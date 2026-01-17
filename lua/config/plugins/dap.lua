return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_python = require("dap-python")

      require("dapui").setup({})
      require("nvim-dap-virtual-text").setup({
        commented = true, -- Show virtual text alongside comment
      })

      dap_python.setup("python3")

      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "", -- or "❌"
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
        text = "", -- or "→"
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      })

      -- Automatically open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      local opts = { noremap = true, silent = true }

      --       vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      --       vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
      --
      --       -- Eval var under cursor
      --       vim.keymap.set("n", "<space>?", function()
      --         require("dapui").eval(nil, { enter = true })
      --       end)
      --
      --       vim.keymap.set("n", "<F1>", dap.continue)
      --       vim.keymap.set("n", "<F2>", dap.step_into)
      --       vim.keymap.set("n", "<F3>", dap.step_over)
      --       vim.keymap.set("n", "<F4>", dap.step_out)
      --       vim.keymap.set("n", "<F5>", dap.step_back)
      --       vim.keymap.set("n", "<F13>", dap.restart)

      -- Toggle breakpoint
      vim.keymap.set("n", "<leader>b", function()
        dap.toggle_breakpoint()
      end, opts)

      -- Continue / Start
      vim.keymap.set("n", "<F1>", function()
        dap.continue()
      end, opts)

      -- Step Into
      vim.keymap.set("n", "<F2>", function()
        dap.step_into()
      end, opts)

      -- Step Over
      vim.keymap.set("n", "<F3", function()
        dap.step_over()
      end, opts)

      -- Step Out
      vim.keymap.set("n", "<F4>", function()
        dap.step_out()
      end, opts)

      -- Keymap to terminate debugging
      vim.keymap.set("n", "<leader>dq", function()
        require("dap").terminate()
      end, opts)

      -- Toggle DAP UI
      vim.keymap.set("n", "<leader>du", function()
        dapui.toggle()
      end, opts)
    end,
  },
}

-- NOTE: teej_dv's dap config but just needed python

-- return {
--   {
--     "mfussenegger/nvim-dap",
--     dependencies = {
--       "leoluz/nvim-dap-go",
--       "rcarriga/nvim-dap-ui",
--       "theHamsta/nvim-dap-virtual-text",
--       "nvim-neotest/nvim-nio",
--       "williamboman/mason.nvim",
--     },
--     config = function()
--       local dap = require "dap"
--       local ui = require "dapui"
--
--       require("dapui").setup()
--       require("dap-go").setup()
--
--       require("nvim-dap-virtual-text").setup {
--         -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
--         display_callback = function(variable)
--           local name = string.lower(variable.name)
--           local value = string.lower(variable.value)
--           if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
--             return "*****"
--           end
--
--           if #variable.value > 15 then
--             return " " .. string.sub(variable.value, 1, 15) .. "... "
--           end
--
--           return " " .. variable.value
--         end,
--       }
--
--       -- Handled by nvim-dap-go
--       -- dap.adapters.go = {
--       --   type = "server",
--       --   port = "${port}",
--       --   executable = {
--       --     command = "dlv",
--       --     args = { "dap", "-l", "127.0.0.1:${port}" },
--       --   },
--       -- }
--
--       local elixir_ls_debugger = vim.fn.exepath "elixir-ls-debugger"
--       if elixir_ls_debugger ~= "" then
--         dap.adapters.mix_task = {
--           type = "executable",
--           command = elixir_ls_debugger,
--         }
--
--         dap.configurations.elixir = {
--           {
--             type = "mix_task",
--             name = "phoenix server",
--             task = "phx.server",
--             request = "launch",
--             projectDir = "${workspaceFolder}",
--             exitAfterTaskReturns = false,
--             debugAutoInterpretAllModules = false,
--           },
--         }
--       end
--
--       vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
--       vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
--
--       -- Eval var under cursor
--       vim.keymap.set("n", "<space>?", function()
--         require("dapui").eval(nil, { enter = true })
--       end)
--
--       vim.keymap.set("n", "<F1>", dap.continue)
--       vim.keymap.set("n", "<F2>", dap.step_into)
--       vim.keymap.set("n", "<F3>", dap.step_over)
--       vim.keymap.set("n", "<F4>", dap.step_out)
--       vim.keymap.set("n", "<F5>", dap.step_back)
--       vim.keymap.set("n", "<F13>", dap.restart)
--
--       dap.listeners.before.attach.dapui_config = function()
--         ui.open()
--       end
--       dap.listeners.before.launch.dapui_config = function()
--         ui.open()
--       end
--       dap.listeners.before.event_terminated.dapui_config = function()
--         ui.close()
--       end
--       dap.listeners.before.event_exited.dapui_config = function()
--         ui.close()
--       end
--     end,
--   },
-- }
