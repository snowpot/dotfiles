return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope", -- コマンドで遅延ロード
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make", -- fzf-nativeを入れることで爆速化
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "horizontal",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = { prompt_position = "top", preview_width = 0.55 },
				},
				file_ignore_patterns = { ".git/", "node_modules/", "vendor/" }, -- 無視するファイル
				pickers = {
					find_files = {
						theme = "dropdown",
					},
				},
				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
					},
					n = {
						["q"] = require("telescope.actions").close,
					},
				},
			},
		})
		require("telescope").load_extension("fzf") -- fzf-native拡張ロード
		vim.keymap.set("n", "fs", function()
			require("telescope.builtin").grep_string({
				search = vim.fn.input("Regex > "),
				use_regex = true,
			})
		end, { desc = "Search with regex" })
	end,
}
