starmourn.ui.info = starmourn.ui.info or {}
starmourn.ui.info.tabs = starmourn.ui.info.tabs or {}
starmourn.ui.info.windows = starmourn.ui.info.windows or {}
starmourn.ui.info.use = true
starmourn.ui.info.config = starmourn.ui.info.config or {}
starmourn.ui.info.config.types = { 'Room', 'Tasks', 'Inventory' }
starmourn.ui.info.config.fontsize = getFontSize() - 2
starmourn.ui.info.config.tasklimit = 24
starmourn.ui.info.config.preservebackground = true
starmourn.ui.info.config.gag = true
starmourn.ui.info.config.displayIDs = false
starmourn.ui.info.config.header_color = '<0,95,255>'
starmourn.ui.info.config.dash_color = '<135,0,175>'
starmourn.ui.info.config.text_color = '<192,192,192>'
starmourn.ui.info.config.activecolors = { r = 20, g = 60, b = 20 }
starmourn.ui.info.config.inactivecolors = { r = 60, g = 60, b = 60 }
starmourn.ui.info.config.windowcolors = { r = 0, g = 0, b = 0 }
starmourn.ui.info.config.activetabtext = '<0,175,215>'
starmourn.ui.info.config.inactivetabtext = 'white'
starmourn.ui.info.capture = false
starmourn.ui.info.buffer = ''
starmourn.ui.info.currenttab = starmourn.ui.info.currenttab or starmourn.ui.info.config.types[1]
starmourn.ui.info.room_players = starmourn.ui.info.room_players or {}
starmourn.ui.info.room_mobs = starmourn.ui.info.room_mobs or {}
starmourn.ui.info.room_items = starmourn.ui.info.room_items or {}
starmourn.ui.info.room_filters = starmourn.ui.info.room_filters or {}
starmourn.ui.info.task_list = starmourn.ui.info.task_list or {}
starmourn.ui.info.inventory = starmourn.ui.info.inventory or {}
starmourn.ui.info.containers = starmourn.ui.info.containers or {}
starmourn.ui.info.armor = starmourn.ui.info.armor or {}

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

starmourn.ui.info.switch = function(tab)
  local r = starmourn.ui.info.config.inactivecolors.r
  local g = starmourn.ui.info.config.inactivecolors.g
  local b = starmourn.ui.info.config.inactivecolors.b
  local newr = starmourn.ui.info.config.activecolors.r
  local newg = starmourn.ui.info.config.activecolors.g
  local newb = starmourn.ui.info.config.activecolors.b
  local oldtab = starmourn.ui.info.currenttab
  if starmourn.ui.info.currenttab ~= tab then
    starmourn.ui.info.windows[oldtab]:hide()
    starmourn.ui.info.tabs[oldtab]:setColor(r, g, b)
    starmourn.ui.info.tabs[oldtab]:echo(oldtab, starmourn.ui.info.config.inactivetabtext, 'c')
    starmourn.ui.info.tabs[oldtab]:setStyleSheet(inactivecss:getCSS())
  end
  starmourn.ui.info.tabs[tab]:setColor(newr, newg, newb)
  starmourn.ui.info.tabs[tab]:echo(tab, starmourn.ui.info.config.activetabtext, 'c')
  starmourn.ui.info.tabs[tab]:setStyleSheet(activecss:getCSS())
  starmourn.ui.info.windows[tab]:show()
  starmourn.ui.info.currenttab = tab
end

function starmourn.ui.info:resetUI()
  starmourn.ui.info.container = starmourn.ui.bottomright
  starmourn.ui.info.tabbox = Geyser.HBox:new({
      name = 'starmourn.ui.info.tabbox',
      x = '5%', y = '4%',
      width = '90%', height = '6%'
                                       }, starmourn.ui.info.container)
end

function starmourn.ui.info:create()
  starmourn.ui.info:resetUI()

  local r = starmourn.ui.info.config.inactivecolors.r
  local g = starmourn.ui.info.config.inactivecolors.g
  local b = starmourn.ui.info.config.inactivecolors.b
  local winr = starmourn.ui.info.config.windowcolors.r
  local wing = starmourn.ui.info.config.windowcolors.g
  local winb = starmourn.ui.info.config.windowcolors.b

  for i, tab in ipairs(starmourn.ui.info.config.types) do
    starmourn.ui.info.tabs[tab] = Geyser.Label:new({ name = string.format('infotab%s', tab) }, starmourn.ui.info.tabbox)
    starmourn.ui.info.tabs[tab]:echo(tab, starmourn.ui.info.config.inactivetabtext, 'c')
    starmourn.ui.info.tabs[tab]:setColor(r, g, b)
    starmourn.ui.info.tabs[tab]:setClickCallback('starmourn.ui.info.switch', tab)
    starmourn.ui.info.tabs[tab]:setStyleSheet(inactivecss:getCSS())
    starmourn.ui.info.windows[tab] = Geyser.MiniConsole:new({
        name = string.format('infowin%s', tab),
        x = '5%', y = '12%',
        autoWrap = false,
        fontSize = starmourn.ui.info.config.fontsize,
        width = '90%', height = '85%'
                                                      }, starmourn.ui.info.container)
    starmourn.ui.info.windows[tab]:setColor(winr, wing, winb)
    starmourn.ui.info.windows[tab]:hide()
  end

  starmourn.ui.info.switch(starmourn.ui.info.config.types[1])
end

function starmourn.ui.info:append(tab)
  local r = starmourn.ui.info.config.windowcolors.r
  local g = starmourn.ui.info.config.windowcolors.g
  local b = starmourn.ui.info.config.windowcolors.b
  selectCurrentLine()
  local ofr, ofg, ofb = getFgColor()
  local obr, obg, obb = getBgColor()
  if starmourn.ui.info.config.preservebackground then
    setBgColor(r, g, b)
  end
  copy()
  starmourn.ui.info.windows[tab]:append()
  if starmourn.ui.info.config.gag then
    deleteLine()
    tempLineTrigger(1, 1, [[if isPrompt() then deleteLine() end]])
  end
end

function starmourn.ui.info:cecho(tab, message)
  cecho(string.format('infowin%s', tab), message)
end

function starmourn.ui.info:decho(tab, message)
  local r = starmourn.ui.info.config.windowcolors.r
  local g = starmourn.ui.info.config.windowcolors.g
  local b = starmourn.ui.info.config.windowcolors.b

  if starmourn.ui.info.config.preservebackground then
    decho(string.format('infowin%s', tab), string.format('<:%s,%s,%s>%s', r,g,b, message))
  else
    decho(string.format('infowin%s', tab), message)
  end
end

function starmourn.ui.info:dechoLink(tab, message, command, hint)
  local r = starmourn.ui.info.config.windowcolors.r
  local g = starmourn.ui.info.config.windowcolors.g
  local b = starmourn.ui.info.config.windowcolors.b

  if starmourn.ui.info.config.preservebackground then
    dechoLink(string.format('infowin%s', tab), string.format('<:%s,%s,%s>%s', r,g,b, message), command, hint, true)
  else
    dechoLink(string.format('infowin%s', tab), message, command, hint, true)
  end
end

function starmourn.ui.info:hecho(tab, message)
  hecho(string.format('infowin%s', tab), message)
end

function starmourn.ui.info:echo(tab, message)
  local alltab = starmourn.ui.info.config.AllTab
  local blink = starmourn.ui.info.config.Blink
  echo(string.format('infowin%s', tab), message)
  if alltab and tab ~= alltab then
    echo(string.format('infowin%s', alltab), message)
  end
end

function starmourn.ui.update_tasks()
  local taskList = starmourn.ui.info.task_list

  clearWindow('infowinTasks')

  local function color(col)
    return '<'..table.concat(color_table[col], ',')..'>'
  end

  local tasks = {completed = {}, uncompleted = {}}
  for _, task in ipairs(taskList) do
    if task.status == '0' then
      tasks.uncompleted[task.id] = task
    else
      tasks.completed[task.id] = task
    end
  end

  starmourn.ui.info:decho('Tasks', string.format('%sUncompleted', starmourn.ui.info.config.header_color))

  for _, task in pairs(tasks.uncompleted) do
    starmourn.ui.info:dechoLink('Tasks', string.format('\n%s[ ] %s%s',
                                                 starmourn.ui.info.config.dash_color,
                                                 starmourn.ui.info.config.text_color,
                                                 task.name
                                                ), 'send("'..task.cmd..'")', task.desc)
  end

  starmourn.ui.info:decho('Tasks', string.format('\n\n%sCompleted', starmourn.ui.info.config.header_color))
  local c = 0
  for _, task in pairs(tasks.completed) do
    starmourn.ui.info:decho('Tasks', string.format('\n%s[%sX%s] %s%s',
                                                 starmourn.ui.info.config.dash_color,
                                                 color('ghost_white'),
                                                 starmourn.ui.info.config.dash_color,
                                                 color('gray'),
                                                 task.name
                                                ))
    c = c + 1
    if c == starmourn.ui.info.config.tasklimit then break end
  end
end

function starmourn.ui.info.handle_ire_tasks_list()
  starmourn.ui.info.task_list = gmcp.IRE.Tasks.List
  starmourn.ui.update_tasks()
end

function starmourn.ui.info.handle_ire_tasks_update()
  local updated = gmcp.IRE.Tasks.Update
  for key, task in ipairs(starmourn.ui.info.task_list) do
    if task.id == updated.id then
      starmourn.ui.info.task_list[key] = updated
      break
    end
  end
  starmourn.ui.update_tasks()
end

function starmourn.ui.update_room()
  clearWindow('infowinRoom')

  local r = starmourn.ui.info.config.windowcolors.r
  local g = starmourn.ui.info.config.windowcolors.g
  local b = starmourn.ui.info.config.windowcolors.b

  local function color(col)
    return '<'..table.concat(color_table[col] or col, ',')..'>'
  end

  starmourn.ui.info:decho('Room', string.format('%sPlayers', starmourn.ui.info.config.header_color))
  for _, player in ipairs(starmourn.ui.info.room_players) do
    starmourn.ui.info:decho('Room', string.format('\n %s- ', starmourn.ui.info.config.dash_color, starmourn.ui.info.config.text_color, player.name))
    dechoPopup('infowinRoom', string.format('%s%s', starmourn.ui.info.config.text_color, player.name), {'send("look '..player.name..'", false)', 'send("honors '..player.name..'", false)'}, {'look', 'honors'}, true)
  end

  starmourn.ui.info.room_mobs = {}

  local roomItems = {mobs = {}, items = {}, itemIDs = {}}

  for _, item in ipairs(starmourn.ui.info.room_items) do
    if item.attrib and item.attrib:find('m', 1, true) then
      starmourn.ui.info.room_mobs[#starmourn.ui.info.room_mobs + 1] = item
    else
      local key = string.lower(item.name)
      roomItems.items[key] = roomItems.items[key] or {}
      roomItems.items[key].count = (roomItems.items[key].count or 0) + 1
      roomItems.items[key].id = item.id
      roomItems.items[key].attrib = item.attrib
      roomItems.items[key].name = item.name
    end
  end

  for filter, func in pairs(starmourn.ui.info.room_filters) do
    starmourn.ui.info.room_mobs = func(starmourn.ui.info.room_mobs)
  end

  starmourn.ui.info:decho('Room', string.format('\n\n%sMobs', starmourn.ui.info.config.header_color))
  for _, entity in pairs(starmourn.ui.info.room_mobs)  do
    local isTarget = (entity.id == starmourn.target)
    local noTarget = entity.attrib:find('x', 1, true)
    local colors = isTarget and {starmourn.ui.info.config.dash_color, starmourn.ui.info.config.dash_color} or {starmourn.ui.info.config.dash_color, noTarget and starmourn.ui.info.config.text_color or "<0,175,215>"}

    starmourn.ui.info:decho('Room', string.format('\n %s-%s %s',
                                            colors[1],
                                            isTarget and '>' or '',
                                            starmourn.ui.info.config.displayIDs and string.format('%s%d ', color(isTarget and 'IndianRed' or 'MediumSlateBlue'), entity.id) or ''
    ))

    local labels = {
      [[send('look ]]..entity.id..[[', false)]],
      [[send('greet ]]..entity.id..[[', false)]],
      [[send('xenozoology scan ]]..entity.id..[[', false)]]
    }
    local cmds = {'look', 'greet', 'scan'}
    if not noTarget then
      table.insert(labels, 1, [[send('st ]]..entity.id..[[', false)]])
      table.insert(cmds, 1, 'target')
    else
      table.insert(labels, [[send('st ]]..entity.id..[[', false)]])
      table.insert(cmds, 'target')
    end
    dechoPopup('infowinRoom', string.format("%s%s", colors[2], entity.name), labels, cmds, true)
  end

  resetFormat()

  starmourn.ui.info:decho('Room', string.format('\n\n%sItems', starmourn.ui.info.config.header_color))
  for entity, data in spairs(roomItems.items) do
    starmourn.ui.info:decho('Room', string.format('\n %s- %s',
                                            starmourn.ui.info.config.dash_color,
                                            starmourn.ui.info.config.displayIDs and string.format('%s%d ', color('MediumSlateBlue'), data.id) or ''
    ))

    local labels = {[[send('look ]]..data.id..[[', false)]]}
    local cmds = {'look'}
    if data.attrib and string.find(data.attrib, 't') then
      table.insert(labels, [[send('take ]]..data.id..[[', false)]])
      table.insert(cmds, 'take')
    end
    dechoPopup('infowinRoom', string.format('%s%s%s', starmourn.ui.info.config.text_color, data.name, data.count > 1 and string.format(' (x%d)', data.count) or ''), labels, cmds, true)

    if starmourn.ui.info.containers[data.id] then
      for _, containerItem in pairs(starmourn.ui.info.containers[data.id]) do
        starmourn.ui.info:decho('Room', string.format('\n     %s- %s',
          color("DimGrey"),
          starmourn.ui.info.config.displayIDs and string.format('%s%d ', color('MediumSlateBlue'), containerItem.id) or ''
        ))
        local labels = {
          [[send('get ]]..containerItem.id..[[ from ]]..data.id..[[', false)]]
        }
        local cmds = {'take out'}
        dechoPopup('infowinRoom', string.format('%s%s', color("DimGrey"), containerItem.name), labels, cmds, true)
      end
    end
  end
end

function starmourn.ui.info.handle_char_items_list()
  local list = gmcp.Char.Items.List
  if list.location == 'room' then
    starmourn.ui.info.room_items = list.items
    starmourn.ui.update_room()
  elseif list.location == 'inv' then
    starmourn.ui.info.inventory = list.items
    starmourn.ui.info.update_inventory()
  elseif string.starts(list.location, 'rep') then
    local id = string.sub(list.location, 4)
    starmourn.ui.info.containers[id] = list.items
  end
end

function starmourn.ui.info.handle_char_items_add()
  local list = gmcp.Char.Items.Add
  if list.location == 'room' then
    table.insert(starmourn.ui.info.room_items, list.item)
    starmourn.ui.update_room()
  elseif list.location == 'inv' then
    table.insert(starmourn.ui.info.inventory, list.item)
    starmourn.ui.info.update_inventory()
  end
end

function starmourn.ui.info.handle_char_items_update()
  local list = gmcp.Char.Items.Update
  if list.location == 'inv' then
    starmourn.ui.info.update_inventory()
  end
end

function starmourn.ui.info.handle_char_items_remove()
  local list = gmcp.Char.Items.Remove
  if list.location == 'room' then
    for key, item in ipairs(starmourn.ui.info.room_items) do
      if item.id == list.item.id then
        table.remove(starmourn.ui.info.room_items, key)
        if item.id == starmourn.target then
          starmourn.targetindex = 0
        end
        break
      end
    end
    starmourn.ui.update_room()
  elseif list.location == 'inv' then
    for key, item in ipairs(starmourn.ui.info.inventory) do
      if item.id == list.item.id then
        table.remove(starmourn.ui.info.inventory, key)
        break
      end
    end
    starmourn.ui.info.update_inventory()
  end
end

function starmourn.ui.info.handle_room_players()
  local list = gmcp.Room.Players
  starmourn.ui.info.room_players = list
  starmourn.ui.update_room()
end

function starmourn.ui.info.handle_room_add_player()
  local player = gmcp.Room.AddPlayer
  table.insert(starmourn.ui.info.room_players, player)
  starmourn.ui.update_room()
end

function starmourn.ui.info.handle_room_remove_player()
  local removed = gmcp.Room.RemovePlayer
  for key, player in ipairs(starmourn.ui.info.room_players) do
    if player.name == removed then
      table.remove(starmourn.ui.info.room_players, key)
      break
    end
  end
  starmourn.ui.update_room()
end

function starmourn.ui.info.handle_room_info()
  if oldnum ~= gmcp.Room.Info.num then
    if starmourn.ui.info.look_timer then killTimer(starmourn.ui.info.look_timer) end
    -- starmourn.ui.info.look_timer = tempTimer(6, [[decho("<215,255,135>You look around<192,192,192>\n]]..gmcp.Room.Info.desc..[[\n")]])
    starmourn.targetindex = 0
    oldnum = gmcp.Room.Info.num
  end
end

function starmourn.ui.info.handle_ire_target_set()
  starmourn.target = gmcp.IRE.Target.Set
  starmourn.ui.update_room()
end

function starmourn.ui.info.rotate_backwards()
  local lastValid = starmourn.targetindex

  while starmourn.targetindex > 0 do
    if starmourn.targetindex > #starmourn.ui.info.room_mobs then
      return false
    end

    if starmourn.targetindex == 1 then
      starmourn.targetindex = lastValid
    else
      starmourn.targetindex = starmourn.targetindex - 1
    end

    local mob = starmourn.ui.info.room_mobs[starmourn.targetindex]
    if not mob.attrib:find('x', 1, true) then
      lastValid = starmourn.targetindex
      send('st '..mob.id, false)
      return
    end
  end

  cecho("<red>There's nothing here, mate.\n")
end

function starmourn.ui.info.rotate_forwards()
  local lastValid = starmourn.targetindex

  while starmourn.targetindex < #starmourn.ui.info.room_mobs + 1 do
    if starmourn.targetindex < 0 then
      return false
    end

    if starmourn.targetindex == #starmourn.ui.info.room_mobs then
      starmourn.targetindex = lastValid
    else
      starmourn.targetindex = starmourn.targetindex + 1
    end

    local mob = starmourn.ui.info.room_mobs[starmourn.targetindex]
    if not mob.attrib:find('x', 1, true)  then
      lastValid = starmourn.targetindex
      send('st '..mob.id, false)
      return
    end
  end
end

function starmourn.ui.info.rotate_room_target()
  starmourn.ui.info.rotate_forwards()
end

function starmourn.ui.info.update_inventory()
  clearWindow('infowinInventory')

  local r = starmourn.ui.info.config.windowcolors.r
  local g = starmourn.ui.info.config.windowcolors.g
  local b = starmourn.ui.info.config.windowcolors.b

  local function color(col)
    return '<'..table.concat(color_table[col] or col, ',')..'>'
  end

  local function hasAttrib(item, contains)
    return item.attrib and string.find(item.attrib, contains)
  end

  local atribs = {}
  local inventory = {items = {}, wielding = {}, wearing = {}, containers = {}}

  for _, item in ipairs(starmourn.ui.info.inventory) do
    if hasAttrib(item, "l") then
      inventory.wielding[item.id] = inventory.wielding[item.id] or {}
      inventory.wielding[item.id].name = item.name
    elseif hasAttrib(item, "w") then
      inventory.wearing[item.id] = inventory.wearing[item.id] or {}
      inventory.wearing[item.id].name = item.name
    elseif hasAttrib(item, "c") then
      inventory.containers[item.id] = inventory.containers[item.id] or {}
      inventory.containers[item.id].name = item.name
    elseif not hasAttrib(item, 'w') and not hasAttrib(item, 'l') and not hasAttrib(item, 'c') then
      local key = string.lower(item.name)
      inventory.items[key] = inventory.items[key] or {}
      inventory.items[key].count = (inventory.items[key].count or 0) + 1
      inventory.items[key].id = item.id
      inventory.items[key].attrib = item.attrib
      inventory.items[key].name = item.name
    end
  end

  if next(inventory.wielding) ~= nil then
    starmourn.ui.info:decho('Inventory', string.format('%sWielding', starmourn.ui.info.config.header_color))
  end

  for id, entity in pairs(inventory.wielding) do
    starmourn.ui.info:decho('Inventory', string.format('\n %s- %s',
        starmourn.ui.info.config.dash_color,
        starmourn.ui.info.config.displayIDs and string.format('%s%d ', color('MediumSlateBlue'), id) or ''
      ))

    local labels = {
      [[send('look ]]..id..[[', false)]],
      [[send('unwield ]]..id..[[', false)]]
    }
    local cmds = {'look', 'unwield'}
    dechoPopup('infowinInventory', string.format('%s%s', starmourn.ui.info.config.text_color, entity.name), labels, cmds, true)
  end

  if next(inventory.wielding) ~= nil and next(starmourn.ui.info.armor) ~= nil then
    starmourn.ui.info:cecho('Inventory', "\n\n")
  end

  if next(starmourn.ui.info.armor) ~= nil then
    starmourn.ui.info:decho('Inventory', string.format('%sArmor', starmourn.ui.info.config.header_color))
  end

  for id, entity in pairs(starmourn.ui.info.armor) do
    starmourn.ui.info:decho('Inventory', string.format('\n %s- %s',
        starmourn.ui.info.config.dash_color,
        starmourn.ui.info.config.displayIDs and string.format('%s%d ', color('MediumSlateBlue'), id) or ''
      ))

    local labels = {
      [[send('probe ]]..id..[[', false)]]
    }
    local cmds = {'look'}
    dechoPopup('infowinInventory', string.format('%s[%s<b>%s</b>%s] %s%s',starmourn.ui.info.config.dash_color, starmourn.ui.info.config.text_color, entity.slot, starmourn.ui.info.config.dash_color, starmourn.ui.info.config.text_color, entity.name), labels, cmds, true)
  end

  if next(inventory.wielding) ~= nil or next(starmourn.ui.info.armor) ~= nil then
    starmourn.ui.info:cecho('Inventory', "\n\n")
  end

  if next(inventory.wearing) ~= nil then
    starmourn.ui.info:decho('Inventory', string.format('%sWearing', starmourn.ui.info.config.header_color))
  end

  for id, entity in spairs(inventory.wearing, function(t, a, b) return string.lower(t[a].name) < string.lower(t[b].name) end) do
    starmourn.ui.info:decho('Inventory', string.format('\n %s- %s',
        starmourn.ui.info.config.dash_color,
        starmourn.ui.info.config.displayIDs and string.format('%s%d ', color('MediumSlateBlue'), id) or ''
      ))

    local labels = {
      [[send('look ]]..id..[[', false)]],
      [[send('remove ]]..id..[[', false)]]
    }
    local cmds = {'look', 'remove'}
    dechoPopup('infowinInventory', string.format('%s%s', starmourn.ui.info.config.text_color, entity.name), labels, cmds, true)
  end

  if next(inventory.wielding) ~= nil or next(inventory.wearing) ~= nil or next(starmourn.ui.info.armor) ~= nil then
    starmourn.ui.info:cecho('Inventory', "\n\n")
  end

  if next(inventory.items) ~= nil then
    starmourn.ui.info:decho('Inventory', string.format('%sItems', starmourn.ui.info.config.header_color))
  end

  for name, entity in spairs(inventory.items) do
    starmourn.ui.info:decho('Inventory', string.format('\n %s- %s',
        starmourn.ui.info.config.dash_color,
        starmourn.ui.info.config.displayIDs and string.format('%s%d ', color('MediumSlateBlue'), entity.id) or ''
    ))

    local labels = {
      [[send('look ]]..entity.id..[[', false)]],
      [[send('drop ]]..entity.id..[[', false)]],
      [[send('wield ]]..entity.id..[[', false)]]
    }
    local cmds = {'look', 'drop', 'wield'}
    local wearable = hasAttrib(entity, 'W')
    if wearable then
      table.insert(labels, [[send('wear ]]..entity.id..[[', false)]])
      table.insert(cmds, 'wear')
    end
    for containerId, container in pairs(inventory.containers) do
      table.insert(labels, [[send('put ]]..entity.id..[[ in ]]..containerId..[[', false)]])
      table.insert(cmds, 'put in '..container.name)
    end
    dechoPopup('infowinInventory', string.format('%s%s%s', starmourn.ui.info.config.text_color, entity.name, entity.count > 1 and string.format(' (x%d)', entity.count) or ''), labels, cmds, true)
  end

  if next(inventory.wielding) ~= nil or next(inventory.wearing) ~= nil or next(inventory.containers) ~= nil or next(starmourn.ui.info.armor) ~= nil then
    starmourn.ui.info:cecho('Inventory', "\n\n")
  end

  if next(inventory.containers) ~= nil then
    starmourn.ui.info:decho('Inventory', string.format('%sContainers', starmourn.ui.info.config.header_color))
  end

  for id, entity in pairs(inventory.containers) do
    starmourn.ui.info:decho('Inventory', string.format('\n %s- %s',
        starmourn.ui.info.config.dash_color,
        starmourn.ui.info.config.displayIDs and string.format('%s%d ', color('MediumSlateBlue'), id) or ''
    ))

    local labels ={
      [[send('look ]]..id..[[', false)]],
      [[send('drop ]]..id..[[', false)]],
      [[send('wield ]]..id..[[', false)]]
    }
    local cmds = {'look', 'drop', 'wield'}
    dechoPopup('infowinInventory', string.format('%s%s%s', starmourn.ui.info.config.text_color, entity.name, starmourn.ui.info.containers[id] and next(starmourn.ui.info.containers[id]) == nil and " (Empty)" or ""), labels, cmds, true)

    if starmourn.ui.info.containers[id] then
      for _, containerItem in pairs(starmourn.ui.info.containers[id]) do
        starmourn.ui.info:decho('Inventory', string.format('\n     %s- %s',
          color("DimGrey"),
          starmourn.ui.info.config.displayIDs and string.format('%s%d ', color('MediumSlateBlue'), containerItem.id) or ''
        ))
        local labels = {
          [[send('get ]]..containerItem.id..[[ from ]]..id..[[', false)]]
        }
        local cmds = {'take out'}
        dechoPopup('infowinInventory', string.format('%s%s', color("DimGrey"), containerItem.name), labels, cmds, true)
      end
    end
  end

  resetFormat()
end

function starmourn.ui.info.handle_send_command(event, cmd)
  if starmourn.ui.info.look_timer then killTimer(starmourn.ui.info.look_timer) end
  local lowerCmd = string.lower(cmd)
  local helpCmds = {"help", "fhelp", "clhelp"}
  for _, helpCmd in ipairs(helpCmds) do
    if string.starts(lowerCmd, helpCmd) then
      starmourn.ui.info.capture = true
      starmourn.ui.helpterm:clear()
    end
  end
end

function starmourn.ui.info.handle_help_capture()
  selectCurrentLine()
  copy()
  starmourn.ui.helpterm:appendBuffer()
  deleteLine()
end

function starmourn.ui.info.handle_help()
  starmourn.ui.helpwindow:show()
  starmourn.ui.info.capture = false
end

starmourn.utils.events.register('send command', 'sysDataSendRequest', 'starmourn.ui.info.handle_send_command')
starmourn.utils.events.register('task list', 'gmcp.IRE.Tasks.List', 'starmourn.ui.info.handle_ire_tasks_list')
starmourn.utils.events.register('task update', 'gmcp.IRE.Tasks.Update', 'starmourn.ui.info.handle_ire_tasks_update')
--starmourn.utils.events.register('task completed', 'gmcp.IRE.Tasks.Completed')
starmourn.utils.events.register('items list', 'gmcp.Char.Items.List', 'starmourn.ui.info.handle_char_items_list')
starmourn.utils.events.register('items add', 'gmcp.Char.Items.Add', 'starmourn.ui.info.handle_char_items_add')
starmourn.utils.events.register('items remove', 'gmcp.Char.Items.Remove', 'starmourn.ui.info.handle_char_items_remove')
starmourn.utils.events.register('items update', 'gmcp.Char.Items.Update', 'starmourn.ui.info.handle_char_items_update')
starmourn.utils.events.register('room players', 'gmcp.Room.Players', 'starmourn.ui.info.handle_room_players')
starmourn.utils.events.register('room addplayer', 'gmcp.Room.AddPlayer', 'starmourn.ui.info.handle_room_add_player')
starmourn.utils.events.register('room removeplayer', 'gmcp.Room.RemovePlayer', 'starmourn.ui.info.handle_room_remove_player')
starmourn.utils.events.register('target info', 'gmcp.Room.Info', 'starmourn.ui.info.handle_room_info')
starmourn.utils.events.register('target set', 'gmcp.IRE.Target.Set', 'starmourn.ui.info.handle_ire_target_set')
