if gmcp.Room.Info.environment == 'bridge' then
  send("ship turn sw")
elseif gmcp.Room.Info.name == 'In space.' then
  send('spacewalk sw')
else
  send("sw")
end
