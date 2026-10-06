--[[
 * ***********************************************************************************************************************
 * Copyright (c) 2015 OwlGaming Community - All Rights Reserved
 * All rights reserved. This program and the accompanying materials are private property belongs to OwlGaming Community
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * ***********************************************************************************************************************
 ]]

local localPlayer = getLocalPlayer()
local timer = false
local kills = 0
function checkDM(killer)
	if (killer==localPlayer) then
		kills = kills + 1
		
		if (kills>=3) then
			triggerServerEvent("alertAdminsOfDM", resourceRoot, kills)
		end
		
		if not (timer) then
			timer = true
			setTimer(resetDMCD, 120000, 1)
		end
	end
end
addEventHandler("onClientPlayerWasted", getRootElement(), checkDM)

function resetDMCD()
	kills = 0
	timer = false
end

--[[
0: Grenade
1: Molotov
2: Rocket
3: Rocket Weak
4: Car
5: Car Quick
6: Boat
7: Heli
8: Mine
9: Object
10: Tank Grenade
11: Small
12: Tiny
]]

-- If the explosion doesn't come from a verified source, it must be illegal.




