function onUse(cid, item, fromPosition, itemEx, toPosition)
Removewall4 = {x=33094, y=32524, z=1, stackpos=1}
Removewall5 = {x=33048, y=32630, z=1, stackpos=1}
getwall4 = getThingfromPos(Removewall4)
getwall5 = getThingfromPos(Removewall5)

if item.itemid == 2344 and getPlayerStorageValue(cid, 1020) >= 9 then
	if getTileItemById(Removewall4, 2344).itemid == 2344 then
	doRemoveItem(getTileItemById(Removewall4, 2344).uid, 1)
	setPlayerStorageValue(cid, 1020, 11)
	doSendMagicEffect(toPosition, CONST_ME_POFF)
	else
	doPlayerSendCancel(cid, "Sorry not possible.")
	end

elseif item.itemid == 2344 and getPlayerStorageValue(cid, 1030) >= 8 then
	if getTileItemById(Removewall5, 2344).itemid == 2344 then
	doRemoveItem(getTileItemById(Removewall5, 2344).uid, 1)
	setPlayerStorageValue(cid, 1030, 10) 
	doSendMagicEffect(toPosition, CONST_ME_POFF)
	else
	doPlayerSendCancel(cid, "Sorry not possible.")
	end
end
  return true
end
  