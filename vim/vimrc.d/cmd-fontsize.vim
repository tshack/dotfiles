function! FontSize(size)
    if has("gui_gtk2") && has("gui_running")
        let fontname = substitute(&guifont, '^\(.* \)\([1-9][0-9]*\)$', '\1', '')
        let cursize = substitute(&guifont, '^\(.* \)\([1-9][0-9]*\)$', '\2', '')
        if (a:size >= 6) && (a:size <= 48)
            let &guifont = fontname . a:size 
        endif
    else
        echoerr "You need to run the GTK2 version of Vim to use this function."
    endif
endfunction
command! -nargs=1 FontSize call FontSize(<f-args>)
