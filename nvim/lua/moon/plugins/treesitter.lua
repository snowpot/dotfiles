return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"tsx",
			"typescript",
			"javascript",
			"json",
			"html",
			"css",
			"markdown",
			"comment",
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = false,
			disable = { "yaml", "python" },
		},
		incremental_selection = { enable = false },
		textobjects = { enable = false },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
