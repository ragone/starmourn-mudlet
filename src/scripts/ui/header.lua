starmourn.ui.room_desc = starmourn.ui.room_desc or{}
starmourn.ui.room_desc.collapsed = starmourn.ui.room_desc.collapsed or true

function starmourn.ui.room_desc.update()
  -- starmourn.ui.room_desc_box= Geyser.HBox:new({ name = 'starmourn.ui.header', x = 0, y = 0, width = '100%', height = '100%', }, starmourn.ui.top)

  starmourn.ui.adj.top:show();
  starmourn.ui.adj.top:lowerAll();
  starmourn.ui.top:setStyleSheet([[
    qproperty-wordWrap: true;
    margin: 20px;
    padding: 10px 20px;
    qproperty-alignment: 'AlignTop';
    font-family: Dosis;
    border-radius: 10px;
    background-color: #1f2225;
]])
  starmourn.ui.top:echo([[
<p style="font-size:35px; font-weight: bold;"><font color="#ffffff">]]..gmcp.Room.Info.area..[[</font></p>
</br>
<p style="font-size:20px"><font color="#00afd7">]]..gmcp.Room.Info.name..[[</font></p>
</br>
<p style="font-size:20px">]]..gmcp.Room.Info.desc..[[</p>

]])
-- starmourn.ui.top:autoHeight();

  local activecss = CSSMan.new([[
    background-color: rgba(0,0,0,100);
    border-style: solid;
    border-width: 1px;
    border-color: rgba(0, 175, 215, 100);
    border-radius: 5px;
    margin: 5px;
    qproperty-wordWrap: true;
  ]])

  local inactivecss = CSSMan.new([[
    background-color: rgba(0,0,0,100);
    border-style: solid;
    border-width: 1px;
    border-color: rgba(0,30,30, 100);
    border-radius: 5px;
    margin: 5px;
    qproperty-wordWrap: true;
  ]])

  function starmourn.ui.room_desc.set(module, status)
    if type(status) == 'boolean' then
      starmourn.ui.room_desc.status[module] = status
    else
      starmourn.ui.room_desc.status[module] = not starmourn.ui.room_desc.status[module]
    end
    raiseEvent('starmourn.ui.module', module)
    local css = (starmourn.ui.room_desc.status[module] and activecss or inactivecss):getCSS()
    -- if status then
    --   starmourn.ui['module'..module]:setFgColor('<0,175,215>')
    -- else
    --   starmourn.ui['module'..module]:setFgColor('white')
    -- end
    starmourn.ui['module'..module]:setStyleSheet(css)
  end
end

function starmourn.ui.room_desc.click()
  if(starmourn.ui.room_desc.collapsed) then
    starmourn.ui.adj.top:resize(nil, "90%")
  else
    starmourn.ui.adj.top:resize(nil, "170px")
  end
  starmourn.ui.room_desc.collapsed = not starmourn.ui.room_desc.collapsed
end

starmourn.utils.events.register('room desc', 'gmcp.Room.Info', 'starmourn.ui.room_desc.update')
