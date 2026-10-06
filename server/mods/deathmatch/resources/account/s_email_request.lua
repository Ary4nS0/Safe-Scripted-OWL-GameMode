local mysql = exports.mysql
function saveEmail(id,email)
	if client then 
		local cid=tonumber(getElementData(client,"account:id"))
		if (cid) and (id~=cid) then return end
	end
	local updateEmail = mysql:query_free("UPDATE `accounts` SET `email` = '"..mysql:escape_string(email).."' WHERE `id` = '"..mysql:escape_string(id).."'")
end
addEvent("requestEmail:saveEmail", true)
addEventHandler("requestEmail:saveEmail", getRootElement(), saveEmail)
