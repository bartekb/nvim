require("mini.starter").setup()
require("mini.hues").setup { background = "#11262d", foreground = "#c0c8cc" }
require("mini.statusline").setup()
require("mini.tabline").setup()
require("mini.basics").setup {
  options = {
    basic = true,
    extra_ui = true,
    win_borders = "bold",
  },
  mappings = {
    basic = true,
    option_toggle_prefix = [[\]],
    windows = true,
    move_with_alt = true,
  },
  autocommands = {
    basic = true,
    relnum_in_visual_mode = true,
  },
}

require("mini.extra").setup()
require("mini.files").setup {
  windows = {
    preview = true,
    width_focus = 30,
    width_preview = 50,
  },
}

require("mini.diff").setup {
  view = {
    style = "sign",
    signs = { add = "+", change = "~", delete = "-" },
  },
}

require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.comment").setup()
require("mini.cursorword").setup()
require("mini.ai").setup()
require("mini.jump2d").setup()
require("mini.notify").setup()
require("mini.icons").setup()
require("mini.sessions").setup()
require("mini.completion").setup()
require("mini.bracketed").setup()
require("mini.move").setup()
require("mini.trailspace").setup()
-- require("mini.fuzzy").setup()
require("mini.align").setup()
require("mini.operators").setup()
require("mini.bufremove").setup()
require("mini.clue").setup {
  triggers = {
    -- Leader triggers
    { mode = "n", keys = "<Leader>" },
    { mode = "x", keys = "<Leader>" },

    -- Built-in completion
    { mode = "i", keys = "<C-x>" },

    -- `g` key
    { mode = "n", keys = "g" },
    { mode = "x", keys = "g" },

    -- Marks
    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "`" },

    -- Registers
    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },

    -- Window commands
    { mode = "n", keys = "<C-w>" },

    -- `z` key
    { mode = "n", keys = "z" },
    { mode = "x", keys = "z" },
  },

  clues = {
    -- Basic clues for leader key
    { mode = "n", keys = "<Leader>f", desc = "+find" },
    { mode = "n", keys = "<Leader>b", desc = "+buffer" },
    { mode = "n", keys = "<Leader>g", desc = "+git" },
    { mode = "n", keys = "<Leader>l", desc = "+lsp" },
    { mode = "n", keys = "<Leader>w", desc = "+window" },
  },
}
