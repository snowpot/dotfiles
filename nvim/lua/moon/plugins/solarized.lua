return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		require("solarized-osaka").setup({
			transparent = true,
			terminal_colors = true,
			on_colors = function(c)
				c.blue = "#268bd2"
				c.cyan = "#2aa198"
				c.green = "#98b92d"
			end,
			on_highlights = function(hl, c)
				hl.Visual = { bg = "#21416a" }
				hl.LineNr = { fg = c.blue }
				hl["@tag.tsx"] = { fg = "#f72d2e" }
				hl["@tag.builtin.tsx"] = { fg = c.blue }
				hl.comment = { fg = "#7b7b7b" }
				local prompt = "#2d3149"
				hl.TelescopeNormal = {
					bg = c.bg_dark,
					fg = c.fg_dark,
				}
				hl.TelescopeBorder = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopePromptNormal = {
					bg = prompt,
				}
				hl.TelescopePromptBorder = {
					bg = prompt,
					fg = prompt,
				}
				hl.TelescopePromptTitle = {
					bg = prompt,
					fg = prompt,
				}
				hl.TelescopePreviewTitle = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopeResultsTitle = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
			end,
		})
		vim.cmd.colorscheme("solarized-osaka")
	end,
}
