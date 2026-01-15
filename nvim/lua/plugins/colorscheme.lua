return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("solarized-osaka").setup({
				transparent = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
				},
				on_highlights = function(hl, _)
					hl.SnacksIndent1 = { fg = "#8BDDFC" } -- base02
					hl.SnacksIndent2 = { fg = "#8BDDFC" } -- base02
					hl.SnacksIndentScope = { fg = "#FFFFFF" } -- base01
					hl.SnacksIndentChunk = { fg = "#8BDDFC" } -- base01
				end,
				on_colors = function(colors)
					colors.bg = colors.base04
				end,
			})
			vim.cmd.colorscheme("solarized-osaka")
		end,
	},
}
