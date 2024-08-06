local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons",  -- optional
    },
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  "github/copilot.vim",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  "neovim/nvim-lspconfig",
  {
    "onsails/lspkind.nvim",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
    },
  },
  "norcalli/nvim-colorizer.lua",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    build = ":MasonUpdate",
  },
  "MunifTanjim/prettier.nvim",
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  "windwp/nvim-ts-autotag",
  "norcalli/nvim-colorizer.lua",
  "nvim-tree/nvim-web-devicons",
  "lewis6991/gitsigns.nvim",
  "dinhhuy258/git.nvim",
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "nvimtools/none-ls.nvim"
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({
        indent = {
          chars = {
            "│",
          },
          style = {
            "#ADF8FF"
          }
        },
        chunk = {
          style = {
            "#ADF8FF"
          }
        },
        line_num = {
          style = {
            "#FFFFFF"
          }
        },
        blank = {
          enable = false,
        }
      })
    end,
  },
})
