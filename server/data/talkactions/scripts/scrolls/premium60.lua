function onSay(cid, words, param)
local points = 25
	if getPlayerVipPoints(cid) >= points then
	doPlayerRemoveVipPoints(cid, points)
	doPlayerAddItem(cid, 5117, 1)
	changePpts(cid)
	doPlayerSendTextMessage(cid, 22, 'Congratulations! You have received Premium Scroll 60 Days from the NptOld Online. Please logout so your character can save.')
	else
	doPlayerSendCancel(cid, "You do not have enough points!")
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
	end
return false
end