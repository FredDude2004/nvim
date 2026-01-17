require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.winborder = "bold"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.conceallevel = 2
vim.opt.scrolloff = 18
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt['guicursor'] = ''

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>', { desc = 'Source a file' })
vim.keymap.set('n', '-', ':Oil<CR>', { desc = 'Open File System' })
vim.keymap.set('n', '<leader>w', ':write<CR>', { desc = 'Write a file' })
vim.keymap.set('n', '<leader>q', ':quote<CR>', { desc = 'Quit a file' })
vim.keymap.set('n', '<C-n>', ':cnext<CR>', { desc = 'Ctr + n for next entry in QuickFix List' })
vim.keymap.set('n', '<C-p>', ':cprev<CR>', { desc = 'Ctr + p for previous entry in QuickFix List' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center screen when navigating down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center screen when navigating up' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center screen when cycling search term' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center screen when cycling search term' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = '[Y]ank to system clipboard' })
vim.keymap.set('n', '<leader>d', '"_d', { desc = '[D]elete to void register' })
vim.keymap.set('n', '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted text down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move highlighted text down' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })
vim.keymap.set('v', '<leader>d', '"_d', { desc = '[D]elete to void register' })
vim.keymap.set('x', '<leader>p', '"_dP', { desc = '[P]aste to void register' })
vim.keymap.set('i', '<C-H>', '<C-W>', { noremap = true }) -- Makes CTRL + Backspcae delete a word back
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Get out of terminal mode' })

-- Remap C-hjkl to navigate splits
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to lower split' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to upper split' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right split' })

-- Resize windows with HJKL
vim.keymap.set('n', '<leader>h', ':vertical resize -7<CR>', { silent = true })
vim.keymap.set('n', '<leader>j', ':resize -7<CR>', { silent = true })
vim.keymap.set('n', '<leader>k', ':resize +7<CR>', { silent = true })
vim.keymap.set('n', '<leader>l', ':vertical resize +7<CR>', { silent = true })

vim.o.splitright = true -- New splits open to the right/bottom
vim.o.splitbelow = true -- New splits open to the right/bottom

vim.api.nvim_create_autocmd('textYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.opt.signcolumn = 'yes'
    end,
})

vim.keymap.set('n', '<leader>st', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd('J')
    vim.api.nvim_win_set_height(0, 15)
end, { desc = '[S]mall [T]erminal' })
