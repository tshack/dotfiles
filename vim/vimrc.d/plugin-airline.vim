" enable powerline font
let g:airline_powerline_fonts = 1
" show all the time (not just when split)
set laststatus=2
" always display buffer tab line
"let g:airline#extensions#tabline#enabled = 1
" use straight buffer tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" cycle buffers using tab
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
