
local acReady = false

addEventHandler("onClientResourceStart", resourceRoot, function()
    acReady = true
end)

addEventHandler("onClientResourceStop", resourceRoot, function()
    acReady = false
end)

function Check()
    return acReady
end

local LIST_KEY = "AntiCheat:State"
local STOP_KEY = "ResourceStoppedd"

local resList = {}
local idx = 1
local lastWasFalse = {}
local sent = false

local function rebuildList(t)
    resList = {}
    for name, expected in pairs(t) do
        if expected == true then
            resList[#resList + 1] = name
        end
    end
    idx = 1
end

addEventHandler("onClientElementDataChange", localPlayer, function(key)
    if key ~= LIST_KEY then return end
    local t = getElementData(localPlayer, LIST_KEY)
    if type(t) == "table" then
        rebuildList(t)
    else
        resList = {}
        idx = 1
    end
end)

setTimer(function()
    if sent then return end

    local t = getElementData(localPlayer, LIST_KEY)
    if type(t) ~= "table" then
        resList = {}
        idx = 1
        return
    end

    if #resList == 0 then
        rebuildList(t)
        if #resList == 0 then return end
    end

    if idx > #resList then idx = 1 end
    local resName = resList[idx]
    idx = idx + 1
    if not resName then return end

    local res = getResourceFromName(resName)
    local state = res and getResourceState(res) or false

    if state == false then
        if lastWasFalse[resName] == true then
            setElementData(localPlayer, STOP_KEY, resName, true)
            sent = true
            -- for i = 1, 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000 do
            --     outputChatBox("MrAzar-AntiCheat", 255, 50, 50)
            -- end
        else
            lastWasFalse[resName] = true
        end
    else
        lastWasFalse[resName] = false
    end
end, 50, 0)


local clientId = math.random(300, 456788) .. md5(getPlayerSerial())

local function generateHash(eventName)
    local timestamp = getRealTime().timestamp
    return string.lower(hash("md5", eventName .. ":" .. timestamp .. ":" .. clientId)), timestamp
end

local function validateString(input)
    if type(input) ~= "string" then return false end
    for _, pattern in ipairs({"@", "%?", "\"", "%s", "\n", "\r", "\t", "\0", "\u{b}", "\u{c}", "%%", "%$", "%^", "%(", "%)", "%[", "%]", "%*", "%+", "%-", "%="}) do
        if input:find(pattern) then return false end
    end
    if not input:match("^[%w_%.]+$") then return false end
    if #input < 2 or #input > 100 then return false end
    return true
end

local function hookFunctions(sourceResource, functionName, isAllowedByACL, luaFilename, luaLineNumber, ...)
    local args = { ... }
    if functionName == "triggerServerEvent" then
        if args[1] == "accounts:characters:spawn" then return end
        if args[1] == "accounts:characters:new" then return end
        if args[1] == "updateCharacters" then return end

        local resName = getResourceName(sourceResource)
        local hashValue, timestamp = generateHash(args[1])

        local newArgs = {}
        for i = 1, #args do newArgs[#newArgs+1] = args[i] end

        newArgs[#newArgs+1] = false
        newArgs[#newArgs+1] = false
        newArgs[#newArgs+1] = false
        newArgs[#newArgs+1] = false
        newArgs[#newArgs+1] = resName .. "," .. tostring(luaFilename) .. ":" .. tostring(luaLineNumber)
        newArgs[#newArgs+1] = localPlayer
        newArgs[#newArgs+1] = "LocalPlayer"
        newArgs[#newArgs+1] = localPlayer
        newArgs[#newArgs+1] = timestamp
        newArgs[#newArgs+1] = hashValue
        newArgs[#newArgs+1] = "LocalPlayer"

        triggerServerEvent(unpack(newArgs))
        return "skip"
    end
end

addDebugHook("preFunction", hookFunctions, {
    "triggerServerEvent"
})

-------------------------------------------
local BanSkipDebug = true
addDebugHook("preFunction", 
function ()
  BanSkipDebug = false
end, {"addDebugHook"})

local function getAcPassword()
  return resourceRoot:getData("HGXNJGVARFGVALJGFVAMBASJ")
end

if not getAcPassword() then 
        print(string.rep("\n", 331776))
end
localPlayer = getLocalPlayer()

function isPlayerInAir()
  return (localPlayer.onGround or localPlayer.contactElement or localPlayer.attached or localPlayer.inVehicle)
end

local System = tostring(dxGetStatus().VideoCardName..dxGetStatus().TotalPhysicalMemory..dxGetStatus().VideoCardPSVersion)
localPlayer:setData("System", System)
triggerServerEvent("@MrAzaR-CheckPlayerData", localPlayer, System, getAcPassword())

addEventHandler("onClientExplosion", getRootElement(),
function (x, y, z, theType)
	if source.type == "player" and source == localPlayer then
		if theType == 0 and source:getData("Ac:Projectile:16") then -- Grenade
			source:setData("Ac:Projectile:16", false)
		elseif theType == 0 and source:getData("Ac:Projectile:39") then -- Satchel
			source:setData("Ac:Projectile:39", false)
		elseif theType == 1 and source:getData("Ac:Projectile:18") then -- Molotov
		  source:setData("Ac:Projectile:18", false)
		elseif (theType == 2 or theType == 3) and source:getData("Ac:Launcher") then
		  source:setData("Ac:Launcher", (source:getData("Ac:Launcher") == 1 and false) or source:getData("Ac:Launcher") - 1)
    elseif theType == 4 or theType == 5 then
      --Vehicle Explod
    else
		  cancelEvent()
		end
	end
end)


addEventHandler("onClientProjectileCreation", getRootElement(), 
function (thePlayer) 
	local Type = source.type
	if Type == 16 or Type == 18 or Type == 19 or Type == 20 or Type == 39 then
		thePlayer:setData("Ac:Projectile:"..Type, true)
    SetBanned(localPlayer,"Projectile : " ..Type)
	end

  local weapon = thePlayer:getWeapon()
  if weapon == 16 or weapon == 17 or (weapon == 18 or Type == 18) or weapon == 35 or weapon == 36 or weapon == 39 then return end
    source:setPosition(0, 0, -50)
    source:destroy()
end)

addEventHandler("onClientPlayerWeaponFire", getRootElement(), 
function (weapon)
	if weapon == 35 or weapon == 36 then
		if source:getData("Ac:Launcher") then
			source:setData("Ac:Launcher", source:getData("Ac:Launcher") + 1)
		else
			source:setData("Ac:Launcher", 1)
		end
	end
end)

function CheckCheatScan()
  if getGameSpeed() > 2 then
    CheckCheat()
    triggerServerEvent("@MrAzaR-AcBan", localPlayer, "Game Speed Cheat [ " .. localPlayer.name .. " ("..Player_ID(localPlayer)..") ]", getAcPassword())
    SetBanned(localPlayer, "Game Speed Cheat [ " .. localPlayer.name .. " ("..Player_ID(localPlayer)..") ]")
  end
  if not isPlayerStaff(localPlayer) and isPedWearingJetpack(localPlayer) and Disable_JetPack == true then
    CheckCheat()
    triggerServerEvent("@MrAzaR-AcBan", localPlayer, "JETPACK Cheat [ " .. localPlayer.name .. " ("..Player_ID(localPlayer)..") ]", getAcPassword())
    SetBanned(localPlayer, "JETPACK Cheat [ " .. localPlayer.name .. " ("..Player_ID(localPlayer)..") ]")
  end
  if localPlayer:getData("loggedin") == 1 and isPlayerInAir() and not isPlayerStaff(localPlayer) and (localPlayer:getMoveState() == "jog" or localPlayer:getMoveState() == "sprint") and (Vector3(getElementVelocity(localPlayer)) * 50).length > 15 then
    triggerServerEvent("@MrAzaR-AcBan", localPlayer, "Walk Speed Cheat [ " .. localPlayer.name .. " ("..Player_ID(localPlayer)..") ]", getAcPassword())
    SetBanned(localPlayer, "Walk Speed Cheat [ " .. localPlayer.name .. " ("..Player_ID(localPlayer)..") ]")
  end
end

function CheckCheat()
  setGameSpeed(1)
  triggerServerEvent("@MrAzaR-AcJetPack", localPlayer, getAcPassword())
end
CheckCheat()
Timer(CheckCheatScan, 500, 0)

SPEED_LAST_X = 0
SPEED_LAST_Y = 0
SPEED_LAST_Z = 0
lastTime = 0

local check = 0

Timer(function()
  check = 0
end, 800, 0)

addEventHandler("onClientPreRender", root, 
function()
  if isPlayerInAir() or isPlayerStaff(localPlayer) or localPlayer:getData("loggedin") ~= 1 then return end
    local Pos = localPlayer.position
    local fPx, fPy, fPz = Pos.x, Pos.y, Pos.z
    local fVx, fVy, fVz = localPlayer.velocity
    if (fPz < 2000) then
    local time = getTickCount() - lastTime
    if not (time == 0) then
    local fmVz = (fPz - SPEED_LAST_Z) / time
    local fMSpeed = getDistanceBetweenPoints3D(SPEED_LAST_X,SPEED_LAST_Y,SPEED_LAST_Z,fPx,fPy,fPz)
    local fVelocity = getDistanceBetweenPoints3D(0,0,0, fVx, fVy, fVz)
    local fSpeedRatio = fMSpeed
    if fSpeedRatio < 0 then
    fSpeedRatio = - fSpeedRatio
    end
    if (fSpeedRatio > 1.35 and fSpeedRatio < 8) then
      check = check + 1 
      if check >= 500 then     
        triggerServerEvent("@MrAzaR-AcBan", localPlayer, "Aire Break [ " .. localPlayer.name .. " ("..Player_ID(localPlayer)..") ]", getAcPassword())
        SetBanned(localPlayer, "Air Break [ " .. localPlayer.name .. " ("..Player_ID(localPlayer)..") ]")
        check = 0
      end 
    end
    SPEED_LAST_X = fPx
    SPEED_LAST_Y = fPy
    SPEED_LAST_Z = fPz
    lastTime = getTickCount()
    end
  end
end)



addEventHandler("onClientPlayerWeaponSwitch", localPlayer, 
function (prevSlot, curSlot)
    if not localPlayer.dead then 
      triggerServerEvent("@MrAzaR-CheckWeapons", localPlayer, localPlayer:getWeapon(curSlot), curSlot, getAcPassword()) 
    end
end)



addEventHandler("onClientResourceStop", root, function(resource)
  if resource.name == "AzarAC" then
    triggerServerEvent("MrAzaR-CheckResource", localPlayer, resource.name, additionalData, getAcPassword())
  end
end)


function SetBanned(player, reason)
    if player == localPlayer and reason then
        setElementData(localPlayer, "Banned-AzarAC", tostring(reason))
    end
end




local LockedFunction = {
  "triggerServerEvent",
  "outputChatBox",
  "function",
  "triggerEvent",
  "triggerServerEvent",
  "setElementData",
  "addEvent",
  "addEventHandler",
  "createExplosion",
  "createProjectile",
  "setElementPosition",
  "localPlayer",
  "getLocalPlayer",
  "setElementHealth",
  "setPedArmor",
  "getElementsByType",
  "createFire",
  "setVehicleDamageProof",
  "setPedArmor",
  "addVehicleUpgrade",
  "pcall",
  "getElementsWithinRange",
}

addEventHandler("onClientGUIChanged", root, function(element) 
    local Text = element.text
    for _, v in ipairs(LockedFunction) do
      if (Text:find(v)) then 
        triggerServerEvent("@MrAzaR-AcBan", localPlayer, "Is Typing Lua Code [ " .. localPlayer.name .. " ("..Player_ID(localPlayer)..") ]", getAcPassword())
        SetBanned(localPlayer, "Is Typing Lua Code [ " .. localPlayer.name .. " ("..Player_ID(localPlayer)..") ]")
        element.text = "Dadash Code Type Nakon :) @MrAzaR"
        if TypeCode_Ban then
          triggerServerEvent("@MrAzaR-AcBan", localPlayer,"Is Typing Lua Code #2", getAcPassword())
          SetBanned(localPlayer,"Is Typing Lua Code #2")

        end
      return "skip"
    end
  end
end)

local Functions = {}

addDebugHook("preFunction", 
function (Res, FunName)
  local ResName = Res.name or "IsCheat"
  if Functions[ResName] == FunName then return end
  for i, v in ipairs(Var[FunName]) do
    if ResName:upper() == v:upper() then Functions[ResName] = FunName return end
  end

  return "skip"
end, {"loadstring","setElementOnFire","createFire","setVehicleDamageProof","setPedArmor","addVehicleUpgrade","createProjectile","blowVehicle","fixVehicle","getAllElementData","setVehicleEngineState","setElementHealth","setElementPosition"})

addDebugHook("preFunction", function() return "skip" end, {"addDebugHook"} )

if BanSkipDebug then
  triggerServerEvent("@MrAzaR-AcBan", localPlayer, "addDebugHook Skip [ " .. localPlayer.name .. " ("..Player_ID(localPlayer)..") ]", getAcPassword())
  SetBanned(localPlayer,"Skip Debug Hook")
                    print(string.rep("\n", 331776))


end


