syntax on
set showcmd
set nowrap
set number
set numberwidth=4
set hlsearch
set backup
set backupdir=~/.vim_backup/
set history=50
set guifont=Literation\ Mono\ Powerline\ 14
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" automatically indent
set autoindent
" use spaces instead of tabs
set expandtab
" # of characters limited to a line
set textwidth=78
" # of spaces for tab
set tabstop=4
" # of spaces for an indent
set shiftwidth=4
" round indent to multiple of shiftwidth
set shiftround
" automatic c code indenting
"set cindent

:if has('gui_running')
    " GUI mode only stuff
:else
    colorscheme elflord
:endif
