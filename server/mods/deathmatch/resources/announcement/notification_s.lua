--Maxime
mysql = exports.mysql

function givePmsToClient (deletes, reads)
	local l_player=client or source
	if getElementData(l_player,"loggedin") ~= 1 then
		return false
	end

    local userID = getElementData(l_player,"account:id") or false
	if not userID then
		return false
	end

	if deletes then
		deleteNoti(l_player,deletes)
	end

	if reads then
		readNoti(reads)
	end

	local noties = {}
	local excludeList = ""
	if getElementData(l_player, "noti_faction_updates") == "0" then
		excludeList = excludeList.." AND type != 'noti_faction_updates' "
	end
	if getElementData(l_player, "vehicle_inactivity_scanner") == "0" then
		excludeList = excludeList.." AND type != 'vehicle_inactivity_scanner' "
	end
	if getElementData(l_player, "support_center") == "0" then
		excludeList = excludeList.." AND type != 'support_center' "
	end
	if getElementData(l_player, "interior_inactivity_scanner") == "0" then
		excludeList = excludeList.." AND type != 'interior_inactivity_scanner' "
	end
	if getElementData(l_player, "noti_offline_pm") == "0" then
		excludeList = excludeList.." AND type NOT REGEXP '[0-9]+' "
	end

	local q = mysql:query("SELECT *, DATE_FORMAT(date,'%b %d, %Y %h:%i %p') AS fdate, TO_SECONDS(date) as datesec FROM notifications WHERE userid="..userID.." AND 1=1 "..excludeList.." ORDER BY `read` ASC, date DESC LIMIT 15")
	while true do
		local row = mysql:fetch_assoc(q)
		if not row then break end
		table.insert(noties, row )
	end
	mysql:free_result(q)

	triggerClientEvent(l_player, "integration:getPmsFromServer", l_player, noties)
	--outputDebugString("integration:givePmsToClient - "..getPlayerName(l_player))  Uncomment if you actually need to debug.
end
addEvent( "integration:givePmsToClient", true )
addEventHandler( "integration:givePmsToClient", root, givePmsToClient )

function readNoti(i, opm)
	
	if i and tonumber(i) and opm then
		
		mysql:query_free("UPDATE notifications SET `read`=1 WHERE id="..i)
		
	
	end
end
addEvent( "readNoti", true )
addEventHandler( "readNoti", root, readNoti )

function deleteNoti(player,i)
	if client and player~=client then return end
	local id=getElementData(player, "account:id")
	if i then
		if tonumber(i) then
			mysql:query_free("DELETE FROM notifications WHERE uaserid="..id.." AND id="..i)
		
		end
	end
end
addEvent( "deleteNoti", true )
addEventHandler( "deleteNoti", root, deleteNoti )

function clearNotis(del, reads)
	
	if reads then
		readNoti(reads)
	end
	if isElement(client) then
		if deletes then	
			
			deleteNoti(client,del)	
		end

		
		local id = getElementData(client, "account:id")
		if id then
			mysql:query_free("DELETE FROM notifications WHERE userid="..id.." ORDER BY `read` ASC, date DESC LIMIT 15") -- Only allow them to delete the last 15.
			triggerEvent("integration:givePmsToClient", client)
			outputChatBox("Deleted latest 15 notifications.", client, 255, 0, 0)
		end
	end
end
addEvent("clearNotis", true)
addEventHandler("clearNotis", root, clearNotis)

function makePlayerNotification(player, title, details, type)
	local id = nil
	local elementFound = nil
	if isElement(player) and getElementType(player) == "player" then
		id = getElementData(player, "account:id")
		elementFound = player
	elseif tonumber(player) then
		id = tonumber(player)
	end
	if not id then
		return false
	end
	if not elementFound then
		for i, p in pairs(getElementsByType("player")) do
			if getElementData(p, "account:id") == id then
				elementFound = p
				break
			end
		end
	end

	mysql:query_free("INSERT INTO notifications SET userid="..id..", title='"..mysql:escape_string(title).."', "..(details and string.len(details)>0 and ("details='"..mysql:escape_string(details).."',") or "").." type='"..(type or "other").."'")
	if elementFound and getElementData(elementFound, "loggedin") == 1 then
		triggerEvent("integration:givePmsToClient", elementFound)
	end

	return true
end
