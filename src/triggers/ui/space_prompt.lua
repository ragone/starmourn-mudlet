local speed, hull, shield, cap = multimatches[2][2], multimatches[2][3], multimatches[2][4], multimatches[2][5]
local vitals = gmcp.Char.Vitals
local shields_perc = round(gmcp.Char.Vitals.ship_shield / gmcp.Char.Vitals.ship_shield_max * 100)
local hull_perc = round(gmcp.Char.Vitals.ship_hull / gmcp.Char.Vitals.ship_hull_max * 100)
local function get_system_color(amount)
  amount = tonumber(amount)
  if amount >= 92.5 then
    return '<255,255,255:0,0,0>'
  elseif amount >= 70 then
    return '<255,255,0:0,0,0>'
  elseif amount >= 30 then
    return '<255,150,20:0,0,0>'
  else
    return '<200,0,0:0,0,0>'
  end
end
deleteLine()
moveCursorEnd('mapwinSpace')
selectCurrentLine('mapwinSpace')
replace('mapwinSpace','')
starmourn.ui.mapper:decho(
  'Space',
  string.format(
    '<192,192,192:0,0,0>Spd:%3s<250,250,250:0,0,0> <230,180,20:0,0,0>Hull:'..get_system_color(hull_perc)..'%3s<250,250,250:0,0,0> <60,160,255:0,0,0>Shld:'..get_system_color(shields_perc)..'%3s<250,250,250:0,0,0><215,60,170:0,0,0> Cap:<192,192,192:0,0,0>%3s%%',
    vitals.ship_speed,
    vitals.ship_hull,
    vitals.ship_shield,
    cap
  )
)
