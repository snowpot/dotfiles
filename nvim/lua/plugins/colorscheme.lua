return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    theme = "dragon",
    compile = false,
    colors = {
      palette = {
        sumiInk0 = "#191919",
        sumiInk1 = "#4c4c4c"
      },
      theme = {
        dragon =  {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },
    overrides = function(colors)
      return {
        Normal       = { bg = "#191919" },
        NormalFloat  = { bg = "#191919" },
        SignColumn   = { bg = "#191919" },
        LineNr       = { bg = "#191919" },
        CursorLine   = { bg = "#191919" },
        MsgArea      = { bg = "#191919" },
        WinSeparator = { bg = "#191919" },
      }
    end,
  },

  config = function(_, opts)
    require("kanagawa").setup(opts)
    vim.cmd.colorscheme("kanagawa-dragon")
  end,
}
