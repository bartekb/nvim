require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "dockerfile",
    "elixir",
    "fish",
    "git_rebase",
    "gitcommit",
    "graphql",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "markdown",
    "markdown_inline",
    "ruby",
    "go",
    "rust",
    "scss",
    "sql",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
    "toml",
    "prisma",       -- (optional for Nest.js + Prisma)
    "proto",        -- (optional for Nest.js + gRPC)
  },

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,

    disable = function(_, buf)
      local max_filesize = 200 * 1024
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      return ok and stats and stats.size > max_filesize
    end,
  },

  indent = {
    enable = true,
    disable = { "yaml" },
  },
}
