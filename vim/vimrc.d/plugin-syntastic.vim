let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_loc_list_height=4

" pylint is very strict & the loc_list is persistent until you fix all errors.
" I write more proof-of-concept code in Python than distributable modules.
" So for Python, this feature is usually more annoying than helpful.
autocmd FileType python let g:syntastic_auto_loc_list = 0

" Open error window manually via :Error or with this leader mapping
map <Leader>e :Error<CR>
map <Leader>S :SyntasticToggleMode<CR>
