local mason_lspconfig = require("mason-lspconfig")
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
	ts_ls = {},
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

local function on_attach(client, bufnr)
	client.server_capabilities.semanticTokensProvider = nil
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
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

vim.lsp.config("*", {
	capabilities = cmp_capabilities,
	on_attach = on_attach,
})

for name, cfg in pairs(servers) do
	vim.lsp.config(name, cfg)
	vim.lsp.enable(name)
end
