return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      animation = false,
      tabpages = true,
      clickable = true,
      focus_on_close = "left",
      insert_at_end = true,
    },
    config = function(_, opts)
      require("barbar").setup(opts)

      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { desc = desc })
      end

      map("<Tab>", "<Cmd>BufferNext<CR>", "Buffer: next")
      map("<S-Tab>", "<Cmd>BufferPrevious<CR>", "Buffer: previous")
      map("<leader>bd", "<Cmd>BufferClose<CR>", "Buffer: close")
      map("<leader>bp", "<Cmd>BufferPin<CR>", "Buffer: pin buffer")
    end,
  },
}
