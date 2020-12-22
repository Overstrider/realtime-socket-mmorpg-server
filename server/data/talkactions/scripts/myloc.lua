function onSay(cid, words, param)

local myx = getPlayerPosition(cid).x
local myy = getPlayerPosition(cid).y
local myz = getPlayerPosition(cid).z

if isPlayer(cid) then
doPlayerSendTextMessage(cid,25,myx.."-"..myy.." - "..myz)
return true
end


end
