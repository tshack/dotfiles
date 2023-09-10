" Clear the default YCM blacklist, which includes things like logfiles,
" markdown, mail, etc
let g:ycm_filetype_blacklist = {}

" By default <leader>d expands diagnostic (error/warning) messages
" Expand them in a popup instead of in the ex line
let g:ycm_show_detailed_diag_in_popup = 1

" Manual toggle for documentation popup
nmap <leader>D <plug>(YCMHover)

" Give documentation popup a fancy border & fix width to 100
augroup MyYCMCustom
  autocmd!
  autocmd FileType c,cpp,rust let b:ycm_hover = {
    \ 'command': 'GetDoc',
    \ 'syntax': &filetype,
    \ 'popup_params': {
    \     'maxwidth': 100,
    \     'border': [],
    \     'borderchars': ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
    \   },
    \ }
augroup END
