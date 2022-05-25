if matches[3] ~= "No" and (tonumber(gmcp.Char.Vitals.ship_shield) > 0) then
  send("ship restart " .. matches[2])
end
if matches[2] == "Engine" then
  starmourn.ui.engine_bf = matches[3]
elseif matches[2] == "Shield" then
  starmourn.ui.shield_bf = matches[3]
elseif matches[2] == "Capacitor" then
  starmourn.ui.capacitor_bf = matches[3]
elseif matches[2] == "Sensor" then
  starmourn.ui.sensor_bf = matches[3]
elseif matches[2] == "Shipsim" then
  starmourn.ui.sim_bf = matches[3]
else
end
