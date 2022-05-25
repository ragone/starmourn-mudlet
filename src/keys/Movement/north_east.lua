if gmcp.Room.Info.environment == 'bridge' then
  send("ship turn ne")
elseif gmcp.Room.Info.name == 'In space.' then
  send('spacewalk ne')
else
  send("ne")
end
