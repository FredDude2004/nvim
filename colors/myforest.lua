vim.o.background = "dark"

local everforest = require("everforest")

everforest.setup({
	background = "hard",
	transparent_background_level = 0,
	ui_contrast = "high",
	diagnostic_text_highlight = true,

	colours_override = function(palette)
		palette.bg0 = "#0F0F0F"
	end,
})

everforest.load()

-- Everforest's loader sets this to "everforest", so rename it afterward.
vim.g.colors_name = "myforest"
