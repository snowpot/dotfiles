local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		version = "^1.0.0",
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},
	{
		"L3MON4D3/LuaSnip",
	},
	{
		"hrsh7th/nvim-cmp",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-buffer",
	},
	{
		"hrsh7th/cmp-cmdline",
	},
	{
		"saadparwaiz1/cmp_luasnip",
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspLog" },
		event = { "BufRead" },
		config = function() end,
	},
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall" },
		event = { "WinNew", "WinLeave", "BufRead" },
		config = function() end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"catppuccin/nvim",
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		keys = {
			{ "ff", "<Cmd>Telescope find_files<CR>", mode = { "n", "v" } },
			{ "fw", "<Cmd>Telescope live_grep<CR>", mode = { "n", "v" } },
			{ "fc", "<Cmd>Telescope commands<CR>", mode = { "n", "v" } },
			{ "fk", "<Cmd>Telescope keymaps<CR>", mode = { "n", "v" } },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
})
