function onUse(cid, item, frompos, item2, topos)
 
local mana = getPlayerMaxMana(cid)
local ppos = getCreaturePosition(cid)

doSendMagicEffect(ppos, CONST_ME_MAGIC_BLUE) 
doPlayerAddMana(cid, mana) 
doCreatureSay(cid,"Aaaah...")
 
end