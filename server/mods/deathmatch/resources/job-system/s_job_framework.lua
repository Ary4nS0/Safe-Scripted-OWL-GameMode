function cancelCityMaintenance()
	if exports.global:hasItem(client,115,"41:1:Spraycan", 2500) then 

		exports.global:takeItem(client, 115, "41:1:Spraycan", 2500)
	end
end
addEvent("cancelCityMaintenance", true)
addEventHandler("cancelCityMaintenance", getRootElement(), cancelCityMaintenance)