local opt = vim.opt
opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

opt.termguicolors = true
opt.showmode = true
opt.laststatus = 3
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.number = true
opt.showmatch = true
opt.showmode = false
opt.cmdheight = 1

opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.helplang = 'en'
opt.showtabline = 2
opt.foldcolumn = '0'
opt.foldenable = false
opt.signcolumn = 'no'
opt.numberwidth = 4


vim.g.mapleader = ' '
opt.clipboard:append { 'unnamedplus' }
opt.ttimeout = true
opt.ttimeoutlen = 50

opt.swapfile = false
opt.backup = false

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohl<CR>', { noremap = true, silent = true })
