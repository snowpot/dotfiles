return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
    },
  },
  keys = {
    {
      "ff",
      function() require("snacks").picker.files() end,
      desc = "Find files",
    },
  },
}
