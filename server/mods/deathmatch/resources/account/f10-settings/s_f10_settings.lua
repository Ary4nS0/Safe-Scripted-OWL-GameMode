local mysql = exports.mysql
function updateSetting(name, value)
	
	if source then
		client = source
	end
	if client and name and value then
		local id = getElementData(client, "account:id") or false
		if id then
			name = mysql:escape_string(name)
			value = mysql:escape_string(value)
			mysql:query_free("REPLACE INTO account_settings (id, name, value ) VALUES ('"..id.."', '"..name.."', '"..value.."') ")
		end
	end
end
addEvent("accounts:settings:update", true)--safe
addEventHandler("accounts:settings:update", root, updateSetting)

function updateCharacterSetting(name, value)
	
	if source then
		client = source
	end
	if client and name and value then
		local id = getElementData(client, "dbid") or false
		if id then
			name = mysql:escape_string(name)
			value = mysql:escape_string(value)
			mysql:query_free("REPLACE INTO character_settings (id, name, value ) VALUES ('"..id.."', '"..name.."', '"..value.."') ")
		end
	end
end
addEvent("accounts:settings:updateCharacterSetting", true)--safe
addEventHandler("accounts:settings:updateCharacterSetting", root, updateCharacterSetting)

function loadAccountSettings(player,id)
	
	if player and id then
		--outputDebugString(tostring(id))
		local settings = {}
		local count = 0
		local query1 = mysql:query("SELECT * FROM `account_settings` WHERE `id` = '"..id.."' ") or false
		while true do
			local row = mysql:fetch_assoc(query1)
			if not row then break end

			if (row.name == 'duty_admin' and not exports.integration:isPlayerTrialAdmin(player)) or (row.name == 'duty_supporter' and not exports.integration:isPlayerSupporter(player)) then
				row.value = 0
			end

			table.insert(settings, {row.name,row.value}  )
			count = count + 1
		end
		mysql:free_result(query1)
		if count > 0 then
			--outputDebugString("Loading "..count.." account settings to client #"..getElementData(player, "account:id"))
			triggerClientEvent("accounts:settings:loadAccountSettings",player, settings)
		end
	end
end
addEvent("accounts:settings:loadAccountSettings", true)--safe
addEventHandler("accounts:settings:loadAccountSettings", root, loadAccountSettings)

function loadCharacterSettings(player,id)
	
	if player and id then
		--outputDebugString(tostring(id))
		local settings = {}
		local count = 0
		local query1 = mysql:query("SELECT * FROM `character_settings` WHERE `id` = '"..id.."' ") or false
		while true do
			local row = mysql:fetch_assoc(query1)
			if not row then break end
			table.insert(settings, {row.name,row.value}  )
			count = count + 1
		end
		mysql:free_result(query1)
		if count > 0 then
			triggerClientEvent("accounts:settings:loadCharacterSettings",player, settings)
			--outputDebugString("Loading "..count.." character settings to client #"..getElementData(player, "account:id"))
		end
	end
end
addEvent("accounts:settings:loadCharacterSettings", true)--safe
addEventHandler("accounts:settings:loadCharacterSettings", root, loadCharacterSettings)

function reconnectPlayer()
	redirectPlayer ( client, "" , 0 )
end
addEvent("accounts:settings:reconnectPlayer", true)
addEventHandler("accounts:settings:reconnectPlayer", root, reconnectPlayer)

local clientAccountSettings = {}
local clientCharacterSettings = {}
function whenPlayerQuit ( quitType )
	if clientAccountSettings[source] and type(clientAccountSettings[source]) == "table" and #clientAccountSettings[source]>0 then
		for i, setting in pairs(clientAccountSettings[source]) do
			triggerEvent("accounts:settings:update", source, setting[1], setting[2])
			--outputDebugString("whenPlayerQuit")
		end
		clientAccountSettings[source] = {}
	end
	
	if clientCharacterSettings[source] and type(clientCharacterSettings[source]) == "table" and #clientCharacterSettings[source]>0 then
		for i, setting in pairs(clientCharacterSettings[source]) do
			triggerEvent("accounts:settings:updateCharacterSetting", source, setting[1], setting[2])
			--outputDebugString("whenPlayerQuit")
		end
		clientCharacterSettings[source] = {}
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), whenPlayerQuit )

function whenPlayerChangeChar ()
	local player =client or source
	if clientCharacterSettings[player] and type(clientCharacterSettings[player]) == "table" and #clientCharacterSettings[player]>0 then
		for i, setting in pairs(clientCharacterSettings[player]) do
			triggerEvent("accounts:settings:updateCharacterSetting", player, setting[1], setting[2])
			--outputDebugString("whenPlayerQuit")
		end
		clientCharacterSettings[player] = {}
	end
end
addEventHandler("accounts:characters:change", getRootElement(), whenPlayerChangeChar)

function saveClientAccountSettingsOnServer(name, value)
	local player = client or source
	local accountSettingNames={
		["duty_admin"]=true,
		["duty_supporter"]=true,
		["report_panel_mod"]=true,
		["hide_hud"]=true,
		["autopark"]=true,
		["speedo"]=true, 
		["cellphone_log"]=true,	
	}
	if (not accountSettingNames[name]) then return end
	--outputDebugString("saveClientAccountSettingsOnServer")
	if not clientAccountSettings[player] then
		clientAccountSettings[player] = {}
	end
	
	local existed = false
	for i = 1, #clientAccountSettings[player] do
		if clientAccountSettings[player][i][1] == name then
			clientAccountSettings[player][i][2] = value
			existed = true
			break
		end
		--outputDebugString(clientAccountSettings[i][1].." - "..clientAccountSettings[i][2])
	end
	if not existed then
		table.insert(clientAccountSettings[player], {name, value})
	end
	
	setElementData(player, name, value)
	if name == "duty_admin" or name == "duty_supporter" then
		exports.global:updateNametagColor(player)
	end
end
addEvent("saveClientAccountSettingsOnServer", true)
addEventHandler("saveClientAccountSettingsOnServer", root, saveClientAccountSettingsOnServer)

function saveClientCharacterSettingsOnServer(name, value)
	--outputDebugString("saveClientCharacterSettingsOnServer: "..name.." - "..value)
	local player=client or source 
	local characterSettingNames={
		["head_turning"]=true,
	}
	if (not characterSettingNames[name]) then return end
	if not clientCharacterSettings[player] then
		clientCharacterSettings[player] = {}
	end
	
	local existed = false
	for i = 1, #clientCharacterSettings[player] do
		if clientCharacterSettings[player][i][1] == name then
			clientCharacterSettings[player][i][2] = value
			existed = true
			break
		end
		--outputDebugString(clientCharacterSettings[player][i][1].." - "..clientCharacterSettings[player][i][2])
	end
	if not existed then
		table.insert(clientCharacterSettings[player], {name, value})
	end
	setElementData(player, name, value)
end
addEvent("saveClientCharacterSettingsOnServer", true)
addEventHandler("saveClientCharacterSettingsOnServer", root, saveClientCharacterSettingsOnServer)