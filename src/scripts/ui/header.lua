starmourn.ui.room_desc = starmourn.ui.room_desc or {}
starmourn.ui.room_desc.collapsed = starmourn.ui.room_desc.collapsed or true

function starmourn.ui.room_desc.update()
	starmourn.ui.adj.top:lowerAll()

	starmourn.ui.top:setStyleSheet([[
    qproperty-wordWrap: true;
    margin: 20px;
    padding: 10px 20px;
    qproperty-alignment: 'AlignTop';
    font-family: Dosis;
    border-radius: 10px;
	image: none;
	background-color: #1f2225;
]])
	starmourn.ui.top:echo([[
<p style="font-size:35px; font-weight: bold;"><font color="#ffffff">]] .. gmcp.Room.Info.area .. [[</font></p>
</br>
<p style="font-size:20px"><font color="#00afd7">]] .. gmcp.Room.Info.name .. [[</font></p>
</br>
<p style="font-size:20px">]] .. gmcp.Room.Info.desc .. [[</p>

]])
end

function starmourn.ui.room_desc.click()
	if starmourn.ui.room_desc.collapsed then
		starmourn.ui.adj.top:resize(nil, "90%")
	else
		starmourn.ui.adj.top:resize(nil, "170px")
	end
	starmourn.ui.room_desc.collapsed = not starmourn.ui.room_desc.collapsed
end

starmourn.utils.events.register("room desc", "gmcp.Room.Info", "starmourn.ui.room_desc.update")
