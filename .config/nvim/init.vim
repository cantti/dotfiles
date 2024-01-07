call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tpope/vim-sleuth'
call plug#end()

set number

syntax on
filetype on

set clipboard=unnamedplus

set wildmenu

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Neovim Cursor change after exiting Neovim bug fix
set guicursor="disable"

" always show tab line
set showtabline=2

" hide ~
set fillchars=eob:\ 

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" nerd tree show hidden files 
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$']

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
