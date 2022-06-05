starmourn.utils.string = starmourn.utils.string or {}

function starmourn.utils.string.clean_up_item(str)
	local regex1 = "^a%s+"
	local regex2 = "^an%s+"
	return string.gsub(string.gsub(str, regex1, ""), regex2, "")
end
