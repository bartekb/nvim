require("nvim-tree").setup {
  disable_netrw = true,
  diagnostics = {
    enable = true,
    -- icons = {
    --   hint = "",
    --   info = "",
    --   warning = "",
    --   error = "",
    -- },
    show_on_dirs = true,
  },
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = false,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    ignore = false,
  },
}
