function getPaid(collectionValue)
	local l_pl=client or source 
	local source=l_pl
	if not exports.factions:isInFactionType(source, 6) then return end
	exports.global:giveMoney(exports.factions:getFactionFromID(20), tonumber(collectionValue))

	local gender = getElementData(source, "gender")
	local genderm = "his"
	if (gender == 1) then
		genderm = "her"
	end

	triggerEvent("sendAme", source,"hands " .. genderm .. " collection of photographs to the woman behind the desk.")
	exports.global:sendLocalText(source, "Victoria Greene says: Thank you. These should make the morning edition. Keep up the good work.", nil, nil, nil, 10)
	outputChatBox("#SAN made $".. exports.global:formatMoney(collectionValue) .." from the photographs.", source, 255, 104, 91, true)
	updateCollectionValue(0)
end
addEvent("submitCollection", true)
addEventHandler("submitCollection", getRootElement(), getPaid)


function info()
	exports.global:sendLocalText(client, "Victoria Greene says: Hello, There. I'm taking the photos of our SAN Photographers -", nil, nil, nil, 10)
	exports.global:sendLocalText(client, "but it seems you aren't one. Feel free to apply for SAN any time ((on the forums))!", nil, nil, nil, 10)
end
addEvent("sellPhotosInfo", true)
addEventHandler("sellPhotosInfo", getRootElement(), info)

function updateCollectionValue(value)
	
	mysql:query_free("UPDATE characters SET photos = " .. mysql:escape_string((tonumber(value) or 0)) .. " WHERE id = " .. mysql:escape_string(getElementData(source, "dbid")) )
end
addEvent("updateCollectionValue", true)--safe
addEventHandler("updateCollectionValue", getRootElement(), updateCollectionValue)

addEvent("getCollectionValue", true)
addEventHandler("getCollectionValue", getRootElement(),
	function()
		if getElementData( client, "loggedin" ) == 1 then
			local result = mysql:query_fetch_assoc("SELECT photos FROM characters WHERE id = " .. mysql:escape_string(getElementData(client, "dbid")) )
			if result then
				triggerClientEvent( client, "updateCollectionValue", clinet, tonumber( result["photos"] ) )
			end
		end
	end
)

function sanAD()
	exports['global']:sendLocalText(client, "Victoria Greene says: You can call to our call centre to place an advert. The number is 7331.", 255, 255, 255, 10)
end
addEvent("cSANAdvert", true)
addEventHandler("cSANAdvert", getRootElement(), sanAD)

function photoHeli(thePlayer)
	if exports.factions:isInFactionType(thePlayer, 6) then
		local theVehicle = getPedOccupiedVehicle(thePlayer)
		if theVehicle then
			local vehicleModel = getElementModel(theVehicle)
			if vehicleModel == 488 or vehicleModel == 487 then
				triggerClientEvent(thePlayer, "job:photo:heli", thePlayer)
			end
		end
	end
end
addCommandHandler("photoheli", photoHeli)
