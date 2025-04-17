local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- LSPごとの個別設定
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

-- cmp.nvim用capabilities（使ってなければこの行削除可）
local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities() or {}
)

-- 各LSPのセットアップ
mason_lspconfig.setup_handlers({
  function(server_name)
    local opts = {
      capabilities = capabilities,
      on_attach = function(_, bufnr)
        local map_opts = { buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, map_opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, map_opts)
      end,
    }

    -- サーバーごとの設定をマージ
    if servers[server_name] then
      opts = vim.tbl_deep_extend("force", opts, servers[server_name])
    end

    lspconfig[server_name].setup(opts)
  end,
})
