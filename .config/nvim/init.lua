local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'tpope/vim-sleuth'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'nordtheme/vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
vim.call('plug#end')

require("nvim-tree").setup({
    actions = {
        open_file = {
          quit_on_open = true,
        },
    },
    filters = {
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
vim.opt.clipboard = 'unnamedplus'
vim.g.airline_powerline_fonts = 1

-- Neovim Cursor change after exiting Neovim bug fix
vim.opt.guicursor = disable

-- always show tab line
vim.opt.showtabline = 2

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
