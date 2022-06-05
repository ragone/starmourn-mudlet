if gmcp.Room.Info.environment == "bridge" then
	send("ship turn se")
elseif gmcp.Room.Info.name == "In space." then
	send("spacewalk se")
else
	send("se")
end
