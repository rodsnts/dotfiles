return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
      "nvim-lua/plenary.nvim"
  },

  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          hidden = true
        }
      },
      defaults = {
        file_ignore_patterns = {
          "node_modules/",
          ".git/"
        }
      },
    })

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
  end
}

