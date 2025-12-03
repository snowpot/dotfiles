return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},

		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"gopls",
					"jsonls",
					"html",
					"cssls",
					"eslint",
				},
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			local group = vim.api.nvim_create_augroup("lsp-attach", { clear = true })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = group,
				callback = function(args)
					local bufnr = args.buf
					local map = function(mode, lhs, rhs)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
					end
					map("n", "K", vim.lsp.buf.hover)
					map("n", "gd", vim.lsp.buf.definition)
					map("n", "gD", vim.lsp.buf.declaration)
					map("n", "gr", vim.lsp.buf.references)
					map("n", "gi", vim.lsp.buf.implementation)
					map("n", "<leader>rn", vim.lsp.buf.rename)
					map("n", "<leader>ca", vim.lsp.buf.code_action)
					map("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end)
				end,
			})

			local servers = {
				"lua_ls",
				"ts_ls",
				"gopls",
				"jsonls",
				"html",
				"cssls",
				"eslint",
			}

			for _, name in ipairs(servers) do
				vim.lsp.enable(name)
			end
		end,
	},
}
