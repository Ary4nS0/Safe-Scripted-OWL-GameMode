-- DISAPPEAR

function toggleInvisibility(thePlayer)
	if exports.integration:isPlayerTrialAdmin(thePlayer) or exports.integration:isPlayerScripter(thePlayer) then
		if getElementData(thePlayer, "supervising") then
			outputChatBox("Please disable /supervise first.", thePlayer, 255, 0, 0)
			return
		end
		local enabled = getElementData(thePlayer, "invisible")
		if (enabled == true) then
			setElementAlpha(thePlayer, 255)
			exports.anticheat:changeProtectedElementDataEx(thePlayer, "reconx", false, false)
			outputChatBox("You are now visible.", thePlayer, 255, 0, 0)
			exports.anticheat:changeProtectedElementDataEx(thePlayer, "invisible", false, false)
			exports.logs:dbLog(thePlayer, 4, thePlayer, "DISAPPEAR DISABLED")
		elseif (enabled == false or enabled == nil) then
			setElementAlpha(thePlayer, 0)
			exports.anticheat:changeProtectedElementDataEx(thePlayer, "reconx", true, false)
			outputChatBox("You are now invisible.", thePlayer, 0, 255, 0)
			exports.anticheat:changeProtectedElementDataEx(thePlayer, "invisible", true, false)
			exports.logs:dbLog(thePlayer, 4, thePlayer, "DISAPPEAR ENABLED")
		else
			outputChatBox("Please disable recon first.", thePlayer, 255, 0, 0)
		end
	end
end
addCommandHandler("disappear", toggleInvisibility)


-- TOGGLE NAMETAG
function toggleMyNametag(thePlayer)
	local visible = getElementData(thePlayer, "reconx")
	local username = getElementData(thePlayer, "account:username")
	if exports.integration:isPlayerLeadAdmin(thePlayer) then
		if (visible == true) then
			setPlayerNametagShowing(thePlayer, false)
			--exports.anticheat:changeProtectedElementDataEx(thePlayer, "reconx", false, false)
			outputChatBox("Your nametag is now visible.", thePlayer, 255, 0, 0)
		elseif (visible == false or visible == nil) then
			setPlayerNametagShowing(thePlayer, false)
			--exports.anticheat:changeProtectedElementDataEx(thePlayer, "reconx", true, false)
			outputChatBox("Your nametag is now hidden.", thePlayer, 0, 255, 0)
		else
			outputChatBox("Please disable recon first.", thePlayer, 255, 0, 0)
		end
	end
end
addCommandHandler("togmytag", toggleMyNametag)

-- RP SUPERVISE
function roleplaySupervise(thePlayer)
	if exports.integration:isPlayerTrialAdmin(thePlayer) or exports.integration:isPlayerSupporter(thePlayer) then
		if exports.global:isStaffOnDuty(thePlayer) then
			if getElementData(thePlayer, "invisible") then
				outputChatBox("Please disable /disappear first.", thePlayer, 255, 0, 0)
				return
			end

			local enabled = getElementData(thePlayer, "supervising")
			if (enabled == true) then
				setElementAlpha(thePlayer, 255)
				outputChatBox("You are now no longer in supervisor state.", thePlayer, 255, 0, 0)
				exports.logs:dbLog(thePlayer, 4, thePlayer, "RP SUPERVISOR DISABLED")
				exports.global:sendWrnToStaff("[AdmCmd] "..getElementData(thePlayer, "account:username").." has disabled RP supervisor mode.")

				setElementData(thePlayer, "supervising", false)
			elseif (enabled == false or enabled == nil) then
				setElementAlpha(thePlayer, 100)
				outputChatBox("You are now in supervisor state.", thePlayer, 0, 255, 0)
				exports.logs:dbLog(thePlayer, 4, thePlayer, "RP SUPERVISOR ENABLED")
				exports.global:sendWrnToStaff("[AdmCmd] "..getElementData(thePlayer, "account:username").." has enabled RP supervisor mode.")

				setElementData(thePlayer, "supervising", true)
			else
				outputChatBox("Please disable recon first.", thePlayer, 255, 0, 0)
			end
		end
	end
end
addCommandHandler("supervise", roleplaySupervise)

addEvent("recon:reattach", true)
addEventHandler("recon:reattach", resourceRoot, function(target, int, dim)
	if not exports.integration:isPlayerSeniorAdmin(client) then return end
	setElementInterior(client, int)
	setElementDimension(client, dim)
	setCameraInterior(client, int)
	local x,y,z = getElementPosition(target)
	setElementPosition(client, x, y, z-5)
	attachElements(client, target, 0, 0, -5)
end)

-- MAXIME's reworks
function asyncReconActivate(cur)

	local l_player=client or source
	if not exports.integration:isPlayerSeniorAdmin(l_player) then return end
	local target = exports.pool:getElement("player", cur.target)
	if not target then
		triggerClientEvent(l_player, "admin:recon", l_player)
		return
	end
	removePedFromVehicle(l_player)
	if exports.freecam:isEnabled(l_player) then
		triggerEvent("freecam:asyncDeactivateFreecam", l_player)
	end

	-- Set important element data
	setElementData(l_player, "reconx", target, true)
	setElementData(l_player, "recontp", true)

	setElementCollisionsEnabled ( l_player, false )
	triggerEvent('artifacts:removeAllOnPlayer', root, l_player)
	setElementAlpha(l_player, 0)
	setPedWeaponSlot(l_player, 0)

	local t_int = getElementInterior(target)
	local t_dim = getElementDimension(target)

	setElementDimension(l_player, t_dim)
	setElementInterior(l_player, t_int)
	setCameraInterior(l_player, t_int)

	local x1, y1, z1 = getElementPosition(target)
	setElementPosition(l_player, x1, y1, 0)

	setTimer(function(l_player, xl, yl, zl, target) setElementPosition(l_player, x1, y1, z1-5); 	attachElements(l_player, target, 0, 0, -5) end, 500, 1, source, xl, yl, zl, target)

	setCameraTarget(l_player,target)
	exports.logs:dbLog(l_player, 4, target, "RECON")
	local hiddenAdmin = getElementData(l_player, "hiddenadmin")
	if hiddenAdmin == 0 and not (exports.integration:isPlayerSeniorAdmin(l_player) and exports.integration:isPlayerTrialAdmin(target) and not exports.integration:isPlayerAdmin(target))  then
		local adminTitle = exports.global:getPlayerAdminTitle(l_player)
		exports.global:sendMessageToAdmins("AdmCmd: " .. tostring(adminTitle) .. " " .. getElementData(l_player, "account:username") .. " started reconning " .. getPlayerName(target):gsub("_", " ") .. " (" .. getElementData(target, "account:username") .. ").")
	elseif exports.integration:isPlayerSeniorAdmin(l_player) and exports.integration:isPlayerTrialAdmin(target) and not exports.integration:isPlayerAdmin(target) and hiddenAdmin == 0 then
		local adminTitle = exports.global:getPlayerAdminTitle(l_player)
		exports.global:sendMessageToSeniorAdmins("SeniorAdmCmd: " .. tostring(adminTitle) .. " " .. getElementData(l_player, "account:username") .. " started reconning " .. getElementData(target, "account:username") .. ".")
	end
end
addEvent("admin:recon:async:activate", true)
addEventHandler("admin:recon:async:activate", root, asyncReconActivate)

function asyncReconDeactivate(cur)
	local l_player=client or source
	if not exports.integration:isPlayerSeniorAdmin(l_player) then return end
	if exports.freecam:isEnabled(l_player) then
		triggerEvent("freecam:asyncDeactivateFreecam", l_player)
	end
	setElementData(l_player, "reconx", false, true)
	removeElementData(l_player, "recontp")

	removePedFromVehicle(l_player)
	detachElements(l_player)

	setElementPosition(l_player, cur.x, cur.y, cur.z)
	setElementRotation(l_player, cur.rx, cur.ry, cur.rz)

	setElementDimension(l_player, cur.dim)
	setElementInterior(l_player, cur.int)
	setCameraInterior(l_player,cur.int)

	setCameraTarget(l_player, nil)
	setElementAlpha(l_player, 255)
	setElementCollisionsEnabled ( l_player, true )
end
addEvent("admin:recon:async:deactivate", true)
addEventHandler("admin:recon:async:deactivate", root, asyncReconDeactivate)


addEvent("admin:disabledisappear", true)
addEventHandler("admin:disabledisappear", root, function (thePlayer)
	if client and thePlayer	~= client then return end
	exports.anticheat:changeProtectedElementDataEx(thePlayer, "reconx", false, false)
	exports.anticheat:changeProtectedElementDataEx(thePlayer, "invisible", false, false)		
end)