local pedDialogWindow
local last_output=0
local thePed
function pedDialog_FAA(ped)
	if getElementData(getLocalPlayer(), "exclusiveGUI") then
		return
	end
	thePed = ped
	local width, height = 250, 135
	local scrWidth, scrHeight = guiGetScreenSize()
	local x = scrWidth/2 - (width/2)
	local y = scrHeight/2 - (height/2)
	if pedDialogWindow and isElement(pedDialogWindow) then
		destroyElement(pedDialogWindow)
	end
	pedDialogWindow = guiCreateWindow(x, y, width, height, "LSIA Receptionist", false)

	b1 = guiCreateButton(10, 30, width-20, 20, "I want to leave a message", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b1, pedDialog_FAA_leaveMessage, false)

	b2 = guiCreateButton(10, 55, width-20, 20, "What licenses are registered on me?", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b2, pedDialog_FAA_myInfo, false)

	b3 = guiCreateButton(10, 80, width-20, 20, "I want a pilot license", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b3, pedDialog_FAA_wantLicense, false)

	b4 = guiCreateButton(10, 105, width-20, 20, "No thanks, I'm just looking", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b4, pedDialog_FAA_noHelp, false)

	--showCursor(true)
	if getTickCount()-last_output<10000 then 
		
		return 
	else
		last_dialog=getTickCount()
		triggerServerEvent("airport:ped:outputchat",resourceRoot, thePed, "local", "Welcome to the LSIA reception. Can I help you?")
	end
end
addEvent("airport:ped:receptionistFAA", true)
addEventHandler("airport:ped:receptionistFAA", getRootElement(), pedDialog_FAA)

function endDialog()
	if pedDialogWindow and isElement(pedDialogWindow) then
		destroyElement(pedDialogWindow)
		pedDialogWindow = nil
	end
end

function pedDialog_FAA_noHelp()
	endDialog()
	if getTickCount()-last_output<10000 then 
		
		return 
	else
		last_dialog=getTickCount()
		triggerServerEvent("airport:ped:outputchat", resourceRoot, thePed, "local", "Okay.")
	end
end

function pedDialog_FAA_myInfo()
	if pedDialogWindow and isElement(pedDialogWindow) then
		destroyElement(pedDialogWindow)
	end
	local width, height = 200, 250
	local scrWidth, scrHeight = guiGetScreenSize()
	local x = scrWidth/2 - (width/2)
	local y = scrHeight/2 - (height/2)
	if pedDialogWindow and isElement(pedDialogWindow) then
		destroyElement(pedDialogWindow)
	end
	pedDialogWindow = guiCreateWindow(x, y, width, height, "LSIA Receptionist - My Licenses", false)

	myInfoGridlist = guiCreateGridList(10, 30, width-20, height-65, false, pedDialogWindow)

	b1 = guiCreateButton(10, (height-65)+35, width-20, 20, "Close", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b1, endDialog, false)

	triggerServerEvent("airport:getLicenses", resourceRoot, thePed)
end

function pedDialog_FAA_myInfoCallback(licenses)
	if pedDialogWindow and isElement(pedDialogWindow) and myInfoGridlist and isElement(myInfoGridlist) then
		if #licenses > 0 then
			local column = guiGridListAddColumn(myInfoGridlist, "License", 0.9)
			for k,v in ipairs(licenses) do
				local row = guiGridListAddRow(myInfoGridlist)
				guiGridListSetItemText(myInfoGridlist, row, column, tostring(v[3]), false, false)
			end
		else
			local column = guiGridListAddColumn(myInfoGridlist, "You have no pilot licenses", 0.9)
		end
	end
end
addEvent("airport:getLicensesCallback", true)
addEventHandler("airport:getLicensesCallback", getResourceRootElement(), pedDialog_FAA_myInfoCallback)

function pedDialog_FAA_leaveMessage()
	guiSetInputMode("no_binds_when_editing")
	if pedDialogWindow and isElement(pedDialogWindow) then
		destroyElement(pedDialogWindow)
	end
	local width, height = 300, 150
	local scrWidth, scrHeight = guiGetScreenSize()
	local x = scrWidth/2 - (width/2)
	local y = scrHeight/2 - (height/2)
	if pedDialogWindow and isElement(pedDialogWindow) then
		destroyElement(pedDialogWindow)
	end
	pedDialogWindow = guiCreateWindow(x, y, width, height, "LSIA Receptionist - Leave Message", false)

	leaveMessageMemo = guiCreateMemo(10, 30, width-20, height-90, "", false, pedDialogWindow)

	b1 = guiCreateButton(10, (height-90)+35, width-20, 20, "Leave Message", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b1, pedDialog_FAA_leaveMessage_send, false)

	b2 = guiCreateButton(10, (height-90)+60, width-20, 20, "Close", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b2, endDialog, false)
	if getTickCount()-last_output<10000 then 
		
		return 
	else
		last_dialog=getTickCount()
		triggerServerEvent("airport:ped:outputchat", resourceRoot, thePed, "local", "Sure. What can I pass on for you?")
	end
end

function pedDialog_FAA_leaveMessage_send()
	if pedDialogWindow and isElement(pedDialogWindow) and leaveMessageMemo and isElement(leaveMessageMemo) then
		local message = guiGetText(leaveMessageMemo)
		if message and string.len(message) > 5 then
			destroyElement(pedDialogWindow)
			pedDialogWindow = nil
			triggerServerEvent("airport:ped:receptionistFAA:sendMessage", resourceRoot, thePed, message)
		end
	end
	guiSetInputMode("allow_binds")
end

function pedDialog_FAA_wantLicense()
	if pedDialogWindow and isElement(pedDialogWindow) then
		destroyElement(pedDialogWindow)
	end
	local width, height = 400, 160
	local scrWidth, scrHeight = guiGetScreenSize()
	local x = scrWidth/2 - (width/2)
	local y = scrHeight/2 - (height/2)
	if pedDialogWindow and isElement(pedDialogWindow) then
		destroyElement(pedDialogWindow)
	end
	pedDialogWindow = guiCreateWindow(x, y, width, height, "LSIA Receptionist - Flight School Info", false)

	local label1 = guiCreateLabel(10, 30, width-20, 40, "You can apply to the flight school at our websites.\nYou'll also find more information there.", false, pedDialogWindow)

	local label2 = guiCreateLabel(10, 70, width-20, 20, "(( Copy the following URL and paste it into your browser:", false, pedDialogWindow)

	local edit1 = guiCreateEdit(10, 90, width-20, 20, "http://owl.pm/f/1141", false, pedDialogWindow)
		guiEditSetReadOnly(edit1, true)

	local label3 = guiCreateLabel(10, 110, width-20, 20, "))", false, pedDialogWindow)

	b1 = guiCreateButton(10, 130, width-20, 20, "OK", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b1, endDialog, false)
	if getTickCount()-last_output<10000 then 
		
		return 
	else
		last_dialog=getTickCount()
		triggerServerEvent("airport:ped:outputchat", resourceRoot, thePed, "local", "You can apply to the flight school at our websites.")
	end
end

function pedDialog_LSAgatekeeper(ped)
	if getElementData(getLocalPlayer(), "exclusiveGUI") then
		return
	end
	thePed = ped
	local width, height = 250, 135
	local scrWidth, scrHeight = guiGetScreenSize()
	local x = scrWidth/2 - (width/2)
	local y = scrHeight/2 - (height/2)
	if pedDialogWindow and isElement(pedDialogWindow) then
		destroyElement(pedDialogWindow)
	end
	pedDialogWindow = guiCreateWindow(x, y, width, height, "Airport Gatekeeper", false)

	b1 = guiCreateButton(10, 30, width-20, 20, "I'm looking for the LSIA reception.", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b1, pedDialog_LSAgatekeeper_reception, false)

	b2 = guiCreateButton(10, 55, width-20, 20, "Can you let me in?", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b2, pedDialog_LSAgatekeeper_letmein, false)

	b3 = guiCreateButton(10, 80, width-20, 20, "I have a flight to catch.", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b3, pedDialog_LSAgatekeeper_flight, false)

	b4 = guiCreateButton(10, 105, width-20, 20, "No thanks, I'm just looking.", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b4, pedDialog_LSAgatekeeper_noHelp, false)

	--showCursor(true)
	if getTickCount()-last_output<10000 then 
		
		return 
	else
		last_dialog=getTickCount()
		triggerServerEvent("airport:ped:outputchat", resourceRoot, thePed, "local", "May I help you?")
	end
end
addEvent("airport:ped:LSAgatekeeper", true)
addEventHandler("airport:ped:LSAgatekeeper", getRootElement(), pedDialog_LSAgatekeeper)

function pedDialog_LSAgatekeeper_noHelp()
	endDialog()
	if getTickCount()-last_output<10000 then 
		
		return 
	else
		last_dialog=getTickCount()
		triggerServerEvent("airport:ped:outputchat", resourceRoot, thePed, "local", "Okay.")
	end
end

function pedDialog_LSAgatekeeper_flight()
	endDialog()
	if getTickCount()-last_output<10000 then 
		
		return 
	end
	last_dialog=getTickCount()
	triggerServerEvent("airport:ped:outputchat", resourceRoot, thePed, "local", "Oh, you need to go to the passenger terminal for that.")
end

function pedDialog_LSAgatekeeper_reception()
	endDialog()
	if getTickCount()-last_output<10000 then 
		
		return 
	else
		last_dialog=getTickCount()
		triggerServerEvent("airport:ped:outputchat", resourceRoot, thePed, "local", "The LSIA reception is at the terminal building. Head over there and get to the bottom floor.")
	end
end

function pedDialog_LSAgatekeeper_letmein()
	endDialog()
	if getTickCount()-last_output<10000 then 
		
		return 
	else
		last_dialog=getTickCount()
		triggerServerEvent("airport:ped:outputchat", resourceRoot, thePed, "local", "Pilots, airport workers and people from LSIA or the emergency services can get in here.")
	end
end

function pedDialog_VMAT(ped)
	if getElementData(getLocalPlayer(), "exclusiveGUI") then
		return
	end
	thePed = ped
	local width, height = 250, 85
	local scrWidth, scrHeight = guiGetScreenSize()
	local x = scrWidth/2 - (width/2)
	local y = scrHeight/2 - (height/2)
	if pedDialogWindow and isElement(pedDialogWindow) then
		destroyElement(pedDialogWindow)
	end
	pedDialogWindow = guiCreateWindow(x, y, width, height, "VMAT device bureaucrat", false)

	b1 = guiCreateButton(10, 30, width-20, 20, "I need a VMAT device.", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b1, pedDialog_VMAT_device, false)

	b2 = guiCreateButton(10, 55, width-20, 20, "Never mind.", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b2, pedDialog_VMAT_noHelp, false)
end
addEvent("airport:ped:vmat", true)
addEventHandler("airport:ped:vmat", getRootElement(), pedDialog_VMAT)

function pedDialog_VMAT_noHelp()
	endDialog()
	if getTickCount()-last_output<10000 then 
		
		return 
	else
		last_dialog=getTickCount()
		triggerServerEvent("airport:ped:outputchat", resourceRoot, thePed, "local", "Okay.")
	end
end

function pedDialog_VMAT_device()
	local isMember, rankID = exports.factions:isPlayerInFaction(localPlayer, 47)
	local isLeader = exports.factions:hasMemberPermissionTo(localPlayer, 47, "add_member")
	rankID = tonumber(rankID) or 0
	if not isMember or not isLeader or (rankID < 18) then
		endDialog()
		if getTickCount()-last_output<10000 then 
		
			return 
		else
			last_dialog=getTickCount()
			triggerServerEvent("airport:ped:outputchat", resourceRoot, thePed, "local", "You don't have the authorization.")
		end
		return
	end
	if getTickCount()-last_output<10000 then 
		
		return 
	else
		last_dialog=getTickCount()
		triggerServerEvent("airport:ped:outputchat", resourceRoot, thePed, "me", "hands a form to "..tostring(exports.global:getPlayerName(localPlayer))..".")
		triggerServerEvent("airport:ped:outputchat", resourceRoot, thePed, "local", "Just fill out this form.")
	end
	local width, height = 270, 100
	local scrWidth, scrHeight = guiGetScreenSize()
	local x = scrWidth/2 - (width/2)
	local y = scrHeight/2 - (height/2)
	if pedDialogWindow and isElement(pedDialogWindow) then
		destroyElement(pedDialogWindow)
	end
	pedDialogWindow = guiCreateWindow(x, y, width, height, "VMAT device bureaucrat", false)
	local lbl1 = guiCreateLabel(10, 30, 50, 25, "Callsign:", false, pedDialogWindow)
	input1 = guiCreateEdit(60, 30, 200, 25, "", false, pedDialogWindow)

	b1 = guiCreateButton(10, 65, (width/2)-20, 25, "Never mind", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b1, function()
			endDialog()
			if getTickCount()-last_output<10000 then 
		
				return 
			else
				last_dialog=getTickCount()
				triggerServerEvent("airport:ped:outputchat", resourceRoot, thePed, "local", "Suit yourself.")
			end
		end, false)

	b2 = guiCreateButton((width/2)+5, 65, (width/2)-20, 25, "Issue", false, pedDialogWindow)
	addEventHandler("onClientGUIClick", b2, function()
			guiSetEnabled(b2, false)
			local callsign = guiGetText(input1)
			triggerServerEvent("airport:spawnVMAT", resourceRoot, thePed, callsign)
			endDialog()
		end, false)

	guiSetInputMode("no_binds_when_editing")
end