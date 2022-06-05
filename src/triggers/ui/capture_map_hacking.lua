if hackclear then
	clearUserWindow("mapwinHacking")
	starmourn.ui.mapper.switch("Hacking")

	hackclear = false
end

selectCurrentLine()
copy()
appendBuffer("mapwinHacking")
deleteLine()
