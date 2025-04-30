return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"*", -- 全ファイルタイプに適用
		}, {
			names = false, -- "blue" や "red" などの名前は無視（必要なら true）
		})
	end,
	event = { "BufReadPost", "BufNewFile" },
}
