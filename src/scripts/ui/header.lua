starmourn.ui.header = starmourn.ui.header or {}
starmourn.ui.header.collapsed = starmourn.ui.header.collapsed or true

function starmourn.ui.header.update()
	starmourn.ui.adj.top:lowerAll()

	starmourn.ui.top:setStyleSheet([[
		qproperty-wordWrap: true;
		padding: 20px;
		qproperty-alignment: 'AlignTop';
		font-family: Dosis;
		image: none;
		border-image: url(]] .. getMudletHomeDir() .. [[/@PKGNAME@/bg.jpg);
	]])
	starmourn.ui.top:echo([[
		<p style="font-size:35px; font-weight: bold;"><font color="#ffffff">]] .. gmcp.Room.Info.area .. [[</font></p>
		</br>
		<p style="font-size:20px"><font color="#00afd7">]] .. gmcp.Room.Info.name .. [[</font></p>
		</br>
		<p style="font-size:20px">]] .. gmcp.Room.Info.desc .. [[</p>
	]])
end

function starmourn.ui.header.click()
	if starmourn.ui.header.collapsed then
		starmourn.ui.adj.top:resize(nil, "90%")
	else
		starmourn.ui.adj.top:resize(nil, "140px")
	end
	starmourn.ui.header.collapsed = not starmourn.ui.header.collapsed
end

starmourn.utils.events.register("room desc", "gmcp.Room.Info", "starmourn.ui.header.update")
