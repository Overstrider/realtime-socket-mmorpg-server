function checkStageChange(cid)
	local playerLevel = getPlayerLevel(cid)
	
	if (playerLevel > stages[#stages].maxLevel) then
		if getPlayerPremiumDays(cid) >= 1 then
            setExperienceRate(cid, stages[#stages].multiplier*1.2)
		else
			setExperienceRate(cid, stages[#stages].multiplier.rate)
		end
		return true
	end
	
	for i = 1, #stages do
		if (playerLevel >= stages[i].minLevel and playerLevel <= stages[i].maxLevel) then
			
		if getPlayerPremiumDays(cid) >= 1 then
            setExperienceRate(cid, stages[i].multiplier*1.2)
		else
			setExperienceRate(cid, stages[i].multiplier)
		end
			return true
		end
	end
	
	return false
end