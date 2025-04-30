return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "eslint_d", "prettierd" },
				typescript = { "eslint_d", "prettierd" },
				typescriptreact = { "eslint_d", "prettierd" },
				javascriptreact = { "eslint_d", "prettierd" },
				json = { "prettierd" },
				markdown = { "prettierd" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 1000,
			},
		})
	end,
}
