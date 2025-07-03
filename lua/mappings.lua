local map = vim.keymap.set

-- General
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("n", "<leader>y", "<cmd>%y+<CR>", { desc = "Yank entire file" })

-- FZF
map("n", "<leader><leader>", require("fzf-lua").files, { desc = "FZF: Files" })
map("n", "<leader>fb", require("fzf-lua").buffers, { desc = "FZF: Buffers" })
map("n", "<leader>fg", require("fzf-lua").live_grep, { desc = "FZF: Live Grep" })
map("n", "<leader>fw", require("fzf-lua").grep_cword, { desc = "FZF: Word under cursor" })
map("v", "<leader>fv", require("fzf-lua").grep_visual, { desc = "FZF: Visual selection" })
map("n", "<leader>fk", require("fzf-lua").keymaps, { desc = "FZF: Search Keymaps" })
map("n", "<leader>gs", require("fzf-lua").git_status, { desc = "Git: Status" })
map("n", "<leader>gb", require("fzf-lua").git_branches, { desc = "Git: Branches" })
map("n", "<leader>gc", require("fzf-lua").git_commits, { desc = "Git: Commits" })

-- map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Git: Diffview Open" })
-- map("n", "<leader>gq", "<cmd>DiffviewClose<cr>", { desc = "Git: Diffview Close" })
-- map("n", "<leader>gf", "<cmd>DiffviewToggleFiles<cr>", { desc = "Git: Toggle Diff Files" })
-- map("n", "<leader>gr", "<cmd>DiffviewRefresh<cr>", { desc = "Git: Refresh Diff" })
-- map("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", { desc = "Git: File History" })
-- map("n", "<leader>gl", "<cmd>Gitsigns blame_line<cr>", { desc = "Git: Blame Line" })
-- map("n", "<leader>gL", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Git: Toggle Line Blame" })
-- map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Git: Reset Buffer" })
-- map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Git: Stage Buffer" })
-- map("n", "<leader>gU", "<cmd>Gitsigns reset_buffer_index<cr>", { desc = "Git: Reset Index" })

-- Git hunks
-- map("n", "]c", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next Git Hunk" })
-- map("n", "[c", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous Git Hunk" })
-- map("n", "<leader>hh", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Git: Stage Hunk" })
-- map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Git: Undo Stage" })
-- map("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Git: Reset Hunk" })
-- map("v", "<leader>hh", ":Gitsigns stage_hunk<cr>", { desc = "Git: Stage Hunk" })
-- map("v", "<leader>hr", ":Gitsigns reset_hunk<cr>", { desc = "Git: Reset Hunk" })

-- Move lines
-- map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
-- map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
-- map("i", "<A-j>", "<ESC><cmd>m .+1<CR>==gi", { desc = "Move line down (Insert)" })
-- map("i", "<A-k>", "<ESC><cmd>m .-2<CR>==gi", { desc = "Move line up (Insert)" })
-- map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
-- map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Visual mode paste without overwriting clipboard
map("v", "p", '"_dP', { desc = "Paste without overwriting clipboard" })

-- Clipboard
map("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("v", "<leader>d", '"+d', { desc = "Delete to clipboard" })
map("i", "<C-v>", '<ESC>"+pa', { desc = "Paste clipboard in insert mode" })

-- Search
map("n", "<leader>/", ":%s/", { desc = "Search and replace file" })
map({ "i", "n" }, "<Esc>", "<cmd>noh<CR><Esc>", { desc = "Clear search highlight" })

-- File Explorer
map("n", "<leader>e", require("oil").toggle_float, { desc = "Toggle File Explorer" })

-- Quickfix
-- map("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Quickfix Open" })
-- map("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Quickfix Close" })
-- map("n", "<leader>qn", "<cmd>cnext<CR>", { desc = "Quickfix Next" })
-- map("n", "<leader>qp", "<cmd>cprev<CR>", { desc = "Quickfix Prev" })
-- map("n", "<leader>qf", "<cmd>cfirst<CR>", { desc = "Quickfix First" })
-- map("n", "<leader>ql", "<cmd>clast<CR>", { desc = "Quickfix Last" })

-- Diagnostics
map("n", "<leader>dt", ':lua vim.cmd("DiagnosticsToggle")<CR>', { desc = "Toggle diagnostics", silent = true })
map(
  "n",
  "<leader>dv",
  ':lua vim.cmd("DiagnosticsToggleVirtualText")<CR>',
  { desc = "Toggle virtual text", silent = true }
)
map("n", "<leader>df", function()
  vim.diagnostic.open_float { focusable = true }
end, { desc = "Float diagnostic" })

-- LSP Mappings
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP: Rename" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
map("n", "<leader>lh", vim.lsp.buf.hover, { desc = "LSP: Hover Docs" })
map("n", "<leader>ld", vim.lsp.buf.definition, { desc = "LSP: Go to Definition" })
map("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "LSP: Type Definition" })
map("n", "<leader>li", vim.lsp.buf.implementation, { desc = "LSP: Implementation" })
map("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "LSP: Signature Help" })
