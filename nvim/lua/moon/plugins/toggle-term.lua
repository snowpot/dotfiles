return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 15,
			open_mapping = [[<C-\>]],
			direction = "horizontal", -- "vertical" or "float"
			float_opts = {
				border = "curved",
			},
		})
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "*",
			callback = function()
				local opts = { buffer = 0, noremap = true, silent = true }
				vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
			end,
		})
	end,
}
