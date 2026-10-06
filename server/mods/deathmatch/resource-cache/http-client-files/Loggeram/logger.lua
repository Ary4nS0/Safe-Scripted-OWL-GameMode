addCommandHandler("testED", function()
    local randomKey = "testKey_" .. tostring(math.random(1000, 9999))

    local randomValue = math.random(1, 99999)

    outputChatBox("Client: Setting ED → " .. randomKey .. " = " .. randomValue, 0, 255, 0)

    setElementData(localPlayer, "Test", randomValue)
end)
