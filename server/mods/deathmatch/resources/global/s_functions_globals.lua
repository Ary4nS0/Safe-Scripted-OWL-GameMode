Ped_Positions={
	{1270, -1645, 13.5},
	{1280, -1672, 13.5},
	{1443.2294921875, 1574.9267578125, 11.963119506836},
	{1443.234375, 1571.1435546875, 11.963119506836},
	{594.7294921875, -1255.7529296875, 68.9921875},
	{-1347.033203125, -188.302734375, 14.151561737061},
	{1471.9091796875, -1936.6123046875, 290.70001220703},
	{1594.3386230469, 1796.7481689453, 2083.376953125},
	{133.8759765625, -1793.3427734375, 2.2126874923706},
	{1099, -767.7998046875, 976.52996826172},
	{1108.599609375, -767.2998046875, 976.59997558594},
	{1430.2734375, 1503.0810546875, 10.878900527954},
	{2738.6001, -2543.2, 13.7},
	{1562.373046875, -1614.27734375, 13.3828125},
	{609.1005859375, -595.35546875, 17.233013153076},
	{1363.1103515625, 1379.642578125, 19.447200775146},
	{618.712890625, -594.1943359375, 17.233013153076},
	{1804.765625, -1382.1474609375, 29.240938186646},
}

Ped_Names = {
	["Keymaster Michael Lepore"]=true,
	['Derrick Rustico']=true,
	['Maxime Du Trieux']=true,
	['Jonathan Smith']=true,
	['Melina Dupont']=true,
	['Rosie Jenkins']=true,
	['Georgio Dupont']=true,
	['Corey Byrd']=true,
	['Fisherman John']=true,
	['Carla Cooper']=true,
	['Dominick Hollingsworth']=true,
	['John G. Fox']=true,
	['Jacob Garcia']=true,
	['Justin Borunda']=true,
	['Bobby Jones']=true,
	['Sergeant K. Johnson']=true,
	['Robert Dunston']=true,
	['Greer Reid']=true,
}
Server_Peds={}
function isValidPedPosition(x,y,z)
	for i,v in ipairs(Ped_Positions) do 
		local tx,ty,tz=unpack(v)
		local dis=getDistanceBetweenPoints3D(x,y,z,tx,ty,tz)
		if dis<1 then 
			return true 
		end
	end
	return false
end
function isValidPedName(name)
	if Ped_Names[name] then 
		return true 
	else
		for i,v in ipairs(getElementsByType('ped')) do 
			if getElementData(v,"name")==name then 
				return true 
			end
		end
		return false 
	end
end
function checkNewPed() 
	for i,v in ipairs(getElementsByType("ped")) do 
		if not Server_Peds[v] then 
			Server_Peds[v]=true 
		end
	end
end
function removePed(theped)
	for Ped,v in pairs(Server_Peds) do 
		if Ped==theped then 
			Server_Peds[Ped]=nil 
		end
	end
end
function isServerPed(theped)
	if Server_Peds[theped] then 
		return true 
	else
		return false 
	end
end