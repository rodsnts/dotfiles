vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", {})

vim.api.nvim_set_keymap('t', '<esc><esc>', '<c-\\><c-n>', {})
vim.keymap.set('n', "<leader>ds", function() require("noice").cmd("dismiss") end)
-- Remap system yank to Leader + y
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {})
vim.api.nvim_set_keymap('n', '<leader>y', '"+Y', {})
