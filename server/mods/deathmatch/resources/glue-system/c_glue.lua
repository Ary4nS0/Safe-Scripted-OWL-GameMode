function glue()
	local player = getLocalPlayer()
	local myVehicle = getPedOccupiedVehicle(player)
	if myVehicle and getElementAttachedTo(myVehicle) then
		
	elseif not myVehicle and getElementAttachedTo(player) then
		triggerServerEvent("ungluePlayer", resourceRoot)
	else
		if not myVehicle then
			local vehicle = getPedContactElement(player)
			if getElementType(vehicle) == "vehicle" then
				
				local px, py, pz = getElementPosition(player)
				local vx, vy, vz = getElementPosition(vehicle)
				local sx = px - vx
				local sy = py - vy
				local sz = pz - vz
				
				local rotpX, rotpY, rotpZ = getElementRotation(player)
				
				local rotvX,rotvY,rotvZ = getElementRotation(vehicle)
				
				local t = math.rad(rotvX)
				local p = math.rad(rotvY)
				local f = math.rad(rotvZ)
				
				local ct = math.cos(t)
				local st = math.sin(t)
				local cp = math.cos(p)
				local sp = math.sin(p)
				local cf = math.cos(f)
				local sf = math.sin(f)
				
				local z = ct*cp*sz + (sf*st*cp + cf*sp)*sx + (-cf*st*cp + sf*sp)*sy
				local x = -ct*sp*sz + (-sf*st*sp + cf*cp)*sx + (cf*st*sp + sf*cp)*sy
				local y = st*sz - sf*ct*sx + cf*ct*sy
				
				--[[local rotX = rotpX - rotvX
				local rotY = rotpY - rotvY
				local rotZ = rotpZ - rotvZ]]
				
				local slot = getPedWeaponSlot(player)
				triggerServerEvent("gluePlayer", player, slot, vehicle, x, y, z, rotpX, rotpY, rotpZ)
			end
		else
			
		end
	end
end
addCommandHandler("glue",glue)