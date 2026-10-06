--MAXIME

addEventHandler("onClientResourceStart", resourceRoot, function()
	serverCurrentTimeSec = 0
	lastTime = getRealTime().timestamp
	triggerServerEvent("getServerCurrentTimeSec", resourceRoot)
end)

function setServerCurrentTimeSec(serverTimeSec)
	serverCurrentTimeSec = serverTimeSec
end
addEvent("setServerCurrentTimeSec", true)
addEventHandler("setServerCurrentTimeSec", root, setServerCurrentTimeSec)

function getNow()
	outputChatBox("[Client] "..now())
end
addCommandHandler("now", getNow)

