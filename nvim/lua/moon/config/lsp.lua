local mason_lspconfig = require("mason-lspconfig")
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
	ts_ls = {
		cmd = { "typescript-language-server", "--stdio" },
		filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "typescript.tsx" },
		root_markers = { "package.json" },
		workspace_required = true,
	},
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				diagnostics = { globals = { "vim" } },
			},
		},
	},
}

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

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

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local keyopts = { buffer = args.bufnr, noremap = true, silent = true }
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		client.server_capabilities.semanticTokensProvider = nil
		if client:supports_method("textDocument/implementation") then
			vim.keymap.set("n", "gD", vim.lsp.buf.implementation, keyopts)
		end
		if client:supports_method("textDocument/definition") then
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, keyopts)
		end
		if client:supports_method("textDocument/typeDefinition*") then
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, keyopts)
		end
		if client:supports_method("textDocument/references") then
			vim.keymap.set("n", "gr", vim.lsp.buf.references, keyopts)
		end
		if client:supports_method("textDocument/rename") then
			vim.keymap.set("n", "gn", vim.lsp.buf.rename, keyopts)
		end
		if client:supports_method("textDocument/codeAction") then
			vim.keymap.set("n", "<Leader>k", vim.lsp.buf.code_action, keyopts)
		end
		-- diagnostics float
		if client:supports_method("textDocument/publishDiagnostics") then
			vim.keymap.set("n", "<Leader>e", function()
				vim.diagnostic.open_float(nil, { focusable = false })
			end, keyopts)
		end
	end,
})

vim.lsp.config("*", {
	capabilities = cmp_capabilities,
})

for name, cfg in pairs(servers) do
	vim.lsp.config(name, cfg)
	vim.lsp.enable(name)
end
