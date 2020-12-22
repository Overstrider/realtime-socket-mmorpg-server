function onLook(cid, thing, itemid)
   if (getPlayerAccess(cid) >= 2) then
      doPlayerSendTextMessage(cid,20,"Position: {x="..getThingPos(thing.uid).x..", y="..getThingPos(thing.uid).y..", z="..getThingPos(thing.uid).z..", stackpos="..getThingPos(thing.uid).stackpos.."}")
      if (isPlayer(thing.uid) == TRUE) then
          doPlayerSendTextMessage(cid, 20, "Player IP: "..convertIntToIP(getIPByPlayerName(getPlayerName(thing.uid))).."")
      else
         if isCreature(thing.uid) == FALSE then
	    doPlayerSendTextMessage(cid,20,"ItemID: "..itemid.."")
            if (thing.uid < 70000) then
	        doPlayerSendTextMessage(cid,20,"UniqueID: "..thing.uid.."")
            end
            if (thing.actionid > 0) then
	        doPlayerSendTextMessage(cid,20,"ActionID: "..thing.actionid.."")
            end
            if (thing.type > 0) then
	        doPlayerSendTextMessage(cid,20,"Item Type: "..thing.type.."")
            end
         end
      end
   end
   return TRUE
end