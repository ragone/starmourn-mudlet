local fontsize = starmourn.ui.mapper.config.fontsize - 2

local width, height = calcFontSize(fontsize)
width = width * 81
height = height * 33
-- creating the starchart container
starmourn.ui.adj.left:show()
schartMini = schartMini
	or Geyser.MiniConsole:new(
		{
			name = "starchart",
			x = 0,
			y = 0,
			autoWrap = true,
			color = "black",
			fontSize = fontsize,
			width = "100%",
			height = "100%",
		},
		starmourn.ui.adj.left
	)
clearWindow("starchart")
showWindow("starchart")

function starmourn.ui.hidestarchart()
	starmourn.ui.adj.left:hide()
end
