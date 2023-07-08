local status, packer = pcall(require, "packer")
if not status then
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use({ "bluz71/vim-moonfly-colors", as = "moonfly" })
	use("wbthomason/packer.nvim")
	use("nvim-lualine/lualine.nvim")
	use("L3MON4D3/LuaSnip")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/nvim-cmp")
	use("onsails/lspkind.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		run = ":MasonUpdate",
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("MunifTanjim/prettier.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("windwp/nvim-ts-autotag")
	use("norcalli/nvim-colorizer.lua")
	use("nvim-tree/nvim-web-devicons")
	use("lewis6991/gitsigns.nvim")
	use("dinhhuy258/git.nvim")
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons",
	})
end)
