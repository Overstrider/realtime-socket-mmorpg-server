EnterGame = { }

-- private variables
local loadBox
local enterGame
local motdWindow
local clientBox
local protocolLogin
local motdEnabled = true

-- private functions
local function onError(protocol, message, errorCode)
  if loadBox then
    loadBox:destroy()
    loadBox = nil
  end

  if not errorCode then
    EnterGame.clearAccountFields()
  end

  local errorBox = displayErrorBox(tr('Login Error'), message)
  connect(errorBox, { onOk = EnterGame.show })
end

local function onMotd(protocol, motd)
  G.motdNumber = tonumber(motd:sub(0, motd:find("\n")))
  G.motdMessage = motd:sub(motd:find("\n") + 1, #motd)
  if motdEnabled then
  end
end

local function onCharacterList(protocol, characters, account, otui)
  -- Try add server to the server list
  ServerList.add(G.host, G.port, g_game.getClientVersion())

  if enterGame:getChildById('rememberPasswordBox'):isChecked() then
    local account = g_crypt.encrypt(G.account)
    local password = g_crypt.encrypt(G.password)

    g_settings.set('account', account)
    g_settings.set('password', password)

    ServerList.setServerAccount(G.host, account)
    ServerList.setServerPassword(G.host, password)

    g_settings.set('autologin', enterGame:getChildById('autoLoginBox'):isChecked())
  else
    -- reset server list account/password
    ServerList.setServerAccount(G.host, '')
    ServerList.setServerPassword(G.host, '')

    EnterGame.clearAccountFields()
  end

  loadBox:destroy()
  loadBox = nil

  CharacterList.create(characters, account, otui)
  CharacterList.show()

  if motdEnabled then
    local lastMotdNumber = g_settings.getNumber("motd")
    if G.motdNumber and G.motdNumber ~= lastMotdNumber then
      g_settings.set("motd", G.motdNumber)
      motdWindow = displayInfoBox(tr('Message of the day'), G.motdMessage)
      connect(motdWindow, { onOk = function() CharacterList.show() motdWindow = nil end })
      CharacterList.hide()
    end
  end
end

 --[[
--function onRestartClient()
--local updateFile = g_resources.getWorkDir() .. 'config/updates/Update.vbs'
 --  if g_platform.fileExists(updateFile) then
   --   g_platform.spawnProcess(updateFile, {})
   --end
--end
--function onExitFunc()
 --  onRestartClient()
--end

---auto Update
local exeName, updateName = 'Realesta.exe', 'Update.vbs'
local webSite = 'http://127.0.0.1/'-- we need a easy solution, su

function onRestartClient()
local updateFile = g_resources.getWorkDir() .. 'config/updates/' .. updateName
   if g_platform.fileExists(updateFile) then
      g_platform.spawnProcess(updateFile, {})
   end
end
function onExitFunc()
   onRestartClient()
end

function updateFunc()
   local exePath = g_resources.getWorkDir() .. 'config/updates/' .. exeName
   if g_platform.downloadFile(webSite .. exeName .. '?v=' .. CLIENT_VERSION+1, exePath) then
	  downloadedExe = true
   end
   local updatePath = g_resources.getWorkDir() .. 'config/updates/' .. updateName
   if g_platform.downloadFile(webSite .. updateName .. '?v=' .. CLIENT_VERSION+1, updatePath) then
	  downloadedUpdate = true
   end

   local succes = function()
     restartBox:destroy()
     restartBox=nil
	 onRestartClient()
   end
   local failed = function()
     restartBox:destroy()
     restartBox=nil
   end
   
   if downloadedExe and downloadedUpdate then
      restartBox = displayGeneralBox(tr('Update Manager'), tr('(Updating complete) Please restart your client.'), {
     { text=tr('Restart!'), callback=succes}, anchor=AnchorHorizontalCenter}, succes)
   else
      restartBox = displayGeneralBox(tr('Update Manager'), tr('Failed to update client. Try to download client manually from the website.'), {
     { text=tr('Ok'), callback=failed}, anchor=AnchorHorizontalCenter}, failed)
   end
end
]]--

function EnterGame.onUpdateNeeded()
g_resources.makeDir("updates")

  if loadBox then
    loadBox:destroy()
    loadBox = nil
  end
	
  local yesCallback = function()
    updateBox:destroy()
    updateBox=nil
    g_platform.openUrl("http://demonia.org/index.php?subtopic=download")
	g_app.exit()
  end
  
  updateBox = displayGeneralBox(tr('Update available'), tr('A new version of the Demonia client is available. Please click the button to download.'), {
  { text=tr('Download'), callback=yesCallback}, anchor=AnchorHorizontalCenter}, yesCallback)
end

-- public functions
function EnterGame.init()
  --connect(g_app, { onExit = onExitFunc })
  enterGame = g_ui.displayUI('entergame')

  g_keyboard.bindKeyDown('Ctrl+G', EnterGame.openWindow)

  local account = g_settings.get('account')
  local password = g_settings.get('password')
  local host = g_settings.get('host')
  local port = g_settings.get('port')
  local autologin = g_settings.getBoolean('autologin')
  local clientVersion = g_settings.getInteger('client-version')
  if clientVersion == 0 then clientVersion = 772 end

  if port == nil or port == 0 then port = 7171 end

  EnterGame.setAccountName(account)
  EnterGame.setPassword(password)

  enterGame:getChildById('serverHostTextEdit'):setText(host)
  enterGame:getChildById('serverPortTextEdit'):setText(port)
  enterGame:getChildById('autoLoginBox'):setChecked(autologin)

  clientBox = enterGame:getChildById('clientComboBox')
  for _, proto in pairs(g_game.getSupportedClients()) do
    clientBox:addOption(proto)
  end
  clientBox:setCurrentOption(clientVersion)

  enterGame:hide()

  if g_app.isRunning() and not g_game.isOnline() then
    enterGame:show()
  end
end

function EnterGame.firstShow()
  --EnterGame.show()

  local account = g_crypt.decrypt(g_settings.get('account'))
  local password = g_crypt.decrypt(g_settings.get('password'))
  local host = g_settings.get('host')
  local autologin = g_settings.getBoolean('autologin')
  if #host > 0 and #password > 0 and #account > 0 and autologin then
    addEvent(function()
      if not g_settings.getBoolean('autologin') then return end
      EnterGame.doLogin()
    end)
  end
end

function EnterGame.terminate()
  disconnect(g_app, { onExit = onExitFunc })
  
  g_keyboard.unbindKeyDown('Ctrl+G')
  enterGame:destroy()
  enterGame = nil
  clientBox = nil
  if motdWindow then
    motdWindow:destroy()
    motdWindow = nil
  end
  if loadBox then
    loadBox:destroy()
    loadBox = nil
  end
  if protocolLogin then
    protocolLogin:cancelLogin()
    protocolLogin = nil
  end
  EnterGame = nil
end

function EnterGame.show()
  if loadBox then return end
  enterGame:show()
  enterGame:raise()
  enterGame:focus()
end

function EnterGame.hide()
  enterGame:hide()
end

function EnterGame.openWindow()
  if g_game.isOnline() then
    CharacterList.show()
  elseif not g_game.isLogging() and not CharacterList.isVisible() then
    EnterGame.show()
  end
end

function EnterGame.setAccountName(account)
  local account = g_crypt.decrypt(account)
  enterGame:getChildById('accountNameTextEdit'):setText(account)
  enterGame:getChildById('accountNameTextEdit'):setCursorPos(-1)
  enterGame:getChildById('rememberPasswordBox'):setChecked(#account > 0)
end

function EnterGame.setPassword(password)
  local password = g_crypt.decrypt(password)
  enterGame:getChildById('accountPasswordTextEdit'):setText(password)
end

function EnterGame.clearAccountFields()
  enterGame:getChildById('accountNameTextEdit'):clearText()
  enterGame:getChildById('accountPasswordTextEdit'):clearText()
  enterGame:getChildById('accountNameTextEdit'):focus()
  g_settings.remove('account')
  g_settings.remove('password')
end

function EnterGame.doLogin()
  G.account = enterGame:getChildById('accountNameTextEdit'):getText()
  G.password = enterGame:getChildById('accountPasswordTextEdit'):getText()
  G.host = enterGame:getChildById('serverHostTextEdit'):getText()
  G.port = tonumber(enterGame:getChildById('serverPortTextEdit'):getText())
  local clientVersion = tonumber(clientBox:getText())
  EnterGame.hide()

  if g_game.isOnline() then
    local errorBox = displayErrorBox(tr('Login Error'), tr('You are already logged in.'))
    connect(errorBox, { onOk = EnterGame.show })
    return
  end

  g_settings.set('host', G.host)
  g_settings.set('port', G.port)
  g_settings.set('client-version', clientVersion)

  protocolLogin = ProtocolLogin.create()
  protocolLogin.onLoginError = onError
  protocolLogin.onMotd = onMotd
  protocolLogin.onCharacterList = onCharacterList
  protocolLogin.onUpdateNeeded = onUpdateNeeded

  loadBox = displayCancelBox(tr('Please wait'), tr('Your character list is being loaded. Please wait.'))
  connect(loadBox, { onCancel = function(msgbox)
                                  loadBox = nil
                                  protocolLogin:cancelLogin()
                                  EnterGame.show()
                                end })

  g_game.setClientVersion(clientVersion)
  g_game.setProtocolVersion(g_game.getClientProtocolVersion(clientVersion))
  g_game.chooseRsa(G.host)

  if modules.game_things.isLoaded() then
    protocolLogin:login(G.host, G.port, G.account, G.password)
  else
    loadBox:destroy()
    loadBox = nil
    EnterGame.show()
  end
end

function EnterGame.displayMotd()
  if not motdWindow then
    motdWindow = displayInfoBox(tr('Message of the day'), G.motdMessage)
    motdWindow.onOk = function() motdWindow = nil end
  end
end

function EnterGame.setDefaultServer(host, port, protocol)
  local hostTextEdit = enterGame:getChildById('serverHostTextEdit')
  local portTextEdit = enterGame:getChildById('serverPortTextEdit')
  local clientLabel = enterGame:getChildById('clientLabel')
  local accountTextEdit = enterGame:getChildById('accountNameTextEdit')
  local passwordTextEdit = enterGame:getChildById('accountPasswordTextEdit')

  if hostTextEdit:getText() ~= host then
    hostTextEdit:setText(host)
    portTextEdit:setText(port)
    clientBox:setCurrentOption(protocol)
    accountTextEdit:setText('')
    passwordTextEdit:setText('')
  end
end

function EnterGame.setUniqueServer(host, port, protocol, windowWidth, windowHeight)
  local hostTextEdit = enterGame:getChildById('serverHostTextEdit')
  hostTextEdit:setText(host)
  hostTextEdit:setVisible(false)
  hostTextEdit:setHeight(0)
  local portTextEdit = enterGame:getChildById('serverPortTextEdit')
  portTextEdit:setText(port)
  portTextEdit:setVisible(false)
  portTextEdit:setHeight(0)

  clientBox:setCurrentOption(protocol)
  clientBox:setVisible(false)
  clientBox:setHeight(0)

  local portLabel = enterGame:getChildById('portLabel')
  portLabel:setVisible(false)
  portLabel:setHeight(0)
  local clientLabel = enterGame:getChildById('clientLabel')
  clientLabel:setVisible(false)
  clientLabel:setHeight(0)

  local serverListButton = enterGame:getChildById('serverListButton')
  serverListButton:setVisible(false)
  serverListButton:setHeight(0)
  serverListButton:setWidth(0)

  local rememberPasswordBox = enterGame:getChildById('rememberPasswordBox')

  if not windowWidth then windowWidth = 240 end
  enterGame:setWidth(windowWidth)
  if not windowHeight then windowHeight = 200 end
  enterGame:setHeight(windowHeight)
end

function EnterGame.setServerInfo(message)
  local label = enterGame:getChildById('serverInfoLabel')
  label:setText(message)
end

function EnterGame.disableMotd()
  motdEnabled = false
end
