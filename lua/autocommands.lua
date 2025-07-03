local function augroup(name)
  return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

-- Highlight on yank.
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
  group = augroup "highlight_yank",
})

-- Setup linter.
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
  group = augroup "linter",
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup "whitespace",
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos "."
    vim.cmd [[%s/\s\+$//e]]
    vim.fn.setpos(".", save_cursor)
  end,
  desc = "Remove trailing whitespace on save",
})

-- Remember last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup "cursor_pos",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Remember last cursor position",
})

-- Go to last location when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup "last_pos",
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Go to last location when opening a buffer",
})
