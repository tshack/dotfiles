set nowrap
set number
set numberwidth=4
set hlsearch
set mouse=a
set textwidth=72
set guifont=Literation\ Mono\ Powerline\ 12
colorscheme easymoney
let mapleader=','
let maplocalleader=','
let g:tex_flavor = "latex"

set completeopt=menu

autocmd FileType rust set completeopt=menu,popup

map <Leader>c :lcd %:p:h<CR>
map <Leader>w :%s/\s\+$//<CR>
map <Leader>r :set relativenumber!<CR>
