local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
  return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
end

protocol.CompletionItemKind = {
  "", -- Text
  "", -- Method
  "󰡱", -- Function
  "", -- Constructor
  "", -- Field
  "", -- Variable
  "", -- Class
  "", -- Interface
  "", -- Module
  "", -- Property
  "", -- Unit
  "", -- Value
  "", -- Enum
  "", -- Keyword
  "﬌", -- Snippet
  "", -- Color
  "", -- File
  "", -- Reference
  "", -- Folder
  "", -- EnumMember
  "", -- Constant
  "", -- Struct
  "", -- Event
  "ﬦ", -- Operator
  "", -- TypeParameter
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
  format = {
    enable = false,
  },
})

nvim_lsp.lua_ls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

nvim_lsp.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.handlers["textDocument/publishDiagnotics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = {
    border = "single",
    spacing = 4,
  },
  severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
  signs,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    border = "single",
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
})
