
function responce()
	triggerClientEvent(client, "legitimateResponceRecived", client)
end
addEvent("tintDemWindows", true)
addEventHandler("tintDemWindows", getRootElement(), responce)