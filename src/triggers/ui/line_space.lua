if line == "----------------------------------------" then
	setTriggerStayOpen("capture map space", 0)
	deleteLine()
else
	starmourn.ui.mapper:append("Space")
	starmourn.ui.mapper.switch("Space")
end
