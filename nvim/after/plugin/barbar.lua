local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', 'gp', '<Cmd>BufferPrevious<CR>', opts)
map('n', 'gt', '<Cmd>BufferNext<CR>', opts)
