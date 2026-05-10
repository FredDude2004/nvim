local setup_treesitter = function()
	local treesitter = require("nvim-treesitter")

	treesitter.setup({})

	local ensure_installed = {
		"vim",
		"vimdoc",
		"rust",
		"c",
		"cpp",
		"go",
		"html",
		"css",
		"javascript",
		"json",
		"lua",
		"markdown",
		"python",
		"typescript",
		"vue",
		"svelte",
		"bash",
	}

	local already_installed = treesitter.get_installed()
	local parsers_to_install = {}

	for _, parser in ipairs(ensure_installed) do
		if not vim.tbl_contains(already_installed, parser) then
			table.insert(parsers_to_install, parser)
		end
	end

	if #parsers_to_install > 0 then
		treesitter.install(parsers_to_install)
	end

	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true }),
		callback = function(args)
			local lang = vim.treesitter.language.get_lang(args.match)

			if lang and vim.list_contains(treesitter.get_installed(), lang) then
				vim.treesitter.start(args.buf, lang)
			end
		end,
	})
end

setup_treesitter()

require("nvim-treesitter.config").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

