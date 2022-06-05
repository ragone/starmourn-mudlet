function starmourn.ui.init(event, package)
	if event == "sysInstall" then
		return
	end
	if starmourn.ui.loadTimer then
		killTimer(starmourn.ui.loadTimer)
	end
	starmourn.ui.loadTimer = tempTimer(0, function()
		starmourn.ui.update_stylesheet()
		starmourn.ui.set_borders()
		starmourn.ui.create_background()
		starmourn.ui.create_boxes()
		starmourn.ui.create_borders()
		starmourn.ui.modules.create()
		starmourn.ui.adj.top:show()
		starmourn.ui.adj.bottom:show()
		starmourn.ui.adj.topright:show()
		starmourn.ui.adj.bottomright:show()
		starmourn.ui.adj.topleft:show()
		starmourn.ui.adj.bottomleft:show()
		starmourn.ui.on_ship = false
		starmourn.ui.capacitor_bf = "No"
		starmourn.ui.engine_bf = "No"
		starmourn.ui.sensor_bf = "No"
		starmourn.ui.shield_bf = "No"
		starmourn.ui.sim_bf = "No"
		if starmourn.ui.chat.use then
			starmourn.ui.chat:create()
		end
		if starmourn.ui.mapper.use then
			starmourn.ui.mapper:create()
		end
		if starmourn.ui.info.use then
			starmourn.ui.info:create()
		end
		raiseEvent("starmourn.ui.loaded")
	end)
end

starmourn.utils.events.register("ui installed", "sysInstall", "starmourn.ui.init", "sysLuaInstallModule")
starmourn.utils.events.register("ui loaded", "sysLoadEvent", "starmourn.ui.init", "sysLuaInstallModule")
