local Plug = vim.fn['plug#']

vim.call('plug#begin')
-- Plug 'tpope/vim-sleuth'
-- Plug 'akinsho/bufferline.nvim'
Plug 'nordtheme/vim'
-- Plug 'nvim-lualine/lualine.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
vim.call('plug#end')

-- enable true color 
vim.opt.termguicolors = true

-- set nord colorscheme
vim.cmd 'colorscheme nord'

-- bufferline
-- require("bufferline").setup{}

-- status line
-- require('lualine').setup{
--     options = {
--       disabled_filetypes = { 'NvimTree' },
--       icons_enabled = true,
--       section_separators = '', 
--       component_separators = ''
--     },
--     extensions = { 'fzf' }
-- }


vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'

-- Neovim Cursor change after exiting Neovim bug fix
vim.opt.guicursor = disable

-- This unsets the "last search pattern" register by hitting return
vim.keymap.set('n', '<CR>', ':noh<CR><CR>')

vim.keymap.set('n', '<F1>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-j>', ':bprev<CR>')
vim.keymap.set('n', '<C-k>', ':bnext<CR>')

-- fzf
vim.keymap.set('n', '<leader>ff', ':Files<CR>')
vim.keymap.set('n', '<leader>fb', ':Buffers<CR>')
vim.keymap.set('n', '<leader>fh', ':History<CR>')
vim.keymap.set('n', '<leader>fr', ':History:<CR>')

-- Comment
-- Ctrl+/ to comment
vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDSpaceDelims = 1
vim.keymap.set({'n', 'v'}, '<C-_>', '<Plug>NERDCommenterToggle<CR>')

-- Ctrl + A to select all
vim.keymap.set('n', '<C-a>', 'ggVG') 

-- display hidden characters
vim.opt.list = true
vim.opt.listchars = { tab = ">·", trail = "·", precedes = "←", extends = "→", eol = "↲", nbsp = "␣" }

-- indentation settings
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.keymap.set('n', '<leader>t4', ':set shiftwidth=4 tabstop=4<CR>')
vim.keymap.set('n', '<leader>t2', ':set shiftwidth=2 tabstop=2<CR>')

-- shift tab to de-indent
vim.keymap.set('i', '<S-Tab>', '<C-d>')