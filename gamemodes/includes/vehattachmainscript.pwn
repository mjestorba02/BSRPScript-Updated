//OnDialogResponse
    new bstring[356];
	new cvehicleid = ChosenVehicleID[playerid];
	if( dialogid == DIALOG_VATTACHMENTS_MAIN ) {
		if( !response ) return true;
		if( response ) {
			switch( listitem ) {
				case 0: {
					if( !IsPlayerInRangeOfPoint( playerid, 20.0, 1061.2295,-899.7582,42.6580 ) && !pData[playerid][pAdminDuty]) return SendErrorMessage( playerid, "You must be at mechanic's garage to place attachments!");
					if(!pData[playerid][pAdminDuty] && pData[playerid][pAdmin] >= 3) ShowPlayerSelectionMenu(playerid, MODEL_SELECTION_VATTACH, "SELECT TOY", avehitems, sizeof(avehitems));
					else ShowPlayerSelectionMenu(playerid, MODEL_SELECTION_VATTACH, "SELECT TOY", vehitems, sizeof(vehitems));
					//ShowPlayerSelectionMenu(playerid, MODEL_SELECTION_VATTACH, "SELECT TOY", vehitems, sizeof(vehitems));
				}
				case 1: {
					new items = 0, info[250];
					for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
					{
						if(gVehicleAttachmentData[cvehicleid][i][v_attachment_db] != 0)
						{
							items++;

							for (new j = 0; j < sizeof(gVehicleAttachmentData); j++)
							{
								if(gVehicleAttachmentData[cvehicleid][i][v_attachment_model] == gVehicleObjects[j][E_VEHICLE_OBJECT_MODEL])
								{
									if(i > 0) strcat(info, "\n");
									strcat(info, gVehicleObjects[j][E_VEHICLE_OBJECT_NAME]);
									break;
								}
							}
						}
						else
						{
							if(i > 0) strcat(info, "\n");
							strcat(info, "None");
						}
					}
					if(items == 0) return SendErrorMessage(playerid, "You do not have any items.");
					SPD(playerid, DIALOG_VATTACHMENTS_EDIT, DSL, "Edit items", info, "Edit", "Back");
				}
				case 2: {
					new items = 0, info[250];
					for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
					{
						if(gVehicleAttachmentData[cvehicleid][i][v_attachment_db] != 0)
						{
							items++;

							for (new j = 0; j < sizeof(gVehicleObjects); j++)
							{
								if(gVehicleAttachmentData[cvehicleid][i][v_attachment_model] == gVehicleObjects[j][E_VEHICLE_OBJECT_MODEL])
								{
									if(i > 0) strcat(info, "\n");
									strcat(info, gVehicleObjects[j][E_VEHICLE_OBJECT_NAME]);
									break;
								}
							}
						}
						else
						{
							if(i > 0) strcat(info, "\n");
							strcat(info, "None");
						}
					}

					if(items == 0)
						return SendErrorMessage(playerid, "You do not have any items.");
					SPD(playerid, DIALOG_VATTACHMENTS_TOGGLE, DSL, "Toggle Items", info, "Select", "Back");
				}
				case 3: {
					new items = 0, info[250];
					for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
					{
						if(gVehicleAttachmentData[cvehicleid][i][v_attachment_db] != 0)
						{
							items++;

							for (new j = 0; j < sizeof(gVehicleObjects); j++)
							{
								if(gVehicleAttachmentData[cvehicleid][i][v_attachment_model] == gVehicleObjects[j][E_VEHICLE_OBJECT_MODEL])
								{
									if(i > 0) strcat(info, "\n");
									strcat(info, gVehicleObjects[j][E_VEHICLE_OBJECT_NAME]);
									break;
								}
							}
						}
						else
						{
							if(i > 0) strcat(info, "\n");
							strcat(info, "None");
						}
					}
					if(items == 0) return SendErrorMessage(playerid, "You do not have any items.");
					SPD(playerid, DIALOG_VATTACHMENTS_REMOVE, DSL, "Remove Items", info, "Delete", "Back");
				}
				case 4: {
					new items = 0, info[250];
					for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
					{
						if(gVehicleAttachmentData[cvehicleid][i][v_attachment_db] != 0)
						{
							items++;

							for (new j = 0; j < sizeof(gVehicleObjects); j++)
							{
								if(gVehicleAttachmentData[cvehicleid][i][v_attachment_model] == gVehicleObjects[j][E_VEHICLE_OBJECT_MODEL])
								{
									if(i > 0) strcat(info, "\n");
									strcat(info, gVehicleObjects[j][E_VEHICLE_OBJECT_NAME]);
									break;
								}
							}
						}
						else
						{
							if(i > 0) strcat(info, "\n");
							strcat(info, "None");
						}
					}
					if(items == 0) return SendErrorMessage(playerid, "You do not have any items.");
					pData[playerid][pSelected]=listitem;
					SPD(playerid, DIALOG_VATTACHMENTS_TEXTURE, DSL, "Texturize Items", info, "Select", "Back");

				}
			}
		}
	}
	else if(dialogid == DIALOG_VATTACHMENTS_REMOVE)
	{
		if(!response)
		{
			return SPD( playerid, DIALOG_VATTACHMENTS_MAIN, DSL, D_INFO_TEXT, "Buy\nChange Position\nToggle Attachment\nDelete Attachment\nTexturize Attachment", FirstButton, SecondButton_2 );
		}
		if(gVehicleAttachmentData[cvehicleid][listitem][v_attachment_db] == 0) 
		{
			SendErrorMessage(playerid, "You have no item in this slot.");
			new items = 0, info[250];
			for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
			{
				if(gVehicleAttachmentData[cvehicleid][i][v_attachment_db] != 0)
				{
					items++;

					for (new j = 0; j < sizeof(gVehicleObjects); j++)
					{
						if(gVehicleAttachmentData[cvehicleid][i][v_attachment_model] == gVehicleObjects[j][E_VEHICLE_OBJECT_MODEL])
						{
							if(i > 0) strcat(info, "\n");
							strcat(info, gVehicleObjects[j][E_VEHICLE_OBJECT_NAME]);
							break;
						}
					}
				}
				else
				{
					if(i > 0) strcat(info, "\n");
					strcat(info, "None");
				}
			}
			return SPD(playerid, DIALOG_VATTACHMENTS_REMOVE, DSL, "Remove Items", info, "Delete", "Back");
		}
		SendInfoMessage(playerid, "* You removed the item.");
		DeleteVehicleAttachment(cvehicleid, listitem);
	}
	else if(dialogid == DIALOG_VATTACHMENTS_TOGGLE)
	{
		if(!response)
		{
			return SPD( playerid, DIALOG_VATTACHMENTS_MAIN, DSL, D_INFO_TEXT, "Buy\nChange Position\nToggle Attachment\nDelete Attachment\nTexturize Attachment", "Select", "Abort" );
		}
		if(gVehicleAttachmentData[cvehicleid][listitem][v_attachment_db] == 0)
		{ 
			SendErrorMessage(playerid, "You have no item in this slot.");
			new items = 0, info[250];
			for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
			{
				if(gVehicleAttachmentData[cvehicleid][i][v_attachment_db] != 0)
				{
					items++;

					for (new j = 0; j < sizeof(gVehicleObjects); j++)
					{
						if(gVehicleAttachmentData[cvehicleid][i][v_attachment_model] == gVehicleObjects[j][E_VEHICLE_OBJECT_MODEL])
						{
							if(i > 0) strcat(info, "\n");
							strcat(info, gVehicleObjects[j][E_VEHICLE_OBJECT_NAME]);
							break;
						}
					}
				}
				else
				{
					if(i > 0) strcat(info, "\n");
					strcat(info, "None");
				}
			}
			return SPD(playerid, DIALOG_VATTACHMENTS_TOGGLE, DSL, "Toggle Items", info, "Select", "Back");
		}
		pData[playerid][pSelected]=listitem;
		//SPD( playerid, dialog_toggleitem , DSMSG, ""col_white"Toggle", "What do you want to do with this item?", "On", "Off");
		SPD(playerid, dialog_Vtoggleitem, DSL, "Toggle", "{17DA3E}On\n{FF2A2A}Off", "Select", "Back");

	}
	else if(dialogid == dialog_Vtoggleitem)
	{
		if(!response)
		{
			new items = 0, info[250];
			for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
			{
				if(gVehicleAttachmentData[cvehicleid][i][v_attachment_db] != 0)
				{
					items++;

					for (new j = 0; j < sizeof(gVehicleObjects); j++)
					{
						if(gVehicleAttachmentData[cvehicleid][i][v_attachment_model] == gVehicleObjects[j][E_VEHICLE_OBJECT_MODEL])
						{
							if(i > 0) strcat(info, "\n");
							strcat(info, gVehicleObjects[j][E_VEHICLE_OBJECT_NAME]);
							break;
						}
					}
				}
				else
				{
					if(i > 0) strcat(info, "\n");
					strcat(info, "None");
				}
			}
			return SPD(playerid, DIALOG_VATTACHMENTS_TOGGLE, DSL, "Toggle Items", info, "Select", "Back");
		}
		if(listitem==0)
		{
			SendInfoMessage(playerid, "* You have toggled on the selected item.");
		   // TogglePlayerItem(playerid, pData[playerid][pSelected], 1);
			ToggleVehicleAttachment(cvehicleid, pData[playerid][pSelected], 1);
			new items = 0, info[250];
			for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
			{
				if(gVehicleAttachmentData[cvehicleid][i][v_attachment_db] != 0)
				{
					items++;

					for (new j = 0; j < sizeof(gVehicleObjects); j++)
					{
						if(gVehicleAttachmentData[cvehicleid][i][v_attachment_model] == gVehicleObjects[j][E_VEHICLE_OBJECT_MODEL])
						{
							if(i > 0) strcat(info, "\n");
							strcat(info, gVehicleObjects[j][E_VEHICLE_OBJECT_NAME]);
							break;
						}
					}
				}
				else
				{
					if(i > 0) strcat(info, "\n");
					strcat(info, "None");
				}
			}
			return SPD(playerid, DIALOG_VATTACHMENTS_TOGGLE, DSL, "Toggle Items", info, "Select", "Back");

		}
		else if(listitem==1)
		{
			SendInfoMessage(playerid, "* You have toggled off the selected item.");
			//TogglePlayerItem(playerid, pData[playerid][pSelected], 0);
			ToggleVehicleAttachment(cvehicleid, pData[playerid][pSelected], 0);
			new items = 0, info[250];
			for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
			{
				if(gVehicleAttachmentData[cvehicleid][i][v_attachment_db] != 0)
				{
					items++;

					for (new j = 0; j < sizeof(gVehicleObjects); j++)
					{
						if(gVehicleAttachmentData[cvehicleid][i][v_attachment_model] == gVehicleObjects[j][E_VEHICLE_OBJECT_MODEL])
						{
							if(i > 0) strcat(info, "\n");
							strcat(info, gVehicleObjects[j][E_VEHICLE_OBJECT_NAME]);
							break;
						}
					}
				}
				else
				{
					if(i > 0) strcat(info, "\n");
					strcat(info, "None");
				}
			}
			return SPD(playerid, DIALOG_VATTACHMENTS_TOGGLE, DSL, "Toggle Items", info, "Select", "Back");
		}

	}
	else if(dialogid == DIALOG_VATTACHMENTS_EDIT)
	{
		if(!response)
		{
			return SPD( playerid, DIALOG_VATTACHMENTS_MAIN, DSL, D_INFO_TEXT, "Buy\nChange Position\nToggle Attachment\nDelete Attachment\nTexturize Attachment", "Select", "Abort" );
		}
		if(gVehicleAttachmentData[cvehicleid][listitem][v_attachment_db] == 0)
		{ 
			SendErrorMessage(playerid, "You have no item in this slot.");
			new items = 0, info[250];
			for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
			{
				if(gVehicleAttachmentData[cvehicleid][i][v_attachment_db] != 0)
				{
					items++;

					for (new j = 0; j < sizeof(gVehicleObjects); j++)
					{
						if(gVehicleAttachmentData[cvehicleid][i][v_attachment_model] == gVehicleObjects[j][E_VEHICLE_OBJECT_MODEL])
						{
							if(i > 0) strcat(info, "\n");
							strcat(info, gVehicleObjects[j][E_VEHICLE_OBJECT_NAME]);
							break;
						}
					}
				}
				else
				{
					if(i > 0) strcat(info, "\n");
					strcat(info, "None");
				}
			}
			return SPD(playerid, DIALOG_VATTACHMENTS_EDIT, DSL, "Edit items", info, "Edit", "Back");
		}
		pData[playerid][pSelected] = listitem;
		SPD(playerid, DIALOG_VATTACHMENTS_EDIT2, DSL, "Edit items", "Edit with keys", "Edit", "Back");
		/*
		if(IsValidDynamicObject(gVehicleAttachmentData[cvehicleid][listitem][v_attachment_object]))
			DestroyDynamicObject(gVehicleAttachmentData[cvehicleid][listitem][v_attachment_object]);
		new Float:x,Float:y,Float:z;
		GetPlayerPos( playerid, x, y, z);
		GetXYInFrontOfPlayer(playerid, x, y, 2.0);
		gVehicleAttachmentData[cvehicleid][listitem][v_attachment_object] = CreateDynamicObject( gVehicleAttachmentData[cvehicleid][listitem][v_attachment_model], x, y, z, 0.0, 0.0, 0.0 , -1 , -1, -1, 300.0, 300.0 );
		if( gVehicleAttachmentData[cvehicleid][listitem][v_attachment_model] == 19327 ||  gVehicleAttachmentData[cvehicleid][listitem][v_attachment_model] == 2691)
		{
			strreplace(gVehicleAttachmentData[cvehicleid][listitem][v_Text], "~", "\n", true);
			format(globalstring, sizeof(globalstring), "%s",gVehicleAttachmentData[cvehicleid][listitem][v_Text] );
			SetDynamicObjectMaterialText(gVehicleAttachmentData[cvehicleid][listitem][v_attachment_object] , 0 , globalstring , gVehicleAttachmentData[cvehicleid][listitem][v_Res], gVehicleAttachmentData[cvehicleid][listitem][v_Font], gVehicleAttachmentData[cvehicleid][listitem][v_Size], gVehicleAttachmentData[cvehicleid][listitem][v_Bold] , gVehicleAttachmentData[cvehicleid][listitem][v_Color],gVehicleAttachmentData[cvehicleid][listitem][v_BGC],gVehicleAttachmentData[cvehicleid][listitem][v_ALG]);
		}
		EditDynamicObject(playerid, gVehicleAttachmentData[cvehicleid][listitem][v_attachment_object]);
		new dObject = gVehicleAttachmentData[cvehicleid][listitem][v_attachment_object];
		new vId = GetPlayerVehicleID(playerid);
		player[playerid][timer] = SetTimerEx("GetKeys", 30, true, "i", playerid);
		player[playerid][EditStatus] = FloatX;
		player[playerid][vehicleida] = vId;		
		player[playerid][obja] = dObject;*/
		
	}
	else if(dialogid == DIALOG_VATTACHMENTS_EDIT2)
	{
		if(!response)
		{
			return SPD( playerid, DIALOG_VATTACHMENTS_MAIN, DSL, D_INFO_TEXT, "Buy\nChange Position\nToggle Attachment\nDelete Attachment\nTexturize Attachment", "Select", "Abort" );
		}
		new index = pData[playerid][pSelected];
		/*if(listitem == 0)
		{
			if(IsValidDynamicObject(gVehicleAttachmentData[cvehicleid][index][v_attachment_object]))
				DestroyDynamicObject(gVehicleAttachmentData[cvehicleid][index][v_attachment_object]);
			new Float:x,Float:y,Float:z;
			GetPlayerPos( playerid, x, y, z);
			GetXYInFrontOfPlayer(playerid, x, y, 2.0);
			gVehicleAttachmentData[cvehicleid][index][v_attachment_object] = CreateDynamicObject( gVehicleAttachmentData[cvehicleid][index][v_attachment_model], x, y, z, 0.0, 0.0, 0.0 , -1 , -1, -1, 300.0, 300.0 );
			if(gVehicleAttachmentData[cvehicleid][index][v_attachment_model] == 19327 ||  gVehicleAttachmentData[cvehicleid][index][v_attachment_model] == 2691)
			{
				strreplace(gVehicleAttachmentData[cvehicleid][index][v_Text], "~", "\n", true);
				format(globalstring, sizeof(globalstring), "%s",gVehicleAttachmentData[cvehicleid][index][v_Text] );
				SetDynamicObjectMaterialText(gVehicleAttachmentData[cvehicleid][index][v_attachment_object] , 0 , globalstring , gVehicleAttachmentData[cvehicleid][index][v_Res], gVehicleAttachmentData[cvehicleid][index][v_Font], gVehicleAttachmentData[cvehicleid][index][v_Size], gVehicleAttachmentData[cvehicleid][index][v_Bold] , gVehicleAttachmentData[cvehicleid][index][v_Color],gVehicleAttachmentData[cvehicleid][index][v_BGC],gVehicleAttachmentData[cvehicleid][index][v_ALG]);
			}
			EditDynamicObject(playerid, gVehicleAttachmentData[cvehicleid][index][v_attachment_object]);
			SetPVarInt(playerid, "edit_cartoysid", cvehicleid);
			SetPVarInt(playerid, "edit_cartoysi", index);
		}*/
		if(listitem == 0)
		{
			new doObject = gVehicleAttachmentData[cvehicleid][index][v_attachment_object];
			new vId = GetPlayerVehicleID(playerid);

			player[playerid][OffSetX] = gVehicleAttachmentData[vId][index][v_attachment_x];
			player[playerid][OffSetY] = gVehicleAttachmentData[vId][index][v_attachment_y];
			player[playerid][OffSetZ] = gVehicleAttachmentData[vId][index][v_attachment_z];
			player[playerid][OffSetRX] = gVehicleAttachmentData[vId][index][v_attachment_rx];
			player[playerid][OffSetRY] = gVehicleAttachmentData[vId][index][v_attachment_ry];
			player[playerid][OffSetRZ] = gVehicleAttachmentData[vId][index][v_attachment_rz];

			player[playerid][timer] = SetTimerEx("GetKeys", 30, true, "i", playerid);
			player[playerid][EditStatus] = FloatX;
			player[playerid][vehicleida] = vId;		
			player[playerid][obja] = doObject;
			player[playerid][selectedindex] = index;
			SM(playerid, COLOR_AQUA, "You started editing the attachment. Change edit options using /editobj.");
			SM(playerid, COLOR_WHITE, "[NOTE]: To stop editing, use '/editvobj stop'");
		}
		
	}
	else if(dialogid == DIALOG_VATTACHMENTS_TEXTURE)
	{
		if(!response)
		{
			return SPD( playerid, DIALOG_VATTACHMENTS_MAIN, DSL, D_INFO_TEXT, "Buy\nChange Position\nToggle Attachment\nDelete Attachment\nTexturize Attachment", "Select", "Abort" );
		}
		if(gVehicleAttachmentData[cvehicleid][listitem][v_attachment_db] == 0)
		{ 
			SendErrorMessage(playerid, "You have no item in this slot.");
			new items = 0, info[250];
			for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
			{
				if(gVehicleAttachmentData[cvehicleid][i][v_attachment_db] != 0)
				{
					items++;

					for (new j = 0; j < sizeof(gVehicleObjects); j++)
					{
						if(gVehicleAttachmentData[cvehicleid][i][v_attachment_model] == gVehicleObjects[j][E_VEHICLE_OBJECT_MODEL])
						{
							if(i > 0) strcat(info, "\n");
							strcat(info, gVehicleObjects[j][E_VEHICLE_OBJECT_NAME]);
							break;
						}
					}
				}
				else
				{
					if(i > 0) strcat(info, "\n");
					strcat(info, "None");
				}
			}
			return SPD(playerid, DIALOG_VATTACHMENTS_TEXTURE, DSL, "Texture items", info, "Edit", "Back");
		}
		if(gVehicleAttachmentData[cvehicleid][listitem][v_attachment_model] != 19327 && gVehicleAttachmentData[cvehicleid][listitem][v_attachment_model] != 2691)
		{ 
			SendErrorMessage(playerid, "Specified item cannot be texturized.");
			new items = 0, info[250];
			for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
			{
				if(gVehicleAttachmentData[cvehicleid][i][v_attachment_db] != 0)
				{
					items++;

					for (new j = 0; j < sizeof(gVehicleObjects); j++)
					{
						if(gVehicleAttachmentData[cvehicleid][i][v_attachment_model] == gVehicleObjects[j][E_VEHICLE_OBJECT_MODEL])
						{
							if(i > 0) strcat(info, "\n");
							strcat(info, gVehicleObjects[j][E_VEHICLE_OBJECT_NAME]);
							break;
						}
					}
				}
				else
				{
					if(i > 0) strcat(info, "\n");
					strcat(info, "None");
				}
			}
			return SPD(playerid, DIALOG_VATTACHMENTS_TEXTURE, DSL, "Texture items", info, "Edit", "Back");
		}
		pData[playerid][pSelected] = listitem;
		ShowPlayerDialog(playerid, dialog_editattachment , DIALOG_STYLE_LIST, "Edit Attachment", "Change Text\nChange Font\nChange Color\nChange Font Size\nChange Background Color\nChange Allignment\nBold Text\nChange Resolution", "Select", "Close");
		
	}
	else if( dialogid == dialog_editattachment ) {
		new slotidv = pData[playerid][pSelected];
		if( !response ) return true;
		switch(listitem)
		{
			case 0: ShowPlayerDialog(playerid, dialog_attachmenttext , DIALOG_STYLE_INPUT, "Change Text", "Enter the text you want to display. Use ~ to start a new line", "Select", "Back");
			case 1:
			{
				for(new a=0; a<sizeof(FontInfo); a++)
				{
					format(bstring, sizeof(bstring), "%s%s\n", bstring, FontInfo[a][FontName]);
				}
				ShowPlayerDialog(playerid, dialog_attachmentfont , DIALOG_STYLE_LIST, "Choose Font", bstring, "Select", "Back");
			}
			case 2: ShowPlayerDialog(playerid, dialog_attachmentfontcolor , DIALOG_STYLE_LIST, "Choose Color", ""MYRED"Red\n"MYBLUE"Blue\n"MYYELLOW"Yellow\n"MYORANGE"Orange\n"MYPURPLE"Purple\n"MYGREEN"Green\n"MYLBLUE"Light Blue\n"MYWHITE"White\n"MYBLACK"Black\n"MYCYAN"Cyan\n"MYPINK"Pink\n"MYBROWN"Brown\n"MYLPURPLE"Light Purple\n"MYLGREEN"Light Green\n"MYGREY"Gray", "Select", "Back");
			case 3: ShowPlayerDialog(playerid, dialog_attachmentfontsize , DIALOG_STYLE_INPUT, "Font Size","Please enter a font size for your Text\nMust be Numeric.", "Enter", "Back");
			case 4: ShowPlayerDialog(playerid, dialog_attachmentbgcolor , DIALOG_STYLE_LIST, "Background Color",""MYRED"Red\n"MYBLUE"Blue\n"MYYELLOW"Yellow\n"MYORANGE"Orange\n"MYPURPLE"Purple\n"MYGREEN"Green\n"MYLBLUE"Light Blue\n"MYWHITE"White\n"MYBLACK"Black\n"MYCYAN"Cyan\n"MYPINK"Pink\n"MYBROWN"Brown\n"MYLPURPLE"Light Purple\n"MYLGREEN"Light Green\n"MYGREY"Gray\nNo Background", "Select", "Back");
			case 5: ShowPlayerDialog(playerid, dialog_attachmentallignment , DIALOG_STYLE_LIST, "Choose Allignment", "Left Allignment\nCenter Allignment\nRight Allignment", "Select", "Back");
			case 6:
			{
				//format(string, sizeof(string), "Text Text %s", (gVehicleAttachmentData[cvehicleid][i][v_Bold] == 1) ? ("Un-Bolded") : ("Bolded"));
				//SendClientMessage(playerid,-1,string);
				gVehicleAttachmentData[cvehicleid][slotidv][v_Bold] =! gVehicleAttachmentData[cvehicleid][slotidv][v_Bold];
				format(globalstring, sizeof(globalstring), "%s",gVehicleAttachmentData[cvehicleid][slotidv][v_Text]);
				strreplace(globalstring, "~", "\n", true);
				SetDynamicObjectMaterialText(gVehicleAttachmentData[cvehicleid][slotidv][v_attachment_object] , 0 , globalstring , gVehicleAttachmentData[cvehicleid][slotidv][v_Res], gVehicleAttachmentData[cvehicleid][slotidv][v_Font], gVehicleAttachmentData[cvehicleid][slotidv][v_Size], gVehicleAttachmentData[cvehicleid][slotidv][v_Bold], gVehicleAttachmentData[cvehicleid][slotidv][v_Color], gVehicleAttachmentData[cvehicleid][slotidv][v_BGC],gVehicleAttachmentData[cvehicleid][slotidv][v_ALG]);
				ShowPlayerDialog(playerid, dialog_editattachment , DIALOG_STYLE_LIST, "Edit Text", "Change Text\nChange Font\nChange Color\nChange Font Size\nChange Background Color\nChange Allignment\nBold Text\nChange Resolution", "Select", "Close");
			}
			case 7: ShowPlayerDialog(playerid, dialog_attachmentresolution , DIALOG_STYLE_LIST, "Choose Resolution", "32x32\n64x32\n64x64\n128x32\n128x64\n128x128\n256x32\n256x64\n256x128\n256x256\n512x64\n512x128\n512x256\n512x512", "Select", "Back");
		}
	}
	else if(dialogid == dialog_attachmenttext)
	{
		new slotidz = pData[playerid][pSelected];
		if(!response) return ShowPlayerDialog(playerid, dialog_editattachment , DIALOG_STYLE_LIST, "Edit Attachment", "Change Text\nChange Font\nChange Color\nChange Font Size\nChange Background Color\nChange Allignment\nBold Text\nChange Resolution", "Select", "Close");
		if(strlen(inputtext) >= MAX_TEXT || strlen(inputtext) <= 0 ) return SendClientMessage(playerid, -1 ,"Text may not be less than 0 or more than "#MAX_TEXT"!");
		format(globalstring, sizeof(globalstring), "%s", inputtext);
		strreplace(globalstring, "~", "\n", true);
		SetDynamicObjectMaterialText(gVehicleAttachmentData[cvehicleid][slotidz][v_attachment_object] , 0 , globalstring , gVehicleAttachmentData[cvehicleid][slotidz][v_Res]  , gVehicleAttachmentData[cvehicleid][slotidz][v_Font], gVehicleAttachmentData[cvehicleid][slotidz][v_Size], gVehicleAttachmentData[cvehicleid][slotidz][v_Bold], gVehicleAttachmentData[cvehicleid][slotidz][v_Color], gVehicleAttachmentData[cvehicleid][slotidz][v_BGC],gVehicleAttachmentData[cvehicleid][slotidz][v_ALG]);
		format(gVehicleAttachmentData[cvehicleid][slotidz][v_Text],256,inputtext);
		sql_attachment_update_string(cvehicleid, slotidz, "text", gVehicleAttachmentData[cvehicleid][slotidz][v_Text] );
		ShowPlayerDialog(playerid, dialog_editattachment , DIALOG_STYLE_LIST, "Edit Text", "Change Text\nChange Font\nChange Color\nChange Font Size\nChange Background Color\nChange Allignment\nBold Text\nChange Resolution", "Select", "Close");
	}
	else if(dialogid == dialog_attachmentallignment)
	{
		new slotidz = pData[playerid][pSelected];
		if(!response) return ShowPlayerDialog(playerid, dialog_editattachment , DIALOG_STYLE_LIST, "Edit Attachment", "Change Text\nChange Font\nChange Color\nChange Font Size\nChange Background Color\nChange Allignment\nBold Text\nChange Resolution", "Select", "Close");
		gVehicleAttachmentData[cvehicleid][slotidz][v_ALG] = listitem;
		sql_attachment_update_integer(cvehicleid, slotidz, "ALG", gVehicleAttachmentData[cvehicleid][slotidz][v_ALG] );
		ShowPlayerDialog(playerid, dialog_attachmentallignment , DIALOG_STYLE_LIST, "Choose Allignment", "Left Allignment\nCenter Allignment\nRight Allignment", "Select", "Back");
		format(globalstring, sizeof(globalstring), "%s", gVehicleAttachmentData[cvehicleid][slotidz][v_Text]);
		strreplace(globalstring, "~", "\n", true);
		SetDynamicObjectMaterialText(gVehicleAttachmentData[cvehicleid][slotidz][v_attachment_object] , 0 , globalstring , gVehicleAttachmentData[cvehicleid][slotidz][v_Res], gVehicleAttachmentData[cvehicleid][slotidz][v_Font], gVehicleAttachmentData[cvehicleid][slotidz][v_Size], gVehicleAttachmentData[cvehicleid][slotidz][v_Bold], gVehicleAttachmentData[cvehicleid][slotidz][v_Color], gVehicleAttachmentData[cvehicleid][slotidz][v_BGC],gVehicleAttachmentData[cvehicleid][slotidz][v_ALG]);
	}
	else if(dialogid == dialog_attachmentresolution)
	{
		new slotidz = pData[playerid][pSelected];
		if(!response) return ShowPlayerDialog(playerid, dialog_editattachment , DIALOG_STYLE_LIST, "Edit Attachment", "Change Text\nChange Font\nChange Color\nChange Font Size\nChange Background Color\nChange Allignment\nBold Text\nChange Resolution", "Select", "Close");
		gVehicleAttachmentData[cvehicleid][slotidz][v_Res] = (listitem+1) * 10;
		sql_attachment_update_integer(cvehicleid, slotidz, "res", gVehicleAttachmentData[cvehicleid][slotidz][v_Res] );
		ShowPlayerDialog(playerid, dialog_attachmentresolution , DIALOG_STYLE_LIST, "Choose Resolution", "32x32\n64x32\n64x64\n128x32\n128x64\n128x128\n256x32\n256x64\n256x128\n256x256\n512x64\n512x128\n512x256\n512x512", "Select", "Back");
		format(globalstring, sizeof(globalstring), "%s", gVehicleAttachmentData[cvehicleid][slotidz][v_Text]);
		strreplace(globalstring, "~", "\n", true);
		SetDynamicObjectMaterialText(gVehicleAttachmentData[cvehicleid][slotidz][v_attachment_object] , 0 , globalstring , gVehicleAttachmentData[cvehicleid][slotidz][v_Res], gVehicleAttachmentData[cvehicleid][slotidz][v_Font], gVehicleAttachmentData[cvehicleid][slotidz][v_Size], gVehicleAttachmentData[cvehicleid][slotidz][v_Bold], gVehicleAttachmentData[cvehicleid][slotidz][v_Color], gVehicleAttachmentData[cvehicleid][slotidz][v_BGC],gVehicleAttachmentData[cvehicleid][slotidz][v_ALG]);
	}
	else if(dialogid == dialog_attachmentfontsize)
	{
		new slotidz = pData[playerid][pSelected];
		if(!response) return ShowPlayerDialog(playerid, dialog_editattachment , DIALOG_STYLE_LIST, "Edit Attachment", "Change Text\nChange Font\nChange Color\nChange Font Size\nChange Background Color\nChange Allignment\nBold Text\nChange Resolution", "Select", "Close");
		if(!IsNumeric(inputtext)) return ShowPlayerDialog(playerid, dialog_attachmentfontsize , DIALOG_STYLE_INPUT, "Font Size","Enter a Font Size\nMust be numeric", "Enter", "Close");
		gVehicleAttachmentData[cvehicleid][slotidz][v_Size] = strval(inputtext);
		sql_attachment_update_integer( cvehicleid, slotidz, "size", gVehicleAttachmentData[cvehicleid][slotidz][v_Size] );
		format(globalstring, sizeof(globalstring), "%s", gVehicleAttachmentData[cvehicleid][slotidz][v_Text]);
		strreplace(globalstring, "~", "\n", true);
		SetDynamicObjectMaterialText(gVehicleAttachmentData[cvehicleid][slotidz][v_attachment_object] , 0 , globalstring , gVehicleAttachmentData[cvehicleid][slotidz][v_Res] ,gVehicleAttachmentData[cvehicleid][slotidz][v_Font], gVehicleAttachmentData[cvehicleid][slotidz][v_Size] , gVehicleAttachmentData[cvehicleid][slotidz][v_Bold], gVehicleAttachmentData[cvehicleid][slotidz][v_Color], gVehicleAttachmentData[cvehicleid][slotidz][v_BGC],gVehicleAttachmentData[cvehicleid][slotidz][v_ALG]);
		ShowPlayerDialog(playerid, dialog_editattachment , DIALOG_STYLE_LIST, "Edit Attachment", "Change Text\nChange Font\nChange Color\nChange Font Size\nChange Background Color\nChange Allignment\nBold Text\nChange Resolution", "Select", "Close");
	}
	else if(dialogid == dialog_attachmentfont)
	{
		new slotidz = pData[playerid][pSelected];
		if(!response) return ShowPlayerDialog(playerid, dialog_editattachment , DIALOG_STYLE_LIST, "Edit Attachment", "Change Text\nChange Font\nChange Color\nChange Font Size\nChange Background Color\nChange Allignment\nBold Text\nChange Resolution", "Select", "Close");
		format(globalstring, sizeof(globalstring), "%s", gVehicleAttachmentData[cvehicleid][slotidz][v_Text]);
		strreplace(globalstring, "~", "\n", true);
		SetDynamicObjectMaterialText(gVehicleAttachmentData[cvehicleid][slotidz][v_attachment_object] , 0 , globalstring , gVehicleAttachmentData[cvehicleid][slotidz][v_Res],inputtext, gVehicleAttachmentData[cvehicleid][slotidz][v_Size], gVehicleAttachmentData[cvehicleid][slotidz][v_Bold], gVehicleAttachmentData[cvehicleid][slotidz][v_Color], gVehicleAttachmentData[cvehicleid][slotidz][v_BGC],gVehicleAttachmentData[cvehicleid][slotidz][v_ALG]);
		format(gVehicleAttachmentData[cvehicleid][slotidz][v_Font],128,inputtext);
		sql_attachment_update_string( cvehicleid, slotidz, "font", gVehicleAttachmentData[cvehicleid][slotidz][v_Font] );
		for(new a=0; a<sizeof(FontInfo); a++)
		{
			format(bstring, sizeof(bstring), "%s%s\n", bstring, FontInfo[a][FontName]);
		}
		ShowPlayerDialog(playerid, dialog_attachmentfont , DIALOG_STYLE_LIST, "Choose Font", bstring, "Select", "Back");
	}
	else if(dialogid == dialog_attachmentfontcolor)
	{
		new slotidz = pData[playerid][pSelected];
		if(!response) return ShowPlayerDialog(playerid, dialog_editattachment , DIALOG_STYLE_LIST, "Edit Attachment", "Change Text\nChange Font\nChange Color\nChange Font Size\nChange Background Color\nChange Allignment\nBold Text\nChange Resolution", "Select", "Close");
		switch(listitem)
		{
			case 0: gVehicleAttachmentData[cvehicleid][slotidz][v_Color]  = MRED;
			case 1: gVehicleAttachmentData[cvehicleid][slotidz][v_Color]  = MBLUE;
			case 2: gVehicleAttachmentData[cvehicleid][slotidz][v_Color]  = MYELLOW;
			case 3: gVehicleAttachmentData[cvehicleid][slotidz][v_Color]  = MORANGE;
			case 4: gVehicleAttachmentData[cvehicleid][slotidz][v_Color]  = MPURPLE;
			case 5: gVehicleAttachmentData[cvehicleid][slotidz][v_Color]  = MGREEN;
			case 6: gVehicleAttachmentData[cvehicleid][slotidz][v_Color]  = MLBLUE;
			case 7: gVehicleAttachmentData[cvehicleid][slotidz][v_Color]  = MWHITE;
			case 8: gVehicleAttachmentData[cvehicleid][slotidz][v_Color]  = MBLACK;
			case 9: gVehicleAttachmentData[cvehicleid][slotidz][v_Color]  = MCYAN;
			case 10: gVehicleAttachmentData[cvehicleid][slotidz][v_Color] = MPINK;
			case 11: gVehicleAttachmentData[cvehicleid][slotidz][v_Color] = MBROWN;
			case 12: gVehicleAttachmentData[cvehicleid][slotidz][v_Color] = MLPURPLE;
			case 13: gVehicleAttachmentData[cvehicleid][slotidz][v_Color] = MLGREEN;
			case 14: gVehicleAttachmentData[cvehicleid][slotidz][v_Color] = MGRAY;
		}
		sql_attachment_update_integer(cvehicleid, slotidz, "color", gVehicleAttachmentData[cvehicleid][slotidz][v_Color] );
		format(globalstring, sizeof(globalstring), "%s", gVehicleAttachmentData[cvehicleid][slotidz][v_Text]);
		strreplace(globalstring, "~", "\n", true);
		SetDynamicObjectMaterialText(gVehicleAttachmentData[cvehicleid][slotidz][v_attachment_object] , 0 , globalstring , gVehicleAttachmentData[cvehicleid][slotidz][v_Res],gVehicleAttachmentData[cvehicleid][slotidz][v_Font], gVehicleAttachmentData[cvehicleid][slotidz][v_Size], gVehicleAttachmentData[cvehicleid][slotidz][v_Bold],gVehicleAttachmentData[cvehicleid][slotidz][v_Color], gVehicleAttachmentData[cvehicleid][slotidz][v_BGC],gVehicleAttachmentData[cvehicleid][slotidz][v_ALG]);
		ShowPlayerDialog(playerid, dialog_attachmentfontcolor , DIALOG_STYLE_LIST, "Choose Color", ""MYRED"Red\n"MYBLUE"Blue\n"MYYELLOW"Yellow\n"MYORANGE"Orange\n"MYPURPLE"Purple\n"MYGREEN"Green\n"MYLBLUE"Light Blue\n"MYWHITE"White\n"MYBLACK"Black\n"MYCYAN"Cyan\n"MYPINK"Pink\n"MYBROWN"Brown\n"MYLPURPLE"Light Purple\n"MYLGREEN"Light Green\n"MYGREY"Gray", "Select", "Back");
	}
	else if(dialogid == dialog_attachmentbgcolor)
	{
		new slotidz = pData[playerid][pSelected];
		if(!response) return ShowPlayerDialog(playerid, dialog_editattachment , DIALOG_STYLE_LIST, "Edit Attachment", "Change Text\nChange Font\nChange Color\nChange Font Size\nChange Background Color\nChange Allignment\nBold Text\nChange Resolution", "Select", "Close");
		switch(listitem)
		{
			case 0:	gVehicleAttachmentData[cvehicleid][slotidz][v_BGC]  = MRED;
			case 1: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC]  = MBLUE;
			case 2: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC]  = MYELLOW;
			case 3: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC]  = MORANGE;
			case 4: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC]  = MPURPLE;
			case 5: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC]  = MGREEN;
			case 6: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC]  = MLBLUE;
			case 7: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC]  = MWHITE;
			case 8: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC]  = MBLACK;
			case 9: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC]  = MCYAN;
			case 10: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC] = MPINK;
			case 11: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC] = MBROWN;
			case 12: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC] = MLPURPLE;
			case 13: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC] = MLGREEN;
			case 14: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC] = MGRAY;
			case 15: gVehicleAttachmentData[cvehicleid][slotidz][v_BGC] = 0;
		}
		sql_attachment_update_integer(cvehicleid, slotidz, "BGC", gVehicleAttachmentData[cvehicleid][slotidz][v_BGC] );
		ShowPlayerDialog(playerid, dialog_attachmentbgcolor , DIALOG_STYLE_LIST, "Background Color",""MYRED"Red\n"MYBLUE"Blue\n"MYYELLOW"Yellow\n"MYORANGE"Orange\n"MYPURPLE"Purple\n"MYGREEN"Green\n"MYLBLUE"Light Blue\n"MYWHITE"White\n"MYBLACK"Black\n"MYCYAN"Cyan\n"MYPINK"Pink\n"MYBROWN"Brown\n"MYLPURPLE"Light Purple\n"MYLGREEN"Light Green\n"MYGREY"Gray\nNo Background", "Select", "Back");
		format(globalstring, sizeof(globalstring), "%s", gVehicleAttachmentData[cvehicleid][slotidz][v_Text]);
		strreplace(globalstring, "~", "\n", true);
		SetDynamicObjectMaterialText(gVehicleAttachmentData[cvehicleid][slotidz][v_attachment_object] , 0 ,globalstring, gVehicleAttachmentData[cvehicleid][slotidz][v_Res],gVehicleAttachmentData[cvehicleid][slotidz][v_Font], gVehicleAttachmentData[cvehicleid][slotidz][v_Size], gVehicleAttachmentData[cvehicleid][slotidz][v_Bold] ,gVehicleAttachmentData[cvehicleid][slotidz][v_Color], gVehicleAttachmentData[cvehicleid][slotidz][v_BGC] ,gVehicleAttachmentData[cvehicleid][slotidz][v_ALG]);
	}


//OnPlayerSelectionmenu
case MODEL_SELECTION_VATTACH:
	    {
		    new vehicleid = ChosenVehicleID[playerid];
			if( response ) {
				new free_index = -1;
				for (new i = 0; i < MAX_VEHICLE_ATTACHED_ITEMS; i++)
				{
					if(gVehicleAttachmentData[vehicleid][i][v_attachment_db] == 0)
					{
						free_index = i;
						break;
					}
				}
				if(free_index == -1)
				{
					SendErrorMessage(playerid, "* Vehicle already has 5 attached objects.");
					return 1;
				}

				gVehicleAttachmentData[vehicleid][free_index][v_attachment_model] = modelid;

				new Float:x,Float:y,Float:z;
				GetPlayerPos( playerid, x, y, z);
				GetXYInFrontOfPlayer(playerid, x, y, 2.0);
				if(IsValidDynamicObject(gVehicleAttachmentData[vehicleid][free_index][v_attachment_object]))
					DestroyDynamicObject(gVehicleAttachmentData[vehicleid][free_index][v_attachment_object]);
				gVehicleAttachmentData[vehicleid][free_index][v_attachment_object] = CreateDynamicObject( modelid, x, y, z, 0.0, 0.0, 0.0 , -1 , -1, -1, 300.0, 300.0 );
				if(modelid == 19327 || modelid == 2691)
				{
					format(gVehicleAttachmentData[vehicleid][free_index][v_Text],30,"Text");
					format(gVehicleAttachmentData[vehicleid][free_index][v_Font],30,"Arial");
					gVehicleAttachmentData[vehicleid][free_index][v_Color] = MPINK;
					gVehicleAttachmentData[vehicleid][free_index][v_Size] = 25;
					gVehicleAttachmentData[vehicleid][free_index][v_BGC] = MWHITE;
					gVehicleAttachmentData[vehicleid][free_index][v_ALG] = 1;
					gVehicleAttachmentData[vehicleid][free_index][v_Bold] = 0;
					gVehicleAttachmentData[vehicleid][free_index][v_Res] = 90;
					gVehicleData[vehicleid][E_VEHICLE_DB_ID] = VehicleInfo[vehicleid][vID];
					SetDynamicObjectMaterialText(gVehicleAttachmentData[vehicleid][free_index][v_attachment_object] , 0 , gVehicleAttachmentData[vehicleid][free_index][v_Text] ,gVehicleAttachmentData[vehicleid][free_index][v_Res],gVehicleAttachmentData[vehicleid][free_index][v_Font], gVehicleAttachmentData[vehicleid][free_index][v_Size], gVehicleAttachmentData[vehicleid][free_index][v_Bold] , gVehicleAttachmentData[vehicleid][free_index][v_Color],gVehicleAttachmentData[vehicleid][free_index][v_BGC],gVehicleAttachmentData[vehicleid][free_index][v_ALG]);
				}
				EditDynamicObject(playerid, gVehicleAttachmentData[vehicleid][free_index][v_attachment_object]);
				SetPVarInt(playerid, "edit_cartoysid", vehicleid);
				SetPVarInt(playerid, "edit_cartoysi", free_index);
				SendInfoMessage(playerid, "* You bought an item!");


				new query[500];
				mysql_format(connectionID, query, sizeof(query), "INSERT INTO `vattachments` (`veh_id`, `Model`, `text`, `font`, `color`, `size`, `BOLD`, `res`, `BGC`, `ALG`, `X`, `Y`, `Z`, `RX`, `RY`, `RZ`) VALUES (%d, %d, '%e', '%e', %d, %d, %d, %d, %d, %d, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)", VehicleInfo[vehicleid][vID], modelid, gVehicleAttachmentData[vehicleid][free_index][v_Text], gVehicleAttachmentData[vehicleid][free_index][v_Font], gVehicleAttachmentData[vehicleid][free_index][v_Color], gVehicleAttachmentData[vehicleid][free_index][v_Size], gVehicleAttachmentData[vehicleid][free_index][v_Bold], gVehicleAttachmentData[vehicleid][free_index][v_Res], gVehicleAttachmentData[vehicleid][free_index][v_BGC], gVehicleAttachmentData[vehicleid][free_index][v_ALG]);
				mysql_tquery(connectionID, query, "InsertVehAttachment", "ii", vehicleid, free_index);
			}
	    }


//Dialog enums
dialog_Vtoggleitem,
	DIALOG_ATTACHMENTS,
	DIALOG_ATTACHMENTS_SLOTNAME,
	DIALOG_ATTACHMENTS_SLOTEDITNAME,
	DIALOG_ATTACHMENTS_SLOTEDIT,
	DIALOG_ATTACHMENTS_SLOTDELETE,
	DIALOG_ATTACHMENTS_MAIN,
	DIALOG_ATTACHMENTS_CATEGORY,
	DIALOG_ATTACHMENTS_GLASSES,
	DIALOG_ATTACHMENTS_HATS,
	DIALOG_ATTACHMENTS_BANDANA,
	DIALOG_ATTACHMENTS_CAP,
	DIALOG_ATTACHMENTS_HELMETS,
	DIALOG_ATTACHMENTS_MASKS,
	DIALOG_ATTACHMENTS_EDIT,
	DIALOG_ATTACHMENTS_BONE,
	DIALOG_ATTACHMENTS_EDITBONE,
	DIALOG_ATTACHMENTS_TOGGLE,
	DIALOG_ATTACHMENTS_REMOVE,
   //============vehicle============================
	DIALOG_VATTACHMENTS_MAIN,
	DIALOG_VATTACHMENTS_CATEGORY,
	DIALOG_VATTACHMENTS_GLASSES,
	DIALOG_VATTACHMENTS_HATS,
	DIALOG_VATTACHMENTS_BANDANA,
	DIALOG_VATTACHMENTS_CAP,
	DIALOG_VATTACHMENTS_HELMETS,
	DIALOG_VATTACHMENTS_MASKS,
	DIALOG_VATTACHMENTS_EDIT,
	DIALOG_VATTACHMENTS_EDIT2,
	DIALOG_VATTACHMENTS_BONE,
	DIALOG_VATTACHMENTS_TOGGLE,
	DIALOG_VATTACHMENTS_REMOVE,
	DIALOG_VATTACHMENTS_TEXTURE,
  //===========================TEXTURIZE========================
	dialog_editattachment,
	dialog_attachmenttext,
	dialog_attachmentfont,
	dialog_attachmentfontcolor, 
	dialog_attachmentfontsize,
	dialog_attachmentbgcolor,
	dialog_attachmentallignment,
	dialog_attachmentresolution,