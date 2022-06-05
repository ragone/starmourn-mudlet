starmourn.ui = starmourn.ui or {}
starmourn.ui.fontsize = getFontSize() - 3

function starmourn.ui.update_stylesheet()
	local background_color = "rgba(0, 0, 0, 100)"
	local background_color_lighter = "rgba(0, 0, 0, 100)"
	local background_color_hover = "rgba(0, 60, 60, 100)"
	local border_color = "rgba(40, 60, 60, 100)"
	local border_color_hover = "rgba(40, 60, 60)"
	local font_color = "#e5ae69"
	local font_color_hover = "#faf3ea"
	local border_radius_one = "5px"
	local border_radius_two = "5px"
	local font_size_settings = "13px"

	setAppStyleSheet([[
    QMainWindow {
      background: ]] .. background_color .. [[;
    }

    QToolBar {
      background: ]] .. background_color .. [[;
    }

    QWidget {
      /*font-size: ]] .. font_size_settings .. [[;*/
      color: ]] .. font_color .. [[;
      background-color: ]] .. background_color .. [[;
      selection-background-color: ]] .. border_color .. [[;	/* selected text bg-color */
      /*selection-color: #eff0f1;*/	/* selected text color */
      /*background-clip: border;*/
      /*border-image: none;*/
      border: 0px transparent ]] .. border_color .. [[;
      /*outline: 0;*/
    }

    QWidget:hover {
      color: ]] .. font_color_hover .. [[;
    }

    QWidget:item {
      background-color: ]] .. background_color .. [[;
      color: ]] .. font_color_hover .. [[;
    }

    QWidget:item:hover {
      background-color: ]] .. background_color_hover .. [[;
      color: ]] .. font_color_hover .. [[;
    }

    QWidget:item:selected {
      background-color: ]] .. background_color_hover .. [[;
    }

    QLineEdit {
      background-color: ]] .. background_color .. [[;
      padding: 5px;
      border-radius: ]] .. border_radius_two .. [[;
    }

    QLineEdit:hover,
    QLineEdit:focus {
      color: ]] .. font_color .. [[;
      background-color: ]] .. background_color_hover .. [[;
    }

    QGroupBox {
      border: 1px solid ]] .. background_color_hover .. [[;
      border-radius: ]] .. border_radius_two .. [[;
      margin-top: 20px;
    }

    QGroupBox::title {
      subcontrol-origin: margin;
      subcontrol-position: top center;
      padding-left: 10px;
      padding-right: 10px;
      padding-top: 10px;
    }

  /*  QAbstractScrollArea {
      border-radius: ]] .. border_radius_two .. [[;
      background-color: ]] .. background_color_lighter .. [[;
    }*/


    QPlainTextEdit {
      border-top: 1px solid ]] .. border_color .. [[;
      /*border-radius: ]] .. border_radius_two .. [[;*/
      padding: 3px 8px;
      background-color: rgb(0, 10, 10);
    }

    QSizeGrip {
      background-color: ]] .. border_color .. [[;
    }

    QPushButton {
      border-radius: ]] .. border_radius_two .. [[;
    }

    QPushButton:hover {
      background-color: ]] .. background_color_hover .. [[;
    }

    QPushButton:disabled {
      background-color: ]] .. background_color_lighter .. [[;
    }


    QComboBox {
      background-color: ]] .. background_color_lighter .. [[;
      border-radius: ]] .. border_radius_two .. [[;
      padding: 5px;
    }

    QComboBox:hover,
    QComboBox:focus {
      background-color: ]] .. background_color_hover .. [[;
    }

    QSpinBox {
      background-color: ]] .. background_color_lighter .. [[;
      padding: 5px;
      border-radius: ]] .. border_radius_two .. [[;
    }

    QSpinBox:hover {
      background-color: ]] .. background_color_hover .. [[;
    }

    QTabWidget::pane {
      border: 0px solid ]] .. background_color_hover .. [[;
      /*padding: 5px;*/
      /*margin: 0px;*/
    }

    QTabWidget::tab-bar {
      left: 10px;
    }

    QTabBar {
      qproperty-drawBase: 0;
      border-bottom: 2px solid ]] .. background_color_hover .. [[;
    }

    QTabBar::tab:top {
      color: ]] .. font_color .. [[;
      border: 2px solid ]] .. background_color_hover .. [[;
      background-color: ]] .. background_color .. [[;
      padding: 5px;
      margin-right: 5px;
      min-width: 50px;
      border-top-left-radius: ]] .. border_radius_two .. [[;
      border-top-right-radius: ]] .. border_radius_two .. [[;
    }

    QTabBar::tab:top:selected {
      border-bottom: 2px solid ]] .. border_color .. [[;
      background-color: ]] .. background_color_hover .. [[;
    }

    QTabBar::tab:top:!selected:hover {
      color: ]] .. font_color_hover .. [[;
      background-color: ]] .. background_color_hover .. [[;
    }

    QListView {
      background-color: ]] .. background_color_lighter .. [[;
      padding: 5px;
      border-radius: ]] .. border_radius_two .. [[;
    }

    QListView::item {
      background-color: ]] .. background_color_lighter .. [[;
      color: ]] .. font_color .. [[;
      border-radius: ]] .. border_radius_two .. [[;
      margin: 2px;
    }

    QListView::item:!selected {
      background-color: ]] .. background_color_lighter .. [[;
      color: ]] .. font_color .. [[;
    }

    QListView::item:!selected:hover {
      background-color: ]] .. background_color_hover .. [[;
      color: ]] .. font_color_hover .. [[;
    }

    QToolButton {
      background: ]] .. background_color .. [[;
      border-style: solid;
      border-width: 2px;
      border-color: ]] .. border_color .. [[;
      border-radius: ]] .. border_radius_one .. [[;
      color: ]] .. font_color .. [[;
      margin: 2px;
      font-size: 10pt;
    }

    QToolButton:hover {
      color: ]] .. font_color .. [[;
      background: ]] .. background_color_hover .. [[;
      border-color: ]] .. border_color_hover .. [[;
      padding-top: 2px;
    }

    QDockWidget {
      color: ]] .. font_color_hover .. [[;
      background: ]] .. border_color .. [[;
    }

    QDockWidget:hover {
      color: ]] .. font_color .. [[;
      background: ]] .. background_color_hover .. [[;
      border-color: ]] .. border_color_hover .. [[;
      padding-top: 2px;
    }

    QStatusBar {
      background: ]] .. border_color .. [[;
      color: ]] .. font_color_hover .. [[;
    }

    QStatusBar:hover {
      color: ]] .. font_color .. [[;
      background: ]] .. background_color_hover .. [[;
      border-color: ]] .. border_color_hover .. [[;
      padding-top: 2px;
    }

    QScrollBar:vertical {
      background: ]] .. background_color .. [[;
      width: 15px;
      margin: 22px 0 22px 0;
    }

    QScrollBar::handle:vertical {
      background-color: ]] .. background_color .. [[;
      min-height: 20px;
      border-width: 2px;
      border-style: solid;
      border-color: ]] .. border_color .. [[;
      border-radius: 7px;
    }

    QScrollBar::add-line:vertical {
      background-color: ]] .. background_color .. [[;
      border-width: 2px;
      border-style: solid;
      border-color: ]] .. border_color .. [[;
      border-bottom-left-radius: 7px;
      border-bottom-right-radius: 7px;
      height: 15px;
      subcontrol-position: bottom;
      subcontrol-origin: margin;
    }

    QScrollBar::add-line:vertical:hover,
    QScrollBar::sub-line:vertical:hover,
    QScrollBar::handle:vertical:hover {
      border-color: ]] .. border_color_hover .. [[;
      background-color: ]] .. background_color_hover .. [[;
    }

    QScrollBar::sub-line:vertical {
      background-color: ]] .. background_color .. [[;
      border-width: 2px;
      border-style: solid;
      border-color: ]] .. border_color .. [[;
      border-top-left-radius: 7px;
      border-top-right-radius: 7px;
      height: 15px;
      subcontrol-position: top;
      subcontrol-origin: margin;
    }

    QScrollBar::up-arrow:vertical, QScrollBar::down-arrow:vertical {
      background: white;
      width: 4px;
      height: 3px;
    }

    QScrollBar::add-page:vertical, QScrollBar::sub-page:vertical {
      background: none;
    }

  /* horizontal scroll */

    QScrollBar:horizontal {
      background: ]] .. background_color .. [[;
      height: 25px;
      margin: 0 22px 10px 22px;
    }

    QScrollBar::handle:horizontal {
      background-color: ]] .. background_color .. [[;
      min-width: 20px;
      border-width: 2px;
      border-style: solid;
      border-color: ]] .. border_color .. [[;
      border-radius: 7px;
    }

    QScrollBar::add-line:horizontal {
      background-color: ]] .. background_color .. [[;
      border-width: 2px;
      border-style: solid;
      border-color: ]] .. border_color .. [[;
      border-top-right-radius: 7px;
      border-bottom-right-radius: 7px;
      height: 11px;
      width: 15px;
      subcontrol-position: right;
      subcontrol-origin: margin;
      margin-bottom: 10px;
    }

    QScrollBar::sub-line:horizontal {
      background-color: ]] .. background_color .. [[;
      border-width: 2px;
      border-style: solid;
      border-color: ]] .. border_color .. [[;
      border-top-left-radius: 7px;
      border-bottom-left-radius: 7px;
      height: 11px;
      width: 15px;
      subcontrol-position: left;
      subcontrol-origin: margin;
      margin-bottom: 10px;
    }

    QScrollBar::add-line:horizontal:hover,
    QScrollBar::sub-line:horizontal:hover,
    QScrollBar::handle:horizontal:hover {
      border-color: ]] .. border_color_hover .. [[;
      background-color: ]] .. background_color_hover .. [[;
    }

    QScrollBar::add-page:horizontal, QScrollBar::sub-page:horizontal {
      background: none;
    }
  ]])
end

function starmourn.ui.create_background()
	local backgroundcss = CSSMan.new([[ background-color: rgb(0,0,0); ]])
	starmourn.ui.adj = starmourn.ui.adj or {}
	starmourn.ui.adj.top = Adjustable.Container:new({
		name = "starmourn.ui.adj.top",
		x = "25%",
		y = 0,
		width = "50%",
		height = "140px",
		autoLoad = false,
	})
	starmourn.ui.adj.bottom = Adjustable.Container:new({
		name = "Gauges",
		x = "25%",
		y = "90%",
		width = "50%",
		height = "10%",
	})
	starmourn.ui.adj.left = Adjustable.Container:new({
		name = "Starchart",
		x = "25%",
		y = "5%",
		width = "61c",
		height = "40c",
	})
	starmourn.ui.adj.right = Adjustable.Container:new({
		name = "Beacon",
		x = "25%+61c",
		y = "5%",
		width = "82c",
		height = "25%",
	})
	starmourn.ui.left = Geyser.Label:new(
		{ name = "starmourn.ui.left", x = 0, y = 0, width = "100%", height = "100%" },
		starmourn.ui.adj.left
	)
	starmourn.ui.left:setStyleSheet(backgroundcss:getCSS())

	starmourn.ui.right = Geyser.Label:new(
		{ name = "starmourn.ui.right", x = 0, y = 0, width = "100%", height = "100%" },
		starmourn.ui.adj.right
	)
	starmourn.ui.right:setStyleSheet(backgroundcss:getCSS())

	starmourn.ui.top = Geyser.Label:new(
		{ name = "starmourn.ui.top", x = 0, y = 0, width = "100%", height = "100%" },
		starmourn.ui.adj.top
	)

	starmourn.ui.top:setStyleSheet([[
    margin: 20px;
    image: url(]] .. getMudletHomeDir() .. [[/@PKGNAME@/logo.jpg);
    background-color: #000000;
	]])
	starmourn.ui.top:setClickCallback(starmourn.ui.header.click)
	starmourn.ui.top:setCursor("ResizeVertical")

	starmourn.ui.bottom = Geyser.Label:new(
		{ name = "starmourn.ui.bottom", x = 0, y = 0, width = "100%", height = "100%" },
		starmourn.ui.adj.bottom
	)
	starmourn.ui.bottom:setStyleSheet(backgroundcss:getCSS())
end

function starmourn.ui.update_windows()
	starmourn.ui.adj.bottom:show()
	starmourn.ui.adj.topright:show()
	starmourn.ui.adj.bottomright:show()
	starmourn.ui.adj.topleft:show()
	starmourn.ui.adj.bottomleft:show()
	starmourn.ui.adj.left:hide()
	starmourn.ui.adj.right:hide()

	starmourn.ui.adj.topright:attachToBorder("right")
	starmourn.ui.adj.bottomright:attachToBorder("right")
	starmourn.ui.adj.topleft:attachToBorder("left")
	starmourn.ui.adj.bottomleft:attachToBorder("left")
	starmourn.ui.adj.top:attachToBorder("top")
	starmourn.ui.adj.bottom:attachToBorder("bottom")

	starmourn.ui.adj.top:lockContainer()
	starmourn.ui.adj.bottom:lockContainer()
	starmourn.ui.adj.topright:lockContainer()
	starmourn.ui.adj.bottomright:lockContainer()
	starmourn.ui.adj.topleft:lockContainer()
	starmourn.ui.adj.bottomleft:lockContainer()
end

function starmourn.ui.create_borders()
	local containers = { "topright", "topleft", "bottomright", "bottomleft" }
	for _, container in pairs(containers) do
		-- Topright
		local top = Geyser.Label:new(
			{ name = container .. "top", x = 0, y = 0, width = "100%", height = "42px" },
			starmourn.ui.adj[container]
		)
		top:setStyleSheet([[
      border-image: url(]] .. getMudletHomeDir() .. [[/@PKGNAME@/top.png);
    ]])

		local bottom = Geyser.Label:new(
			{ name = container .. "bottom", x = 0, y = "100%-11px", width = "100%", height = "11px" },
			starmourn.ui.adj[container]
		)
		bottom:setStyleSheet([[
      border-image: url(]] .. getMudletHomeDir() .. [[/@PKGNAME@/bottom.png);
    ]])

		local right = Geyser.Label:new(
			{ name = container .. "right", x = "100%-35px", y = "42px", width = "35px", height = "100%-53px" },
			starmourn.ui.adj[container]
		)
		right:setStyleSheet([[
      border-image: url(]] .. getMudletHomeDir() .. [[/@PKGNAME@/right.png);
    ]])

		local left = Geyser.Label:new(
			{ name = container .. "left", x = 0, y = "42px", width = "34px", height = "100%-53px" },
			starmourn.ui.adj[container]
		)
		left:setStyleSheet([[
      border-image: url(]] .. getMudletHomeDir() .. [[/@PKGNAME@/left.png);
    ]])
	end

	local header = Geyser.Label:new(
		{ name = "headerbottom", x = 0, y = "100%-11px", width = "100%", height = "11px" },
		starmourn.ui.adj.top
	)
	header:setStyleSheet([[
      border-image: url(]] .. getMudletHomeDir() .. [[/@PKGNAME@/bottom.png);
    ]])
end

function starmourn.ui.create_boxes()
	local boxcss = CSSMan.new([[
    background-color: rgb(0,0,0);
      font-family: Bitstream Vera Sans Mono;
  ]])

	local termcss = CSSMan.new([[
    background-color: rgb(13,23,19);
      font-family: Bitstream Vera Sans Mono;
  ]])
	starmourn.ui.helpwindow = Geyser.UserWindow:new({
		name = "helpwindow",
		x = "20%",
		y = "20%",
		width = "50%",
		height = "40%",
	})

	starmourn.ui.helpwindow:setStyleSheet(termcss:getCSS())
	starmourn.ui.helpwindow:hide()

	starmourn.ui.helpterm = Geyser.MiniConsole:new({
		name = "help",
		x = "5%",
		y = "5%",
		autoWrap = true,
		fontSize = starmourn.ui.fontsize,
		width = "90%",
		height = "90%",
	}, starmourn.ui.helpwindow)

	local winr = starmourn.ui.info.config.windowcolors.r
	local wing = starmourn.ui.info.config.windowcolors.g
	local winb = starmourn.ui.info.config.windowcolors.b
	starmourn.ui.helpterm:setColor(0, 0, 0)

	starmourn.ui.adj = starmourn.ui.adj or {}
	starmourn.ui.adj.topright = Adjustable.Container:new({
		name = "Chat",
		x = "75%",
		y = 0,
		width = "25%",
		height = "50%",
		fontSize = starmourn.ui.fontsize,
	})
	starmourn.ui.adj.bottomright = Adjustable.Container:new({
		name = "Room Info",
		x = "75%",
		y = "50%",
		width = "25%",
		height = "50%",
		fontSize = starmourn.ui.fontsize,
	})
	starmourn.ui.adj.topleft = Adjustable.Container:new({
		name = "Map",
		x = "0%",
		y = "0%",
		width = "25%",
		height = "75%",
		fontSize = starmourn.ui.fontsize,
	})
	starmourn.ui.adj.bottomleft = Adjustable.Container:new({
		name = "Mindsim",
		x = "0%",
		y = "75%",
		width = "25%",
		height = "25%",
		fontSize = starmourn.ui.fontsize,
	})

	starmourn.ui.topright = Geyser.Label:new({
		name = "starmourn.ui.topright",
		x = 35,
		y = 30,
		width = "100%-70px",
		height = "100%-41px",
		fontSize = starmourn.ui.fontsize,
	}, starmourn.ui.adj.topright)
	starmourn.ui.topright:setStyleSheet(boxcss:getCSS())

	starmourn.ui.bottomright = Geyser.Label:new({
		name = "starmourn.ui.bottomright",
		x = 35,
		y = 30,
		width = "100%-70px",
		height = "100%-41px",
		fontSize = starmourn.ui.fontsize,
	}, starmourn.ui.adj.bottomright)
	starmourn.ui.bottomright:setStyleSheet(boxcss:getCSS())

	starmourn.ui.topleft = Geyser.Label:new({
		name = "starmourn.ui.topleft",
		x = 35,
		y = 30,
		width = "100%-70px",
		height = "100%-41px",
		fontSize = starmourn.ui.fontsize,
	}, starmourn.ui.adj.topleft)
	starmourn.ui.topleft:setStyleSheet(boxcss:getCSS())

	starmourn.ui.bottomleft = Geyser.Label:new({
		name = "starmourn.ui.bottomleft",
		x = 35,
		y = 30,
		width = "100%-70px",
		height = "100%-41px",
		fontSize = starmourn.ui.fontsize,
	}, starmourn.ui.adj.bottomleft)

	starmourn.ui.bottomleft:setStyleSheet([[
		font-family: Bitstream Vera Sans Mono;
	]])
	setWindowWrap(getColumnCount())
end

function starmourn.ui.create_gauges(class)
	starmourn.ui.footer = Geyser.VBox:new(
		{ name = "starmourn.ui.footer", x = 0, y = 0, width = "100%", height = "100%" },
		starmourn.ui.bottom
	)

	starmourn.ui.hp_box = Geyser.HBox:new({ name = "starmourn.ui.hp_box" }, starmourn.ui.footer)
	starmourn.ui.char = Geyser.HBox:new(
		{ name = "starmourn.ui.char", x = 0, y = 0, width = "100%", height = "100%" },
		starmourn.ui.footer
	)

	starmourn.ui.leftcolumn = Geyser.VBox:new({ name = "starmourn.ui.leftcolumn" }, starmourn.ui.char)

	if class == "Nanoseer" then
		starmourn.ui.middlecolumn = Geyser.VBox:new({ name = "starmourn.ui.middlecolumn" }, starmourn.ui.char)
	end

	starmourn.ui.rightcolumn = Geyser.VBox:new({ name = "starmourn.ui.rightcolumn" }, starmourn.ui.char)

	local backcss = CSSMan.new([[
    background-color: rgba(0,0,0,0);
    border-style: solid;
    border-color: grey;
    border-width: 1px;
    border-radius: 5px;
    margin: 5px;
  ]])

	local frontcss = CSSMan.new([[
    background-color: rgba(0,0,0,0);
    border-style: solid;
    border-color: grey;
    border-width: 1px;
    border-radius: 5px;
    margin: 5px;
  ]])

	local function gauge(name, column, bgc)
		starmourn.ui[name] = Geyser.Gauge:new({ name = "starmourn.ui." .. name }, column)
		starmourn.ui[name].back:setStyleSheet(backcss:getCSS())
		frontcss:set("background-color", bgc)
		starmourn.ui[name].front:setStyleSheet(frontcss:getCSS())
		starmourn.ui[name]:setValue(100, 100)
	end

	gauge("health", starmourn.ui.hp_box, "brown")

	gauge("target", starmourn.ui.leftcolumn, "#8700AF")
	starmourn.ui.target:setValue(0, 100)

	if class == "Nanoseer" then
		gauge("nanites", starmourn.ui.middlecolumn, "navy")
		gauge("sanity", starmourn.ui.rightcolumn, "purple")
	elseif class == "Engineer" then
		gauge("parts", starmourn.ui.rightcolumn, "blue")
	elseif class == "B.E.A.S.T." then
		gauge("plasma", starmourn.ui.rightcolumn, "firebrick")
	elseif class == "Scoundrel" then
		gauge("bullets", starmourn.ui.rightcolumn, "orange")
	elseif class == "Fury" then
		gauge("rage", starmourn.ui.rightcolumn, "red")
	end
end

function starmourn.ui.handle_char_name()
	sendGMCP('Core.Supports.Add ["Comm.Channel 1"]')
	sendGMCP('Core.Supports.Add ["IRE.Tasks 1"]')
	sendGMCP('Core.Supports.Add ["IRE.Target 1"]')
	sendGMCP('Comm.Channel.Players ""')
end

local function get_system_color(amount)
	amount = tonumber(amount)
	if amount > 92.5 then
		return "MistyRose"
	elseif amount > 70 then
		return "yellow"
	elseif amount > 30 then
		return "orange"
	else
		return "red"
	end
end

function starmourn.ui.update_mindsim()
	if not gmcp.Char.Vitals then
		return
	end

	local class = gmcp.Char.Status.class

	if not starmourn.ui.footer then
		starmourn.ui.create_gauges(class)
	end
	if gmcp.IRE and gmcp.IRE.Target and type(gmcp.IRE.Target.Info) == "table" and gmcp.IRE.Target.Info.hpperc ~= "" then
		local target_hp_raw = gmcp.IRE.Target.Info.hpperc:gsub("%%", "")
		local target_name = table.n_filter(starmourn.ui.info.room_items, function(item)
			return item.id == gmcp.IRE.Target.Info.id
		end)
		starmourn.ui.target:setValue(
			tonumber(target_hp_raw),
			100,
			'<center><font color="LightGrey"><font color="LightGrey">' .. target_name[1].name
		)
	else
		starmourn.ui.target:setValue(0, 100, '<center><font color="LightGrey"><font color="LightGrey">No target')
	end

	starmourn.ui.health:setValue(
		tonumber(gmcp.Char.Vitals.hp),
		tonumber(gmcp.Char.Vitals.maxhp),
		'<center><font color="LightGrey"><font color="LightGrey">Health: '
			.. string.format("%s / %s", gmcp.Char.Vitals.hp, gmcp.Char.Vitals.maxhp)
	)

	if class == "Nanoseer" then
		starmourn.ui.nanites:setValue(
			tonumber(gmcp.Char.Vitals.nn),
			tonumber(gmcp.Char.Vitals.maxnn),
			'<center><font color="LightGrey">Nanites: ' .. gmcp.Char.Vitals.formatnn
		)
		starmourn.ui.sanity:setValue(
			tonumber(gmcp.Char.Vitals.sa),
			tonumber(gmcp.Char.Vitals.maxsa),
			'<center><font color="LightGrey">Sanity: ' .. gmcp.Char.Vitals.formatsa
		)
	elseif class == "Engineer" then
		starmourn.ui.parts:setValue(
			tonumber(gmcp.Char.Vitals.pt),
			tonumber(gmcp.Char.Vitals.maxpt),
			'<center><font color="LightGrey">Parts: ' .. gmcp.Char.Vitals.formatpt
		)
	elseif class == "B.E.A.S.T." then
		starmourn.ui.plasma:setValue(
			tonumber(gmcp.Char.Vitals.pl),
			tonumber(gmcp.Char.Vitals.maxpl),
			'<center><font color="LightGrey">Plasma: ' .. gmcp.Char.Vitals.formatpl
		)
	elseif class == "Scoundrel" then
		starmourn.ui.bullets:setValue(
			tonumber(gmcp.Char.Vitals.bl),
			tonumber(gmcp.Char.Vitals.maxbl or 8),
			'<center><font color="LightGrey">Bullets: ' .. gmcp.Char.Vitals.formatbl
		)
	elseif class == "Fury" then
		starmourn.ui.rage:setValue(
			tonumber(gmcp.Char.Vitals.rg),
			1000,
			'<center><font color="LightGrey">Rage: ' .. gmcp.Char.Vitals.formatrg
		)
	end

	if not (gmcp.Char.Vitals.ship_bearing == nil) then
		local vitals = gmcp.Char.Vitals
		local ship_dmg_cap = 100 - tonumber(vitals.ship_dmg_cap)
		local ship_dmg_engine = 100 - tonumber(vitals.ship_dmg_engine)
		local ship_dmg_sensor = 100 - tonumber(vitals.ship_dmg_sensor)
		local ship_dmg_shield = 100 - tonumber(vitals.ship_dmg_shield)
		local ship_dmg_sim = 100 - tonumber(vitals.ship_dmg_sim)
		local shields_perc = round(gmcp.Char.Vitals.ship_shield / gmcp.Char.Vitals.ship_shield_max * 100)
		local hull_perc = round(gmcp.Char.Vitals.ship_hull / gmcp.Char.Vitals.ship_hull_max * 100)
		if shields_perc >= 100 then
			spacer1 = 3
		elseif shields_perc < 10 then
			spacer1 = 1
		else
			spacer1 = 2
		end
		if hull_perc >= 100 then
			spacer2 = 3
		elseif hull_perc < 10 then
			spacer2 = 1
		else
			spacer2 = 2
		end
		starmourn.ui.bottomleft:echo([[
    <p align="center">
      <font color="#00afd7">ShipSim Interface:<font color="#d7ff87"> ]] .. gmcp.Char.Vitals.ship_name .. [[</font>
    </p>
    <table align="center">
      <tr>
        <td align="right">
          <font color="#005eff">Name:</font>
        </td>
        <td>
          <font color="white">]] .. gmcp.Char.Name.name .. [[</font>
        </td>
        <td align="right">
          <font color="#005eff">Capacitor:</font>
        </td>
        <td>
          <font color="]] .. get_system_color(ship_dmg_cap) .. [[">]] .. ship_dmg_cap .. [[</font>&nbsp;(]] .. starmourn.ui.capacitor_bf .. [[</font>)]] .. [[
        </td>
      </tr>
      <tr>
        <td align="right">
          <font color="#005eff">Level:</font>
        </td>
        <td>
          <font color="white">]] .. gmcp.Char.Status.level .. [[</font>
        </td>
        <td align="right">
          <font color="#005eff">Engine:</font>
        </td>
        <td>
          <font color="]] .. get_system_color(ship_dmg_engine) .. [[">]] .. ship_dmg_engine .. [[</font>&nbsp;(]] .. starmourn.ui.engine_bf .. [[</font>)]] .. [[
        </td>
      </tr>
      <tr>
        <td align="right">
          <font color="#005eff">Class:</font>
        </td>
        <td>
          <font color="white">]] .. class .. [[</font>
        </td>
        <td align="right">
          <font color="#005eff">Sensor:</font>
        </td>
        <td>
          <font color="]] .. get_system_color(ship_dmg_sensor) .. [[">]] .. ship_dmg_sensor .. [[</font>&nbsp;(]] .. starmourn.ui.sensor_bf .. [[</font>)]] .. [[
        </td>
      </tr>
      <tr>
        <td align="right">
          <font color="#005eff">Marks</font><font color="#005eff">:</font>
        </td>
        <td>
          <font color="white">]] .. gmcp.Char.Status.marks .. [[</font>
        </td>
        <td align="right">
          <font color="#005eff">Shield:</font>
        </td>
        <td>
          <font color="]] .. get_system_color(ship_dmg_shield) .. [[">]] .. ship_dmg_shield .. [[</font>&nbsp;(]] .. starmourn.ui.shield_bf .. [[</font>)]] .. [[
        </td>
      </tr>
      <tr>
        <td align="right">
          <font color="#005eff">Health</font><font color="#005eff">:</font>
        </td>
        <td>
          <font color="]] .. get_system_color(hull_perc) .. [[">]] .. hull_perc .. [[</font> ]] .. [[<font color = "cyan">(</font><font color="]] .. get_system_color(
			shields_perc
		) .. [[">]] .. shields_perc .. [[</font><font color = "cyan">)</font>
        </td>
        <td align="right">
          <font color="#005eff">ShipSim:</font>
        </td>
        <td>
          <font color="]] .. get_system_color(ship_dmg_sim) .. [[">]] .. ship_dmg_sim .. [[</font>&nbsp;(]] .. starmourn.ui.sim_bf .. [[</font>)]] .. [[
        </td>
      </tr>
    </table>
    ]])
	else
		starmourn.ui.bottomleft:echo([[
    <p align="center">
      <font color="#00afd7">MindSim Interface</font>
    </p>
    <table align="center">
      <tbody>
        <tr>
          <td align="right">
            <font color="#005eff">Name:</font>
          </td>
          <td>
            <font color="white">]] .. gmcp.Char.Name.name .. [[</font>
          </td>
          <td align="right">
            <font color="#005eff">Wetwiring:</font>
          </td>
          <td>
            <font color="]] .. get_system_color(gmcp.Char.Vitals.wetwiring) .. [[">]] .. gmcp.Char.Vitals.wetwiring .. [[</font>&nbsp;(<font color="]] .. get_system_color(
			gmcp.Char.Vitals.wetwiring_efficacy
		) .. [[">]] .. gmcp.Char.Vitals.wetwiring_efficacy .. [[</font>)]] .. [[
          </td>
        </tr>
        <tr>
          <td align="right">
            <font color="#005eff">Level:</font>
          </td>
          <td>
            <font color="white">]] .. gmcp.Char.Status.level .. [[</font>
          </td>
          <td align="right">
            <font color="#005eff">Muscular:</font>
          </td>
          <td>
            <font color="]] .. get_system_color(gmcp.Char.Vitals.muscular) .. [[">]] .. gmcp.Char.Vitals.muscular .. [[</font>&nbsp;(<font color="]] .. get_system_color(
			gmcp.Char.Vitals.muscular_efficacy
		) .. [[">]] .. gmcp.Char.Vitals.muscular_efficacy .. [[</font>)]] .. [[
          </td>
        </tr>
        <tr>
          <td align="right">
            <font color="#005eff">Class:</font>
          </td>
          <td>
            <font color="white">]] .. class .. [[</font>
          </td>
          <td align="right">
            <font color="#005eff">Internal:</font>
          </td>
          <td>
            <font color="]] .. get_system_color(gmcp.Char.Vitals.internal) .. [[">]] .. gmcp.Char.Vitals.internal .. [[</font>&nbsp;(<font color="]] .. get_system_color(
			gmcp.Char.Vitals.internal_efficacy
		) .. [[">]] .. gmcp.Char.Vitals.internal_efficacy .. [[</font>)]] .. [[
          </td>
        </tr>
        <tr>
          <td align="right">
            <font color="#005eff">Marks</font><font color="#005eff">:</font>
          </td>
          <td>
            <font color="white">]] .. gmcp.Char.Status.marks .. [[</font>
          </td>
          <td align="right">
            <font color="#005eff">Sensory:</font>
          </td>
          <td>
            <font color="]] .. get_system_color(gmcp.Char.Vitals.sensory) .. [[">]] .. gmcp.Char.Vitals.sensory .. [[</font>&nbsp;(<font color="]] .. get_system_color(
			gmcp.Char.Vitals.sensory_efficacy
		) .. [[">]] .. gmcp.Char.Vitals.sensory_efficacy .. [[</font>)]] .. [[
          </td>
        </tr>
        <tr>
          <td align="right">
            <font color="#005eff">Mind:</font>
          </td>
          <td>
            <font color="]] .. get_system_color(gmcp.Char.Vitals.mind) .. [[">]] .. gmcp.Char.Vitals.mind .. [[</font>&nbsp;(<font color="]] .. get_system_color(
			gmcp.Char.Vitals.mind_efficacy
		) .. [[">]] .. gmcp.Char.Vitals.mind_efficacy .. [[</font>)]] .. [[
          </td>
        </tr>
      </tbody>
    </table>
  ]])
	end
end

starmourn.utils.events.register("gmcp additions", "gmcp.Char.Name", "starmourn.ui.handle_char_name")
starmourn.utils.events.register("mindsim vitals", "gmcp.Char.Vitals", "starmourn.ui.update_mindsim")
starmourn.utils.events.register("mindsim status", "gmcp.Char.Status", "starmourn.ui.update_mindsim")
