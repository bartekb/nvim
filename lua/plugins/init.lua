return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  { lazy = true, "nvim-lua/plenary.nvim" },

  { "nvim-tree/nvim-web-devicons", opts = {} },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      return require "plugins.configs.tree"
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      return require "plugins.configs.lualine"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▍" },
        change = { text = "▍" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▍" },
        untracked = { text = "▍" },
      },
    },
  },

  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = {
      "TroubleToggle",
      "Trouble",
    },
    opts = {
      use_diagnostic_signs = true,
    },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Document Diagnostics (Trouble)",
      },
    },
  },

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

  {
    "stevearc/conform.nvim",
    opts = require "plugins.configs.conform",
  },

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require "plugins.configs.fzf",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      return require "plugins.configs.lsp"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require "lint"

      lint.linters_by_ft = {
        ruby = { "ruby" },
        fish = { "fish" },
        -- javascript = { "biomejs" },
        -- typescript = { "biomejs" },
        -- javascriptreact = { "biomejs" },
        -- typescriptreact = { "biomejs" },
        go = { "golangcilint" },
        -- svelte = { "eslint_d" },
        -- python = { "pylint" },
      }
    end,
  },
}
