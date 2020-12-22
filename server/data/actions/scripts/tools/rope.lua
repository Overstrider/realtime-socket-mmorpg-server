function onUse(cid, item, frompos, item2, topos)
	if(topos.x == 0 and topos.y == 0 and topos.z == 0) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		return true
	end

	if(topos.x == CONTAINER_POSITION) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		return true
	end

	local newPos = {x = topos.x, y = topos.y, z = topos.z, stackpos = 0}
	local groundItem = getThingfromPos(newPos)
	if (isInArray(ROPE_SPOT, groundItem.itemid) ) then
		newPos.y = newPos.y + 1
		newPos.z = newPos.z - 1
		doTeleportThing(cid, newPos)
	elseif (isInArray(OPENED_HOLE, item2.itemid) or isInArray(OPENED_TRAP, item2.itemid) or isInArray(DOWN_LADDER, item2.itemid) ) then
		newPos.y = newPos.y + 1
		local downPos = {x = topos.x, y = topos.y, z = topos.z + 1, stackpos = 255}
		local downItem
        	if getBooleanFromString(getConfigValue("can_rope_creatures"), true) then
			downItem = getThingFromPos(downPos)
		else
			local topCreature = getTopCreature(downPos)
			if topCreature.uid ~= 0 and isPlayer(getCreatureMaster(topCreature.uid)) then --is summon of a player or a player itself
				downItem = topCreature
			else
				local ammountItems = getTileThingByPos({x = downPos.x , y = downPos.y, z = downPos.z, stackpos = -1})
				for aux = 1, ammountItems - 1 do
					local it = getTileThingByPos({x = downPos.x , y = downPos.y, z = downPos.z, stackpos = aux })
					if isValidUID(it.uid) and not isCreature(it.uid) and hasProperty(it.uid, CONST_PROP_MOVEABLE) then
						downItem = it
						break
					end
				end
			end
		end
		if downItem ~= nil and (downItem.itemid > 0) then
			doTeleportThing(downItem.uid, newPos)
		else
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		end
	else
		return false
	end
	return true
end