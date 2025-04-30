return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPost", "BufNewFile" }, -- ファイルを開いたタイミングで読み込む
	config = function()
		require("bufferline").setup({})
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- アイコンを表示するための依存関係
	},
}
