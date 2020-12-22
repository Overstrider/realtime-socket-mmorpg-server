function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1223 or item.itemid == 1225 then
	   if getPlayerStorageValue(cid, 99697) == 1 then
		doTransformItem(item.uid,item.itemid+1)
		local dir = getDirectionTo(getPlayerPosition(cid), fromPosition)
		doMoveCreature(cid, dir)
		end
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return true
end