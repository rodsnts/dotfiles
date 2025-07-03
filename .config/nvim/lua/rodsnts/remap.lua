vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", {})

vim.api.nvim_set_keymap('t', '<esc><esc>', '<c-\\><c-n>', {})
vim.keymap.set('n', "<leader>ds", function() require("noice").cmd("dismiss") end)
-- Remap system yank to Leader + y
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {})
vim.api.nvim_set_keymap('n', '<leader>y', '"+Y', {})

-- Prettier formatting for specific filetypes
local function format_with_prettier()
  local filetype = vim.bo.filetype
  local prettier_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "json" }
  
  for _, ft in ipairs(prettier_filetypes) do
    if filetype == ft then
      vim.cmd("silent !npx prettier --write " .. vim.fn.shellescape(vim.fn.expand("%")))
      vim.cmd("edit!")
      print("Formatted with Prettier")
      return
    end
  end
  
  print("Prettier not available for filetype: " .. filetype)
end

vim.keymap.set('n', '<leader>fp', format_with_prettier, { desc = "Format with Prettier" })

-- Quick save
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = 'Split vertically' })
vim.keymap.set('n', '<leader>s', '<C-w>s', { desc = 'Split horizontally' })
