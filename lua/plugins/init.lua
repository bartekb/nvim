return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  { lazy = true, "nvim-lua/plenary.nvim" },

  { "nvim-tree/nvim-web-devicons", opts = {} },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      return require "plugins.configs.lualine"
    end,
  },

  { "lewis6991/gitsigns.nvim", opts = {} },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  -- we use blink plugin only when in insert mode
  -- so lets lazyload it at InsertEnter event
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = {
      { "windwp/nvim-autopairs", opts = {} },
    },
    opts = function()
      return require "plugins.configs.blink"
    end,
  },

  -- {
  --   "williamboman/mason.nvim",
  --   build = ":MasonUpdate",
  --   cmd = { "Mason", "MasonInstall" },
  --   opts = {},
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require "plugins.configs.lspconfig"
  --   end,
  -- },

  {
    "stevearc/conform.nvim",
    opts = require "plugins.configs.conform",
  },

  -- {
  --   "nvimdev/indentmini.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   opts = {},
  -- },

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require "plugins.configs.fzf",
  },
}
