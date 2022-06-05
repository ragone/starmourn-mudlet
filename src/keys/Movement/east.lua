if gmcp.Room.Info.environment == "bridge" then
	send("ship turn e")
elseif gmcp.Room.Info.name == "In space." then
	send("spacewalk e")
else
	send("e")
end
