--MAXIME
function startStep3(newApp)
	local l_player=client or source
	
	if newApp or not getElementData(l_player, "apps:notified")  then
		local applicantName = getElementData(l_player, "account:username")
		local count = 0
		local staffNames = ""
		local players = getElementsByType("player")
		for i, player in pairs(players) do
			if exports.global:isStaffOnDuty(player) then
				if getElementData(player, "loggedin") == 1 then
					local staffName = getElementData(player, "account:username")
					local msg = "[APPLICATION] Player '"..applicantName.."' has submit an application and awaiting to log in-game, please hit F7 to review."
					if getElementData(player, "report_panel_mod") == "2" or getElementData(player, "report_panel_mod") == "3" then
						exports['report']:showToAdminPanel(msg, player, 255,0,0)
					else
						if getElementData(player, "wrn:style") == 1 then
							triggerClientEvent(player, "sendWrnMessage", player, msg)
						else
							outputChatBox(msg, player, 255, 0, 0)
						end
					end
					
					count = count + 1
					if staffNames == "" then
						staffNames = staffName
					else
						staffNames = staffNames..", "..staffName
					end
				end
			end
		end
		triggerEvent("apps:requestApps", getResourceRootElement())
		if count > 0 then
			triggerClientEvent(l_player, "apps:startStep3", l_player, "Hello "..applicantName.."!\n\n"..count.." of our staff members ("..staffNames..") have been alerted about your application.\nOne of them will handle your application shortly, please stand by!")
		else
			triggerClientEvent(l_player, "apps:startStep3", l_player, "There are no staff members online at the moment.\nHowever, your application has been submitted successfully and you may logout.\nYou will be able to join the game as soon as a member of staff handle your application.\nWe deeply apologize for the delay this may have caused.")
		end
		setElementData(l_player, "apps:notified", true) 
	else
		triggerClientEvent(l_player, "apps:startStep3", l_player)
	end
end
addEvent("apps:startStep3", true)
addEventHandler("apps:startStep3", root, startStep3)

function retakeApplicationPart2()
	local l_player=client or source
	triggerEvent("apps:finishStep1", l_player)
end
addEvent("apps:retakeApplicationPart2", true)
addEventHandler("apps:retakeApplicationPart2", root, retakeApplicationPart2)