starmourn.ui.chat = starmourn.ui.chat or {}
starmourn.ui.chat.use = true
starmourn.ui.chat.config = starmourn.ui.chat.config or {}
starmourn.ui.chat.config.usetimestamp = "HH:mm:ss"
starmourn.ui.chat.config.timestampcustomcolor = false
starmourn.ui.chat.config.timestampfg = "white"
starmourn.ui.chat.config.timestampbg = "grey"
starmourn.ui.chat.config.channels = { "All", "Local", "Crew", "Clan", "Dynasty", "Faction", "Newbie" }
starmourn.ui.chat.config.alltab = "All"
starmourn.ui.chat.config.blink = true
starmourn.ui.chat.config.blinktime = 3
starmourn.ui.chat.config.blinkfromall = false
starmourn.ui.chat.config.fontsize = getFontSize() - 2
starmourn.ui.chat.config.preservebackground = true
starmourn.ui.chat.config.gag = false
starmourn.ui.chat.config.filterccc = false
starmourn.ui.chat.config.activecolors = { r = 20, g = 60, b = 20 }
starmourn.ui.chat.config.inactivecolors = { r = 60, g = 60, b = 60 }
starmourn.ui.chat.config.windowcolors = { r = 0, g = 0, b = 0 }
starmourn.ui.chat.config.activetabtext = "<0,175,215>"
starmourn.ui.chat.config.inactivetabtext = "white"
starmourn.ui.chat.currenttab = starmourn.ui.chat.currenttab
	or starmourn.ui.chat.config.alltab
	or starmourn.ui.chat.config.channels[1]
starmourn.ui.chat.tabstoblink = starmourn.ui.chat.tabstoblink or {}
starmourn.ui.chat.tabs = starmourn.ui.chat.tabs or {}
starmourn.ui.chat.windows = starmourn.ui.chat.windows or {}

local to_cmds = {
	["All"] = nil,
	["Clan"] = "clt",
	["Crew"] = "crt",
	["Dynasty"] = "dt",
	["Faction"] = "ft",
	["Local"] = "say",
	["Commerce"] = "commerce",
	["Conflict"] = nil,
	["Newbie"] = "newbie",
}

local activecss = CSSMan.new([[
  border-radius: 3px;
  border-style: solid;
  border-width: 1px;
  border-color: rgba(0, 175, 215, 100);
  margin: 1px;
]])

local inactivecss = CSSMan.new([[
  border-radius: 3px;
  border-style: solid;
  border-width: 1px;
  border-color: rgba(0, 30, 30, 100);
  margin: 1px;
]])

starmourn.ui.chat.switch = function(chat)
	local r = starmourn.ui.chat.config.inactivecolors.r
	local g = starmourn.ui.chat.config.inactivecolors.g
	local b = starmourn.ui.chat.config.inactivecolors.b
	local newr = starmourn.ui.chat.config.activecolors.r
	local newg = starmourn.ui.chat.config.activecolors.g
	local newb = starmourn.ui.chat.config.activecolors.b
	local oldchat = starmourn.ui.chat.currenttab
	if starmourn.ui.chat.currenttab ~= chat then
		starmourn.ui.chat.windows[oldchat]:hide()
		starmourn.ui.chat.tabs[oldchat]:setColor(r, g, b)
		starmourn.ui.chat.tabs[oldchat]:echo(oldchat, starmourn.ui.chat.config.inactivetabtext, "c")
		starmourn.ui.chat.tabs[oldchat]:setStyleSheet(inactivecss:getCSS())
		if starmourn.ui.chat.config.blink and starmourn.ui.chat.tabstoblink[chat] then
			starmourn.ui.chat.tabstoblink[chat] = nil
		end
		if starmourn.ui.chat.config.blink and chat == starmourn.ui.chat.config.alltab then
			starmourn.ui.chat.tabstoblink = {}
		end
	end
	starmourn.ui.chat.tabs[chat]:setColor(newr, newg, newb)
	starmourn.ui.chat.tabs[chat]:echo(chat, starmourn.ui.chat.config.activetabtext, "c")
	starmourn.ui.chat.tabs[chat]:setStyleSheet(activecss:getCSS())
	starmourn.ui.chat.windows[chat]:show()
	starmourn.ui.chat.currenttab = chat
end

function starmourn.ui.chat:resetUI()
	starmourn.ui.chat.container = starmourn.ui.topright
	starmourn.ui.chat.tabbox = Geyser.HBox:new({
		name = "starmourn.ui.chat.tabbox",
		x = "5%",
		y = "4%",
		width = "90%",
		height = "6%",
	}, starmourn.ui.chat.container)
end

function starmourn.ui.chat:create()
	starmourn.ui.chat:resetUI()

	local r = starmourn.ui.chat.config.inactivecolors.r
	local g = starmourn.ui.chat.config.inactivecolors.g
	local b = starmourn.ui.chat.config.inactivecolors.b
	local winr = starmourn.ui.chat.config.windowcolors.r
	local wing = starmourn.ui.chat.config.windowcolors.g
	local winb = starmourn.ui.chat.config.windowcolors.b

	for i, tab in ipairs(starmourn.ui.chat.config.channels) do
		starmourn.ui.chat.tabs[tab] = Geyser.Label:new(
			{ name = string.format("chattab%s", tab) },
			starmourn.ui.chat.tabbox
		)
		starmourn.ui.chat.tabs[tab]:echo(tab, starmourn.ui.chat.config.inactivetabtext, "c")
		starmourn.ui.chat.tabs[tab]:setColor(r, g, b)
		starmourn.ui.chat.tabs[tab]:setClickCallback("starmourn.ui.chat.switch", tab)
		starmourn.ui.chat.tabs[tab]:setStyleSheet(inactivecss:getCSS())
		starmourn.ui.chat.windows[tab] = Geyser.MiniConsole:new({
			name = string.format("chatwin%s", tab),
			x = "5%",
			y = "12%",
			autoWrap = true,
			fontSize = starmourn.ui.chat.config.fontsize,
			width = "90%",
			height = "85%",
		}, starmourn.ui.chat.container)
		starmourn.ui.chat.windows[tab]:setColor(winr, wing, winb)
		starmourn.ui.chat.windows[tab]:enableCommandLine()
		local cmdcss = CSSMan.new([[
  background-color: rgb(0,10,10);
]])
		starmourn.ui.chat.windows[tab]:setCmdLineStyleSheet(cmdcss:getCSS())

		local cmd = to_cmds[tab]
		local function channel_chat(text)
			if cmd then
				send(cmd .. " " .. text)
			else
				send(text)
			end
		end
		starmourn.ui.chat.windows[tab]:setCmdAction(channel_chat)
		starmourn.ui.chat.windows[tab]:hide()
	end

	starmourn.ui.chat.switch(starmourn.ui.chat.config.alltab or starmourn.ui.chat.config.channels[1])
	if starmourn.ui.chat.config.blink and not starmourn.ui.chat.blinktimerOn then
		starmourn.ui.chat:blink()
	end
end

function starmourn.ui.chat:append(chat)
	local r = starmourn.ui.chat.config.windowcolors.r
	local g = starmourn.ui.chat.config.windowcolors.g
	local b = starmourn.ui.chat.config.windowcolors.b
	selectCurrentLine()
	local ofr, ofg, ofb = getFgColor()
	local obr, obg, obb = getBgColor()
	if starmourn.ui.chat.config.preservebackground then
		setBgColor(r, g, b)
	end
	copy()
	if starmourn.ui.chat.config.timestamp then
		local timestamp = getTime(true, starmourn.ui.chat.config.timestamp)
		local tsfg = {}
		local tsbg = {}
		local colorLeader = ""
		if starmourn.ui.chat.config.timestampcustomcolor then
			if type(starmourn.ui.chat.config.timestampfg) == "string" then
				tsfg = color_table[starmourn.ui.chat.config.timestampfg]
			else
				tsfg = starmourn.ui.chat.config.timestampfg
			end
			if type(starmourn.ui.chat.config.timestampbg) == "string" then
				tsbg = color_table[starmourn.ui.chat.config.timestampbg]
			else
				tsbg = starmourn.ui.chat.config.timestampbg
			end
			colorLeader = string.format("<%s,%s,%s:%s,%s,%s>", tsfg[1], tsfg[2], tsfg[3], tsbg[1], tsbg[2], tsbg[3])
		else
			colorLeader = string.format("<%s,%s,%s:%s,%s,%s>", ofr, ofg, ofb, obr, obg, obb)
		end
		local fullstamp = string.format("%s%s", colorLeader, timestamp)
		starmourn.ui.chat.windows[chat]:decho(fullstamp)
		starmourn.ui.chat.windows[chat]:echo(" ")
		if starmourn.ui.chat.config.alltab then
			starmourn.ui.chat.windows[starmourn.ui.chat.config.alltab]:decho(fullstamp)
			starmourn.ui.chat.windows[starmourn.ui.chat.config.alltab]:echo(" ")
		end
	end
	starmourn.ui.chat.windows[chat]:append()
	if starmourn.ui.chat.config.gag then
		deleteLine()
		tempLineTrigger(1, 1, [[if isPrompt() then deleteLine() end]])
	end
	if starmourn.ui.chat.config.alltab then
		appendBuffer(string.format("chatwin%s", starmourn.ui.chat.config.alltab))
	end
	if starmourn.ui.chat.config.blink and chat ~= starmourn.ui.chat.currenttab then
		if
			(starmourn.ui.chat.config.alltab == starmourn.ui.chat.currenttab)
			and not starmourn.ui.chat.config.blinkonall
		then
			return
		else
			starmourn.ui.chat.tabstoblink[chat] = true
		end
	end
end

function starmourn.ui.chat:blink()
	if starmourn.ui.chat.blinkID then
		killTimer(starmourn.ui.chat.blinkID)
	end
	if not starmourn.ui.chat.config.blink then
		starmourn.ui.chat.blinktimerOn = false
		return
	end
	if not starmourn.ui.chat.container.hidden then
		for tab, _ in pairs(starmourn.ui.chat.tabstoblink) do
			starmourn.ui.chat.tabs[tab]:flash()
		end
	end
	starmourn.ui.chat.blinkID = tempTimer(starmourn.ui.chat.config.blinktime, function()
		starmourn.ui.chat:blink()
	end)
end

function starmourn.ui.chat:cecho(chat, message)
	local alltab = starmourn.ui.chat.config.alltab
	local blink = starmourn.ui.chat.config.blink
	cecho(string.format("chatwin%s", chat), message)
	if alltab and chat ~= alltab then
		cecho(string.format("chatwin%s", alltab), message)
	end
	if blink and chat ~= starmourn.ui.chat.currenttab then
		if (alltab == starmourn.ui.chat.currenttab) and not starmourn.ui.chat.config.blinkonall then
			return
		else
			starmourn.ui.chat.tabstoblink[chat] = true
		end
	end
end

function starmourn.ui.chat:decho(chat, message)
	local alltab = starmourn.ui.chat.config.alltab
	local blink = starmourn.ui.chat.config.blink
	decho(string.format("chatwin%s", chat), message)
	if alltab and chat ~= alltab then
		decho(string.format("chatwin%s", alltab), message)
	end
	if blink and chat ~= starmourn.ui.chat.currenttab then
		if (alltab == starmourn.ui.chat.currenttab) and not starmourn.ui.chat.config.blinkonall then
			return
		else
			starmourn.ui.chat.tabstoblink[chat] = true
		end
	end
end

function starmourn.ui.chat:hecho(chat, message)
	local alltab = starmourn.ui.chat.config.alltab
	local blink = starmourn.ui.chat.config.blink
	hecho(string.format("chatwin%s", chat), message)
	if alltab and chat ~= alltab then
		hecho(string.format("chatwin%s", alltab), message)
	end
	if blink and chat ~= starmourn.ui.chat.currenttab then
		if (alltab == starmourn.ui.chat.currenttab) and not starmourn.ui.chat.config.blinkonall then
			return
		else
			starmourn.ui.chat.tabstoblink[chat] = true
		end
	end
end

function starmourn.ui.chat:echo(chat, message)
	local alltab = starmourn.ui.chat.config.alltab
	local blink = starmourn.ui.chat.config.blink
	echo(string.format("chatwin%s", chat), message)
	if alltab and chat ~= alltab then
		echo(string.format("chatwin%s", alltab), message)
	end
	if blink and chat ~= starmourn.ui.chat.currenttab then
		if (alltab == starmourn.ui.chat.currenttab) and not starmourn.ui.chat.config.blinkonall then
			return
		else
			starmourn.ui.chat.tabstoblink[chat] = true
		end
	end
end

function starmourn.ui.chat.handle_comm_channel_text()
	local talker = gmcp.Comm.Channel.Text.talker

	if
		starmourn.ui.chat.config.filterccc
		and (
			not gmcp.Comm.Channel.Players
			or (not table.contains(gmcp.Comm.Channel.Players, talker) and not (talker == gmcp.Char.Name.name))
		)
	then
		return
	end

	local channels = starmourn.ui.chat.config.channels
	local gmcpChannel = gmcp.Comm.Channel.Text.channel:lower()
	local text = ansi2decho(gmcp.Comm.Channel.Text.text)
	local raw = text:gsub("<.->", "")
	local r = starmourn.ui.chat.config.windowcolors.r
	local g = starmourn.ui.chat.config.windowcolors.g
	local b = starmourn.ui.chat.config.windowcolors.b

	if starmourn.ui.chat.config.preservebackground then
		text = text:gsub(":>", string.format(":%s,%s,%s>", r, g, b))
	end

	local to_channel = {
		["say"] = "Local",
		["yell"] = "Local",
		["ft"] = "Faction",
		["clt"] = "Clan",
		["dt"] = "Dynasty",
		["ooc"] = "Local",
		["emote"] = "Local",
		["market"] = "Clan",
		["conflict"] = "Clan",
	}

	local channel = table.contains(channels, gmcpChannel:title()) and gmcpChannel:title() or to_channel[gmcpChannel]

	if not channel then
		if gmcpChannel:starts("tell") then
			channel = "Local"
		else
			cecho("\n<red>Unknown Channel: <yellow>" .. gmcpChannel)
			return
		end
	end

	starmourn.ui.chat:decho(channel, text .. "\n")

	if starmourn.ui.chat.config.gag then
		tempExactMatchTrigger(raw, function()
			deleteLine()
			tempLineTrigger(1, 1, [[if isPrompt() then deleteLine() end]])
		end, 1)
	end
end

starmourn.utils.events.register("gmcp comms", "gmcp.Comm.Channel.Text", "starmourn.ui.chat.handle_comm_channel_text")
