local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'tpope/vim-sleuth'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'nordtheme/vim'
-- Plug 'vim-airline/vim-airline'
-- Plug 'itchyny/lightline.vim'
Plug 'nvim-lualine/lualine.nvim'
vim.call('plug#end')

require("nvim-tree").setup({
    actions = {
        open_file = {
          quit_on_open = true,
        },
    },
    filters = {
      dotfiles = true,
      custom = { '^.git$' }
    },
})

-- enable true color 
vim.opt.termguicolors = true

-- set nord colorscheme
vim.cmd 'colorscheme nord'

-- bufferline
require("bufferline").setup{}

-- status line
require('lualine').setup{
    options = {
      disabled_filetypes = { 'NvimTree' },
    }   
}

-- nerd tree show hidden files 
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeIgnore = { '.git$' }

-- nerd tree quit on open
vim.g.NERDTreeQuitOnOpen = 1

vim.opt.number = true
vim.opt.clipboard = unnamedplus
vim.g.airline_powerline_fonts = 1

-- Neovim Cursor change after exiting Neovim bug fix
vim.opt.guicursor = disable

-- always show tab line
vim.opt.showtabline = 2

-- This unsets the "last search pattern" register by hitting return
vim.keymap.set('n', '<CR>', ':noh<CR><CR>')

vim.keymap.set('n', '<F1>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-j>', ':bprev<CR>')
vim.keymap.set('n', '<C-k>', ':bnext<CR>')