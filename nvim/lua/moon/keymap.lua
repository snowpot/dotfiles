vim.keymap.set("n", "<leader>s", [[:%s/\<<Cr><Cw>\>/<Cr><Cw>/gI<Left><Left><Left>]])
vim.keymap.set("i", "jj", [[<Esc>]])

-- telescope keymap 
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files find_command=rg,--hidden,--files prompt_prefix=🔍<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "when yank highlight",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

