#define MAX_FONT_NAME 30 
#define MAX_TEXT 256 

#define MOD_VERSION     							  	   	"Celestial Roleplay v0.01"
#define MAP_NAME    										"English"
#define FirstButton 										"Confirm"
#define SecondButton 										"Leave"
#define SecondButton_2 										"Back"
#define D_INFO_TEXT                   					  	"Celestial Roleplay"

//==================================[ Script ]==================================

#define SPD                                                     ShowPlayerDialog
#define DSL 												   DIALOG_STYLE_LIST

#define MYRED "{FF0000}"
#define MYBLUE "{0000FF}"
#define MYYELLOW "{FFFF00}"
#define MYORANGE "{FFA500}"
#define MYPURPLE "{800080}"
#define MYGREEN "{008000}"
#define MYLBLUE "{0080FF}"
#define MYWHITE "{FFFFFF}"
#define MYBLACK "{000000}"
#define MYCYAN "{00FFFF}"
#define MYPINK "{FF00FF}"
#define MYBROWN "{6A0000}"
#define MYLPURPLE "{8080C0}"
#define MYLGREEN "{00FF00}"
#define MYGREY "{676767}"

#define MRED 0xFFFF0000
#define MBLUE 0xFF0000FF
#define MYELLOW 0xFFFFFF00
#define MORANGE 0xFFFF8000
#define MPURPLE 0xFF400080
#define MGREEN 0xFF008000
#define MLBLUE 0xFF0080FF
#define MWHITE 0xFFFFFFFF
#define MBLACK 0xFF000000
#define MCYAN 0xFF00FFFF
#define MPINK 0xFFFF00FF
#define MBROWN 0xFF6A0000
#define MLPURPLE 0xFF8080C0
#define MLGREEN 0xFF00FF00
#define MGRAY 0xFF676767

new globalstring[ 256 ];

// Model Selection
enum
{
	MODEL_SELECTION_LANDOBJECTS,
	MODEL_SELECTION_FURNITURE,
	MODEL_SELECTION_CLOTHING,
	MODEL_SELECTION_CLOTHES,
 	MODEL_SELECTION_COPCLOTHING,
	MODEL_SELECTION_VATTACH,
	MODEL_SELECTION_VEHICLE_VOUCHER,
	MODEL_SELECTION_GARAGE
}

enum
{
	e_VEHICLE_TYPE_NONE,
	e_VEHICLE_TYPE_PRIVATE,
	e_VEHICLE_TYPE_GROUP,
	e_VEHICLE_TYPE_JOB,
	e_VEHICLE_TYPE_RENT,
	e_VEHICLE_TYPE_MAYOR,
	e_VEHICLE_TYPE_EXHIBIT,
	e_VEHICLE_TYPE_ADMIN,
	e_VEHICLE_TYPE_SPECIAL,
	e_VEHICLE_TYPE_VIP,
	e_VEHICLE_TYPE_STATE,
	e_VEHICLE_TYPE_HELPER

}

enum E_VEHICLE {

	E_VEHICLE_DB_ID,
	E_VEHICLE_OWNER_ID,
	E_VEHICLE_OWNER_NAME[MAX_PLAYER_NAME],
	E_VEHICLE_PRICE,
	E_VEHICLE_LOCK_STATUS,
	E_VEHICLE_RANK,
	Float:E_VEHICLE_PARK_X,
	Float:E_VEHICLE_PARK_Y,
	Float:E_VEHICLE_PARK_Z,
	Float:E_VEHICLE_PARK_A,
	E_VEHICLE_WORLD,
	E_VEHICLE_INTERIOR,
	E_VEHICLE_TYPE,
	E_VEHICLE_GROUP_DB_ID,
	E_VEHICLE_GROUP_ID,
	E_VEHICLE_JOB,
	E_VEHICLE_COLOR_1,
	E_VEHICLE_COLOR_2,
	E_VEHICLE_MODEL,
	E_VEHICLE_PLATE[24],
	E_VEHICLE_PLATE_COLOR,
	E_VEHICLE_LOCK_LVL,
	E_VEHICLE_ALARM_LVL,
	E_VEHICLE_FUEL,
	E_VEHICLE_TUNED,
	E_VEHICLE_IMMOBILISER, 
	E_VEHICLE_SPOILER,
	E_VEHICLE_HOOD,
	E_VEHICLE_ROOF,
	E_VEHICLE_SKIRT,
	E_VEHICLE_LAMPS,
	E_VEHICLE_NITRO,
	E_VEHICLE_EXHAUST,
	E_VEHICLE_WHEELS,
	E_VEHICLE_STEREO,
	E_VEHICLE_HYDRAULICS,
	E_VEHICLE_F_BUMPER, //FRONT BUMPER
	E_VEHICLE_R_BUMPER, //REAR BUMPER
	E_VEHICLE_VENTS,
	E_VEHICLE_PAINT_JOB,
	E_VEHICLE_MILEAGE,
	E_VEHICLE_RENT_TIME,
	E_VEHICLE_RENTER,
	E_VEHICLE_MILES,
	E_VEHICLE_TYRE_REPAIRS,
	E_VEHICLE_ARMOUR,
	E_VEHICLE_DEATH_STATUS,
	Float:E_VEHICLE_ARMOURH,
	E_VEHICLE_NITRO_LEVEL,
	E_VEHICLE_CRATE_TYPE,
	E_VEHICLE_CRATES,
	Text3D:E_VEHICLE_TEXT, //for crates and callsigns
	E_VEHICLE_BODY,
	Text3D:E_VEHICLE_BODY_TEXT
}
new gVehicleData[ MAX_VEHICLES ][ E_VEHICLE ];

enum FontInformation
{
	FontName[MAX_FONT_NAME],
};
new FontInfo[][FontInformation] = // All the fonts, You can also add new one, Check example below.
{
	{"Lucida Console"},
	{"Verdana"},
	{"Cambria"},
	{"Palatino Linotype"},
	{"Times New Roman"},
	{"Microsoft Sans Serif"},
	{"Constantia"},
	{"Impact"},
	{"Georgia"},
	{"Arial"},
	{"Arial Black"},
	{"Comic Sans MS"},
	{"Trebuchet MS"}
//	{"YOUR FONT NAME"}
};
//==================================VEHICLE ATTACHMENTS===================
#define MAX_VEHICLE_ATTACHED_ITEMS	5
//------------------------------------------------------------------------------

forward OnLoadVehicleAttachments(vehicleid);
forward InsertVehAttachment(vehicleid, index);

//------------------------------------------------------------------------------

enum playerSets
{
	Float:OffSetX,
	Float:OffSetY,
	Float:OffSetZ,
	Float:OffSetRX,
	Float:OffSetRY,
	Float:OffSetRZ,
	obja,
	EditStatus,
	bool: delay,
	lra,
	selectedindex,
	vehicleida,
	objmodel,
	timer
}
new Float:player[MAX_PLAYERS][playerSets];

const FloatX =  1;
const FloatY =  2;
const FloatZ =  3;
const FloatRX = 4;
const FloatRY = 5;
const FloatRZ = 6;

new ChosenVehicleID[MAX_PLAYERS];
enum
{
	LIST_GLASSES,
	LIST_HATS,
	LIST_BANDANA,
	LIST_CAP,
	LIST_HELMETS,
	LIST_MASKS,
	LIST_FUN
}

enum E_VEHICLE_OBJECT
{
	E_VEHICLE_OBJECT_PRICE,
	E_VEHICLE_OBJECT_MODEL,
	E_VEHICLE_OBJECT_NAME[32]
};

new gVehicleObjects[][E_VEHICLE_OBJECT] = 
{
	{50,	19308,	"Taxi Sign"},
	{50,	19307,	"Blue Flag"},
	{50,	19306,	"Red Flag"},
	{50,	19279,	"White light"},
	{50,	1116,	"Bumper 1"},
	{150,	1013,	"Tyres Maybe"},
	{75,	1024,	"Tyres Again"},
	{100,	1176,	"Bumper 2"},
	{150,	1112,	"IDK what's that"},
	{200,	1111,	"IDK what's that 2"},
	{250,	1139,	"Bumper 3"},
	{300,	1058,	"Bumper 4"},
	{300,	1049,	"Bumper 5"},
	{300,	1181,	"Bumper 6"},
	{300,	1179,	"Bunper 7"},
	{300,	1188,	"Bumper 8"},
	{600,	1025,	"Wheel"},
	{500,	1098,	"Wheel 2"},
	{500,	1042,	"Weird Item"},
	{500,	1099,	"Weird Item 2"},
	{500,	1210,	"Briefcase"},
	{500,	18648,	"Blue Neon"},
	{500,	18651,	"Pink Neon"},
	{500,	18650,	"Yellow Neon"},
	{400,	18649,	"Green Neon"},
	{400,	18647,	"Red Neon"},
	{400,	18652,	"White Neon"},
	{400,	19419,	"Police Lights 1"},
	{400,	19420,	"Police Lights 2"},
	{400,	18646,	"Police Lights 3"},
	{400,	19620,	"Police Lights 4"},
	{400,	11701,	"Light Flasher"},
	{400,	19601,	"Snow Plow"},
	{400,	19777,	"FBI Logo"},
	{400,	19314,	"Horn"},
	{1000,  19327,  "Big Rectangle"},
	{1000,  2691,   "Big Square"}

};

//------------------------------------------------------------------------------

enum v_attachment_data
{
	v_attachment_db,
	v_attachment_object,
	v_attachment_model,
	v_attachment_toggle,
	Float:v_attachment_x,
	Float:v_attachment_y,
	Float:v_attachment_z,

	Float:v_attachment_rx,
	Float:v_attachment_ry,
	Float:v_attachment_rz,
	v_Text[MAX_TEXT],
	v_Size,
	v_BGC,
	v_ALG,
	v_Font[MAX_FONT_NAME],
	v_Color,
	v_Bold,
	v_Res

}
new gVehicleAttachmentData[MAX_VEHICLES][MAX_VEHICLE_ATTACHED_ITEMS][v_attachment_data];

//================================================vehicle attachments==============================
ResetVehicleAttachments(vehicleid)
{
	for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
	{
		gVehicleAttachmentData[vehicleid][i][v_attachment_db] = 0;
		gVehicleAttachmentData[vehicleid][i][v_attachment_model] = 0;
		if(IsValidDynamicObject(gVehicleAttachmentData[vehicleid][i][v_attachment_object]))
			DestroyDynamicObject(gVehicleAttachmentData[vehicleid][i][v_attachment_object]);

		gVehicleAttachmentData[vehicleid][i][v_attachment_object] = -1;
	}
}

//------------------------------------------------------------------------------

ResetVehicleAttachment(vehicleid, slotid)
{
	gVehicleAttachmentData[vehicleid][slotid][v_attachment_db] = 0;
	gVehicleAttachmentData[vehicleid][slotid][v_attachment_model] = 0;
	if(IsValidDynamicObject(gVehicleAttachmentData[vehicleid][slotid][v_attachment_object]))
		DestroyDynamicObject(gVehicleAttachmentData[vehicleid][slotid][v_attachment_object]);

	gVehicleAttachmentData[vehicleid][slotid][v_attachment_object] = -1;
}
ToggleVehicleItem(vehicleid, slotid, toggle)
{
	if(toggle==0)
	{
		if(IsValidDynamicObject(gVehicleAttachmentData[vehicleid][slotid][v_attachment_object]))
			DestroyDynamicObject(gVehicleAttachmentData[vehicleid][slotid][v_attachment_object]);
		gVehicleAttachmentData[vehicleid][slotid][v_attachment_toggle] = 0;
		gVehicleAttachmentData[vehicleid][slotid][v_attachment_object] = -1;
	}
	else
	{

		new modelid = gVehicleAttachmentData[vehicleid][slotid][v_attachment_model];

		new Float:x = gVehicleAttachmentData[vehicleid][slotid][v_attachment_x];
		new Float:y = gVehicleAttachmentData[vehicleid][slotid][v_attachment_y];
		new Float:z = gVehicleAttachmentData[vehicleid][slotid][v_attachment_z];

		new Float:rx = gVehicleAttachmentData[vehicleid][slotid][v_attachment_rx];
		new Float:ry = gVehicleAttachmentData[vehicleid][slotid][v_attachment_ry];
		new Float:rz = gVehicleAttachmentData[vehicleid][slotid][v_attachment_rz];

		
		if(IsValidDynamicObject(gVehicleAttachmentData[vehicleid][slotid][v_attachment_object]))
			DestroyDynamicObject(gVehicleAttachmentData[vehicleid][slotid][v_attachment_object]);
		gVehicleAttachmentData[vehicleid][slotid][v_attachment_object] = CreateDynamicObject( modelid, x, y, z, rx, ry, rz , -1 , -1, -1, 300.0, 300.0);
		if(modelid == 19327 || modelid == 2691)
		{
			strreplace(gVehicleAttachmentData[vehicleid][slotid][v_Text], "~", "\n", true);
			format(globalstring, sizeof(globalstring), "%s",gVehicleAttachmentData[vehicleid][slotid][v_Text] );
			SetDynamicObjectMaterialText(gVehicleAttachmentData[vehicleid][slotid][v_attachment_object] , 0 , globalstring , gVehicleAttachmentData[vehicleid][slotid][v_Res], gVehicleAttachmentData[vehicleid][slotid][v_Font], gVehicleAttachmentData[vehicleid][slotid][v_Size], gVehicleAttachmentData[vehicleid][slotid][v_Bold] , gVehicleAttachmentData[vehicleid][slotid][v_Color],gVehicleAttachmentData[vehicleid][slotid][v_BGC],gVehicleAttachmentData[vehicleid][slotid][v_ALG]);
		}
		AttachDynamicObjectToVehicle( gVehicleAttachmentData[vehicleid][slotid][v_attachment_object], vehicleid, x, y, z, rx, ry, rz );
			
	}
}

//------------------------------------------------------------------------------

stock SaveVehicleAttachments(vehicleid)
{
	new query[512];
	for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
	{
		if(gVehicleAttachmentData[vehicleid][i][v_attachment_db] == 0)
			continue;

		mysql_format(connectionID, query, sizeof(query),
		"UPDATE `vattachments` SET `Model`=%d,\
		`X`=%f, `Y`=%f, `Z`=%f,\
		`RX`=%f, `RY`=%f, `RZ`=%f\
		WHERE `ID`=%d",
		gVehicleAttachmentData[vehicleid][i][v_attachment_model],
		gVehicleAttachmentData[vehicleid][i][v_attachment_x], gVehicleAttachmentData[vehicleid][i][v_attachment_y], gVehicleAttachmentData[vehicleid][i][v_attachment_z],
		gVehicleAttachmentData[vehicleid][i][v_attachment_rx], gVehicleAttachmentData[vehicleid][i][v_attachment_ry], gVehicleAttachmentData[vehicleid][i][v_attachment_rz],
		gVehicleAttachmentData[vehicleid][i][v_attachment_db]);
		mysql_tquery(connectionID, query);
	}
	return 1;
}
stock SaveVehicleAttachment(vehicleid, slotid)
{
	new query[512];
	if(gVehicleAttachmentData[vehicleid][slotid][v_attachment_db] == 0)
		return 1;
	mysql_format(connectionID, query, sizeof(query),
	"UPDATE `vattachments` SET `Model`=%d,\
	`X`=%f, `Y`=%f, `Z`=%f,\
	`RX`=%f, `RY`=%f, `RZ`=%f\
	WHERE `ID`=%d",
	gVehicleAttachmentData[vehicleid][slotid][v_attachment_model],
	gVehicleAttachmentData[vehicleid][slotid][v_attachment_x], gVehicleAttachmentData[vehicleid][slotid][v_attachment_y], gVehicleAttachmentData[vehicleid][slotid][v_attachment_z],
	gVehicleAttachmentData[vehicleid][slotid][v_attachment_rx], gVehicleAttachmentData[vehicleid][slotid][v_attachment_ry], gVehicleAttachmentData[vehicleid][slotid][v_attachment_rz],
	gVehicleAttachmentData[vehicleid][slotid][v_attachment_db]);
	mysql_tquery(connectionID, query);
	return 1;
}
stock SaveVehicleTexture(vehicleid, slotid)
{
	new query[1024];
	if(gVehicleAttachmentData[vehicleid][slotid][v_attachment_db] == 0)
		return 1;
	mysql_format(connectionID, query, sizeof(query),
	"UPDATE `vattachments` SET `text`=%e,\
	`font`=%e, `color`=%d, `size`=%d,\
	`BOLD`=%d, `res`=%d,\
	`BGC`=%d, `ALG`=%d\
	WHERE `ID`=%d",
	gVehicleAttachmentData[vehicleid][slotid][v_Text],
	gVehicleAttachmentData[vehicleid][slotid][v_Font], gVehicleAttachmentData[vehicleid][slotid][v_Color], gVehicleAttachmentData[vehicleid][slotid][v_Size],
	gVehicleAttachmentData[vehicleid][slotid][v_Bold], gVehicleAttachmentData[vehicleid][slotid][v_Res], gVehicleAttachmentData[vehicleid][slotid][v_BGC], gVehicleAttachmentData[vehicleid][slotid][v_ALG],
	gVehicleAttachmentData[vehicleid][slotid][v_attachment_db]);
	mysql_tquery(connectionID, query);
	return 1;
}
//------------------------------------------------------------------------------

DeleteVehicleAttachment(vehicleid, slotid)
{
	if(!gVehicleAttachmentData[vehicleid][slotid][v_attachment_db])
		return 1;

	new query[200];
	mysql_format(connectionID, query, sizeof(query), "DELETE FROM `vattachments` WHERE `ID` = %d", gVehicleAttachmentData[vehicleid][slotid][v_attachment_db]);
	mysql_tquery(connectionID, query);
	ResetVehicleAttachment(vehicleid, slotid);
	return 1;
}
ToggleVehicleAttachment(vehicleid, slotid, toggle)
{
	if(!gVehicleAttachmentData[vehicleid][slotid][v_attachment_db])
		return 1;
	
	ToggleVehicleItem(vehicleid, slotid, toggle);
	return 1;
}

//------------------------------------------------------------------------------

GiveVehicleAttachments(vehicleid)
{
	for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
	{
		if(gVehicleAttachmentData[vehicleid][i][v_attachment_db] == 0)
			continue;

		if(gVehicleAttachmentData[vehicleid][i][v_attachment_toggle] == 0)
		   continue;

		new modelid = gVehicleAttachmentData[vehicleid][i][v_attachment_model];

		new Float:x = gVehicleAttachmentData[vehicleid][i][v_attachment_x];
		new Float:y = gVehicleAttachmentData[vehicleid][i][v_attachment_y];
		new Float:z = gVehicleAttachmentData[vehicleid][i][v_attachment_z];

		new Float:rx = gVehicleAttachmentData[vehicleid][i][v_attachment_rx];
		new Float:ry = gVehicleAttachmentData[vehicleid][i][v_attachment_ry];
		new Float:rz = gVehicleAttachmentData[vehicleid][i][v_attachment_rz];

		if(IsValidDynamicObject(gVehicleAttachmentData[vehicleid][i][v_attachment_object]))
			DestroyDynamicObject(gVehicleAttachmentData[vehicleid][i][v_attachment_object]);
		gVehicleAttachmentData[vehicleid][i][v_attachment_object] = CreateDynamicObject( modelid, x, y, z, rx, ry, rz , -1 , -1, -1, 300.0, 300.0 );
		if(modelid == 19327 || modelid == 2691)
		{
			format(globalstring, sizeof(globalstring), "%s", gVehicleAttachmentData[vehicleid][i][v_Text]);
			strreplace(globalstring, "~", "\n", true);
			SetDynamicObjectMaterialText(gVehicleAttachmentData[vehicleid][i][v_attachment_object] , 0, gVehicleAttachmentData[vehicleid][i][v_Text], gVehicleAttachmentData[vehicleid][i][v_Res], gVehicleAttachmentData[vehicleid][i][v_Font], gVehicleAttachmentData[vehicleid][i][v_Size], gVehicleAttachmentData[vehicleid][i][v_Bold], gVehicleAttachmentData[vehicleid][i][v_Color], gVehicleAttachmentData[vehicleid][i][v_BGC],gVehicleAttachmentData[vehicleid][i][v_ALG]);
		}
		AttachDynamicObjectToVehicle(gVehicleAttachmentData[vehicleid][i][v_attachment_object], vehicleid, x, y, z, rx, ry, rz );
	}
}

CopyVehicleAttachments(vehicleid, cvehicleid)
{
	for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
	{
		if(gVehicleAttachmentData[vehicleid][i][v_attachment_db] == 0)
			continue;


		gVehicleAttachmentData[cvehicleid][i][v_attachment_model] = gVehicleAttachmentData[vehicleid][i][v_attachment_model];

		gVehicleAttachmentData[cvehicleid][i][v_attachment_x] = gVehicleAttachmentData[vehicleid][i][v_attachment_x];
		gVehicleAttachmentData[cvehicleid][i][v_attachment_y] = gVehicleAttachmentData[vehicleid][i][v_attachment_y];
		gVehicleAttachmentData[cvehicleid][i][v_attachment_z] = gVehicleAttachmentData[vehicleid][i][v_attachment_z];

		gVehicleAttachmentData[cvehicleid][i][v_attachment_rx] = gVehicleAttachmentData[vehicleid][i][v_attachment_rx];
		gVehicleAttachmentData[cvehicleid][i][v_attachment_ry] = gVehicleAttachmentData[vehicleid][i][v_attachment_ry];
		gVehicleAttachmentData[cvehicleid][i][v_attachment_rz] = gVehicleAttachmentData[vehicleid][i][v_attachment_rz];

		gVehicleAttachmentData[cvehicleid][i][v_Color] = gVehicleAttachmentData[vehicleid][i][v_Color];
		gVehicleAttachmentData[cvehicleid][i][v_Size] = gVehicleAttachmentData[vehicleid][i][v_Size];
		gVehicleAttachmentData[cvehicleid][i][v_BGC] =  gVehicleAttachmentData[vehicleid][i][v_BGC];
		gVehicleAttachmentData[cvehicleid][i][v_ALG] = gVehicleAttachmentData[vehicleid][i][v_ALG];
		gVehicleAttachmentData[cvehicleid][i][v_Res] = gVehicleAttachmentData[vehicleid][i][v_Res];
		gVehicleData[cvehicleid][E_VEHICLE_DB_ID] = VehicleInfo[vehicleid][vID];
		strmid( gVehicleAttachmentData[cvehicleid][i][v_Text], gVehicleAttachmentData[vehicleid][i][v_Text], 0, strlen( gVehicleAttachmentData[vehicleid][i][v_Text] ), MAX_TEXT );
		strmid( gVehicleAttachmentData[cvehicleid][i][v_Font], gVehicleAttachmentData[vehicleid][i][v_Font], 0, strlen( gVehicleAttachmentData[vehicleid][i][v_Font] ), MAX_FONT_NAME );
		new query[512];
		mysql_format(connectionID, query, sizeof(query), "INSERT INTO `vattachments` (`veh_id`, `Model`, `X`, `Y`, `Z`, `RX`, `RY`, `RZ`) VALUES (%d, %d, %f, %f, %f, %f, %f, %f)", gVehicleData[cvehicleid][E_VEHICLE_DB_ID], gVehicleAttachmentData[cvehicleid][i][v_attachment_model], gVehicleAttachmentData[cvehicleid][i][v_attachment_x], gVehicleAttachmentData[cvehicleid][i][v_attachment_y], gVehicleAttachmentData[cvehicleid][i][v_attachment_z], gVehicleAttachmentData[cvehicleid][i][v_attachment_rx], gVehicleAttachmentData[cvehicleid][i][v_attachment_ry], gVehicleAttachmentData[cvehicleid][i][v_attachment_rz]);
		mysql_tquery(connectionID, query, "InsertVehAttachment", "ii", cvehicleid, i);
		SaveVehicleAttachment(cvehicleid, i);
		SaveVehicleTexture(cvehicleid, i);
	}
}
//------------------------------------------------------------------------------

/*LoadVehicleAttachments1(vehicleid, vehicleidd)
{
	tmpobjid = CreateDynamicObject(19419,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, 0.000, -0.400, 0.649, 0.000, 0.000, 0.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "HPG", 100, "Ariel", 20, 0, -65536, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, -0.054, 1.199, 0.220, 0.000, 270.000, 90.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "PULISYA ", 130, "Ariel", 35, 0, -65536, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, -0.054, 1.560, 0.200, 0.000, 278.000, 90.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "602", 130, "Ariel", 35, 0, -65536, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, -0.054, 1.939, 0.149, 0.000, 280.600, 90.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "l", 110, "Ariel", 50, 1, -16776961, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, 1.110, 0.509, -0.190, 270.000, 180.000, 0.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "l", 110, "Ariel", 50, 1, -16776961, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, -1.110, 0.509, -0.190, 270.000, -180.000, 0.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "l", 110, "Ariel", 50, 1, -16776961, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, -1.111, -0.509, -0.175, -270.000, -180.000, 0.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "l", 110, "Ariel", 50, 1, -16776961, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, 1.111, -0.509, -0.175, -270.000, 180.000, 0.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "l", 110, "Ariel", 50, 1, -16776961, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, 1.111, -0.524, -0.284, 270.000, -180.000, 0.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "l", 110, "Ariel", 50, 1, -16776961, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, -1.111, -0.524, -0.284, 270.000, 180.000, 0.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "l", 110, "Ariel", 50, 1, -16776961, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, 1.116, 0.475, -0.284, 270.000, -180.000, 0.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "l", 110, "Ariel", 50, 1, -16776961, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, -1.116, 0.475, -0.284, 270.000, 180.000, 0.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "602", 130, "Ariel", 20, 0, -65536, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, -0.665, 2.479, -0.150, 0.000, 347.900, 99.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "HPG 6", 130, "Ariel", 20, 0, -65536, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, 0.665, 2.479, -0.150, 0.000, -373.900, 81.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "PNP", 100, "Ariel", 15, 0, -65536, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, 1.105, -1.100, 0.059, 0.000, 0.000, 0.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "PNP", 100, "Ariel", 15, 0, -65536, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, -1.105, -1.100, 0.059, 0.000, 0.000, 180.000);
    tmpobjid = CreateDynamicObject(1014,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, 0.000, -2.319, 0.299, 0.000, 0.000, 0.000);
    tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "MTPD", 100, "Ariel", 20, 0, -460545, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, vehicleid, -0.054, 0.199, 0.568, 0.000, -60.000, 90.000);
}*/

LoadVehicleAttachments(vehicleid, vehicleidd)
{
	new query[128];
	mysql_format(connectionID, query, sizeof(query), "SELECT * FROM `vattachments` WHERE `veh_id` = %d", vehicleidd);
	mysql_tquery(connectionID, query, "OnLoadVehicleAttachments", "i", vehicleid);
}

//------------------------------------------------------------------------------

public OnLoadVehicleAttachments(vehicleid)
{
	new rows, fields;
	cache_get_data(rows, fields, connectionID);
	if(rows)
	{
		for (new i = 0; i < rows; i++)
		{
			if(i == MAX_VEHICLE_ATTACHED_ITEMS) break;

			gVehicleAttachmentData[vehicleid][i][v_attachment_db] = cache_get_field_content_int(i, "ID");

			gVehicleAttachmentData[vehicleid][i][v_attachment_model] = cache_get_field_content_int(i, "Model");

			gVehicleAttachmentData[vehicleid][i][v_attachment_x] = cache_get_field_content_float(i, "X");
			gVehicleAttachmentData[vehicleid][i][v_attachment_y] = cache_get_field_content_float(i, "Y");
			gVehicleAttachmentData[vehicleid][i][v_attachment_z] = cache_get_field_content_float(i, "Z");

			gVehicleAttachmentData[vehicleid][i][v_attachment_rx] = cache_get_field_content_float(i, "RX");
			gVehicleAttachmentData[vehicleid][i][v_attachment_ry] = cache_get_field_content_float(i, "RY");
			gVehicleAttachmentData[vehicleid][i][v_attachment_rz] = cache_get_field_content_float(i, "RZ");

			gVehicleAttachmentData[vehicleid][i][v_attachment_toggle] = 1;

			gVehicleAttachmentData[vehicleid][i][v_Color] = cache_get_field_content_int( i, "color" );
			gVehicleAttachmentData[vehicleid][i][v_Size] = cache_get_field_content_int( i, "size" );
			gVehicleAttachmentData[vehicleid][i][v_BGC] = cache_get_field_content_int( i, "BGC");
			gVehicleAttachmentData[vehicleid][i][v_ALG] = cache_get_field_content_int( i, "ALG" );
			gVehicleAttachmentData[vehicleid][i][v_Res] = cache_get_field_content_int( i, "res" );
			cache_get_field_content( i, "text",  gVehicleAttachmentData[vehicleid][i][v_Text], connectionID, 256 );
			cache_get_field_content( i, "font",  gVehicleAttachmentData[vehicleid][i][v_Font], connectionID, 256 );

		}
		GiveVehicleAttachments(vehicleid);
	}
	return 1;
}
public InsertVehAttachment(vehicleid, index)
{
	gVehicleAttachmentData[vehicleid][index][v_attachment_db] = cache_insert_id();
	return 1;
}
CMD:copyattach(playerid,params[])
{
	if(pData[playerid][pAdmin] < 5 ) return SendErrorMessage( playerid, "You do not have permission to use this command.");
	new vehicleid, cvehicleid;
	if( sscanf( params, "ii",vehicleid, cvehicleid) ) return SCM(playerid, COLOR_SYNTAX, "[ERROR]: /copyattach [From vehicle ID] [To vehicle ID]");
	if(!IsValidVehicle(vehicleid)) return SendErrorMessage(playerid, "Invalid first vehicle ID specified.");
	if(!IsValidVehicle(cvehicleid)) return SendErrorMessage(playerid, "Invalid second vehicle ID specified.");
	if(GetVehicleModel(vehicleid) != GetVehicleModel(cvehicleid)) return SendErrorMessage(playerid, "Both vehicles have different models, attachments can't be copied.");
	CopyVehicleAttachments(vehicleid, cvehicleid);
	GiveVehicleAttachments(cvehicleid);
	SendInfoMessage(playerid,"Attachments copied successfully.");
	return 1;
}
CMD:attach(playerid)
{
	if(!pData[playerid][pDynamicAdmin])
	{
	    return SCM(playerid, COLOR_SYNTAX, "You are not authorized to use this command.");
	}
	if(IsPlayerInAnyVehicle(playerid))
	{
		//new vehicleid = GetPlayerVehicleID( playerid );
		/*if(!vehicleid || !IsVehicleOwner(playerid, vehicleid))
		{
			return SCM(playerid, COLOR_SYNTAX, "You are not inside any vehicle of yours.");
		}*/
		ChosenVehicleID[playerid] = GetPlayerVehicleID(playerid);
		SPD(playerid, DIALOG_VATTACHMENTS_MAIN, DSL, "Vehicle Attachments", "Buy\nChange Position\nToggle Attachment\nDelete Attachment\nTexturize Attachment", FirstButton, SecondButton_2 );
	}
	else return SendErrorMessage(playerid, "You are not in a vehicle.");
	return 1;
}

CMD:editvobj( playerid, params[] ) {
	if(GetPlayerVehicleID(playerid) == 0) return SendErrorMessage(playerid, "You are not in a vehicle.");
	if(GetPlayerVehicleID(playerid) != player[playerid][vehicleida]) return SendErrorMessage(playerid, "You are not in the vehicle anymore.");
	new vehicleid = ChosenVehicleID[playerid];
	new item[32];
	if( sscanf( params, "s[32] ", item)) {
		SCM( playerid, SERVER_COLOR, "___________________________________________________________________");
		SCM( playerid, COLOR_WHITE, "/editvobj [ option ]");
		SCM( playerid, COLOR_WHITE, "[option] x, y, z, rx, ry, rz, stop");
		SCM( playerid, SERVER_COLOR, "___________________________________________________________________");
		return 1;
	}

	if(!strcmp("stop", item, true))
	{
		KillTimer(player[playerid][timer]);
		SendInfoMessage(playerid, "You stopped editing the vehicle attachment.");
		for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
		{
			if(player[playerid][obja] == gVehicleAttachmentData[vehicleid][i][v_attachment_object] && IsValidDynamicObject(gVehicleAttachmentData[vehicleid][i][v_attachment_object]))
			{
				SaveVehicleAttachment( vehicleid, i);
				player[playerid][EditStatus] = -1;
			}
		}
	}
	else if(!strcmp("x", item, true))
	{
		player[playerid][EditStatus] = FloatX;
		return SendInfoMessage(playerid, "You are editing X offset now.");
	}
	else if(!strcmp("y", item, true))
	{
		player[playerid][EditStatus] = FloatY;
		return SendInfoMessage(playerid, "You are editing Y offset now.");
	}
	else if(!strcmp("z", item, true))
	{
		player[playerid][EditStatus] = FloatZ;
		return SendInfoMessage(playerid, "You are editing Z offset now.");
	}
	else if(!strcmp("rx", item, true))
	{
		player[playerid][EditStatus] = FloatRX;
		return SendInfoMessage(playerid, "You are editing RX offset now.");
	}
	else if(!strcmp("ry", item, true))
	{
		player[playerid][EditStatus] = FloatRY;
		return SendInfoMessage(playerid, "You are editing RY offset now.");
	}
	else if(!strcmp("rz", item, true))
	{
		player[playerid][EditStatus] = FloatRZ;
		return SendInfoMessage(playerid, "You are editing RZ offset now.");
	}
	else
	{
		SCM( playerid, SERVER_COLOR, "___________________________________________________________________");
		SCM( playerid, COLOR_WHITE, "/editvobj [ option ]");
		SCM( playerid, COLOR_WHITE, "[option] x, y, z, rx, ry, rz, stop");
		SCM( playerid, SERVER_COLOR, "___________________________________________________________________");
	}

	return 1;
}

stock sql_attachment_update_integer(vehicleid, slotid, field[], value ) {

	new q[ 256 ];
	mysql_format( connectionID, q, sizeof(q), "UPDATE `vattachments` SET `%s` = '%d' WHERE `ID` = '%d'", field, value, gVehicleAttachmentData[vehicleid][slotid][v_attachment_db] );
	mysql_tquery( connectionID, q );

	return true;
}

stock sql_attachment_update_string(vehicleid, slotid, field[], value[] ) {

	new q[ 512 ];
	mysql_format( connectionID, q, sizeof(q), "UPDATE `vattachments` SET `%s` = '%e' WHERE `ID` = '%d'", field, value, gVehicleAttachmentData[vehicleid][slotid][v_attachment_db] );
	mysql_tquery( connectionID, q );

	return true;
}

//=========================================================================================================================================
forward GetKeys(playerid);
public GetKeys(playerid)
{
	if(!IsValidDynamicObject(player[playerid][obja])) KillTimer(player[playerid][timer]);
	new Keys, ud, gametext[36], Float: toAdd;
	
	GetPlayerKeys(playerid,Keys,ud,player[playerid][lra]);    
	switch(Keys)
	{
		case KEY_FIRE:   toAdd = 0.000500;		
		default:         toAdd = 0.005000;
	}
	if(player[playerid][lra] == 128)
	{
		switch(player[playerid][EditStatus])
		{
			case FloatX:
			{
				player[playerid][OffSetX] = floatadd(player[playerid][OffSetX], toAdd);
				format(gametext, 36, "offsetx: ~w~%f", player[playerid][OffSetX]);
				gVehicleAttachmentData[player[playerid][vehicleida]][player[playerid][selectedindex]][v_attachment_x] = player[playerid][OffSetX];
				GameTextForPlayer(playerid, gametext, 1000, 3);
			}
			case FloatY:
			{
				player[playerid][OffSetY] = floatadd(player[playerid][OffSetY], toAdd);
				format(gametext, 36, "offsety: ~w~%f", player[playerid][OffSetY]);
				gVehicleAttachmentData[player[playerid][vehicleida]][player[playerid][selectedindex]][v_attachment_y] = player[playerid][OffSetY];
				GameTextForPlayer(playerid, gametext, 1000, 3);
			}
			case FloatZ:
			{
				player[playerid][OffSetZ] = floatadd(player[playerid][OffSetZ], toAdd);
				format(gametext, 36, "offsetz: ~w~%f", player[playerid][OffSetZ]);
				gVehicleAttachmentData[player[playerid][vehicleida]][player[playerid][selectedindex]][v_attachment_z] = player[playerid][OffSetZ];
				GameTextForPlayer(playerid, gametext, 1000, 3);
			}
			case FloatRX:
			{
				if(Keys == 0) player[playerid][OffSetRX] = floatadd(player[playerid][OffSetRX], floatadd(toAdd, 1.000000));	
				else player[playerid][OffSetRX] = floatadd(player[playerid][OffSetRX], floatadd(toAdd,0.100000));					                			
				format(gametext, 36, "offsetrx: ~w~%f", player[playerid][OffSetRX]);
				gVehicleAttachmentData[player[playerid][vehicleida]][player[playerid][selectedindex]][v_attachment_rx] = player[playerid][OffSetRX];
				GameTextForPlayer(playerid, gametext, 1000, 3);
			}
			case FloatRY:
			{
				if(Keys == 0) player[playerid][OffSetRY] = floatadd(player[playerid][OffSetRY], floatadd(toAdd, 1.000000));	
				else player[playerid][OffSetRY] = floatadd(player[playerid][OffSetRY], floatadd(toAdd,0.100000));	
				format(gametext, 36, "offsetry: ~w~%f", player[playerid][OffSetRY]);
				gVehicleAttachmentData[player[playerid][vehicleida]][player[playerid][selectedindex]][v_attachment_ry] = player[playerid][OffSetRY];
				GameTextForPlayer(playerid, gametext, 1000, 3);
			}
			case FloatRZ:
			{
				if(Keys == 0) player[playerid][OffSetRZ] = floatadd(player[playerid][OffSetRZ], floatadd(toAdd, 1.000000));	
				else player[playerid][OffSetRZ] = floatadd(player[playerid][OffSetRZ], floatadd(toAdd,0.100000));	
				format(gametext, 36, "offsetrz: ~w~%f", player[playerid][OffSetRZ]);
				gVehicleAttachmentData[player[playerid][vehicleida]][player[playerid][selectedindex]][v_attachment_rz] = player[playerid][OffSetRZ];
				GameTextForPlayer(playerid, gametext, 1000, 3);
			}
		}
		AttachDynamicObjectToVehicle(player[playerid][obja], player[playerid][vehicleida], player[playerid][OffSetX], player[playerid][OffSetY], player[playerid][OffSetZ], player[playerid][OffSetRX], player[playerid][OffSetRY], player[playerid][OffSetRZ]);
	}
	else if(player[playerid][lra] == -128)
	{
		switch(player[playerid][EditStatus])
		{
			case FloatX:
			{
				player[playerid][OffSetX] = floatsub(player[playerid][OffSetX], toAdd);
				format(gametext, 36, "offsetx: ~w~%f", player[playerid][OffSetX]);
				gVehicleAttachmentData[player[playerid][vehicleida]][player[playerid][selectedindex]][v_attachment_x] = player[playerid][OffSetX];
				GameTextForPlayer(playerid, gametext, 1000, 3);
			}
			case FloatY:
			{
				player[playerid][OffSetY] = floatsub(player[playerid][OffSetY], toAdd);
				format(gametext, 36, "offsety: ~w~%f", player[playerid][OffSetY]);
				gVehicleAttachmentData[player[playerid][vehicleida]][player[playerid][selectedindex]][v_attachment_y] = player[playerid][OffSetY];
				GameTextForPlayer(playerid, gametext, 1000, 3);
			}
			case FloatZ:
			{
				player[playerid][OffSetZ] = floatsub(player[playerid][OffSetZ], toAdd);
				format(gametext, 36, "offsetz: ~w~%f", player[playerid][OffSetZ]);
				gVehicleAttachmentData[player[playerid][vehicleida]][player[playerid][selectedindex]][v_attachment_z] = player[playerid][OffSetZ];
				GameTextForPlayer(playerid, gametext, 1000, 3);
			}
			case FloatRX:
			{
				if(Keys == 0) player[playerid][OffSetRX] = floatsub(player[playerid][OffSetRX], floatadd(toAdd, 1.000000));	
				else player[playerid][OffSetRX] = floatsub(player[playerid][OffSetRX], floatadd(toAdd,0.100000));			
			    format(gametext, 36, "offsetrx: ~w~%f", player[playerid][OffSetRX]);
				gVehicleAttachmentData[player[playerid][vehicleida]][player[playerid][selectedindex]][v_attachment_rx] = player[playerid][OffSetRX];
				GameTextForPlayer(playerid, gametext, 1000, 3);
			}
			case FloatRY:
			{
				if(Keys == 0) player[playerid][OffSetRY] = floatsub(player[playerid][OffSetRY], floatadd(toAdd, 1.000000));	
				else player[playerid][OffSetRY] = floatsub(player[playerid][OffSetRY], floatadd(toAdd,0.100000));	
				format(gametext, 36, "offsetry: ~w~%f", player[playerid][OffSetRY]);
				gVehicleAttachmentData[player[playerid][vehicleida]][player[playerid][selectedindex]][v_attachment_ry] = player[playerid][OffSetRY];
				GameTextForPlayer(playerid, gametext, 1000, 3);
			}
			case FloatRZ:
			{
				if(Keys == 0) player[playerid][OffSetRZ] = floatsub(player[playerid][OffSetRZ], floatadd(toAdd, 1.000000));	
				else player[playerid][OffSetRZ] = floatsub(player[playerid][OffSetRZ], floatadd(toAdd,0.100000));	
				format(gametext, 36, "offsetrz: ~w~%f", player[playerid][OffSetRZ]);
				gVehicleAttachmentData[player[playerid][vehicleida]][player[playerid][selectedindex]][v_attachment_rz] = player[playerid][OffSetRZ];
				GameTextForPlayer(playerid, gametext, 1000, 3);
			}
		}
		AttachDynamicObjectToVehicle(player[playerid][obja], player[playerid][vehicleida], player[playerid][OffSetX], player[playerid][OffSetY], player[playerid][OffSetZ], player[playerid][OffSetRX], player[playerid][OffSetRY], player[playerid][OffSetRZ]);
	}
	return 1;
}