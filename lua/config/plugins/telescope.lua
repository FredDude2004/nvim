return {
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.1.9',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },

    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        }
      }

      vim.keymap.set("n", "<leader>sf", require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set("n", "<leader>sh", require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
      vim.keymap.set("n", "<leader>sn", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end, { desc = '[S]earch [N]eovim' })
      vim.keymap.set("n", "<leader>sp", function()
        require('telescope.builtin').find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end, { desc = '[S]earch [P]ackages' })

      require "config.telescope.multigrep".setup()
    end
  }
}
