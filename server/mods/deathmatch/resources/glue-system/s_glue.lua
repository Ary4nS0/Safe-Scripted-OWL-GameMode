
function gluePlayer(slot, vehicle, x, y, z, rotX, rotY, rotZ)
	if getPedContactElement(client)~=vehicle then return end
	attachElements(client, vehicle, x, y, z, rotX, rotY, rotZ)
	setElementRotation(client, rotX, rotY, rotZ)
	setPedWeaponSlot(client, slot)
end
addEvent("gluePlayer",true)
addEventHandler("gluePlayer",getRootElement(),gluePlayer)

function ungluePlayer()
	--outputDebugString('s_glue / ungluePlayer / ' .. getPlayerName(client))
	detachElements(client)
end
addEvent("ungluePlayer",true)
addEventHandler("ungluePlayer",getRootElement(),ungluePlayer)




function getNearby(e)
	local t = {}
	local x, y, z = getElementPosition(e)
	for k, v in ipairs(getElementsByType"player") do
		local dist = getDistanceBetweenPoints3D(x, y, z, getElementPosition(v))
		if dist < 100 then
			table.insert(t, getPlayerName(v) .. ' ' .. math.floor(dist))
		end
	end
	return table.concat(t, ', ')
end

addEventHandler("onTrailerAttach", root,
	function(truck)
		outputDebugString('s_glue / onTrailerAttach / ' .. getElementData(source, "dbid") .. ' to ' .. getElementData(truck, "dbid"))
		outputDebugString('s_glue / nearby: ' .. getNearby(source))


		--Make trailers damage proof
		if getElementModel(source) == 611 then
			setVehicleDamageProof(source, true)
			outputDebugString("WAKKA WAKKA")
		end
	end)

addEventHandler("onTrailerDetach", root,
	function(truck)
		outputDebugString('s_glue / onTrailerDetach / ' .. getElementData(source, "dbid") .. ' to ' .. getElementData(truck, "dbid"))
		outputDebugString('s_glue / nearby: ' .. getNearby(source))
	end)

--If it respawns, set it back to collisions enabled so shit doesn't bug
addEventHandler("onVehicleRespawn", root, function(exploded)
	if getElementType(source) == "vehicle" then
		setElementCollisionsEnabled(source, true)
	end
end)
