return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      grep = {
        args = { "rg", "--vimgrep", "--smart-case", "--hidden", "--glob", "!.git" },
      },
      files = {
        hidden = true,
        ignored = true,
      }
    }
  },
  keys = {
    { "<leader>ff", function() require("snacks.picker").files() end, desc = "Find Files" },
    { "<leader>fg", function() require("snacks.picker").grep() end,  desc = "Grep" },
    { "<leader>fb", function() require("snacks.picker").buffers() end, desc = "Buffers" },
    { "<leader>fh", function() require("snacks.picker").help() end, desc = "Help" },
  }
}
