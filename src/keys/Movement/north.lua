if gmcp.Room.Info.environment == "bridge" then
	send("ship turn n")
elseif gmcp.Room.Info.name == "In space." then
	send("spacewalk n")
else
	send("n")
end
