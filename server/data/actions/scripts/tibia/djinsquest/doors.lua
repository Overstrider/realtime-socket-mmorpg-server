function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 1020) >= 2 and itemEx.actionid == 915 then
		doTransformItem(item.uid,item.itemid+1)
		local dir = getDirectionTo(getPlayerPosition(cid), fromPosition)
		doMoveCreature(cid, dir)
	elseif getPlayerStorageValue(cid, 1020) >= 11 and itemEx.actionid == 913 then
		doTransformItem(item.uid,item.itemid+1)
		local dir = getDirectionTo(getPlayerPosition(cid), fromPosition)
		doMoveCreature(cid, dir)
	elseif getPlayerStorageValue(cid, 1030) >= 2 and itemEx.actionid == 914 then
		doTransformItem(item.uid,item.itemid+1)
		local dir = getDirectionTo(getPlayerPosition(cid), fromPosition)
		doMoveCreature(cid, dir)
	elseif getPlayerStorageValue(cid, 1030) >= 2 and itemEx.actionid == 916 then
		doTransformItem(item.uid,item.itemid+1)
		local dir = getDirectionTo(getPlayerPosition(cid), fromPosition)
		doMoveCreature(cid, dir)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The door is sealed against unwanted intruders.")
	end

	return true
end