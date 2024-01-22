let mapleader=" "

" clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p

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
nnoremap H ^
vnoremap H ^
onoremap H ^
nnoremap L $
vnoremap L $
onoremap L $
