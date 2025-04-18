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
  ensure_installed = vim.tbl_keys(servers)
})

local capabilities =  require("cmp_nvim_lsp").default_capabilities()
local builtin = require("telescope.builtin")

-- 各LSPのセットアップ
mason_lspconfig.setup_handlers({
  function(server_name)
    local opts = {
      capabilities = capabilities,
      on_attach = function(_, bufnr)
        local map_opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)           -- 定義へ
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, map_opts)         -- 宣言へ
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, map_opts)     -- 実装へ
vim.keymap.set("n", "gr", vim.lsp.buf.references, map_opts)         -- 参照へ
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, map_opts)    -- 型定義へ
vim.keymap.set("n", "K", vim.lsp.buf.hover, map_opts)               -- ドキュメント
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, map_opts)     -- 名前変更
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, map_opts)-- アクション
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, map_opts) -- 診断表示
      end,
    }

    -- サーバーごとの設定をマージ
    if servers[server_name] then
      opts = vim.tbl_deep_extend("force", opts, servers[server_name])
    end

    lspconfig[server_name].setup(opts)
  end,
})
