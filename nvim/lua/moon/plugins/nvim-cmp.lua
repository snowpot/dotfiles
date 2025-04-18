return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },       -- LSP補完
    { "hrsh7th/cmp-buffer" },         -- バッファ補完（キャッシュ付きで軽い）
    { "hrsh7th/cmp-path" },           -- パス補完
    {
      "L3MON4D3/LuaSnip",             -- スニペット
      build = "make install_jsregexp", -- 正規表現強化（任意）
    },
    { "saadparwaiz1/cmp_luasnip" },   -- LuaSnip連携
    {
      "onsails/lspkind.nvim",         -- アイコン（軽量＆キャッシュ有効）
      opts = {
        mode = "symbol",              -- シンプルモードで描画軽量化
        maxwidth = 40,
        ellipsis_char = "...",
      },
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol",
          maxwidth = 40,
          ellipsis_char = "...",
        }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      performance = {
        debounce = 60,
        throttle = 30,
        fetching_timeout = 200,
      },
    })
  end,
}
