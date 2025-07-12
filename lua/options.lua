local g = vim.g -- Global variables (maps, providers)
local opt = vim.opt -- Meta-table powered Option object

g.mapleader = " "
g.maplocalleader = "\\"
opt.laststatus = 3 -- Global statusline (Neovim ≥0.7)
opt.showmode = false -- Mode shown by statusline plugin instead
opt.number = true -- Absolute line numbers
opt.relativenumber = true -- Relative numbers for motions
opt.signcolumn = "yes:2" -- Reserve 2 columns (prevents text jitter)
opt.cursorline = true
opt.termguicolors = true
opt.splitright = true
opt.splitbelow = true
opt.mouse = "a" -- Enable mouse everywhere
opt.timeoutlen = 400 -- Faster which‑key‑like popups
opt.list = true
opt.listchars = { tab = "»·", trail = "·", nbsp = "␣", extends = "…", precedes = "…", eol = "↲" }
opt.fillchars = { eob = " " } -- Hide ~ on blank lines
opt.clipboard:prepend "unnamedplus"
opt.expandtab = true -- Always spaces, never hard TABs
opt.shiftwidth = 2 -- >> indents 2 columns
opt.tabstop = 2 -- A TAB counts for 2 columns visually
opt.softtabstop = 2
opt.smartindent = true -- Insert indents automatically in C‑like blocks
opt.ignorecase = true -- Case‑insensitive by default…
opt.smartcase = true -- … but smart when capitals present
opt.undofile = true -- Persistent undo across restarts
opt.undolevels = 1000 -- Plenty of history
opt.swapfile = false -- Use your VCS instead
vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })
opt.shortmess:append { I = true, c = true }
