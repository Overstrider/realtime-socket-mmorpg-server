function onSay(cid, words, param)
local points = 15
local outfit = getCreatureOutfit(cid)
local lookType = outfit.lookType
if getPlayerStorageValue(cid, 84274493) < 1 then
	if getPlayerVipPoints(cid) >= points then
	setPlayerStorageValue(cid, 84274493, 1)
	doPlayerRemoveVipPoints(cid, points)
	changePpts(cid)
	doPlayerSendTextMessage(cid, 22, 'Congratulations! You have received Rogue Outfit from the NptOld Online. Please logout so your character can save.')
	else
	doPlayerSendCancel(cid, "You do not have enough points!")
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
	end
elseif getPlayerStorageValue(cid, 84274493) >= 1 then
	if getPlayerSex(cid) == 0 then
	doCreatureChangeOutfit(cid, {lookType = 250, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet})
	else
	doCreatureChangeOutfit(cid, {lookType = 249, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet})
	end
end
return false
end