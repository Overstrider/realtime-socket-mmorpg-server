local FISH_WATER = {490}
local NOFISH_WATER = {493, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4820, 4821, 4822, 4823, 4824, 4825}
local ITEM_WORM = 3976
local ITEM_FISH = 2667
local ITEM_FISHING_ROD = 2580

function onUse(cid, item, frompos, item2, topos)

	if (isInArray(FISH_WATER, item2.itemid) == TRUE) then
		fishingskill = getPlayerSkill(cid,6)
		formula = fishingskill /200+0.85* math.random()
		if formula > 0.70 then
			doSendMagicEffect(topos,1)
			doPlayerAddSkillTry(cid,6,2)
			doPlayerAddItem(cid,2667,1)
		else
			doSendMagicEffect(topos,1)
			doPlayerAddSkillTry(cid,6,1)
		end
	elseif (isInArray(NO_FISH_WATER, item2.itemid) == TRUE) then
		doSendMagicEffect(topos,1)
        elseif (isInArray(REST_WATER, item2.itemid) == TRUE) then
                doTransformItem(item2.uid,490)
		doSendMagicEffect(topos,1)
	end
	return 1
end

