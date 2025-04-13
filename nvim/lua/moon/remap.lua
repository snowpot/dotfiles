vim.keymap.set("n", "<leader>s", [[:%s/\<<Cr><Cw>\>/<Cr><Cw>/gI<Left><Left><Left>]])
vim.keymap.set("i", "jj", [[<Esc>]])

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "when yank highlight",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

