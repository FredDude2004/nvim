return {
  'stevearc/oil.nvim',
  --@module 'oil'
  --@type oil.SetupOpts
  buf_options = {
    buflisted = false,
    bufhidden = false,
  },
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
