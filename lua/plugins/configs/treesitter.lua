require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "html",
    "css",
    "typescript",
    "javascript",
    "ruby",
    "yaml",
    "go",
    "rust",
    "python",
    "bash",
    "sql",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
}
