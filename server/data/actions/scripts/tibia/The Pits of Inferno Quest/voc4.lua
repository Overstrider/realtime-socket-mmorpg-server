function onUse(cid, item, frompos, item2, topos)
gatepos = {x=32835, y=32333, z=11, stackpos=1}
getgate = getThingfromPos(gatepos)

if item.actionid == 60038 and item.itemid == 1945 then
doRemoveItem(getgate.uid,1)
doCreateItem(355,1,gatepos)
doTransformItem(item.uid,item.itemid+1)
elseif item.actionid == 60038 and item.itemid == 1946 then
doCreateItem(5062,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end