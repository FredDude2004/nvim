local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader

-- ================================================================================
-- NORMAL MODE KEYMAPS
-- ================================================================================

keymap("n", "<space>", "<Nop>")
keymap("n", "n", "nzzzv") -- Previous search and center the cursor
keymap("n", "N", "Nzzzv") -- Previous search and center the cursor
keymap("n", "<C-d>", "<C-d>zz") -- Scroll down and center the cursor
keymap("n", "<C-u>", "<C-u>zz") -- Scroll up and center the cursor
keymap("n", "<Leader>w", "<cmd>w!<CR>", s) -- Save the current file
keymap("n", "<Leader>q", "<cmd>q<CR>", s) -- Quit Neovim
keymap("n", "<Leader>te", "<cmd>tabnew<CR>", s) -- Open a new tab
keymap("n", "<Leader>-", "<cmd>vsplit<CR>", s) -- Split the window vertically
keymap("n", "<Leader>_", "<cmd>split<CR>", s) -- Split the window horizontally
keymap("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", s) -- Format the current buffer using LSP
keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>') -- Change directory to the current file's directory
keymap("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true }) -- Go to definition
keymap("n", "<leader>ps", "<cmd>lua vim.pack.update()<CR>")
keymap("n", "<leader>gs", "<cmd>Git<CR>", { noremap = true, silent = true })
keymap("n", "<leader>gp", "<cmd>Git push<CR>", { noremap = true, silent = true })
keymap("n", "<leader>o", ":update<CR> :source<CR>", { desc = "Source a file" })
keymap("n", "-", ":Oil<CR>", { desc = "Open File System" })
keymap("n", "<leader>w", ":write<CR>", { desc = "Write a file" })
keymap("n", "<C-n>", ":cnext<CR>", { desc = "Ctr + n for next entry in QuickFix List" })
keymap("n", "<C-p>", ":cprev<CR>", { desc = "Ctr + p for previous entry in QuickFix List" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Center screen when navigating down" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Center screen when navigating up" })
keymap("n", "n", "nzzzv", { desc = "Center screen when cycling search term" })
keymap("n", "N", "Nzzzv", { desc = "Center screen when cycling search term" })
keymap("n", "<leader>Y", '"+Y', { desc = "[Y]ank to system clipboard" })
keymap("n", "<leader>d", '"_d', { desc = "[D]elete to void register" })
keymap("n", "<leader>y", '"+y', { desc = "[Y]ank to system clipboard" })

-- Remap C-hjkl to navigate splits
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower split" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper split" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

-- Resize windows with HJKL or ←↓↑→
keymap("n", "<leader>h", ":vertical resize -7<CR>", s)
keymap("n", "<leader>j", ":resize -10<CR>", s)
keymap("n", "<leader>k", ":resize +10<CR>", s)
keymap("n", "<leader>l", ":vertical resize +7<CR>", s)
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better movement in wrapped text
keymap("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

-- Show the file path
keymap("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

-- Toggle diagnostics
keymap("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

-- Toggle colorcolumn at 80 characters --
keymap("n", "<leader>cc", function()
	if vim.opt.colorcolumn:get()[1] == "80" then
		vim.opt.colorcolumn = ""
	else
		vim.opt.colorcolumn = "80"
	end
end, { desc = "Toggle colorcolumn" })

-- Open a terminal in a horizontal split
keymap("n", "<leader>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end, { desc = "[S]mall [T]erminal" })

-- ================================================================================
-- VISUAL MODE KEYMAPS
-- ================================================================================

keymap("v", "<Leader>p", '"_dP') -- Paste without overwriting the default register
keymap("v", "<leader>y", '"+y', { desc = "[Y]ank to system clipboard" })
keymap("v", "<leader>d", '"_d', { desc = "[D]elete to void register" })
keymap({ "v", "n" }, "<leader>x", '"_d', { desc = "[X] Delete without yanking" })
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text down" })

-- ================================================================================
-- MISCELANOUS KEYMAPS
-- ================================================================================

keymap("x", "<leader>p", '"_dP', { desc = "[P]aste to void register" })

keymap("t", "<Esc>", "<C-\\><C-N>") -- Exit terminal mode
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Get out of terminal mode" })

keymap("i", "<C-BS>", "<C-W>", { noremap = true }) -- Makes CTRL + Backspcae delete a word back

keymap("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
