function onThink(interval)
local players = {}
table.insert(players, cid)
for _, cid in pairs(getPlayersOnlineList()) do
if getPlayerUnjustKills(cid).day > 0 then
table.insert(players, cid)
db.executeQuery("UPDATE `player_killers` SET `unjustified` = '0' WHERE `player_id` = '" .. getPlayerGUID(cid) .. "' and `time` <= '"..(os.time()).."';")
if getPlayerUnjustKills(cid).day < 3 and getPlayerSkullType(cid) == 4 then
table.insert(players, cid)
setPlayerSkullType(cid, SKULL_NONE)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Month: " .. getPlayerUnjustKills(cid).day .. ".")
end
end
end
return true
end 
		