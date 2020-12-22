function onSay(cid, words, param)
if getPlayerStorageValue(cid, 274545) < 1 then
setPlayerStorageValue(cid, 274545, 1)
end
return false
end