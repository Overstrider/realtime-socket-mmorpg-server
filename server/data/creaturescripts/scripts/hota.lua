local tps = {
    ["Morguthis"] = {pos = {x = 33174, y = 32694, z = 14, stackpos = 0}, toPos = {x = 33182, y = 32717, z = 14, stackpos = 1}, time = 60},
	["Vashresamun"] = {pos = {x = 33116, y = 32656, z = 15, stackpos = 0}, toPos = {x = 33145, y = 32668, z = 15, stackpos = 1}, time = 60},
	["Dipthrah"] = {pos = {x = 33103, y = 32590, z = 15, stackpos = 0}, toPos = {x = 33126, y = 32594, z = 15, stackpos = 1}, time = 60},
	["Thalas"] = {pos = {x = 33396, y = 32852, z = 14, stackpos = 0}, toPos = {x = 33349, y = 32830, z = 14, stackpos = 1}, time = 60},
	["Rahemos"] = {pos = {x = 33073, y = 32781, z = 14, stackpos = 0}, toPos = {x = 33051, y = 32779, z = 14, stackpos = 1}, time = 60},
	["Omruc"] = {pos = {x = 33195, y = 32002, z = 14, stackpos = 0}, toPos = {x = 33178, y = 32018, z = 14, stackpos = 1}, time = 60},
	["Mahrdis"] = {pos = {x = 33191, y = 32959, z = 15, stackpos = 0}, toPos = {x = 33174, y = 32937, z = 15, stackpos = 1}, time = 60},
}

local function removeTp(tp)
	local t = getTileItemById(tp.pos, 1387).uid
	return t > 0 and doRemoveItem(t) and doSendMagicEffect(tp.pos, CONST_ME_POFF)
end

function onDie(cid)
    local tp = tps[getCreatureName(cid)]
	if tp then
    doCreateTeleport(1387, tp.toPos, tp.pos)
    doCreatureSay(cid, "The portal will be closed in "..tp.time.." seconds, please run.", TALKTYPE_ORANGE_1)
    addEvent(removeTp, tp.time*1000, tp)
    end    
	return true
end