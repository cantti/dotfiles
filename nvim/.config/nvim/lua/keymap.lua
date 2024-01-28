-- leader space
vim.g.mapleader = " "

-- telescope.nvim
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>")
vim.keymap.set('n', '<C-p>', ":Telescope find_files<CR>") -- vscode like
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>")
vim.keymap.set('n', '<C-f>', ":Telescope live_grep<CR>") -- vscode lile
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>")
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>")

-- clipboard
vim.keymap.set({'n', 'v'}, '\\', '"_')
vim.keymap.set('v', 'p', 'P')

-- nav between buffers
vim.keymap.set('n', 'gt', ':bnext<CR>')
vim.keymap.set('n', 'gT', ':bprev<CR>')

-- Ctrl+/ to comment
vim.keymap.set({'n', 'v'}, '<C-_>', '<Plug>NERDCommenterToggle')
vim.keymap.set('i', '<C-_>', '<Esc><Plug>NERDCommenterTogglei')

-- Ctrl + A to select all
vim.keymap.set('n', '<C-a>', 'ggVG')

-- Indentation
vim.keymap.set('n', '<leader>t4', ':set shiftwidth=4 tabstop=4<CR>')
vim.keymap.set('n', '<leader>t2', ':set shiftwidth=2 tabstop=2<CR>')

-- shift tab to de-indent
vim.keymap.set('i', '<S-Tab>', '<C-d>')
vim.keymap.set('v', '<Tab>', '>gv')
vim.keymap.set('v', '<S-Tab>', '<gv')
vim.keymap.set('n', '<Tab>', '>>')
vim.keymap.set('n', '<S-Tab>', '<<')

-- remap ^ and $
vim.keymap.set({'n', 'v', 'o'}, 'H', '^')
vim.keymap.set({'n', 'v', 'o'}, 'L', '$')

-- netrw
vim.keymap.set('n', '<leader>e', ':Ex<cr>')