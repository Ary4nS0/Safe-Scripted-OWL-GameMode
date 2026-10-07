--[[
 * ***********************************************************************************************************************
 * Copyright (c) 2015 OwlGaming Community - All Rights Reserved
 * All rights reserved. This program and the accompanying materials are private property belongs to OwlGaming Community
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * ***********************************************************************************************************************
 ]]

local secretHandle = 'DwcbeZdBsd432Hcw2SvySv5FcW'

Anti_Unknown_Data=true -- true : Only the elementData values that exist in {list_datas} are allowed to be received from the client



-- Events That Are Only Allowed to Be Called from the Server Side
only_server_call={ 
    ["accounts:characters:list"]=true,
    ["accounts:options"]=true,
    ["accounts:options:settings"]=true,
    ["edu"]=true,
    ["onChatacterLogin"]=true,
    ["accounts:logout"]=true,
    ["accounts:error:window"]=true,
    ["accounts:settings:loadGraphicSettings"]=true,
    ["onCharacterLogin"]=true,
    ["account:changingchar"]=true,
    ["account:character:spawned"]=true,
    ["account:character:select"]=true,
    ["forum:remove"]=true,
    ["accounts:settings:update"]=true,
    ["accounts:settings:updateCharacterSetting"]=true,
    ["accounts:settings:loadAccountSettings"]=true,
    ["accounts:settings:loadCharacterSettings"]=true,
    ["onRequestLogin"]=true,
    ["goFromLoginToSelectionScreen"]=true,
    ["accounts:playerFinishApps"]=true,
    ["awardPlayer"]=true,
    ["feedback:openFeedBackDetails"]=true,
    ["remoteFreezePlayer"]=true,
    ["admin-system:adminduty"]=true,
    ["admin-system:gmduty"]=true,
    ["points:checkexpiration"]=true,
    ["onCustomAnimationReplace"]=true,
    ["onCustomAnimationRestore"]=true,
    ["playerGetMotds"]=true,
    ["alertAdminsOfSpeedHacks"]=true,
    ["apps:requestApps"]=true,
    ["artifacts:removeAllOnPlayer"]=true,
    ["artifacts:toggle"]=true,
    ["tellTransfersHistory"]=true,
    ["addBankTransactionLog"]=true,
    ["cache:verifyServerImageFile"]=true,
    ["cargo:loadForklift"]=true,
    ["cargo:unloadForklift"]=true,
    ["clothes:tempfix"]=true,
    ["s_getOutbox"]=true,
    ["onPlayerDuty"]=true,
    ["onPlayerGetInter"]=true,
    ["lift:me"]=true,
    ["doHeadHit"]=true,
    ["stretcher:hasPlayerStretcherSpawned"]=true,
    ["stretcher:isPedStretcherOccupied"]=true,
    ["stretcher:destroyStretcher"]=true,
    ["gmpost:submit"]=true,
    ["forum:intpost"]=true,
    ["forum:theftpost"]=true,
    ["useTV"]=true,
    ["sendLocalText"]=true,
    ["updateNametagColor"]=true,
    ["init_treat_bodypart"]=true,
    ["init_treat_all"]=true,
    ["RequestServerData"]=true,
    ["item-system:saveTextureReplacement"]=true,
    ["subscribeToInventoryChanges"]=true,
    ["sendCurrentInventory"]=true,
    ["unsubscribeFromInventoryChanges"]=true,
    ["item-system:addPlayerArtifacts"]=true,
    ["item-system:addAllArtifacts"]=true,
    ["dropItemOnDead"]=true,
    ["changeVehicleUpgrade"]=true,
    ["updateCollectionValue"]=true,
    ["job-system:trucker:spawnRoute"]=true,
    ["updateNextCheckpoint"]=true,
    ["gunlicense:weaponlicenses"]=true,
    ["payday:run"]=true,
    ["shop:addItemToCustomShop"]=true,
    ["pd:ped:help"]=true,
    ["pd:ped:appointment"]=true,
    ["forceElementStreamIn"]=true,
    ["sendWeaponSwitchToAll"]=true,
    ["snakecam:toggleSnakeCam"]=true,
    ["phone:requestShowPhoneGUI"]=true,
    ["phone:forceUpdateContactList"]=true,
    ["vehicle:handbrake:lifted"]=true,
    ["alarmDistrict"]=true,
    ["realism:startsmoking"]=true,
    ["realism:stopsmoking"]=true,
    ["setDrunkness"]=true,
    ["realism:applyWalkingStyle"]=true,
    ["airport-gates:toggleGateOpen"]=true,
    ["airport-gates:checkGate"]=true,
    ["chair:allocate"]=true,
    ["tow:unimpoundedVeh"]=true,
    ["weapon:removeSatchel"]=true,
    ["updateLocalGuns"]=true,
    ["installKeypad"]=true,
    ["interior:requestHUD"]=true,
    ["int:updatemarker"]=true,
    ["sellVehicle"]=true,
}
-- ElementDatas Allowed to Be Sent from the Client Side
list_datas={
	["streams"]={type="number",element="client",datas={1,0}},

	["phone_anim"]={type="number",element="client",datas={1,0}},

	["supervising"]={type="bool",element="client",datas={false,}},

	["savedLocations"]={type="bool",element="client",datas={false,}},

	["freecamTV:state"]={type="bool",element="client",datas={true,false}},

	["hanging"]={type="table",element="client",datas="N/A",
	check=function(value,element,target) 
		if value==nil then return true end
		if type(value)~="table" then  return false end 
		 
		local checks={['heli']=0,['side']=0,['line_percent']=0,['legs_up']=0,}
		for k,v in pairs(value) do 
			if checks[k]==0 then 
				checks[k]=checks[k]+1 
				if k=="heli" and (not isElement(v) or not getElementType(v)=="vehicle") then 
					return false 
				elseif k=="side" and (type(v)~='string' or string.len(v)<=5 ) then 
					return false 
				elseif k=="line_percent" and type(v)~="number" then 
					return false 
				elseif k=="legs_up" and type(v)~="boolean"  then 
					return false 
				end
			elseif type(ckecks[k])~="number" then 
				return false 
			elseif checks[k]>0 then 
				return false 
			end
		end
		for k,v in pairs(checks) do 
			if v==0 then 
				return false 
			end
		end
		return true
	end},

	["isfishing"]={type="bool",element="client",datas={true,false}},

	["truckerjob:markerID"]={type="unknown",element="client",datas="N/A" , 
	check=function(value,element,target)
		if type(value)=="number" or value==false then 
			return true 
		end
		return false
	end},

	["truckerjob:markerIndex"]={type="unknown",element="client",datas="N/A" , 
	check=function(value,element,target)
		if type(value)=="number" or value==false then 
			return true 
		end
		return false
	end},

	["gunlicense:activewindow"]={type="bool",element="client",datas={true,false}},

	["shop:NoAccess"]={type="bool",element="client",datas={true,false}},

	["currentCap"]={type="number",element="ped",datas="N/A"},

	["sCapacity"]={type="number",element="ped",datas="N/A",

	check=function(value,element,target)
		if not exports.global:hasItem(element, 5, getElementDimension(target)) and not exports.integration:isPlayerAdmin(element) then 
			return false
		end
		return true
	end},

	["sSales"]={type="string",element="ped",datas={"",},
	check=function(value,element,target)
		if not exports.global:hasItem(element, 5, getElementDimension(target)) and not exports.integration:isPlayerAdmin(element) then 
			return false
		end
		return true
	end},

	["animation_state"]={type="number",element="client",datas="N/A"},

	["skydiving"]={type="bool",element="client",datas={true,false}},

	["dispatch:joint"]={type="bool",element="root",datas={true,false}},

	["deagle:reload"]={type="bool",element="client",datas={true,false}},

	["shotgun:reload"]={type="bool",element="client",datas={true,false}},

	["dogs:table"]={type="table",element="resource",datas="N/A",
	check=function(value,element,target)
		if exports.integration:isPlayerLeadAdmin(element) or exports.integration:isPlayerScripter(element) then
			return true 
		end 
		return false
	end},

	["k9:status"]={type="number",element="ped",datas={1,0},
	check=function(value,element,target)
		if getElementData(target, "besitzer") == getPlayerName(element) then
			if exports.global:getDistanceBetweenElements(target,element)<=5 then 
				return true 
			end
		end
		return false
	end},

	["backupbleepers:goingBackwards"]={type="bool",element="client",datas={true,false}},

	["seatbeltwarning"]={type="unknown",element="vehicle",datas="N/A",
	check=function(value,element,target)
		if value==nil then 
			return true 
		end
		if value==1 then 
			if exports.global:getDistanceBetweenElements(element,target)<15 then 
				return true
			end
		end
		return false
	end},

	["report:topRight"]={type="number",element="client",datas={3,},
	check=function(value,element,target)
		if exports.integration:isPlayerTrialAdmin(element) or exports.integration:isPlayerSupporter(element) then
			return true 
		end
		return false
	end},

	["sfia_pilots:table"]={type="table",element="resource",datas="N/A",
	check=function(value,element,target)
		if not exports.factions:hasMemberPermissionTo(element, 47, "add_member") then 
			return false
		end
		return true
	end},

	["faa:registrytable"]={type="table",element="resource",datas="N/A",
	check=function(value,element,target)
		local isFAA, rankFAA = exports.factions:isPlayerInFaction(element, 47)
		local isLeader = exports.factions:hasMemberPermissionTo(element, 47, "add_member")
		if not isFAA or not isLeader then	
			return false 
		end
		return true
	end},

	["gui:ViewingRadioManager"]={type="bool",element="client",datas={true,false},},
	
}
function check_exists(table,value)
	for i,v in ipairs(table) do 
		if v==value then 
			return true 
		end
	end
	return false 
end

addDebugHook("preEvent",function( sourceResource, eventName, eventSource, eventClient, luaFilename, luaLineNumber, key , oldValue , newValue)
	if not eventClient then return end 

	if only_server_call[eventName] then 
		print("non Server Call ON: "..eventName)
		return "skip"
	end

	if eventName=="onElementDataChange" then 
		
		if Anti_Unknown_Data==true then 
			if type(list_datas[key])~="table" then 
				setElementData(eventSource,key,oldValue)
				return "skip"
			end
		end
		if type(list_datas[key])=="table" then 
			local _table=list_datas[key]


			if _table.type=="bool" then 
				if type(newValue)~="boolean" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.type=="number" then 
				if type(newValue)~="number" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.type=="string" then 
				if type(newValue)~="string" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.type=="table" then 
				if type(newValue)~="table" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			end


			if _table.element=="client" then 
				if eventSource~=eventClient then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.element=="ped" then 
				if getElementType(eventSource)~="ped" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.element=="vehicle" then 
				if getElementType(eventSource)~="vehicle" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.element=="object" then 
				if getElementType(eventSource)~="object" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.element=="marker" then 
				if getElementType(eventSource)~="marker" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.element=="colshape" then 
				if getElementType(eventSource)~="colshape" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.element=="building" then 
				if getElementType(eventSource)~="building" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.element=="pickup" then 
				if getElementType(eventSource)~="pickup" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.element=="blip" then 
				if getElementType(eventSource)~="blip" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.element=="radararea" then 
				if getElementType(eventSource)~="radararea" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.element=="projectile" then 
				if getElementType(eventSource)~="projectile" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.element=="team" then 
				if getElementType(eventSource)~="team" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.element=="console" then 
				if getElementType(eventSource)~="console" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			elseif _table.element=="resource" then 
				if getElementType(eventSource)~="resource" then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
				
			elseif _table.element=="root" then 
				if eventSource~=root then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			end
			if _table.datas~="N/A" then 
				
				if not check_exists(_table.datas,newValue) then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			end
			if type(_table.check)=="function" then 
				if not _table.check(newValue,eventClient,eventSource) then 
					setElementData(eventSource,key,oldValue)
					return "skip"
				end
			end
		end
	end
end)







addEventHandler("onElementDataChange", getRootElement(),
	function (index, oldValue)
		if not client then
			return
		end
		local theElement = source
		if (index ~= "interiormarker") then
			local isProtected = getElementData(theElement, secretHandle.."p:"..index)
			if (isProtected) then
				-- get real source here
				-- it aint source!
				local sourceClient = client
				if (sourceClient) then
					if (getElementType(sourceClient) == "player") then
						local newData = getElementData(source, index)
						local playername = getPlayerName(source) or "Somethings"
						-- Get rid of the player
						local msg = "[AdmWarn] " .. getPlayerName(sourceClient) .. " sent illegal data. "
						local msg2 = " (victim: "..playername.." index: "..index .." newvalue:".. tostring(newData) .. " oldvalue:".. tostring(oldValue)  ..")"
						--outputConsole(msg)
						--outputConsole(msg2)
						--exports.global:sendMessageToAdmins(msg)
						exports.global:sendMessageToAdmins(msg)
						exports.global:sendMessageToAdmins(msg2)
						--exports.logs:dbLog(sourceClient, 5, sourceClient, msg..msg2 )

						-- uncomment this when it works
						--local ban = banPlayer(sourceClient, false, false, true, getRootElement(), "Hacked Client.", 0)

						-- revert data
						changeProtectedElementDataEx(source, index, oldValue, true)
					end
				end
			end
		end
	end
);

addEventHandler ( "onPlayerJoin", getRootElement(),
	function ()
		protectElementData(source, "account:id")
		protectElementData(source, "account:username")
		protectElementData(source, "legitnamechange")
		protectElementData(source, "dbid")
	end
);

function allowElementData(thePlayer, index)
	return setElementData(thePlayer, secretHandle.."p:"..index, false, false)
end

function protectElementData(thePlayer, index)
	return setElementData(thePlayer, secretHandle.."p:"..index, true, false)
end

function changeProtectedElementData(thePlayer, index, newvalue)
	if allowElementData(thePlayer, index) then
		local set = setElementData(thePlayer, index, newvalue)
		if protectElementData(thePlayer, index) then
			return set
		end
	end
end

function changeProtectedElementDataEx(thePlayer, index, newvalue, sync, nosyncatall)
	if (thePlayer) and (index) then
		if not newvalue then
			newvalue = nil
		end

		if allowElementData(thePlayer, index) then
			local set = setElementData(thePlayer, index, newvalue, sync)
			if set then
				if not sync then
					if not nosyncatall then
						if getElementType ( thePlayer ) == "player" then
							triggerClientEvent(thePlayer, "edu", getRootElement(), thePlayer, index, newvalue)
						end
					end
				end
			end

			if protectElementData(thePlayer, index) then
				return set
			end
		end
		return false
	end
	return false
end

function setEld(thePlayer, index, newvalue, sync)
	local sync2 = false
	local nosyncatall = true
	if sync == "one" then
		sync2 = false
		nosyncatall = false
	elseif sync == "all" then
		sync2 = true
		nosyncatall = false
	else
		sync2 = false
		nosyncatall = true
	end
	return changeProtectedElementDataEx(thePlayer, index, newvalue, sync2, nosyncatall)
end

function genHandle()
	local hash = ''
	for Loop = 1, math.random(5,16) do
		hash = hash .. string.char(math.random(65, 122))
	end
	return hash
end

function fetchH()
	return secretHandle
end

secretHandle = genHandle()
