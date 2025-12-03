return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  opts = {
    lsp = {
      hover = { enabled = true, view = "hover" },
      signature = { enabled = true },
    },
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
    },

    messages = {
      enabled = true,
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "split",
    },

    presets = {
      lsp_doc_border = true,
      bottom_search = false,      -- / ? を下に出さない
      command_palette = false,    -- パレット無効
      long_message_to_split = true,
    },
  },
}
