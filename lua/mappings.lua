local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")
map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole filecontent

-- FZF
map('n', '<leader><leader>', require('fzf-lua').files, { desc = 'Fzf Files' })
map('n', '<leader>bb', require('fzf-lua').buffers, { desc = 'Fzf Buffers' })
map('n', '<leader>ss', require('fzf-lua').live_grep, { desc = 'Fzf Grep' })
map('n', '<leader>sw', require('fzf-lua').grep_cword, { desc = 'Search word under cursor' })
map('v', '<leader>sv', require('fzf-lua').grep_visual, { desc = 'Search selection' })
map('n', '<leader>gs', require('fzf-lua').git_status, { desc = 'Github Status' })
map('n', '<leader>gb', require('fzf-lua').git_branches, { desc = 'Github Branches' })
map('n', '<leader>gc', require('fzf-lua').git_commits, { desc = 'Github Commits' })
