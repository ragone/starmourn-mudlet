if gmcp.Room.Info.environment == 'bridge' then
  send("ship turn s")
elseif gmcp.Room.Info.name == 'In space.' then
  send('spacewalk s')
else
  send("s")
end
