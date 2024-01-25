local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tomasiser/vim-code-dark'
Plug 'nvim-lualine/lualine.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lua/plenary.nvim' -- required by telescope.nvim
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' }) 
vim.call('plug#end')

-- enable true color 
vim.opt.termguicolors = true
--
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
vim.opt.clipboard = 'unnamedplus'
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>0', '"0p')
vim.keymap.set('v', 'p', 'P')

-- nav between buffers
vim.keymap.set('n', 'gt', ':bnext<CR>')
vim.keymap.set('n', 'gT', ':bprev<CR>')

-- telescope.nvim
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>")
vim.keymap.set('n', '<C-p>', ":Telescope find_files<CR>") -- vscode like
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>")
vim.keymap.set('n', '<C-f>', ":Telescope live_grep<CR>") -- vscode lile
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>")
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>")
require('telescope').setup{
  pickers = {
    find_files = {
      find_command = {
        "fd", "--type", "f", "--hidden", "--exclude", ".git", "--exclude", "node_modules"
      }
    }
  },
}

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

-- Ctrl + S to save
vim.keymap.set('n', '<C-s>', ':w<CR>') 
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>') 

-- Ctrl + q to exit
vim.keymap.set({ 'n', 'i' }, '<C-q>', ':q<CR>') 

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
vim.keymap.set('v', '<Tab>', '>gv')
vim.keymap.set('v', '<S-Tab>', '<gv')
vim.keymap.set('n', '<Tab>', '>>')
vim.keymap.set('n', '<S-Tab>', '<<')

-- autopairs
require("nvim-autopairs").setup {}

-- remap ^ and $
vim.keymap.set({'n', 'v', 'o'}, 'H', '^')
vim.keymap.set({'n', 'v', 'o'}, 'L', '$')

-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "vimdoc" },
  highlight = {
    enable = true
  },
}
