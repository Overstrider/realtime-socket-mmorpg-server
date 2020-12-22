function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end

	local lookType = tonumber(param)
	if lookType >= 75 and lookType < 700 then
		local playerOutfit = getCreatureOutfit(cid)
		playerOutfit.lookType = lookType
		doCreatureChangeOutfit(cid, playerOutfit)
	else
		player:sendCancelMessage("A look type with that id does not exist.")
	end
	return false
end