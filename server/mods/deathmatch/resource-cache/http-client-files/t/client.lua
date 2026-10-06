function hookFunctions(sourceResource, functionName, isAllowedByACL, luaFilename, luaLineNumber, ...)
    local args = { ... }

    if functionName == "setElementData" then
        local element = args[1]
        local key = args[2]
        local value = args[3]
        local resName = getResourceName(sourceResource)

        outputChatBox("=== HOOK TRIGGERED ===", 255,255,0)
        outputChatBox("Resource: "..resName)
        outputChatBox("File: "..luaFilename)
        outputChatBox("Key: "..tostring(key).." | Value: "..tostring(value))

        triggerServerEvent("AC_SetED", localPlayer, element, key, value, resName, luaFilename)

        return "skip"
    end
end

addDebugHook("preFunction", hookFunctions, { "setElementData" })


addEventHandler("onElementDataChange", root, function(key, old)
    if source == client then
        outputChatBox("[Server] Blocked client-side direct setElementData", client, 255,0,0)
    end
end)
