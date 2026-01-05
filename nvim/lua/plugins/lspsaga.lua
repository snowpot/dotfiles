return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  opts = {
    ui = {
      border = "single",
    },
    symbol_in_winbar = {
      enable = true,
      separator = " > ",
      folder_level = 1,
    },
    lightbulb = {
      enable = false,
      sign = false,
      virtual_text = false,
    },
    beacon = { enable = false }
  }
}
