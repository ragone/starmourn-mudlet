starmourn.ui.modules = starmourn.ui.modules or {}
starmourn.ui.modules.list = { "PVP", "Hunting", "Raiding", "Mining", "AFK" }
starmourn.ui.modules.status = starmourn.ui.modules.status or {}

function starmourn.ui.modules.create()
	-- starmourn.ui.header = Geyser.HBox:new({ name = 'starmourn.ui.header', x = 0, y = 0, width = '100%', height = '100%', }, starmourn.ui.top)

	-- local activecss = CSSMan.new([[
	--   background-color: rgba(0,0,0,100);
	--   border-style: solid;
	--   border-width: 1px;
	--   border-color: rgba(0, 175, 215, 100);
	--   border-radius: 5px;
	--   margin: 5px;
	--   qproperty-wordWrap: true;
	-- ]])

	-- local inactivecss = CSSMan.new([[
	--   background-color: rgba(0,0,0,100);
	--   border-style: solid;
	--   border-width: 1px;
	--   border-color: rgba(0,30,30, 100);
	--   border-radius: 5px;
	--   margin: 5px;
	--   qproperty-wordWrap: true;
	-- ]])

	-- table.foreach(starmourn.ui.modules.list, function(key, module)
	--                 starmourn.ui['module'..module] = Geyser.Label:new({ name = 'starmourn.ui.module.'..module }, starmourn.ui.header)
	--                 starmourn.ui['module'..module]:setClickCallback('starmourn.ui.modules.set', module)
	--                 starmourn.ui['module'..module]:setStyleSheet(inactivecss:getCSS())
	--                 -- starmourn.ui['module'..module]:echo(module, 'white', 'c')
	--                 starmourn.ui.modules.status[module] = false
	-- end)

	function starmourn.ui.modules.set(module, status)
		if type(status) == "boolean" then
			starmourn.ui.modules.status[module] = status
		else
			starmourn.ui.modules.status[module] = not starmourn.ui.modules.status[module]
		end
		raiseEvent("starmourn.ui.module", module)
		local css = (starmourn.ui.modules.status[module] and activecss or inactivecss):getCSS()
		-- if status then
		--   starmourn.ui['module'..module]:setFgColor('<0,175,215>')
		-- else
		--   starmourn.ui['module'..module]:setFgColor('white')
		-- end
		starmourn.ui["module" .. module]:setStyleSheet(css)
	end

	function starmourn.ui.modules.check(module)
		return starmourn.ui.modules.status[module]
	end
end
