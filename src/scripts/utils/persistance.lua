starmourn.utils.persistance = starmourn.utils.persistance or {}

function starmourn.utils.persistance.save(t)
	assert(
		type(t) == "string",
		"starmourn.utils.persistance.save: bad argument #1 type (string expected, got " .. type(t) .. ")"
	)
	assert(#t > 0, "starmourn.utils.persistance.save: string cannot be empty")

	t = "starmourn." .. t
	local sep = package.config:sub(1, 1) == "/" and "/" or "\\"
	local path = getMudletHomeDir() .. sep .. t
	assert(loadstring("if " .. t .. ' then table.save("' .. path .. '", ' .. t .. ") end"))()
end

function starmourn.utils.persistance.load(t)
	assert(
		type(t) == "string",
		"starmourn.utils.persistance.save: bad argument #1 type (string expected, got " .. type(t) .. ")"
	)
	assert(#t > 0, "starmourn.utils.persistance.save: string cannot be empty")

	t = "starmourn." .. t
	local sep = package.config:sub(1, 1) == "/" and "/" or "\\"
	local path = getMudletHomeDir() .. sep .. t
	assert(
		loadstring(
			"if not "
				.. t
				.. " then "
				.. t
				.. ' = {}; if lfs.attributes("'
				.. path
				.. '") then table.load("'
				.. path
				.. '", '
				.. t
				.. ") end end"
		)
	)()
end
