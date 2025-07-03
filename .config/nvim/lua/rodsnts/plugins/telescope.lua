return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",
  lazy= false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          theme = "ivy",
          hidden = true
        }
      },
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          ".git",
          ".next",
        }
      },
      extensions = {
        fzf = {}
      }
    })

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = 'Search in current buffer' })
  end
}
