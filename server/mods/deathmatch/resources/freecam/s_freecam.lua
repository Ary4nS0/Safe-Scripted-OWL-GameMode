function setPlayerFreecamEnabled(player, x, y, z, dontChangeFixedMode)
	removePedFromVehicle(player)
	setElementData(player, "realinvehicle", 0, false)

	return triggerClientEvent(player,"doSetFreecamEnabled", getRootElement(), x, y, z, dontChangeFixedMode)
end

function setPlayerFreecamDisabled(player, dontChangeFixedMode)
	return triggerClientEvent(player,"doSetFreecamDisabled", getRootElement(), dontChangeFixedMode)
end

function setPlayerFreecamOption(player, theOption, value)
	return triggerClientEvent(player,"doSetFreecamOption", getRootElement(), theOption, value)
end

function isPlayerFreecamEnabled(player)
	return isEnabled(player)
end

--Maxime's rework
function asyncActivateFreecam ()
	local l_player= client or source
	if getElementData(l_player, "loggedin") ~= 1 or (not exports.integration:isPlayerTrialAdmin(l_player) and not exports.integration:isPlayerScripter(l_player) and not getElementData(l_player, "canFly") ) then 
		return 
	end
	if not isEnabled(l_player) then
		outputDebugString("[FREECAM] asyncActivateFreecam / Ran")
		removePedFromVehicle(l_player)
		setElementAlpha(l_player, 0)
		setElementFrozen(l_player, true)
		if not exports.integration:isPlayerTrialAdmin(l_player) and not exports.integration:isPlayerScripter(l_player) then
			exports.global:sendMessageToAdmins("[FREECAM] "..exports.global:getAdminTitle1(l_player).." has activated temporary /freecam.")
		end
		setElementData(l_player, "freecam:state", true, false)
		exports.logs:dbLog(l_player, 4, {l_player}, "FREECAM")
	end
end
addEvent("freecam:asyncActivateFreecam", true)
addEventHandler("freecam:asyncActivateFreecam", root, asyncActivateFreecam)

function asyncDeactivateFreecam ()
	local l_player= client or source
	if  isEnabled(l_player) then
		outputDebugString("[FREECAM] asyncDeactivateFreecam / Ran")
		removePedFromVehicle(l_player)
		setElementAlpha(l_player, 255)
		setElementFrozen(l_player, false)
		setElementData(l_player, "freecam:state", false, false)
	end
end
addEvent("freecam:asyncDeactivateFreecam", true)
addEventHandler("freecam:asyncDeactivateFreecam", root, asyncDeactivateFreecam)
