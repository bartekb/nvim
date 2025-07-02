local map = vim.keymap.set

-- General
map("n", "<leader>y", "<cmd>%y+<CR>", { desc = "Yank entire file" })

-- File operations (VSCode-like)
map("n", "<C-S-p>", function() require('mini.extra').pickers.commands() end, { desc = "Command palette" })
map("n", "<leader><leader>", function() require('mini.pick').builtin.files() end, { desc = "Find files" })
map("n", "<leader>fb", function() require('mini.pick').builtin.buffers() end, { desc = "Find buffers" })
map("n", "<leader>fg", function() require('mini.pick').builtin.grep_live() end, { desc = "Live grep" })
map("n", "<leader>fw", function() require('mini.pick').builtin.grep({ pattern = vim.fn.expand('<cword>') }) end, { desc = "Find word under cursor" })
map("n", "<leader>fh", function() require('mini.pick').builtin.help() end, { desc = "Find help" })
map("n", "<leader>fr", function() require('mini.extra').pickers.oldfiles() end, { desc = "Recent files" })
map("n", "<leader>fc", function() require('mini.extra').pickers.git_commits() end, { desc = "Git commits" })

-- File explorer (VSCode-like sidebar)
map("n", "<leader>e", function() require('mini.files').open() end, { desc = "File explorer" })
map("n", "<leader>E", function() require('mini.files').open(vim.api.nvim_buf_get_name(0)) end, { desc = "File explorer (current file)" })

-- Buffer management
map("n", "<leader>bd", function() require('mini.bufremove').delete() end, { desc = "Delete buffer" })
map("n", "<leader>bD", function() require('mini.bufremove').delete(0, true) end, { desc = "Delete buffer (force)" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Visual mode paste without overwriting clipboard
map("v", "p", '"_dP', { desc = "Paste without overwriting clipboard" })

-- Clipboard operations
map("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("v", "<leader>d", '"+d', { desc = "Delete to clipboard" })
map("i", "<C-v>", '<ESC>"+pa', { desc = "Paste clipboard in insert mode" })

-- LSP mappings
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Diagnostics
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show diagnostics" })
-- map("n", "[d", vim.diagnostic.jump { count = -1 }, { desc = "Previous diagnostic" })
-- map("n", "]d", vim.diagnostic.jump { count = 1 }, { desc = "Next diagnostic" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostics to location list" })

-- Git (using mini.diff)
map("n", "<leader>gh", function() require('mini.diff').toggle_overlay() end, { desc = "Toggle git overlay" })
map("n", "]h", function() require('mini.diff').goto_hunk('next') end, { desc = "Next git hunk" })
map("n", "[h", function() require('mini.diff').goto_hunk('prev') end, { desc = "Previous git hunk" })

-- Sessions
map("n", "<leader>ss", function() require('mini.sessions').select() end, { desc = "Select session" })
map("n", "<leader>sw", function() require('mini.sessions').write() end, { desc = "Write session" })

-- Quickfix
map("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open quickfix" })
map("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close quickfix" })
map("n", "<leader>qn", "<cmd>cnext<CR>", { desc = "Next quickfix" })
map("n", "<leader>qp", "<cmd>cprev<CR>", { desc = "Previous quickfix" })

-- Utility
map("n", "<leader>nh", "<cmd>noh<CR>", { desc = "Clear search highlights" })

