if gmcp.Room.Info.environment == 'bridge' then
  send("ship turn nw")
elseif gmcp.Room.Info.name == 'In space.' then
  send('spacewalk nw')
else
  send("nw")
end
