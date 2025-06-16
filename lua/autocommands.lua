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

-- Close quickfix window when it is empty.
vim.api.nvim_create_autocmd({ "QuickFixCmdPost" }, {
  pattern = { "[^l]*" },
  callback = function()
    if vim.fn.getqflist({ winid = 0 })[1] == nil then
      vim.cmd.cclose()
    end
  end,
  group = augroup "quickfix",
})

-- Setup linter.
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
  group = augroup "linter",
})

-- Automatically open quickfix window when there are errors
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  group = vim.api.nvim_create_augroup("QuickFixAutoOpen", { clear = true }),
  pattern = "[^l]*",
  command = "cwindow",
})

-- Automatically open location list when there are errors
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  group = vim.api.nvim_create_augroup("LocationListAutoOpen", { clear = true }),
  pattern = "l*",
  command = "lwindow",
})

-- Set quickfix window height
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("QuickFixHeight", { clear = true }),
  pattern = "qf",
  command = "setlocal winheight=10",
})
