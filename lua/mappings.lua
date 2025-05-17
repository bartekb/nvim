local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")
map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole filecontent

-- FZF
map("n", "<leader><leader>", require("fzf-lua").files, { desc = "Fzf Files" })
map("n", "<leader>bb", require("fzf-lua").buffers, { desc = "Fzf Buffers" })
map("n", "<leader>ss", require("fzf-lua").live_grep, { desc = "Fzf Grep" })
map("n", "<leader>sw", require("fzf-lua").grep_cword, { desc = "Search word under cursor" })
map("v", "<leader>sv", require("fzf-lua").grep_visual, { desc = "Search selection" })
map("n", "<leader>gs", require("fzf-lua").git_status, { desc = "Github Status" })
map("n", "<leader>gb", require("fzf-lua").git_branches, { desc = "Github Branches" })
map("n", "<leader>gc", require("fzf-lua").git_commits, { desc = "Github Commits" })

-- Move Lines.
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- <option> delete to delete a word in insert mode.
map("i", "<A-BS>", "<C-w>", { desc = "Delete word before cursor", remap = true })

-- Better indent.
map("v", "<", "<gv")
map("v", ">", ">gv")

-- LSP actions.
map("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename item" })
map("n", "<leader>k", vim.lsp.buf.hover, { desc = "Show docs for item under cursor" })
map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Perform code :action" })

-- Search.
map("n", "<leader>s", ":%s/", { desc = "Search and replace file" })
map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Keybinding to toggle inline diagnostics
map("n", "<Leader>ii", ':lua vim.cmd("DiagnosticsToggleVirtualText")<CR>', { noremap = true, silent = true })
map("n", "<Leader>id", ':lua vim.cmd("DiagnosticsToggle")<CR>', { noremap = true, silent = true })
map("n", "<leader>z", function()
  vim.diagnostic.open_float { focusable = true }
end, { desc = "Expand an Error into a float" })

map("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
