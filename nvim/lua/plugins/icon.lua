return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      default = true,
    },
  },
  {
    "nvim-mini/mini.icons",
    version = "*",
    config = function()
      require("mini.icons").setup()
    end,
  },
}
