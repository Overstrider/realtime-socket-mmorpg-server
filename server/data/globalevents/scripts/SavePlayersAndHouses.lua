local function serverSave()
    doSaveServer(true)
end

local function secondSaveWarning()
    addEvent(serverSave, 60000)
end

--function onThink(interval) <-- en caso de querer salvar por intervalos mas cortos
function onThink(interval)
    addEvent(secondSaveWarning, 60000)
    return true
end