dofile(getDataDir() .. 'npc/scripts/lib/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'smith'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this time I'm only selling ice rapiers and serpent swords. But I would buy scimitars, giant swords, serpent swords, poison daggers, knight axes, dragon hammers and skull staffs from you."})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling only ancient shields. But I buy tower shields, black shields, ancient shields and vampire shields."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am buying and selling dark armors. But I would also buy a knight armor from you."})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am buying and selling dark helmets. Furthermore I'm buying warrior helmets, strange helmets and mystic turbans."})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this time I'm only buying knight legs."})

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is none of your business."})
keywordHandler:addKeyword({'alesar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That is my name. So what!"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What does it look like, fool? I'm a guard! But I won't sell you anything until Malor orders me otherwise."})
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I won't sell you anything, human. Malor doesn't want me to trade with strangers."})
keywordHandler:addKeyword({'permission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I won't sell you anything, human. Malor doesn't want me to trade with strangers."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't you dare mention Daraman in my presence, human. I am through with his insidious lies and through with your accursed race!"})
keywordHandler:addKeyword({'djinn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day we will teach your race a lesson it will never forget."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We need a strong king to unite us in our struggle against the humans."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day we djinn will rid this world of evil."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care about human cities. If I had my way, they would all be burnt to down today."})
keywordHandler:addKeyword({'pharaoh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The pharaoh in Ankrahmun is a dangerous fool. Just your typical human, in other words."})
keywordHandler:addKeyword({'palace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "So?"})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What are you talking about? More human pseudo-philosophical flapdoodle?"})
keywordHandler:addKeyword({'rah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What are you talking about? More human pseudo-philosophical flapdoodle?"})
keywordHandler:addKeyword({'uthun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What are you talking about? More human pseudo-philosophical flapdoodle?"})
keywordHandler:addKeyword({'akh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What are you talking about? More human pseudo-philosophical flapdoodle?"})
keywordHandler:addKeyword({'scarab'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I like them. They are peaceful, but if they are provoked they fight ferociously. And they are know to eat humans!"})
keywordHandler:addKeyword({"kha'zeel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "These mountains are our refuge from those pesky humans. Too bad there are always some who come up here anyway. You, for example."})
keywordHandler:addKeyword({"kha'labal"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The desert Kha'labal was once a beautiful land, but it was devastated in the course of the war. Damn humans! This is all your fault!"})
keywordHandler:addKeyword({'melchior'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I remember him. He was a greedy, double-dealing hyena. As far as I know his bleached bones are now lying somewhere in the Kha'labal."})
keywordHandler:addKeyword({'djema'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Djema? Well - I suppose she is the only human I still like. But she has been brought up by djinns. Who knows - perhaps humans can learn."})
keywordHandler:addKeyword({"baa'leal"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Baa'leal is Malor's lieutenant. Unflinchingly loyal, but not quite as clever as he thinks he is."})
keywordHandler:addKeyword({"bo'ques"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I miss Bo'ques' cooking, but not his pompous airs and graces."})
keywordHandler:addKeyword({"fa'hradin"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fa'hradin, that old cynic is way too smart to believe in Daraman's lies. He should reconsider his loyalties."})

function greetCallback(cid)
	if getPlayerStorageValue(cid,1020) == 12 then -- Can buy/sell? Yes (change storage in your server)
	
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'serpent sword'}, 2409, 900)
shopModule:addSellableItem({'dragon hammer'}, 2434, 2000)
shopModule:addSellableItem({'giant sword'}, 2393, 17000)
shopModule:addSellableItem({'poison dagger'}, 2411, 50)
shopModule:addSellableItem({'scimitar'}, 2419, 150)
shopModule:addSellableItem({'skull staff'}, 2436, 6000)
shopModule:addSellableItem({'knight axe'}, 2430, 2000)
shopModule:addSellableItem({'tower shield'}, 2528, 8000)
shopModule:addSellableItem({'black shield'}, 2529, 800)
shopModule:addSellableItem({'ancient shield'}, 2532, 900)
shopModule:addSellableItem({'vampire shield'}, 2534, 15000)
shopModule:addSellableItem({'warrior helmet'}, 2475, 5000)
shopModule:addSellableItem({'knight armor'}, 2476, 5000)
shopModule:addSellableItem({'knight legs'}, 2477, 5000)
shopModule:addSellableItem({'strange helmet'}, 2479, 500)
shopModule:addSellableItem({'dark armor'}, 2489, 400)
shopModule:addSellableItem({'dark helmet'}, 2490, 250)
shopModule:addSellableItem({'mystic turban'}, 2663, 150)

shopModule:addBuyableItem({'ice rapier'}, 2396, 5000)
shopModule:addBuyableItem({'serpent sword'}, 2409, 6000)
shopModule:addBuyableItem({'ancient shield'}, 2532, 5000)
shopModule:addBuyableItem({'dark armor'}, 2489, 1500)
shopModule:addBuyableItem({'dark helmet'}, 2490, 1000)
		return true
	else
		return true
	end
end 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
	
if(msgcontains(msg, "mission")) then	
		if (getPlayerStorageValue(cid, 1020) == 5) then
			npcHandlerfocus = 1
			npcHandler:say("So Baa'leal thinks you are up to do a mission for us? ...", cid)
			addEvent(message1, 3000, pos)
		elseif (getPlayerStorageValue(cid, 1020) == 7) then
			npcHandlerfocus = 2
			npcHandler:say("Did you find the tear of Daraman?", cid)
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandlerfocus == 1) then
			npcHandler:say("All right then, human. Have you ever heard of the 'Tears of Daraman'? ...",cid)
			npcHandlerfocus = 0
			setPlayerStorageValue(cid, 1020, 6)
			addEvent(message3, 5000, pos)
		elseif(npcHandlerfocus == 2) then
			npcHandler:say("So you have made it? You have really managed to steal a Tear of Daraman? ... Alesar: Amazing how you humans are just impossible to get rid of. Incidentally, you have this character trait in common with many insects and with other vermin. ...",cid)
			npcHandlerfocus = 0
			setPlayerStorageValue(cid, 1020, 8)
			doPlayerRemoveItem(cid,2346,1)
			addEvent(message11, 5000, pos)
		end
	end

	return true
end	

function message1(cid, type, msg)
npcHandler:say("I think he is getting old, entrusting human scum such as you are with an important mission like that. ...",cid)
addEvent(message2, 5000, pos)
end
function message2(cid, type, msg)
npcHandler:say("Personally, I don't understand why you haven't been slaughtered right at the gates. ... Alesar: Anyway. Are you prepared to embark on a dangerous mission for us?", cid)
end

function message3(cid, type, msg)
npcHandler:say("Maybe we have some use for someone like you. Would you be interested in working for us. Helping to fight the Marid?", cid)
addEvent(message4, 5000, pos)
end
function message4(cid, type, msg)
npcHandler:say("They are precious gemstones made of some unknown blue mineral and possess enormous magical power. ...", cid)
addEvent(message5, 5000, pos)
end
function message5(cid, type, msg)
npcHandler:say("If you want to learn more about these gemstones don't forget to visit our library. ...", cid)
addEvent(message6, 5000, pos)
end
function message6(cid, type, msg)
npcHandler:say("Anyway, one of them is enough to create thousands of our mighty djinn blades. ...", cid)
addEvent(message7, 5000, pos)
end
function message7(cid, type, msg)
npcHandler:say("Unfortunately my last gemstone broke and therefore I'm not able to create new blades anymore. ...", cid)
addEvent(message8, 5000, pos)
end
function message8(cid, type, msg)
npcHandler:say("To my knowledge there is only one place where you can find these gemstones - I know for a fact that the Marid have at least one of them. ...", cid)
addEvent(message9, 5000, pos)
end
function message9(cid, type, msg)
npcHandler:say("Well... to cut a long story short, your mission is to sneak into Ashta'daramai and to steal it. ...", cid)
addEvent(message10, 5000, pos)
end
function message10(cid, type, msg)
npcHandler:say("Needless to say, the Marid won't be too eager to part with it. Try not to get killed until you have delivered the stone to me.", cid)
end

function message11(cid, type, msg)
npcHandler:say("Nevermind. I hate to say it, but it you have done us a favour, human. That gemstone will serve us well. ...", cid)
addEvent(message12, 5000, pos)
end
function message12(cid, type, msg)
npcHandler:say("Baa'leal, wants you to talk to Malor concerning some new mission. ...", cid)
addEvent(message13, 5000, pos)
end
function message13(cid, type, msg)
npcHandler:say("Looks like you have managed to extended your life expectancy - for just a bit longer.", cid)
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())