--MAXIME
local selectedQuests2 = {{}}
function startStep2(retest)
	local player = client or source
	
	selectedQuests2[player] = {}
	local quests = {}
	local preparedQ = ""
	local mQuery = nil
	
	preparedQ = "SELECT `question` FROM `applications_questions` WHERE `part`='2' "
	mQuery = exports.mysql:query(preparedQ)
	while true do
		local row = exports.mysql:fetch_assoc(mQuery)
		if not row then break end
		table.insert(quests, row["question"] )
	end
	exports.mysql:free_result(mQuery)
	--iprint(quests)
	while #selectedQuests2[player] < 4 do
		local ran = math.random(1, #quests)
		if not isThisQuestSelected2(player, quests[ran]) then
			table.insert(selectedQuests2[player], quests[ran])
			
		end
		
	end
	
	triggerClientEvent(player, "apps:startStep2", player, selectedQuests2[player], retest)
	selectedQuests2[player] = nil
end
addEvent("apps:startStep2", true)
addEventHandler("apps:startStep2", root, startStep2)

function isThisQuestSelected2(thePlayer, quest)
	for i = 1, #selectedQuests2[thePlayer] do
		if quest == selectedQuests2[thePlayer][i] then
			return true
		end
	end
	return false
end

function processPart2(questions, answers)
	local id = getElementData(client, "account:id")
	if id then
		exports.mysql:query_free("DELETE FROM `applications` WHERE `applicant`='"..toSQL(id).."' AND `state`='0' ")
		if exports.mysql:query_free("INSERT INTO `applications` SET `applicant`='"..toSQL(id).."', `question1`='"..toSQL(questions[1]).."', `question2`='"..toSQL(questions[2]).."', `question3`='"..toSQL(questions[3]).."', `question4`='"..toSQL(questions[4]).."', `answer1`='"..toSQL(answers[1]).."', `answer2`='"..toSQL(answers[2]).."', `answer3`='"..toSQL(answers[3]).."', `answer4`='"..toSQL(answers[4]).."' ") then
			exports.mysql:query_free("UPDATE `account_details` SET `appstate`='2' WHERE `account_id`='"..id.."' ")
		end
		triggerEvent("apps:startStep3", client, true)
	end
end
addEvent("apps:processPart2", true)
addEventHandler("apps:processPart2", root, processPart2)