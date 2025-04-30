vim.keymap.set("n", "<leader>s", [[:%s/\<<Cr><Cw>\>/<Cr><Cw>/gI<Left><Left><Left>]])
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("n", "<esc><esc>", ":nohl<CR>")

-- telescope keymap
vim.keymap.set("n", "ff", "<cmd>Telescope find_files find_command=rg,--hidden,--files prompt_prefix=🔍 <cr>")
vim.keymap.set("n", "fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "fh", "<cmd>Telescope help_tags<cr>")

-- oil keymap
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- toggle-term keymap
vim.keymap.set("t", "<C-Up>", "<C-\\><C-n>:resize +2<CR>i", { silent = true })
vim.keymap.set("t", "<C-Down>", "<C-\\><C-n>:resize -2<CR>i", { silent = true })
vim.keymap.set("t", "<C-Left>", "<C-\\><C-n>:vertical resize -5<CR>i", { silent = true })
vim.keymap.set("t", "<C-Right>", "<C-\\><C-n>:vertical resize +5<CR>i", { silent = true })

-- tabline keymap
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "next buf" })
vim.keymap.set("n", "<leader><Tab>", "<cmd>bprevious<CR>", { desc = "prev buf" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "when yank highlight",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
