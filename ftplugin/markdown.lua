-- Set maximum line length to 100 characters
vim.opt_local.textwidth = 100

-- Ensure 't' is present so text wraps automatically at the textwidth limit
vim.opt_local.formatoptions:append("t")
