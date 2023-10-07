local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	ui = {
		border = "rounded",
	},
	symbol_in_winbar = {
		enable = false,
	},
	lightbulb = {
		enable = false,
	},
	outline = {
		layout = "float",
	},
})
local opts = { noremap = true, silent = true }
local diagnostic = require("lspsaga.diagnostic")
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga finder<CR>", opts)
vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
vim.keymap.set("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
