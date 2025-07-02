local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not (vim.uv or vim.loop).fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.deps').setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

require "options"
require "mappings"

now(function()
  require('mini.starter').setup()
  require('mini.hues').setup({ background = '#11262d', foreground = '#c0c8cc' })
  require('mini.statusline').setup()
  require('mini.tabline').setup()
  require('mini.basics').setup({
    options = {
      basic = true,
      extra_ui = true,
      win_borders = 'bold',
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
  })
end)

later(function()
  -- require('mini.pick').setup({
  --     mappings = {
  --       to_quickfix = {
  --         char = "<C-q>",
  --         func = function()
  --           local items = MiniPick.get_picker_items() or {}
  --           MiniPick.default_choose_marked(items)
  --           MiniPick.stop()
  --         end,
  --       },
  --     },
  -- })
  require('mini.extra').setup()
  require('mini.files').setup({
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 50,
    },
  })

  require('mini.diff').setup({
    view = {
      style = 'sign',
      signs = { add = '+', change = '~', delete = '-' },
    },
  })

  require('mini.pairs').setup()
  require('mini.surround').setup()
  require('mini.comment').setup()

  -- require('mini.indentscope').setup({
  --   symbol = '│',
  --   options = { try_as_border = true },
  -- })

  require('mini.cursorword').setup()
  require('mini.ai').setup()
  require('mini.jump2d').setup()
  require('mini.notify').setup()
  require('mini.icons').setup()
  require('mini.sessions').setup()
  require('mini.completion').setup()
  require('mini.bracketed').setup()
  require('mini.move').setup()
  require('mini.trailspace').setup()
  require('mini.fuzzy').setup()
  require('mini.align').setup()
  require('mini.operators').setup()
  require('mini.bufremove').setup()
  require('mini.clue').setup({
    triggers = {
      -- Leader triggers
      { mode = 'n', keys = '<Leader>' },
      { mode = 'x', keys = '<Leader>' },

      -- Built-in completion
      { mode = 'i', keys = '<C-x>' },

      -- `g` key
      { mode = 'n', keys = 'g' },
      { mode = 'x', keys = 'g' },

      -- Marks
      { mode = 'n', keys = "'" },
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },

      -- Registers
      { mode = 'n', keys = '"' },
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },

      -- Window commands
      { mode = 'n', keys = '<C-w>' },

      -- `z` key
      { mode = 'n', keys = 'z' },
      { mode = 'x', keys = 'z' },
    },

    clues = {
      -- Basic clues for leader key
      { mode = 'n', keys = '<Leader>f', desc = '+find' },
      { mode = 'n', keys = '<Leader>b', desc = '+buffer' },
      { mode = 'n', keys = '<Leader>g', desc = '+git' },
      { mode = 'n', keys = '<Leader>l', desc = '+lsp' },
      { mode = 'n', keys = '<Leader>w', desc = '+window' },
    },
  })
end)

later(function()
  add('neovim/nvim-lspconfig')
  add('rachartier/tiny-inline-diagnostic.nvim')

  add({
    source = 'nvim-treesitter/nvim-treesitter',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })

  local lspconfig = require('lspconfig')
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = { enable = false },
        diagnostics = { globals = { 'vim' } },
      },
    },
  })
  lspconfig.ts_ls.setup({ capabilities = capabilities })
  lspconfig.jsonls.setup({ capabilities = capabilities })

  require('tiny-inline-diagnostic').setup()

  -- Treesitter configuration
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'lua', 'python', 'javascript', 'typescript', 'rust', 'go', 'c', 'cpp',
      'bash', 'json', 'yaml', 'html', 'css', 'markdown', 'vim', 'vimdoc', 'ruby', 'go'
    },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
    },
    -- Add these to satisfy the type checker
    modules = {},
    sync_install = false,
    ignore_install = {},
    auto_install = true,
    })
  end)

require "autocommands"
