let mapleader=" "

" clipboard
noremap <leader>0 "0
noremap <leader>p "+

" nav between buffers
" VsVim and VSCodeVim work with tabs, not buffers
" uncomment for regular vim to switch buffers with gt
" nnoremap gt :bnext<CR>
" nnoremap gT :bprev<CR>

" Ctrl + A to select all
noremap <C-a> ggVG

" Tab and S-Tab
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <Tab> >>
nnoremap <S-Tab <<

" Ctrl + A to select all
noremap H ^
noremap L $

" Ctrl + S to save
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>

" Ctrl + q to exit
inoremap <C-q> :q<CR>
nnoremap <C-q> :q<CR>
