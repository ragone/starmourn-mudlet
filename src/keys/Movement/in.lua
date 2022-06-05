if gmcp.Room.Info.environment == "bridge" then
	send("ship halt")
elseif gmcp.Room.Info.name == "In space." then
	send("spacewalk board")
else
	send("in")
end
