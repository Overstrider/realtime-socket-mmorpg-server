function init()
	connect(g_game, 'onTextMessage', serverComunication)
	connect(g_game, { onGameEnd = hide } )
end

function terminate()
	disconnect(g_game, { onGameEnd = hide })
	disconnect(g_game, 'onTextMessage', serverComunication)
end

function serverComunication(mode, text)
	if not g_game.isOnline() then
		return
	end
	if mode == MessageModes.Failure then
		if text:find("##system##PPTS") then
        g_game.talk("!exclusive")
        end
    end
end