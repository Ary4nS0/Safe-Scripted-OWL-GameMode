local bannedAnimations = { ["FIN_Cop1_ClimbOut2"]=true, ["FIN_Jump_on"]=true, ["sprint_civi"] = true }

addEvent("AnimationSet",true)
addEventHandler("AnimationSet",getRootElement(),
	function (block, ani, loop)
		local l_player=client or source
		if bannedAnimations[ani] then
			outputChatBox("This animation is currently banned.", l_player, 255, 0, 0)
			return
		end

		if(l_player)then
			if(block)then
				if loop then
					setPedAnimation(l_player,block,ani,-1,loop)
				else
					setPedAnimation(l_player,block,ani,1,false)
				end
			else
				setPedAnimation(l_player)
			end
		end
	end)
