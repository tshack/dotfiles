let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_loc_list_height=4

" pylint is very strict & the loc_list is persistent until you fix all errors.
" I write more proof-of-concept code in Python than distributable modules.
" So for Python, this feature is usually more annoying than helpful.
"autocmd FileType python let g:syntastic_auto_loc_list = 0

" pylint is insanely slow when importing modules.  In the context of
" syntactic, this causes writing to be super slow -- especially for larger
" libraries (i.e. networkx).  Use pyflakes instead, which is a more
" reasonable checker for constant in-editor checking.
let g:syntastic_python_checkers = ['flake8']

" Open error window manually via :Error or with this leader mapping
map <Leader>e :Error<CR>
map <Leader>S :SyntasticToggleMode<CR>
