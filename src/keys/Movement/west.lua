if gmcp.Room.Info.environment == "bridge" then
	send("ship turn w")
elseif gmcp.Room.Info.name == "In space." then
	send("spacewalk w")
else
	send("w")
end
