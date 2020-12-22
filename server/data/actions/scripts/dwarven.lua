function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 290) == 1 then
		doTransformItem(item.uid,item.itemid+1)
		local dir = getDirectionTo(getPlayerPosition(cid), fromPosition)
		doMoveCreature(cid, dir)
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return true
end