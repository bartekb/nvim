-- nvim_options.lua – robust defaults tuned for TS / Rails / Postgres development
-- ================================================================

-- Aliases -------------------------------------------------------------------
local g   = vim.g         -- Global variables (maps, providers)
local opt = vim.opt       -- Meta-table powered Option object

-------------------------------------------------------------------------------
-- 1. Leaders -----------------------------------------------------------------
-------------------------------------------------------------------------------
-- Use <Space> for global and \ for window‑local mappings.  They must be set
-- *before* any mapping calls or plugin loader.
g.mapleader      = " "
g.maplocalleader = "\\"

-------------------------------------------------------------------------------
-- 2. Statusline & UI ----------------------------------------------------------
-------------------------------------------------------------------------------
opt.laststatus       = 3          -- Global statusline (Neovim ≥0.7)
opt.showmode         = false      -- Mode shown by statusline plugin instead
opt.number           = true       -- Absolute line numbers
opt.relativenumber   = true       -- Relative numbers for motions
opt.signcolumn       = "yes:2"    -- Reserve 2 columns (prevents text jitter)
opt.cursorline       = true
opt.termguicolors    = true
opt.splitright       = true
opt.splitbelow       = true
opt.mouse            = "a"        -- Enable mouse everywhere
opt.timeoutlen       = 400        -- Faster which‑key‑like popups

-- Render invisible characters (helpful when pairing or pasting).
opt.list       = true
opt.listchars  = { tab = "»·", trail = "·", nbsp = "␣", extends = "…", precedes = "…", eol = "↲" }
opt.fillchars  = { eob = " " } -- Hide ~ on blank lines

-------------------------------------------------------------------------------
-- 3. Clipboard ---------------------------------------------------------------
-------------------------------------------------------------------------------
-- Prefer system clipboard.  If OSC52 is available (SSH or tmux), use it as a
-- *fallback* by appending to the default provider instead of replacing it.
opt.clipboard:prepend("unnamedplus")

local has_osc52, osc52 = pcall(require, "vim.ui.clipboard.osc52")
if has_osc52 then
  g.clipboard = {
    name = "osc52 and fallback",
    copy = {
      ["+"] = osc52.copy "+",
      ["*"] = osc52.copy "*",
    },
    paste = {
      ["+"] = osc52.paste "+",
      ["*"] = osc52.paste "*",
    },
  }
end

-------------------------------------------------------------------------------
-- 4. Indentation -------------------------------------------------------------
-------------------------------------------------------------------------------
-- Force **two‑space soft tabs everywhere** (even for filetype plugins that
-- default to something else).  Override with modelines if needed.
opt.expandtab   = true   -- Always spaces, never hard TABs
opt.shiftwidth  = 2      -- >> indents 2 columns
opt.tabstop     = 2      -- A TAB counts for 2 columns visually
opt.softtabstop = 2
opt.smartindent = true   -- Insert indents automatically in C‑like blocks

-- Autocmd to ensure every buffer stays on 2‑space indent regardless of
-- filetype‑specific defaults.
vim.api.nvim_create_autocmd("FileType", {
  group    = vim.api.nvim_create_augroup("UniversalTwoSpaceIndent", { clear = true }),
  callback = function()
    vim.opt_local.expandtab   = true
    vim.opt_local.shiftwidth  = 2
    vim.opt_local.tabstop     = 2
    vim.opt_local.softtabstop = 2
  end,
})

-------------------------------------------------------------------------------
-- 5. Search ------------------------------------------------------------------
-------------------------------------------------------------------------------
opt.ignorecase = true     -- Case‑insensitive by default…
opt.smartcase  = true     -- … but smart when capitals present

-------------------------------------------------------------------------------
-- 6. Persistence -------------------------------------------------------------
-------------------------------------------------------------------------------
opt.undofile     = true                               -- Persistent undo across restarts
opt.undolevels   = 10000                              -- Plenty of history
opt.swapfile     = false                              -- Use your VCS instead

-------------------------------------------------------------------------------
-- 7. Performance tweaks ------------------------------------------------------
-- Additional tweaks live in plugin configs if needed for very large files
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- 8. Highlight groups --------------------------------------------------------
-------------------------------------------------------------------------------
vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })

-------------------------------------------------------------------------------
-- 9. Misc --------------------------------------------------------------------
-------------------------------------------------------------------------------
opt.shortmess:append({ I = true, c = true })
