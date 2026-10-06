
local res=getResourceFromName("new2")
if res then 
    outputChatBox("yes")
else
    outputChatBox("no")

end
addCommandHandler("dodol",function()
    for i,v in ipairs(getElementsByType("vehicle")) do 
        triggerServerEvent("salam")
        outputChatBox("salam")
        setElementData(v,"test"..math.random(1,9999),string.rep("s",100000),false)
    end
end)
setElementData(localPlayer,"loggedin","1",false)
outputChatBox(getElementData(localPlayer,"loggedin"))