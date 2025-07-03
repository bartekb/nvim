return {
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
    "gbprod/substitute.nvim",
    opts = {},
  },

  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      return require "plugins.configs.mini"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

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
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup()
      vim.diagnostic.config { virtual_text = false }
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require "lint"

      lint.linters_by_ft = {
        ruby = { "ruby" },
      }
    end,
  },
  {
    "stevearc/oil.nvim",
    opts = require "plugins.configs.fzf",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  },
  {
    "benomahony/oil-git.nvim",
    dependencies = { "stevearc/oil.nvim" },
  },

  {
    "JezerM/oil-lsp-diagnostics.nvim",
    dependencies = { "stevearc/oil.nvim" },
    opts = {},
  },
}
