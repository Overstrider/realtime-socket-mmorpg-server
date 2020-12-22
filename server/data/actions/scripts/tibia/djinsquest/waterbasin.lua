local wallPositions = {
	{x=33108, y=32530, z=3}
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerStorageValue(cid,1020) == 6 then
 	doPlayerSendTextMessage(cid,22,"You have chosen an tear of daraman.")
	for i = 1, #wallPositions do
	doCreateItem(2346,wallPositions[i])
	end
 	setPlayerStorageValue(cid,1020,7)
 else
 	doPlayerSendTextMessage(cid,22,"The chest is empty.")
 end
return true
end