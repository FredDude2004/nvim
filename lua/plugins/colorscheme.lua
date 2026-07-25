-- local function set_transparent() -- set UI component to transparent
-- 	local groups = {
-- 		"Normal",
-- 		"NormalNC",
-- 		"EndOfBuffer",
-- 		"NormalFloat",
-- 		"FloatBorder",
-- 		"SignColumn",
-- 		"StatusLine",
-- 		"StatusLineNC",
-- 		"TabLine",
-- 		"TabLineFill",
-- 		"TabLineSel",
-- 		"ColorColumn",
-- 	}
-- 	for _, g in ipairs(groups) do
-- 		vim.api.nvim_set_hl(0, g, { bg = "none" })
-- 	end
-- 	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
-- 	vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
-- 	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
-- 	vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#767676", bg = "NONE" })
-- end

-- ================================================================================
-- KANAGAWA
-- ================================================================================

-- vim.cmd.colorscheme("kanagawa-paper")
-- vim.cmd.colorscheme("kanagawa-paper-ink")
-- vim.cmd.colorscheme("kanagawa-paper-canvas")

-- ================================================================================
-- CATPPUCCIN
-- ================================================================================

-- vim.cmd.colorscheme("catppuccin-nvim")

-- OR

-- vim.cmd.colorscheme("catppuccin")

-- ================================================================================
-- VAGUE
-- ================================================================================

-- vim.cmd.colorscheme("vague")

-- ================================================================================
-- TOKYONIGHT
-- ================================================================================

-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("tokyonight-night")
-- vim.cmd.colorscheme("tokyonight-storm")
-- vim.cmd.colorscheme("tokyonight-moon")
-- vim.cmd.colorscheme("tokyonight-day"):

-- ================================================================================
-- EVERFOREST
-- ================================================================================

vim.o.background = "dark" -- or "light"
require("everforest").setup({
	background = "medium", -- 'hard', 'medium', 'soft'
	transparent_background_level = 2,
	ui_contrast = "high", -- 'low', 'high'
	diagnostic_text_highlight = 1,
	colours_override = function(palette)
		palette.bg_dim = "#0A0A0A"
		palette.bg0 = "#0F0F0F"
		palette.bg1 = "#171717"
		palette.bg2 = "#202020"
		palette.bg3 = "#292929"
		palette.bg4 = "#333333"
		palette.bg5 = "#3D3D3D"
		-- palette.red = "#EA6962"
		-- palette.blue = "#7DAEA3"
		-- palette.yellow = "#CD9E52"
	end,
})
vim.cmd.colorscheme("myforest")

-- ================================================================================
-- STOICS
-- ================================================================================

-- vim.cmd.colorscheme("stoics")

-- ================================================================================
-- PASTELDARK
-- ================================================================================

-- vim.cmd.colorscheme("pasteldark")

-- ================================================================================
-- RISTRETTO
-- ================================================================================

-- require("monokai-pro").setup({
-- 	transparent_background = false, -- selecitoncolor: #373538
-- 	terminal_colors = true,
-- 	devicons = true,
-- 	styles = {
-- 		comment = { italic = true },
-- 		keyword = { italic = true },
-- 		type = { italic = true },
-- 		storageclass = { italic = true },
-- 		structure = { italic = true },
-- 		parameter = { italic = true },
-- 		annotation = { italic = true },
-- 		tag_attribute = { italic = true },
-- 	},
-- 	filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
-- 	day_night = {
-- 		enable = false,
-- 		day_filter = "pro",
-- 		night_filter = "spectrum",
-- 	},
-- 	inc_search = "background", -- underline | background
-- 	background_clear = {
-- 		"toggleterm",
-- 		"telescope",
-- 		"renamer",
-- 		"notify",
-- 	},
-- 	plugins = {
-- 		bufferline = {
-- 			underline_selected = false,
-- 			underline_visible = false,
-- 			underline_fill = false,
-- 			bold = true,
-- 		},
-- 		indent_blankline = {
-- 			context_highlight = "default", -- default | pro
-- 			context_start_underline = false,
-- 		},
-- 	},
-- })
-- vim.cmd.colorscheme("monokai-pro")

-- ================================================================================
-- DRACULA
-- ================================================================================

-- require("dracula").setup({
-- 	-- customize dracula color palette
-- 	colors = {
-- 		bg = "#2C2525",
-- 		fg = "#F8F8F2",
-- 		selection = "#373538",
-- 		comment = "#6272A4",
-- 		red = "#FF5555",
-- 		orange = "#FFB86C",
-- 		yellow = "#F1FA8C",
-- 		green = "#A8D475",
-- 		purple = "#D6ACFF",
-- 		cyan = "#8BE9FD",
-- 		pink = "#FF79C6",
-- 		bright_red = "#FF6E6E",
-- 		bright_green = "#69FF94",
-- 		bright_yellow = "#FFFFA5",
-- 		bright_blue = "#CBA6F7",
-- 		bright_magenta = "#FF92DF",
-- 		bright_cyan = "#A4FFFF",
-- 		bright_white = "#FFFFFF",
-- 		menu = "#21222C",
-- 		visual = "#3E4452",
-- 		gutter_fg = "#4B5263",
-- 		nontext = "#3B4048",
-- 		white = "#ABB2BF",
-- 		black = "#191A21",
-- 	},
-- 	transparent_bg = true, -- default false
-- 	-- lualine_bg_color = "#44475a", -- default nil
-- 	italic_comment = true, -- default false
-- })
-- vim.cmd.colorscheme("dracula")

-- ================================================================================
-- NIGHTFALL
-- ================================================================================

-- require("nightfall").setup({})
-- vim.cmd.colorscheme("nightfall")

-- ================================================================================
-- GRUBER DARKER
-- ================================================================================

-- vim.cmd.colorscheme("gruber-darker")

-- ================================================================================

-- set_transparent()
