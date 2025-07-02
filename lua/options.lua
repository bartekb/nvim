-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Disable netrw (we use mini.files)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.diagnostic.config({ virtual_text = false })

local o = vim.opt

-- General
o.mouse = 'a'                    -- Enable mouse support
o.clipboard = 'unnamedplus'      -- Use system clipboard
o.swapfile = false               -- Disable swap files
o.backup = false                 -- Disable backup files
o.undofile = true                -- Enable persistent undo
o.undolevels = 10000             -- Lots of undo history
o.updatetime = 250               -- Faster completion
o.timeoutlen = 300               -- Faster key sequence timeout

-- UI
o.termguicolors = true           -- True color support
o.number = true                  -- Show line numbers
o.relativenumber = true          -- Show relative line numbers
o.signcolumn = 'yes'             -- Always show sign column
o.cursorline = true              -- Highlight current line
o.wrap = false                   -- Don't wrap lines
o.scrolloff = 8                  -- Keep 8 lines above/below cursor
o.sidescrolloff = 8              -- Keep 8 columns left/right of cursor
o.pumheight = 10                 -- Popup menu height
o.showmode = false               -- Don't show mode (statusline shows it)

-- Windows and splits
o.splitbelow = true              -- New horizontal splits go below
o.splitright = true              -- New vertical splits go right

-- Indentation
o.expandtab = true               -- Use spaces instead of tabs
o.shiftwidth = 2                 -- Number of spaces for indentation
o.tabstop = 2                    -- Number of spaces for tab
o.softtabstop = 2                -- Number of spaces for tab in insert mode
o.smartindent = true             -- Smart indentation
o.breakindent = true             -- Maintain indent when wrapping

-- Search
o.ignorecase = true              -- Case-insensitive search
o.smartcase = true               -- Case-sensitive if uppercase present
o.hlsearch = true                -- Highlight search results
o.incsearch = true               -- Incremental search

-- Completion
o.completeopt = 'menu,menuone,noselect'  -- Better completion experience

-- List characters (show whitespace)
o.list = true
o.listchars = {
  tab = '»·',
  trail = '·',
  nbsp = '␣',
  extends = '…',
  precedes = '…',
}

-- Fill characters
o.fillchars = {
  eob = ' ',                     -- Empty lines at end of buffer
}

-- Performance
o.lazyredraw = false             -- Don't redraw during macros (can cause issues)
o.synmaxcol = 240                -- Max column for syntax highlighting

-- Disable providers we don't need
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Session options
o.sessionoptions = {
  'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds'
}

-- Autoread files when changed outside of vim
o.autoread = true

-- Better display for messages
o.cmdheight = 1                  -- Command line height
o.shortmess:append('c')          -- Don't show completion messages
