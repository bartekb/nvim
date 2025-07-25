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
    "rust",
    "scss",
    "sql",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
    "toml",
  },

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,

    -- Disable highlighting for large files (>100 KB)
    disable = function(_, buf)
      local max_filesize = 200 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      return ok and stats and stats.size > max_filesize
    end,
  },

  indent = {
    enable = true,
    disable = { "yaml" }, -- YAML indentation can be quirky
  },
}
