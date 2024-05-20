return {
  'lewis6991/gitsigns.nvim',

  config = function ()
    require('gitsigns').setup({
      current_line_blame_opts = {
        delay = 0
      }
    })
    local gitsigns = require('gitsigns')
    vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame)
  end
}
