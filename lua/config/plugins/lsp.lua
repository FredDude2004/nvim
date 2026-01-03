return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      vim.lsp.config("jdtls", {
        capabilities = capabilities,
      })
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })
      vim.lsp.config("gopls", {
        capabilities = capabilities,
      })
      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.enable('jdtls')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('gopls')
      vim.lsp.enable('pyright')

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if not client then return end


          if not client:supports_method('textDocument/willSaveWaitUntil')
              and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end,
      })

      local set_keymaps = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = '[G]oto [d]efinition' })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = '[G]oto [i]mplementation' })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = '[K]ode Hover' })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = '[R]e [N]ame' })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = '[C]ode [A]ctions' })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = '[G]oto [R]eferences' })
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local bufnr = ev.buf
          set_keymaps(client, bufnr)
        end
      })
    end
  }
}
