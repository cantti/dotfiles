let mapleader=" "

" clipboard
noremap <leader>y "+y
noremap <leader>p "+p

" nav between buffers
nnoremap gt :bnext<CR>
nnoremap gT :bprev<CR>

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
inoremap <C-s> :w<CR>
nnoremap <C-s> :w<CR>

" Ctrl + q to exit
inoremap <C-q> :q<CR>
nnoremap <C-q> :q<CR>