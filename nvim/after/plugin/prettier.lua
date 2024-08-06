local status, prettier = pcall(require, "prettier")

prettier.setup({
  bin = "prettier",
  filetypes = {
    filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    },
  },
})
