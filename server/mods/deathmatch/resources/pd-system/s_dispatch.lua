-- Chaos dispatch blips!

addEventHandler("onElementDataChange", getRootElement(), function(name, oldD)
  if name == "lspd:siren" then
    triggerClientEvent("dispatch:blipSiren", resourceRoot, getElementData(source, "lspd:siren"), source)
  elseif name == "dispatch:joint" then
    triggerClientEvent("dispatch:jointChange", resourceRoot, getElementData(root, "dispatch:joint")) 
  elseif name == "faction" then
  	if getElementType(source) ~= "player" then return end
    triggerClientEvent("dispatch:factionChange", resourceRoot, getElementData(source, "faction"), oldD) 
  end
end)

addEvent("dispatch:onDutyChange", true)
addEventHandler("dispatch:onDutyChange", resourceRoot, function(data)
  if exports.global:hasItem(client, 177) and (exports.factions:isPlayerInFaction(client, 1) or exports.factions:isPlayerInFaction(client, 50)) then
    setElementData(client, "dispatch:onDuty", data)
    triggerClientEvent("dispatch:onDutyChange", resourceRoot, data, client) 
  end
end)

addEvent("dispatch:callsignChange", true)
addEventHandler("dispatch:callsignChange", resourceRoot, function(data) 
  if exports.global:hasItem(client, 177) and (exports.factions:isPlayerInFaction(client, 1) or exports.factions:isPlayerInFaction(client, 50)) then
    setElementData( client, "dispatch:callsign", data)
    triggerClientEvent("dispatch:callsignChange", resourceRoot, data, client) 
  end
end)