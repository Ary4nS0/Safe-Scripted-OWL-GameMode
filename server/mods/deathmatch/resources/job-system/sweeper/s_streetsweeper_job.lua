function giveTruckingMoney(wage)
	local veh=getPedOccupiedVehicle(client)
	if not veh then return end 
	local model=getElementModel(veh)
	if (model~=414) then return end 
	exports.global:giveMoney(client, wage)
end
addEvent("giveTruckingMoney", true)
addEventHandler("giveTruckingMoney", getRootElement(), giveTruckingMoney)

function respawnTruck(vehicle)
	local veh=getPedOccupiedVehicle(client)
	if not (veh) or (veh~=vehicle) then return end 
	local model=getElementModel(vehicle)
	if (model~=414) then return end
	removePedFromVehicle(client, vehicle)
	respawnVehicle(vehicle)
	setVehicleLocked(vehicle, false)
end
addEvent("respawnTruck", true)
addEventHandler("respawnTruck", getRootElement(), respawnTruck)

function playerQuitJob()
	local veh=getPedOccupiedVehicle(client)
	if not (veh)  then return end 
	local model=getElementModel(vehicle)
	if (model~=414) then return end
	exports.anticheat:changeProtectedElementDataEx(client, "job", 0, true)
end
addEvent("quitjob", true)
addEventHandler("quitjob", getRootElement(), playerQuitJob)