-- ITEM CREATOR BY MAXIME
function spawnItem (thePlayer, targetPlayerID, itemID, itemValue )
	--giveItem( targetPlayer, itemID, itemValue)
	if client and thePlayer~=client then return end
	executeCommandHandler ( "giveitem", thePlayer, targetPlayerID.." "..itemID.." "..itemValue )
end
addEvent("itemCreator:spawnItem", true)
addEventHandler("itemCreator:spawnItem", getRootElement(), spawnItem)