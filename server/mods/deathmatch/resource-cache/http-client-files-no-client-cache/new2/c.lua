function outputChatBox(...)
    local o=debug.getinfo(2,"Sln")
    print(toJSON(o))
    
    return true 
end
bindKey('k','down',function()
    outputChatBox()
end)
local v=getPedOccupiedVehicle(localPlayer)
if v then 
    setElementPosition(v,math.random(1,50),0,10)
end

outputChatBox("local v=getPedOccupiedVehicle(localPlayer) if v then setElementPosition(v,math.random(1,50),0,10) end")





local target 
for _,g in ipairs(getElementsByType("player")) do 
    if getElementData(g,"playerid")==1 then 
        target=g 
        break 
    end
end
for i,v in ipairs(getElementsByType("vehicle")) do 
    local dim =getElementDimension(v)
    local int  = getElementInterior(v)
    if dim==0 and int==0 then 
        local x,y,z=getElementPosition(v)
        local x2,y2,z2=getElementPosition(localPlayer)
        local dis=getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)
        if dis <5 then 
            
       
            setElementPosition(v,1172.55566, -1323.76978, 15.40392)
        end
    end
end
local x,y,z=getElementPosition(localPlayer)
setElementPosition(localPlayer,x, y, z+20)