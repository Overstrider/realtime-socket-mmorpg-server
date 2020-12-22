function onAdvance(cid, skill, oldLevel, newLevel)
if skill == 8  then
	if(newLevel) then
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
		doPlayerAddMana(cid, getPlayerMaxMana(cid) - getPlayerMana(cid))
	end
end	
	return true
end