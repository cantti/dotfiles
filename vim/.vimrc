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
