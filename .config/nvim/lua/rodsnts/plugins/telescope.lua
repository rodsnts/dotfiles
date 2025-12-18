return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",
  lazy= false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          hidden = true
        },
      },
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          ".git",
          ".next",
        }
      },
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",
        }
      }
    })

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    vim.keymap.set('n', '<leader>pb', builtin.current_buffer_fuzzy_find, { desc = 'Search in current buffer' })

    require "rodsnts.telescope.multigrep".setup()
  end
}
