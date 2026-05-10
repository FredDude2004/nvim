-- Setup Mason and install all of these LSP's and extra tools
require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"bashls",
		"ts_ls",
		"gopls",
		"clangd",
		"efm",
	},
	automatic_enable = false, -- since you're manually using vim.lsp.enable()
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"clang-format",
		"cpplint",
		"gofumpt",
		"revive",
		"prettierd",
		"eslint_d",
		"fixjson",
		"luacheck",
		"stylua",
		"flake8",
		"black",
		"shellcheck",
		"shfmt",
	},
	auto_update = false,
	run_on_start = true,
})
