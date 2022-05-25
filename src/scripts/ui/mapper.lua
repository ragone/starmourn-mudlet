starmourn.ui.mapper = starmourn.ui.mapper or {}
starmourn.ui.mapper.use = true
starmourn.ui.mapper.config = starmourn.ui.mapper.config or {}
starmourn.ui.mapper.config.maps = { 'Mudlet', 'Ground', 'Space', 'Hacking' }
starmourn.ui.mapper.config.fontsize = 11
starmourn.ui.mapper.config.preservebackground = true
starmourn.ui.mapper.config.gag = true
starmourn.ui.mapper.config.starchart = true
starmourn.ui.mapper.config.activecolors = { r = 20, g = 60, b = 20 }
starmourn.ui.mapper.config.inactivecolors = { r = 60, g = 60, b = 60 }
starmourn.ui.mapper.config.windowcolors = { r = 0, g = 10, b = 10 }
starmourn.ui.mapper.config.active_tab_text = '<0,175,215>'
starmourn.ui.mapper.config.inactive_tab_text = 'white'
starmourn.ui.mapper.current_tab = starmourn.ui.mapper.current_tab or starmourn.ui.mapper.config.maps[1]
starmourn.ui.mapper.tabs = starmourn.ui.mapper.tabs or {}
starmourn.ui.mapper.windows = starmourn.ui.mapper.windows or {}

local activecss = CSSMan.new([[
  border-radius: 3px;
  border-style: solid;
  border-width: 1px;
  border-color: rgba(0, 175, 215, 100);
  margin: 1px;
]])

local inactivecss = CSSMan.new([[
  border-radius: 3px;
  border-style: solid;
  border-width: 1px;
  border-color: rgba(0, 30, 30, 100);
  margin: 1px;
]])

starmourn.ui.mapper.switch = function(map)
  local r = starmourn.ui.mapper.config.inactivecolors.r
  local g = starmourn.ui.mapper.config.inactivecolors.g
  local b = starmourn.ui.mapper.config.inactivecolors.b
  local newr = starmourn.ui.mapper.config.activecolors.r
  local newg = starmourn.ui.mapper.config.activecolors.g
  local newb = starmourn.ui.mapper.config.activecolors.b
  local oldmap = starmourn.ui.mapper.current_tab
  if starmourn.ui.mapper.current_tab ~= map then
    starmourn.ui.mapper.windows[oldmap]:hide()
    starmourn.ui.mapper.tabs[oldmap]:setColor(r, g, b)
    starmourn.ui.mapper.tabs[oldmap]:echo(oldmap, starmourn.ui.mapper.config.inactive_tab_text, 'c')
    starmourn.ui.mapper.tabs[oldmap]:setStyleSheet(inactivecss:getCSS())
  end
  starmourn.ui.mapper.tabs[map]:setColor(newr, newg, newb)
  starmourn.ui.mapper.tabs[map]:echo(map, starmourn.ui.mapper.config.active_tab_text, 'c')
  starmourn.ui.mapper.tabs[map]:setStyleSheet(activecss:getCSS())
  starmourn.ui.mapper.windows[map]:show()
  starmourn.ui.mapper.current_tab = map
end

function starmourn.ui.mapper:resetUI()
  starmourn.ui.mapper.container = starmourn.ui.topleft
  starmourn.ui.mapper.tabbox = Geyser.HBox:new({
      name = 'starmourn.ui.mapper.tabbox',
      x = '5%', y = '3%',
      width = '90%', height = '5%'
  }, starmourn.ui.mapper.container)
end

function starmourn.ui.mapper:create()
  starmourn.ui.mapper:resetUI()

  local r = starmourn.ui.mapper.config.inactivecolors.r
  local g = starmourn.ui.mapper.config.inactivecolors.g
  local b = starmourn.ui.mapper.config.inactivecolors.b
  local winr = starmourn.ui.mapper.config.windowcolors.r
  local wing = starmourn.ui.mapper.config.windowcolors.g
  local winb = starmourn.ui.mapper.config.windowcolors.b

  for i, tab in ipairs(starmourn.ui.mapper.config.maps) do
    starmourn.ui.mapper.tabs[tab] = Geyser.Label:new({ name = string.format('maptab%s', tab) }, starmourn.ui.mapper.tabbox)
    starmourn.ui.mapper.tabs[tab]:echo(tab, starmourn.ui.mapper.config.inactive_tab_text, 'c')
    starmourn.ui.mapper.tabs[tab]:setColor(r, g, b)
    starmourn.ui.mapper.tabs[tab]:setClickCallback('starmourn.ui.mapper.switch', tab)
    starmourn.ui.mapper.tabs[tab]:setStyleSheet(inactivecss:getCSS())
    if tab == 'Mudlet' then
      starmourn.ui.mapper.windows[tab] = Geyser.Mapper:new({
          name = string.format('mapwin%s', tab),
          x = '5%', y = '9%',
          width = '90%', height = '89%'
                                                           }, starmourn.ui.mapper.container)
    else
      starmourn.ui.mapper.windows[tab] = Geyser.MiniConsole:new({
          name = string.format('mapwin%s', tab),
          x = '5%', y = '9%',
          fontSize = starmourn.ui.mapper.config.fontsize,
          width = '90%', height = '89%'
                                                                }, starmourn.ui.mapper.container)
      if not (tab == 'Space') then
        starmourn.ui.mapper.windows[tab]:setColor(winr, wing, winb)
      else
        starmourn.ui.mapper.windows[tab]:setColor(0, 0, 0)
      end
    end
    starmourn.ui.mapper.windows[tab]:hide()
  end

  starmourn.ui.mapper.switch(starmourn.ui.mapper.config.maps[1])
end

function starmourn.ui.mapper:append(map)
  local r = starmourn.ui.mapper.config.windowcolors.r
  local g = starmourn.ui.mapper.config.windowcolors.g
  local b = starmourn.ui.mapper.config.windowcolors.b
  selectCurrentLine()
  local ofr, ofg, ofb = getFgColor()
  local obr, obg, obb = getBgColor()
  if starmourn.ui.mapper.config.preservebackground and not (map == 'Space') then
    setBgColor(r, g, b)
  end
  copy()
  starmourn.ui.mapper.windows[map]:append()
  if starmourn.ui.mapper.config.gag then
    deleteLine()
    tempLineTrigger(1, 1, [[if isPrompt() then deleteLine() end]])
  end
end

function starmourn.ui.mapper:decho(tab, message)
  local r = starmourn.ui.mapper.config.windowcolors.r
  local g = starmourn.ui.mapper.config.windowcolors.g
  local b = starmourn.ui.mapper.config.windowcolors.b

  if starmourn.ui.mapper.config.preservebackground and not (tab == 'Space') then
    decho(string.format('mapwin%s', tab), string.format('<:%s,%s,%s>%s', r,g,b, message))
  else
    decho(string.format('mapwin%s', tab), message)
  end
end
