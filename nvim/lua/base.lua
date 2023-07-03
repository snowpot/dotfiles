vim.scriptencoding = "utf-8"

local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.nu = true
opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.cmdheight = 0
opt.hlsearch = true
opt.showcmd = true
opt.laststatus = 3
opt.expandtab = true
opt.scrolloff = 10
opt.backupskip = "/tmp/*, /private/tmp/*"
opt.inccommand = "split"
opt.ignorecase = true
opt.breakindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.ai = true
opt.si = true
opt.wrap = false
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })
opt.shortmess:append({ I = true })
vim.g.mapleader = " "

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

vim.opt.formatoptions:append({ "r" })

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Esc><Esc>", ":nohl<CR>", { noremap = true, silent = true })
