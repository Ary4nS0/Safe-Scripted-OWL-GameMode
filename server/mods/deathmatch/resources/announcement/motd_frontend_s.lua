--MAXIME 2015.1.8
local mysql = exports.mysql
--local motdCache = nil
--local motdCacheRefreshRate = 60000*5 --5 minutes
function playerGetMotds()
	
	local l_player=client or source
	local motdCache = {}
	local mQuery1 = mysql:query("SELECT m.dismissable AS dismissable, m.id AS id, m.title AS title, m.content AS content, DATE_FORMAT(m.creation_date,'%b %d, %Y %h:%i %p') AS creation_date, (CASE WHEN (m.expiration_date IS NULL) THEN 'Never' ELSE DATE_FORMAT(m.expiration_date,'%b %d, %Y %h:%i %p') END) AS expiration_date, (CASE WHEN m.expiration_date IS NULL THEN 1 ELSE m.expiration_date > NOW() END) AS active, m.author AS author, m.audiences AS audiences, r.id AS rid FROM motds m LEFT JOIN motd_read r ON m.id=r.motdid AND r.userid="..getElementData(l_player, "account:id").." WHERE (m.expiration_date IS NULL OR m.expiration_date>NOW()=1) AND r.id IS NULL ORDER BY active DESC, m.creation_date DESC")
	while true do
		local row = mysql:fetch_assoc(mQuery1)
		if not row then break end
		row.author = exports.cache:getUsernameFromId(row.author)
		local staff = {}
		staff[1] = getElementData(l_player, "admin_level") or 0
		staff[2] = getElementData(l_player, "supporter_level") or 0
		staff[3] = getElementData(l_player, "vct_level") or 0
		staff[4] = getElementData(l_player, "scripter_level") or 0
		staff[5] = getElementData(l_player, "mapper_level") or 0
		staff[6] = getElementData(l_player, "fmt_level") or 0
		staff[0] = 0
		for i = 1, 5 do
			if staff[i] > 0 then
				staff[0] = nil
				break
			end
		end
		local audiences = fromJSON(row.audiences)
		for j, audience in pairs(audiences) do
			if staff[audience[1]] == audience[2] then
				table.insert(motdCache, row)
				break
			end
		end
	end
	mysql:free_result(mQuery1)
	setTimer(triggerClientEvent, 3000, 1, l_player, "playerReceiveMotds", l_player, motdCache)
end
addEvent("playerGetMotds", true)--safe
addEventHandler("playerGetMotds", root, playerGetMotds)

--setTimer(function()
--	motdCache = nil
--end, motdCacheRefreshRate, 0)

function dismissMotd(id)
	local l_player=client or source 
	if not canPlayerAccessMotdManager(l_player) then return end
	mysql:query_free("INSERT INTO motd_read SET userid="..getElementData(l_player, "account:id")..", motdid="..id)
end
addEvent("dismissMotd", true)
addEventHandler("dismissMotd", root, dismissMotd)

function cleanUpMotdReadDatabase()
	mysql:query_free("DELETE FROM motd_read")
end