function onUse(cid, item, frompos, item, topos)

	-- premium scroll 7
	if item.itemid == 5114 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You received 7 days of premium account. Please login again!")
		doPlayerAddPremiumDays(cid, 7)
		doSendMagicEffect(getPlayerPosition(cid), 12)
		doRemoveItem(item.uid,1)

	-- premium scroll 15
	elseif item.itemid == 5115 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You received 15 days of premium account. Please login again!")
		doPlayerAddPremiumDays(cid, 15)
		doSendMagicEffect(getPlayerPosition(cid), 12)
		doRemoveItem(item.uid,1)

	-- premium scroll 30
	elseif item.itemid == 5116 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You received 30 days of premium account. Please login again!")
		doPlayerAddPremiumDays(cid, 30)
		doSendMagicEffect(getPlayerPosition(cid), 12)
		doRemoveItem(item.uid,1)

	-- premium scroll 60
	elseif item.itemid == 5117 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You received 60 days of premium account. Please login again!")
		doPlayerAddPremiumDays(cid, 60)
		doSendMagicEffect(getPlayerPosition(cid), 12)
		doRemoveItem(item.uid,1)
	
	-- green djinn scroll
	elseif item.itemid == 5118 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You received full acess green djinn. Please login again!")
		setPlayerStorageValue(cid, 1020, 12)
		doSendMagicEffect(getPlayerPosition(cid), 13) 
		doRemoveItem(item.uid,1)
	
	-- blue djinn scroll
	elseif item.itemid == 5119 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You received full acess blue djinn. Please login again!")
		setPlayerStorageValue(cid, 1030, 11)
		doSendMagicEffect(getPlayerPosition(cid), 13) 
		doRemoveItem(item.uid,1)
		
	-- postman djinn scroll
	elseif item.itemid == 5120 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You received full acess postman quest. Please login again!")
		setPlayerStorageValue(cid, STORAGE_POSTMAN_DOOR, 5)
		doSendMagicEffect(getPlayerPosition(cid), 13) 
		doRemoveItem(item.uid,1)
		
	-- change sex scroll
	elseif item.itemid == 5121 then
		if( getPlayerSex(cid) == 0 )then  
		doPlayerSetSex(cid, 1) 
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have changed your gender") 
		doSendMagicEffect(getPlayerPosition(cid), 14)
		doRemoveItem(item.uid,1)
		elseif( getPlayerSex(cid) == 1 ) then  
		doPlayerSetSex(cid, 0) 
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have changed your gender") 
		doSendMagicEffect(getPlayerPosition(cid), 14)
		doRemoveItem(item.uid,1)
		end  
	end

	return true
end