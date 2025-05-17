require("nvim-tree").setup({
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
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  git = {
    ignore = false,
  },
})
