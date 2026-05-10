vim.pack.add({
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/echasnovski/mini.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/creativenull/efmls-configs-nvim",
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/obsidian-nvim/obsidian.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	{
		src = "https://github.com/nvim-telescope/telescope.nvim",
		version = "v0.1.9",
	},
	{
		src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},

	-- Colorschemes
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/neanias/everforest-nvim",
	"https://github.com/thesimonho/kanagawa-paper.nvim",
	"https://github.com/catppuccin/nvim",
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/mtendekuyokwa/stoics.nvim",
	"https://github.com/ankushbhagats/pastel.nvim",
	"https://github.com/loctvl842/monokai-pro.nvim",
	"https://github.com/mofiqul/dracula.nvim",
	"https://github.com/benjasper/nightfall.nvim",
	"https://github.com/blazkowolf/gruber-darker.nvim",
})

require("plugins.treesitter")
require("plugins.colorscheme")
require("plugins.mason")
require("plugins.lsp")
require("plugins.completions")
require("plugins.oil")
require("plugins.telescope")
require("plugins.gitsigns")
require("plugins.mini")
require("plugins.obsidian")
require("plugins.lualine")
