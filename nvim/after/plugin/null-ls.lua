local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint_d
  }
})

require("mason-null-ls").setup({
  ensure_installed = { "stylua", "prettier", "eslint_d" }
})
