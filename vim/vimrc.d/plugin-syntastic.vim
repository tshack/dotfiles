" I don't like auto loc list.  For example, pylint is very strict about
" escaping multline list comprehensions, function parameters, etc.  You are
" stuck with the error window until you fix these -- no way to close it.
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_loc_list_height=4

" Just open error window manually via |:Error|
