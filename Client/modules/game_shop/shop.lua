local shopWindow
local shopButton
local shopTabBar
local addonsPanel
local itemsPanel
local premiumPanel
local mountsPanel
local acceptWindow
local pptsLabel = nil
ppts = nil
 
function init()
  shopWindow = g_ui.displayUI('shop')
  shopWindow:hide()
 
  shopTabBar = shopWindow:getChildById('shopTabBar')
  shopTabBar:setContentWidget(shopWindow:getChildById('shopTabContent'))
 
  addonsPanel = g_ui.loadUI('addons')
  shopTabBar:addTab(tr('Outfits'), addonsPanel, '/modules/game_shop/images/shoptabs/addons')
  
  mountsPanel = g_ui.loadUI('mounts')
  shopTabBar:addTab(tr('Decoration'), mountsPanel, '/modules/game_shop/images/shoptabs/mounts')
 
  premiumPanel = g_ui.loadUI('premium')
  shopTabBar:addTab(tr('Premium Scrolls'), premiumPanel, '/modules/game_shop/images/shoptabs/premium')
 
  itemsPanel = g_ui.loadUI('items')
  shopTabBar:addTab(tr('Quest Scrolls'), itemsPanel, '/modules/game_shop/images/shoptabs/items')
  
  shopButton = modules.client_topmenu.addLeftGameButton('shopButton', tr('Services'), '/modules/game_shop/images/shop', toggle)

end
 
function terminate()
  shopWindow:destroy()
  shopButton:destroy()
end
 
function toggle()
  if shopWindow:isVisible() then
    hide()
	shopButton:setOn(false)
  else
    show()
	shopButton:setOn(true)
  end
end
 
function show()
  shopWindow:show()
  shopWindow:raise()
  shopWindow:focus()
end
 
function hide()
  shopWindow:hide()
  shopButton:setOn(false)
  if acceptWindow then
    acceptWindow:destroy()
    acceptWindow = nil
  end
end
 
function addTab(name, panel, icon)
  shopTabBar:addTab(name, panel, icon)
end
 
function addButton(name, func, icon)
  shopTabBar:addButton(name, func, icon)
end

function onPptsChange(localPlayer, ppts)
  shopWindow:setText(string.format("Service Offer - Premium Points: %.3d", ppts))
end
 
-- Buy functions:
 
-- Addons Rainbow
function buyRainbow()
  if acceptWindow then
    return true
  end
 
  local acceptFunc = function()
    g_game.talk('!rainbow')
    acceptWindow:destroy()
    acceptWindow = nil
  end
  local useFunc = function()
    g_game.talk('!rainbow')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end
 
  acceptWindow = displayGeneralBox(tr("Accept transaction"), tr("Do you really want to buy or use these outfits?"),
  { { text=tr('Use'), callback=useFunc },
	{ text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, useFunc, acceptFunc, cancelFunc)
  return true
end
 
-- Addons Mighty
function buyMighty()
  if acceptWindow then
    return true
  end
 
  local acceptFunc = function()
    g_game.talk('!mighty')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 local useFunc = function()
    g_game.talk('!mighty')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end
 
  acceptWindow = displayGeneralBox(tr("Accept transaction"), tr("Do you really want to buy or use these outfits?"),
  { { text=tr('Use'), callback=useFunc },
	{ text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, useFunc, acceptFunc, cancelFunc)
  return true
end
 
-- Addons Shaman
function buyShaman()
  if acceptWindow then
    return true
  end
 
  local acceptFunc = function()
    g_game.talk('!shaman')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 local useFunc = function()
    g_game.talk('!shaman')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end
 
  acceptWindow = displayGeneralBox(tr("Accept transaction"), tr("Do you really want to buy or use these outfits?"),
  { { text=tr('Use'), callback=useFunc },
	{ text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, useFunc, acceptFunc, cancelFunc)
  return true
end

-- Addons Angel
function buyAngel()
  if acceptWindow then
    return true
  end
 
  local acceptFunc = function()
    g_game.talk('!angel')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 local useFunc = function()
    g_game.talk('!angel')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end
 
  acceptWindow = displayGeneralBox(tr("Accept transaction"), tr("Do you really want to buy or use these outfits?"),
  { { text=tr('Use'), callback=useFunc },
	{ text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, useFunc, acceptFunc, cancelFunc)
  return true
end

-- Premium Scroll 7 Days
function buypremium7()
  if acceptWindow then
    return true
  end
 
  local acceptFunc = function()
    g_game.talk('!premium7')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end
 
  acceptWindow = displayGeneralBox(tr("Accept transaction"), tr("Do you really want to buy this scroll?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

-- Premium Scroll 15 Days
function buypremium15()
  if acceptWindow then
    return true
  end
 
  local acceptFunc = function()
    g_game.talk('!premium15')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end
 
  acceptWindow = displayGeneralBox(tr("Accept transaction"), tr("Do you really want to buy this scroll?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

-- Premium Scroll 30 Days
function buypremium30()
  if acceptWindow then
    return true
  end
 
  local acceptFunc = function()
    g_game.talk('!premium30')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end
 
  acceptWindow = displayGeneralBox(tr("Accept transaction"), tr("Do you really want to buy this scroll?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

-- Premium Scroll 60 Days
function buypremium60()
  if acceptWindow then
    return true
  end
 
  local acceptFunc = function()
    g_game.talk('!premium60')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end
 
  acceptWindow = displayGeneralBox(tr("Accept transaction"), tr("Do you really want to buy this scroll?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

-- Green Djinn Scroll
function buygreendjinn()
  if acceptWindow then
    return true
  end
 
  local acceptFunc = function()
    g_game.talk('!greendjinn')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end
 
  acceptWindow = displayGeneralBox(tr("Accept transaction"), tr("Do you really want to buy this scroll?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

-- Blue Djinn Scroll
function buybluedjinn()
  if acceptWindow then
    return true
  end
 
  local acceptFunc = function()
    g_game.talk('!bluedjinn')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end
 
  acceptWindow = displayGeneralBox(tr("Accept transaction"), tr("Do you really want to buy this scroll?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

-- Postman Scroll
function buypostman()
  if acceptWindow then
    return true
  end
 
  local acceptFunc = function()
    g_game.talk('!postman')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end
 
  acceptWindow = displayGeneralBox(tr("Accept transaction"), tr("Do you really want to buy this scroll?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

-- Change Sex Scroll
function buychangesex()
  if acceptWindow then
    return true
  end
 
  local acceptFunc = function()
    g_game.talk('!changesex')
    acceptWindow:destroy()
    acceptWindow = nil
  end
 
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end
 
  acceptWindow = displayGeneralBox(tr("Accept transaction"), tr("Do you really want to buy this scroll?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end