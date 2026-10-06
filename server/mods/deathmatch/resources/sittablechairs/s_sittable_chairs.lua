local chairData =
{
	-- offset = { x, y, z }, rotation = rz, rotateable = degrees in both direction you can turn
	[1720] = { offset = { 0, 0, 1.3 }, rotation = 0 },
	[1716] = { offset = { -0.3, -0.3, 1.5 }, rotation = 270, rotateable = 360 },
	[2125] = { offset = { 0, 0, 1.3 }, rotation = 90, rotateable = 180 },
	[1671] = { offset = { 0, 0, 0.8 }, rotation = 0 },
	[1714] = { offset = { 0, 0, 1.3 }, rotation = 0 },
	[1715] = { offset = { 0, -0.2, 1.3 }, rotation = 0 },
	[1722] = { offset = { 0, 0.3, 1.35 }, rotation = 180, rotateable = 100 },
	[1721] = { offset = { 0, 0.3, 1.35 }, rotation = 180, rotateable = 0 },
	[1704] = { offset = { 0.5, -0.25, 1.4 }, rotation = 0 },
	[1727] = { offset = { 0.5, -0.25, 1.4 }, rotation = 0 },
	[1754] = { offset = { 0, -0.25, 1.4 }, rotation = 0 },
	[2350] = { offset = { 0, 0, 1.3 }, rotation = 90, rotateable = 180 },
	[1663] = { offset = { 0, 0, 0.8 }, rotation = 0 },
	[1739] = { offset = { 0, 0, 0.6 }, rotation = 270 },
	[2183] = { offset = { 0, 0, 0.8 }, rotation = 0 },
	[1806] = { offset = { 0, 0.1, 1.3 }, rotation = 180 },
	[1562] = { offset = { 0, 0, 0.6 }, rotation = 0 },
	[2120] = { offset = { 0, 0, 0.6 }, rotation = 270 },
	[2636] = { offset = { 0, 0, 0.6 }, rotation = 270 },
	[2807] = { offset = { 0, 0, 0.8 }, rotation = 270 },
	[2123] = { offset = { -0.05, 0, 0.7 }, rotation = 270 },
	[1759] = { offset = { 0.5, 0, 1.28 }, rotation = 0 },
}
function sitOnChair(zx, zy, zz, zrz, chair, offset)
	local x, y, z = getElementPosition(chair)
	local rx, ry, rz = getElementRotation(chair)
	local data = chairData[getElementModel(chair)]
	if not data then return end
	if exports.global:getDistanceBetweenElements(client,chair)>10 then return end

	
	setPedRotation(client, (rz + data.rotation)-180)
	attachElements(client, chair, unpack(data.offset))
	setElementFrozen(client, true)

	exports.global:applyAnimation( client, "FOOD", "FF_Sit_Look", -1, true, false, true)
	exports.global:sendLocalMeAction(client, "sits down on the chair.")
	for k,v in ipairs(getElementsByType("player")) do
		if (v~=client) then
			triggerClientEvent(v,"csit",client,x,y,z)
		end
	end
end
addEvent("sit", true)
addEventHandler("sit", getRootElement(), sitOnChair)

function removeAnim(player)
	exports.global:removeAnimation( player )
end

function standUp(chair)
	checkWastedChairs(client)
	removeAnim( client )
	setTimer(removeAnim, 200, 1, client)
	setElementFrozen(client, false)
	exports.global:sendLocalMeAction(client, "stands up from the chair.")
	
	for k,v in ipairs(getElementsByType("player")) do
		if (v~=client) then
			triggerClientEvent(v,"cstand",source)
		end
	end
end
addEvent("stand", true)
addEventHandler("stand", getRootElement(), standUp)

--

local haxChairs = {}
function checkWastedChairs(source)
	if haxChairs[source] then
		destroyElement(haxChairs[source].e)
		haxChairs[source] = nil
	end
end

local function same(a,b)
	return math.abs(a-b)<0.1
end
addEvent("chair:allocate", true)--safe
addEventHandler("chair:allocate", root,
	function(model, x, y, z, rx, ry, rz)
		if client then return end
		checkWastedChairs(client)
		
		-- check if this chair is used
		for k, v in pairs(haxChairs) do
			if v.d == getElementDimension(client) and v.i == getElementInterior(client) then
				if same(v.x, x) and same(v.y, y) and same(v.z, z) then
					outputChatBox("That seat is already occupied!", client, 255, 0, 0)
					return
				end
			end
		end
		
		-- create a chair
		local data = {x = x, y = y, z = z, i = getElementInterior(client), d = getElementDimension(client)}
		data.e = createObject(model, x, y, z, rx, ry, rz)
		setElementDimension(data.e, data.d)
		setElementInterior(data.e, data.i)
		setElementAlpha(data.e, 0)
		haxChairs[client] = data
		
		triggerClientEvent(client, "chair:selfsit", data.e)
	end
)

addEventHandler("onPlayerQuit", root, function() checkWastedChairs(source) end)
