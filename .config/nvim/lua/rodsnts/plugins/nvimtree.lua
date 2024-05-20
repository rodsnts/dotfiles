return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    require("nvim-tree").setup({
    auto_reload_on_write = true,
    sort_by = "case_sensitive",
    view = {
      width = 30,
    },
    renderer = {
      group_empty = false,
    },
    filters = {
      dotfiles = false,
    },
    git = {
      enable = true,
      ignore = false
    }
  })

  --vim.cmd([[autocmd VimEnter * NvimTreeOpen]])
  vim.keymap.set('n', '<C-b>', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
  end
}
