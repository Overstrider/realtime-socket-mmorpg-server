function onLogin(cid)
	local playerVoc = getPlayerVocation(cid) -- Deixe isso como esta.

local Mages = {
	ML = 40, -- Level inicial/minimo dos mages, sorc e druid.
	Shield = 30 -- Shield inicial/minimo dos mages, sorc e druid.
	}
	
local Paladin = {
	Distance = 80, -- Distancia inicial/minima dos paladinos.
	Shield = 80, -- Shield inicial/minimo dos paladinos.
	ML = 15 -- MagicLevel inicial/minimo dos paladinos.
	}
	
local Kina = {
	Sword = 80, -- Sword Level inicial/minimo dos knights.
	Axe = 80, -- Axe Level inicial/minimo dos knights.
	Club = 80, -- Club Level inicial/minimo dos knights.
	Shield = 80, -- Shield Level inicial/minimo dos knights.
	ML = 5 -- MagicLevel inicial/minimo dos knights.
	}
	
if playerVoc == 1 then
	if getPlayerMagLevel(cid) < Mages.ML then
		doPlayerAddMagLevel(cid, Mages.ML - getPlayerMagLevel(cid))
	end
	if getPlayerSkill(cid, 5) < Mages.Shield then
		doPlayerAddSkillTry(cid, 5, Mages.Shield - getPlayerSkill(cid, 5))
	end

elseif playerVoc == 2 then
	if getPlayerMagLevel(cid) < Mages.ML then
		doPlayerAddMagLevel(cid, Mages.ML - getPlayerMagLevel(cid))
	end
	if getPlayerSkill(cid, 5) < Mages.Shield then
		doPlayerAddSkillTry(cid, 5, Mages.Shield - getPlayerSkill(cid, 5))
	end

elseif playerVoc == 3 then
	if getPlayerSkill(cid, 4) < Paladin.Distance then
		doPlayerAddSkillTry(cid, 4, Paladin.Distance - getPlayerSkill(cid, 4))
	end
	if getPlayerSkill(cid, 5) < Paladin.Shield then
		doPlayerAddSkillTry(cid, 5, Paladin.Shield - getPlayerSkill(cid, 5))
	end
	if getPlayerMagLevel(cid) < Paladin.ML then
		doPlayerAddMagLevel(cid, Paladin.ML - getPlayerMagLevel(cid))
	end

elseif playerVoc == 4 then
	if getPlayerSkill(cid, 2) < Kina.Sword then
		doPlayerAddSkillTry(cid, 2, 80)
	end
	if getPlayerSkill(cid, 1) < Kina.Club then
		doPlayerAddSkillTry(cid, 1, Kina.Club - getPlayerSkill(cid, 1))
	end
	if getPlayerSkill(cid, 3) < Kina.Axe then
		doPlayerAddSkillTry(cid, 3, Kina.Axe - getPlayerSkill(cid, 3))
	end
	if getPlayerSkill(cid, 5) < Kina.Shield then
		doPlayerAddSkillTry(cid, 5, Kina.Shield - getPlayerSkill(cid, 5))
	end
	if getPlayerMagLevel(cid) < Kina.ML then
		doPlayerAddMagLevel(cid, Kina.ML - getPlayerMagLevel(cid))
	end
end

return TRUE
end