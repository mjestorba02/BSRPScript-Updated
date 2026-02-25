require('dotenv').config();
const express = require('express');
const mysql = require('mysql2/promise');
const axios = require('axios');
const cron = require('node-cron');
const ip = require('ip'); // npm install ip
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

const FREE_SOURCES = [
  'https://raw.githubusercontent.com/X4BNet/lists_vpn/main/output/vpn/ipv4.txt',
  'https://raw.githubusercontent.com/az0/vpn_ip/main/protonvpn.txt',
  'https://raw.githubusercontent.com/X4BNet/lists_vpn/main/ipv4.txt',
  'https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt',
  'https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_vpnnet.ipset', 
  'https://www.vpngate.net/api/iphone/', // VPN Gate CSV endpoint (needs parsing)
  'https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt', // Example additional IP list (not VPN specific but can filter suspicious)
  'https://raw.githubusercontent.com/vpnapi/vpnapi-database/master/vpn-ipv4.txt', // VPN API free IP list
  // Add more trusted public/free sources here
];

const PAID_SOURCES = [
  // add paid sources if you have
];

// MySQL connection pool
let pool;

async function initDb() {
  pool = await mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT || 3306,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
  });
}

// Convert CIDR to start and end IP numbers
function cidrToRange(cidr) {
  try {
    const [rangeIp, prefix] = cidr.split('/');
    const start = ip.toLong(rangeIp);
    const mask = prefix ? parseInt(prefix, 10) : 32;
    const size = Math.pow(2, 32 - mask);
    const end = start + size - 1;
    return [start, end];
  } catch {
    return null;
  }
}

// Upsert IP ranges into DB
async function upsertRanges(ranges, type, source) {
  if (!ranges.length) return 0;

  const conn = await pool.getConnection();
  try {
    await conn.beginTransaction();

    for (const cidr of ranges) {
      const range = cidrToRange(cidr.trim());
      if (!range) continue;

      const [start_ip, end_ip] = range;
      await conn.query(
        `INSERT INTO antivpn_entries (start_ip, end_ip, type, source, first_seen, last_seen)
         VALUES (?, ?, ?, ?, NOW(), NOW())
         ON DUPLICATE KEY UPDATE last_seen=NOW()`,
        [start_ip, end_ip, type, source]
      );
    }

    await conn.commit();
    return ranges.length;
  } catch (err) {
    await conn.rollback();
    console.error('DB upsert error:', err);
    return 0;
  } finally {
    conn.release();
  }
}

// Fetch IP lists from URLs
async function fetchList(url) {
  try {
    const res = await axios.get(url, { timeout: 15000 });
    // The list is expected to be one IP or CIDR per line
    return res.data.split('\n').filter(Boolean);
  } catch (err) {
    console.error(`Failed to fetch ${url}:`, err.message);
    return [];
  }
}

// Refresh VPN IP lists from sources
async function refreshVpnLists() {
  console.log('Starting VPN lists refresh...');

  // Free lists
  let freeCount = 0;
  for (const url of FREE_SOURCES) {
    const list = await fetchList(url);
    const upserted = await upsertRanges(list, 'free', url);
    console.log(`Upserted ${upserted} free IP ranges from ${url}`);
    freeCount += upserted;
  }

  // Paid lists (if any)
  let paidCount = 0;
  for (const url of PAID_SOURCES) {
    const list = await fetchList(url);
    const upserted = await upsertRanges(list, 'paid', url);
    console.log(`Upserted ${upserted} paid IP ranges from ${url}`);
    paidCount += upserted;
  }

  console.log(`Refresh complete. Free upserted ${freeCount}, Paid upserted ${paidCount}`);
}

// API endpoint to check if IP is VPN
app.get('/check/:ip', async (req, res) => {
  const checkIp = req.params.ip;

  if (!ip.isV4Format(checkIp)) {
    return res.status(400).json({ error: 'Invalid IPv4 address' });
  }

  const ipLong = ip.toLong(checkIp);

  try {
    const [rows] = await pool.query(
      `SELECT type FROM antivpn_entries
       WHERE ? BETWEEN start_ip AND end_ip
       LIMIT 1`,
      [ipLong]
    );

    if (rows.length > 0) {
      res.json({ ip: checkIp, isVPN: true, type: rows[0].type });
    } else {
      res.json({ ip: checkIp, isVPN: false, type: null });
    }
  } catch (err) {
    console.error('DB query error:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.use(cors());

// Start server and refresh loop
(async () => {
  try {
    await initDb();
    await refreshVpnLists();

    // Refresh lists daily at midnight
    cron.schedule('0 0 * * *', refreshVpnLists);

    app.listen(PORT, '0.0.0.0', () => {
      console.log(`Anti-VPN API listening on port ${PORT}`);
    });
  } catch (err) {
    console.error('Failed to start server:', err);
    process.exit(1);
  }
})();