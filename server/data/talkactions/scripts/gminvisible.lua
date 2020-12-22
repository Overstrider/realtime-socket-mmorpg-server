function onSay(cid, words, param)
	if (isPlayer(cid) and getPlayerFlagValue(cid, PLAYERFLAG_CANNOTBESEEN) == false) then
		doPlayerToogleGmInvisible(cid)
	end
	local pos = getPlayerPos(cid)
	if (isGmInvisible(cid) ) then
		doSendMagicEffect(pos, CONST_ME_POFF)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You are now invisible.")
		db.executeQuery("UPDATE players SET invisible = 1 WHERE name = " .. db.escapeString(getPlayerName(cid)) .. ";")
	else
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You are now visible.")
		db.executeQuery("UPDATE players SET invisible = 0 WHERE name = " .. db.escapeString(getPlayerName(cid)) .. ";")
	end
	return false
end
