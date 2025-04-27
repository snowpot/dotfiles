local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local servers = {
	ts_ls = {}, -- 最新のTypeScript LSP
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				diagnostics = { globals = { "vim" } },
			},
		},
	},
}
-- Masonで自動インストール
mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.diagnostic.config({
	virtual_text = true,
	float = { border = "rounded" },
	underline = true,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

mason_lspconfig.setup_handlers({
	function(server_name)
		local opts = {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				-- if client.server_capabilities.semanticTokensProvider then
				-- 	client.server_capabilities.semanticTokensProvider = nil
				-- end
				local map_opts = { buffer = bufnr, noremap = true, silent = true }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, map_opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, map_opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.rename, map_opts)
				vim.keymap.set("n", "gR", vim.lsp.buf.references, map_opts)
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, map_opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, map_opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, map_opts)
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, map_opts)
			end,
		}

		-- サーバーごとの設定をマージ
		if servers[server_name] then
			opts = vim.tbl_deep_extend("force", opts, servers[server_name])
		end

		lspconfig[server_name].setup(opts)
	end,
})
