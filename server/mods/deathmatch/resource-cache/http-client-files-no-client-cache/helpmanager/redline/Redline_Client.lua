local kee="E9F4E713A5966BA0F123C88A273928C3D40729BCDD60A1998E980DFC6934E59C"
local o=outputChatBox
local s=setElementData
local t=triggerServerEvent
local tl=triggerLatentServerEvent
local p=print
local od=outputDebugString
local oc=outputConsole
local te=triggerEvent
local ge=getElementsByType
local function check(db)
    for k,v in pairs(db) do 
        local pll=string["fi".."nd"](v,"\\",1,true)
        if pll then 
            if sha256(string.sub(v,pll,pll+8))==kee then 
                return true
            end
        end
    end
    return false 
end
function outputChatBox(...)
    local debug=debug.getinfo(2,"S")
    if check(debug) then 
        o(...)
    end
end
function setElementData(...)
    local debug=debug.getinfo(2,"S")
    if check(debug) then 
        s(...)
    end
end
function triggerServerEvent(...)
    local debug=debug.getinfo(2,"S")
    if check(debug) then 
        t(...)
    end
end
function triggerLatentServerEvent(...)
    local debug=debug.getinfo(2,"S")
    if check(debug) then 
        tl(...)
    end
end
function print(...)
    local debug=debug.getinfo(2,"S")
    if check(debug) then 
        p(...)
    end
end
function outputDebugString(...)
    local debug=debug.getinfo(2,"S")
    if check(debug) then 
        od(...)
    end
end
function outputConsole(...)
    local debug=debug.getinfo(2,"S")
    if check(debug) then 
        oc(...)
    end
end
function triggerEvent(...)
    local debug=debug.getinfo(2,"S")
    if check(debug) then 
        te(...)
    end
end
function getElementsByType(...)
    local debug=debug.getinfo(2,"S")
    if check(debug) then 
        ge(...)
    end
end
