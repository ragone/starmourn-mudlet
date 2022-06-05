for _, item in ipairs(starmourn.ui.info.inventory) do
	if item.attrib and string.find(item.attrib, "c") then
		sendGMCP("Char.Items.Contents " .. item.id)
	end
end
