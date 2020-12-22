local config = {
    fragTime = getConfigInfo('timeToDecreaseFrags')
}
function onSay(cid, words, param, channel)
    local fragstatus, fragsPvP, amount = getPlayerStorageValue(cid,3943), getPlayerStorageValue(cid,3944), getPlayerSkullEndTime(cid)
    local frags = math.floor((amount / config.fragTime) + 1)
    local remainingTime = math.floor(amount - (config.fragTime / 1000))
    local hours = math.floor(((remainingTime / 1000) / 60) / 60)
    local minutes = math.floor(((remainingTime / 1000) / 60) - (hours * 60))
	local seconds = math.floor(((remainingTime / 1000)) - (minutes*60))
    if(amount >= 0 and config.fragTime > 0) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, (fragstatus > 1 and fragsPvP > 1) and "[Frags: " .. fragstatus .. "] [Arena PVP: " .. fragsPvP .. "]You have " .. frags .. " unjustified frag" .. (frags > 2 and "s" or "") .. ". The amount of unjustified frags will decrease after: " .. hours .. "h and " .. minutes .. "m and " .. seconds .. "s." or fragsPvP > 1 and "[Arena PVP: " .. fragsPvP .. "] You have " .. frags .. " unjustified frag" .. (frags > 2 and "s" or "") .. ". The amount of unjustified frags will decrease after: " .. hours .. "h and " .. minutes .. "m and " .. seconds .. "s." or fragstatus > 1 and "[Frags: " .. fragstatus .. "] You have " .. frags .. " unjustified frag" .. (frags > 2 and "s" or "") .. ". The amount of unjustified frags will decrease after: " .. hours .. "h and " .. minutes .. "m and " .. seconds .. "s." or "You have " .. frags .. " unjustified frag" .. (frags > 2 and "s" or "") .. ". The amount of unjustified frags will decrease after: " .. hours .. "h and " .. minutes .. "m and " .. seconds .. "s.")
		else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You do not have any unjustified frag.")
    end
    return TRUE
end