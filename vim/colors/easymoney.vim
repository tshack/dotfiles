" Vim color file
" Maintainer:   James A. Shackleford (shack at linux dot com)
" Last Change:  July 23rd, 2015
"
" easymoney.vim - a modified version of slate.vim that works on xterms with
" 88 or 256 colors. The algorithm for approximating the GUI colors with the
" xterm palette is from desert256.vim by Henry So Jr.


set background=dark

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name = "easymoney"

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif


" ======== START FUNCTIONS ================================================

" returns an approximate grey index for the given grey level
fun <SID>grey_number(x)
    if &t_Co == 88
        if a:x < 23
            return 0
        elseif a:x < 69
            return 1
        elseif a:x < 103
            return 2
        elseif a:x < 127
            return 3
        elseif a:x < 150
            return 4
        elseif a:x < 173
            return 5
        elseif a:x < 196
            return 6
        elseif a:x < 219
            return 7
        elseif a:x < 243
            return 8
        else
            return 9
        endif
    else
        if a:x < 14
            return 0
        else
            let l:n = (a:x - 8) / 10
            let l:m = (a:x - 8) % 10
            if l:m < 5
                return l:n
            else
                return l:n + 1
            endif
        endif
    endif
endfun

" returns the actual grey level represented by the grey index
fun <SID>grey_level(n)
    if &t_Co == 88
        if a:n == 0
            return 0
        elseif a:n == 1
            return 46
        elseif a:n == 2
            return 92
        elseif a:n == 3
            return 115
        elseif a:n == 4
            return 139
        elseif a:n == 5
            return 162
        elseif a:n == 6
            return 185
        elseif a:n == 7
            return 208
        elseif a:n == 8
            return 231
        else
            return 255
        endif
    else
        if a:n == 0
            return 0
        else
            return 8 + (a:n * 10)
        endif
    endif
endfun

" returns the palette index for the given grey index
fun <SID>grey_color(n)
    if &t_Co == 88
        if a:n == 0
            return 16
        elseif a:n == 9
            return 79
        else
            return 79 + a:n
        endif
    else
        if a:n == 0
            return 16
        elseif a:n == 25
            return 231
        else
            return 231 + a:n
        endif
    endif
endfun

" returns an approximate color index for the given color level
fun <SID>rgb_number(x)
    if &t_Co == 88
        if a:x < 69
            return 0
        elseif a:x < 172
            return 1
        elseif a:x < 230
            return 2
        else
            return 3
        endif
    else
        if a:x < 75
            return 0
        else
            let l:n = (a:x - 55) / 40
            let l:m = (a:x - 55) % 40
            if l:m < 20
                return l:n
            else
                return l:n + 1
            endif
        endif
    endif
endfun

" returns the actual color level for the given color index
fun <SID>rgb_level(n)
    if &t_Co == 88
        if a:n == 0
            return 0
        elseif a:n == 1
            return 139
        elseif a:n == 2
            return 205
        else
            return 255
        endif
    else
        if a:n == 0
            return 0
        else
            return 55 + (a:n * 40)
        endif
    endif
endfun

" returns the palette index for the given R/G/B color indices
fun <SID>rgb_color(x, y, z)
    if &t_Co == 88
        return 16 + (a:x * 16) + (a:y * 4) + a:z
    else
        return 16 + (a:x * 36) + (a:y * 6) + a:z
    endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun <SID>color(r, g, b)
    " get the closest grey
    let l:gx = <SID>grey_number(a:r)
    let l:gy = <SID>grey_number(a:g)
    let l:gz = <SID>grey_number(a:b)

    " get the closest color
    let l:x = <SID>rgb_number(a:r)
    let l:y = <SID>rgb_number(a:g)
    let l:z = <SID>rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
        " there are two possibilities
        let l:dgr = <SID>grey_level(l:gx) - a:r
        let l:dgg = <SID>grey_level(l:gy) - a:g
        let l:dgb = <SID>grey_level(l:gz) - a:b
        let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
        let l:dr = <SID>rgb_level(l:gx) - a:r
        let l:dg = <SID>rgb_level(l:gy) - a:g
        let l:db = <SID>rgb_level(l:gz) - a:b
        let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
        if l:dgrey < l:drgb
            " use the grey
            return <SID>grey_color(l:gx)
        else
            " use the color
            return <SID>rgb_color(l:x, l:y, l:z)
        endif
    else
        " only one possibility
        return <SID>rgb_color(l:x, l:y, l:z)
    endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun <SID>rgb(rgb)
    let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
    let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
    let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
    return <SID>color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun <SID>X(group, fg, bg, attr)
    if a:fg != ""
        exec "hi ".a:group." guifg=#".a:fg." ctermfg=".<SID>rgb(a:fg)
    endif
    if a:bg != ""
        exec "hi ".a:group." guibg=#".a:bg." ctermbg=".<SID>rgb(a:bg)
    endif
    if a:attr != ""
        if a:attr == 'italic'
            exec "hi ".a:group." gui=".a:attr." cterm=none"
        else
            exec "hi ".a:group." gui=".a:attr." cterm=".a:attr
        endif
    endif
endfun

" ======== END FUNCTIONS ==================================================

call <SID>X("Normal",       "ffffff",   "242424",   "none")
call <SID>X("Cursor",       "708090",   "f0e68c",   "none")
            "CursorLine
            "CursorColumn
            "CursorIM
            "Question
            "IncSearch
call <SID>X("IncSearch",    "00ff00",   "000000",   "none")
call <SID>X("Search",       "f5deb3",   "cd853f",   "none")
            "MatchParen"
call <SID>X("SpecialKey",	"9acd32",	      "",	"none")
call <SID>X("Visual",       "f0e68c",   "6b8e23",   "none")
call <SID>X("LineNr",		"7f7f7f",	      "",	"none")

hi VertSplit guibg=#c2bfa5 guifg=grey40 gui=none cterm=reverse
hi Folded guibg=black guifg=grey40 ctermfg=grey ctermbg=darkgrey
hi FoldColumn guibg=black guifg=grey20 ctermfg=4 ctermbg=7
hi ModeMsg guifg=goldenrod cterm=none ctermfg=brown
hi MoreMsg guifg=SeaGreen ctermfg=darkgreen
hi NonText guifg=RoyalBlue guibg=grey15 cterm=bold ctermfg=blue
hi Question guifg=springgreen ctermfg=green
hi StatusLine guibg=#c2bfa5 guifg=black gui=none cterm=bold,reverse
hi StatusLineNC guibg=#c2bfa5 guifg=grey40 gui=none cterm=reverse
hi Title guifg=gold gui=bold cterm=bold ctermfg=yellow
hi Statement guifg=CornflowerBlue ctermfg=lightblue
hi WarningMsg guifg=salmon ctermfg=1
hi String guifg=SkyBlue ctermfg=darkcyan
hi Comment term=bold ctermfg=11 guifg=grey40
hi Constant guifg=#ffa0a0 ctermfg=brown
hi Special guifg=darkkhaki ctermfg=brown
hi Identifier guifg=salmon ctermfg=red
hi Include guifg=red ctermfg=red
hi PreProc guifg=red guibg=white ctermfg=red
hi Operator guifg=Red ctermfg=Red
hi Define guifg=gold gui=bold ctermfg=yellow
hi Type guifg=CornflowerBlue ctermfg=2
hi Function guifg=navajowhite ctermfg=brown
hi Structure guifg=green ctermfg=green
hi Ignore guifg=grey40 cterm=bold ctermfg=7
hi Todo guifg=orangered guibg=yellow2
hi Directory ctermfg=darkcyan
hi ErrorMsg cterm=bold guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
hi VisualNOS cterm=bold,underline
hi WildMenu ctermfg=0 ctermbg=3
hi DiffAdd ctermbg=4
hi DiffChange ctermbg=5
hi DiffDelete cterm=bold ctermfg=4 ctermbg=6
hi DiffText cterm=bold ctermbg=1
hi Underlined cterm=underline ctermfg=5
hi Error guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
hi SpellErrors guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1

" Give the pop-up menu a lime green background w/ black font
hi Pmenu ctermfg=2 ctermbg=3 guifg=#000000 guibg=#dfff00
hi PmenuSel guibg=#444444 guifg=#ffffff


" ==== DELECTE FUNCTIONS =====
delf <SID>X
delf <SID>rgb
delf <SID>color
delf <SID>rgb_color
delf <SID>rgb_level
delf <SID>rgb_number
delf <SID>grey_color
delf <SID>grey_level
delf <SID>grey_number
" ============================
