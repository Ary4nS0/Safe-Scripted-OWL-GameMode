function test()
    local trace=debug.traceback()
    print(trace)
end
local aswa={}
addEvent("shol",true)
addEventHandler("shol",root,function(a)
    aswa[resourceRoot]=a
end)