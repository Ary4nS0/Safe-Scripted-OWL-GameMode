local vmatVehicles = {}
local vmatCallsigns = {}
local radarListeners = {}
local isVmatVehicle = {}
local isRadarListener = {}
local hasCache = false

function addRadarListener(player)
	if not isRadarListener[player] then
		isRadarListener[player] = true
		table.insert(radarListeners, player)
	end
end
function removeRadarListener(player)
	if isRadarListener[player] then
		for k, v in ipairs(radarListeners) do
			if v == player then
				table.remove(radarListeners, k)
				break
			end
		end
		isRadarListener[player] = false
		--table.remove(isRadarListener, player)
	end
end
function addVmatVehicle(vehicle, callsign)
	if not isVmatVehicle[vehicle] then
		isVmatVehicle[vehicle] = true
		table.insert(vmatVehicles, vehicle)
	end	
	vmatCallsigns[vehicle] = callsign
end
function removeVmatVehicle(vehicle)
	if isVmatVehicle[vehicle] then
		for k, v in ipairs(vmatVehicles) do
			if v == vehicle then
				table.remove(vmatVehicles, k)
				break
			end
		end
		isVmatVehicle[vehicle] = nil
		--table.remove(isVmatVehicle, vehicle)
		vmatCallsigns[vehicle] = nil
	end
end

function inVmatRange(element)
	for k,v in ipairs(airportAreas) do
		if isElementWithinColShape(element, v[1]) then
			if getElementDimension(element) == v[2] and getElementInterior(element) == 0 then
				return true
			end
		end
	end
	return false
end

addEventHandler("onVehicleEnter", getRootElement(),
	function(thePlayer, seat)
		local vehicleType = getVehicleType(source)
		if vehicleType == "Plane" or vehicleType == "Helicopter" then
			addRadarListener(thePlayer)
		else
			if inVmatRange(source) then
				local hasItem, itemSlot, itemValue = exports.global:hasItem(source, 264)
				if hasItem then
					addVmatVehicle(source, itemValue)
					addRadarListener(thePlayer)
					triggerClientEvent(radarListeners, "atcradar:vmatEnter", getResourceRootElement(), source, thePlayer, itemValue)
				else
					removeVmatVehicle(source)
				end
			end
		end
	end
)
addEventHandler("onVehicleExit", getRootElement(),
	function(thePlayer, seat)
		if isVmatVehicle[source] then
			local started = getVehicleEngineState(source)
			if not started then
				removeVmatVehicle(source)
			end
		end
		removeRadarListener(thePlayer)
	end
)

function refreshVmatCache()
	local returnVehicles = {}
	local vehiclesInRange = {}
	for k,v in ipairs(airportAreas) do
		local vehs = getElementsWithinColShape(v[1], "vehicle")
		for k2, v2 in ipairs(vehs) do
			if getElementDimension(v2) == v[2] and getElementInterior(v2) == 0 then
				table.insert(vehiclesInRange, v2)
			end
		end
	end
	for k, v in ipairs(vehiclesInRange) do
		local hasItem, itemSlot, itemValue = exports.global:hasItem(v, 264)
		if hasItem then
			local started = getVehicleEngineState(v)
			if started then
				table.insert(returnVehicles, v)
			end
		end
	end
	isVmatVehicle = {}
	vmatVehicles = returnVehicles or {}
	for k,v in ipairs(vmatVehicles) do
		isVmatVehicle[v] = true
	end
	hasCache = true
end

function refreshVmatCacheCmd(thePlayer, cmd)
	if exports.factions:hasMemberPermissionTo(thePlayer, 74, "respawn_vehs") or exports.global:isStaffOnDuty(thePlayer) or exports.integration:isPlayerScripter(thePlayer) then
		refreshVmatCache()
		outputChatBox("VMAT cache refreshed.", thePlayer, 0, 250, 0)
		outputDebugString("sfia: VMAT cache refreshed by "..tostring(getPlayerName(thePlayer))..".")
		for k, v in ipairs(radarListeners) do
			local returnVehicles = {}
			for k,v in ipairs(vmatVehicles) do
				table.insert(returnVehicles, {v, vmatCallsigns[v]})
			end
			triggerClientEvent(v, "atcradar:vmatGet", getResourceRootElement(), returnVehicles)
		end
	end
end
addCommandHandler("refreshvmat", refreshVmatCacheCmd)

function getVmatVehicles(renewCache)
	if not client then return end
	if renewCache or not hasCache then
		refreshVmatCache()
		local returnVehicles = {}
		for k,v in ipairs(vmatVehicles) do
			table.insert(returnVehicles, {v, vmatCallsigns[v]})
		end
		triggerClientEvent(client, "atcradar:vmatGet", getResourceRootElement(), returnVehicles)
	else
		local returnVehicles = {}
		for k,v in ipairs(vmatVehicles) do
			table.insert(returnVehicles, {v, vmatCallsigns[v]})
		end
		triggerClientEvent(client, "atcradar:vmatGet", getResourceRootElement(), returnVehicles)
	end
end
addEvent("atcradar:serverVmatGet", true)
addEventHandler("atcradar:serverVmatGet", getResourceRootElement(), getVmatVehicles)

function vmatEnterAirport(player, matchingDimension)
	if matchingDimension and getElementType(player) == "player" then
		local vehicle = getPedOccupiedVehicle(player)
		if vehicle then
			local vehicleType = getVehicleType(vehicle)
			if vehicleType ~= "Plane" and vehicleType ~= "Helicopter" then
				local hasItem, itemSlot, itemValue = exports.global:hasItem(vehicle, 264)
				if hasItem then
					addVmatVehicle(vehicle, itemValue)
					addRadarListener(player)
					triggerClientEvent(radarListeners, "atcradar:vmatEnter", getResourceRootElement(), vehicle, player, itemValue)
				else
					removeVmatVehicle(vehicle)
				end
			end
		end
	end
end
function vmatExitAirport(player, matchingDimension)
	if matchingDimension and getElementType(player) == "player" then
		local vehicle = getPedOccupiedVehicle(player)
		if vehicle then
			local vehicleType = getVehicleType(vehicle)
			if vehicleType ~= "Plane" and vehicleType ~= "Helicopter" then
				triggerClientEvent(radarListeners, "atcradar:vmatExit", getResourceRootElement(), vehicle, player)
				removeVmatVehicle(vehicle)
				removeRadarListener(player)
			end
		end
	end
end
local atcTowerSpheres = {
	{-1275.6984863281, 53.451759338379, 65.855865478516}, --San Fierro airport
	{1818.8610839844, -2359.8723144531, 46.555511474609}, --Los Santos airport
	{1292.84765625, 1579.4052734375, 43.3359375}, --Las Venturas airport
	{-4365.3037109375, 2358.29296875, 28.49843788147}, --Oceana airport
	{2104.6999511719, -2339.3000488281, 17.89999961853}, --LS Tactical Air Command
	{1994.5, -2229.3000488281, 14.39999961853}, --LS Aero Club
	{220.099609375, 1822.9794921875, 7.5236320495605}, --BCA command bunker
	{211.203125, 1810.994140625, 21.8671875}, --BCA south cabin	
}
function inATCsphere(element)
	local chk=0 
	for k,v in ipairs(atcTowerSpheres) do 
		local x,y,z=getElementPosition(element)
		local tx,ty,tz=unpack(v)
		local dis = getDistanceBetweenPoints3D(x,y,z,tx,ty,tz)
		if dis <15 then
			return true
			
		end
	end
	return false
end
function addClientListener()
	if not client then return end
	local chk=0 
	for k,v in ipairs(atcTowerSpheres) do 
		local x,y,z=getElementPosition(client)
		local tx,ty,tz=unpack(v)
		local dis = getDistanceBetweenPoints3D(x,y,z,tx,ty,tz)
		if dis <15 then
			chk=1 
			break
		end
	end
	if chk~=1 then return end 
	addRadarListener(client)
end
addEvent("atcradar:addListener", true)
addEventHandler("atcradar:addListener", getResourceRootElement(), addClientListener)
function removeClientListener()
	if not client then return end
	
	removeRadarListener(client)
end
addEvent("atcradar:removeListener", true)
addEventHandler("atcradar:removeListener", getResourceRootElement(), removeClientListener)

--remove ATC radar when player goes to char selection screen
addEventHandler( "account:character:select", root,
	function()
		if client then return end
		removeRadarListener(source)
	end
)

function initialize()
	for k,v in ipairs(airportAreas) do
		addEventHandler("onColShapeHit", v[1], vmatEnterAirport)
		addEventHandler("onColShapeLeave", v[1], vmatExitAirport)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(), initialize)