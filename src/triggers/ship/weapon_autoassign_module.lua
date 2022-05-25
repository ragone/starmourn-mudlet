if matches[3] == "Interdictor Beam" then
  send('ship module alias ' ..matches[2].. ' iterdict')
elseif matches[3] == "Laser Beam I" or matches[3] == "Laser Beam II" or matches[3] == "Laser Beam III" then
  send('ship module alias ' ..matches[2].. ' lasers')
elseif matches[3] == "Targeted Missile I" or matches[3] == "Targeted Missile II" or matches[3] == "Targeted Missile III" then
  send('ship module alias ' ..matches[2].. ' missiles')
elseif matches[3] == "Massive Cannon I" or matches[3] == "Massive Cannon II" or matches[3] == "Massive Cannon III" then
  send('ship module alias ' ..matches[2].. ' mcannons')
elseif matches[3] == "Cannon I" or matches[3] == "Cannon II" or matches[3] == "Cannon III" then
  send('ship module alias ' ..matches[2].. ' cannons')
elseif matches[3] == "Slicekit" then
  send('ship module alias ' ..matches[2].. ' slicer')
elseif matches[3] == "Cap Drainer" then
  send('ship module alias ' ..matches[2].. ' drainer')
else
end
