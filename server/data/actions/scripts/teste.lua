
function onUse(cid, item, fromPosition, itemEx, toPosition)
		if getPlayerStorageValue(cid,2352) <= 10  then
		setPlayerStorageValue(cid,2352,getPlayerStorageValue(cid,2352)+1)
		doPlayerSendTextMessage(cid, 22, "Voce tem Storage Ttst ["..getPlayerStorageValue(cid, 2352).."/10].")
		else
		doPlayerSendTextMessage(cid, 22, "Voce tem Storage Ttst ["..getPlayerStorageValue(cid, 2352).."/10].")
		end	
	return true
end