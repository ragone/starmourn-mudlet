local target = gmcp.Char.Status.target:match("%w+")
if gmcp.Room.Info.environment == "bridge" then
	sendAll(
		"ship target " .. target,
		"ship weapon fire mcannons " .. target,
		"ship weapon fire cannons " .. target,
		"ship weapon fire lasers " .. target,
		"ship weapon fire missiles " .. target,
		"ship weapon fire interdict " .. target
	)
else
	send("out")
end
