local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tomasiser/vim-code-dark'
Plug 'nvim-lualine/lualine.nvim'
Plug 'windwp/nvim-autopairs'
vim.call('plug#end')

-- enable true color 
vim.opt.termguicolors = true

-- set colorscheme
vim.cmd 'colorscheme codedark'

-- lualine
require('lualine').setup {
  options = {
    theme = 'iceberg_dark',
    section_separators = '',
    component_separators = '',
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_z = {'tabs'}
  }
}

-- reduce update time for immediate git status (airblade/vim-gitgutter)
vim.opt.updatetime = 100

-- leader space
vim.g.mapleader = " "

-- line number
vim.opt.number = true
vim.opt.relativenumber = true

-- clipboard config
-- vim.opt.clipboard = 'unnamedplus'
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')

-- Neovim Cursor change after exiting Neovim bug fix
-- vim.opt.guicursor = disable

-- delete instead of cut (use x for cut)
-- vim.keymap.set({'n', 'v'}, 'd', '"_d')
-- vim.keymap.set({'n', 'v'}, 'D', '"_D')
-- vim.keymap.set({'n', 'v'}, 'c', '"_c')
-- vim.keymap.set({'n', 'v'}, 'C', '"_C')

-- nav between buffers
vim.keymap.set('n', 'gt', ':bnext<CR>')
vim.keymap.set('n', 'gT', ':bprev<CR>')

-- fzf
vim.keymap.set('n', '<C-p>', ':Files<CR>')
vim.keymap.set('n', '<leader>f', ':Files<CR>')
vim.keymap.set('n', '<C-b>', ':Buffers<CR>')
vim.keymap.set('n', '<leader>b', ':Buffers<CR>')
vim.keymap.set('n', '<leader>h', ':History<CR>')
vim.keymap.set('n', '<leader>r', ':History:<CR>')

-- Nerdcommenter settings
vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDToggleCheckAllLines = 1

-- Ctrl+/ to comment
vim.keymap.set({'n', 'v'}, '<C-_>', '<Plug>NERDCommenterToggle')
vim.keymap.set('i', '<C-_>', '<Esc><Plug>NERDCommenterTogglei')

-- Ctrl + A to select all
vim.keymap.set('n', '<C-a>', 'ggVG') 

-- display hidden characters
-- use :set list or :set nolist
vim.opt.list = true
vim.opt.listchars = { 
  tab = ">·",
  trail = "·",
  -- precedes = "←",
  -- extends = "→",
  -- eol = "↲",
  nbsp = "␣",
  space = "·"
}

-- indentation settings
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.keymap.set('n', '<leader>t4', ':set shiftwidth=4 tabstop=4<CR>')
vim.keymap.set('n', '<leader>t2', ':set shiftwidth=2 tabstop=2<CR>')

-- shift tab to de-indent
vim.keymap.set('i', '<S-Tab>', '<C-d>')

-- autopairs
require("nvim-autopairs").setup {}

-- remap ^ and $
vim.keymap.set({'n', 'v', 'o'}, 'H', '^')
vim.keymap.set({'n', 'v', 'o'}, 'L', '$')
