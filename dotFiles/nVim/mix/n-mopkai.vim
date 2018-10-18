" Vim color scheme
"
" Author: mopp
"
" Note: Based on the molokai theme by Tomas Restrepo
"

if exists('g:loaded_mopkai')
    finish
endif
let g:loaded_mopkai = 1

set background=dark
hi clear
let g:colors_name='mopkai'

let c_gnu = 1
let c_comment_strings = 1


if has('nvim') || !has('gui_running')
        " color terminal
        " :help hi-normal-cterm
        if get(g:, 'mopkai_is_not_set_normal_ctermbg', 0)
            hi Normal          ctermfg=253
        else
            hi Normal          ctermfg=253 ctermbg=233
        endif

        hi Comment         ctermfg=15
        hi Constant        ctermfg=135              cterm=bold
        hi String          ctermfg=13
        hi Character       ctermfg=229
        hi Number          ctermfg=63
        hi Boolean         ctermfg=135              cterm=bold
        hi Float           ctermfg=135

        "hi Identifier      ctermfg=208              cterm=none
        hi Identifier      ctermfg=50              cterm=none
        "hi Function        ctermfg=118
        hi Function        ctermfg=11

        " 161 Statment LaxRedBold
        hi Statement       ctermfg=161              cterm=bold

        hi Conditional     ctermfg=160              cterm=bold
        hi Repeat          ctermfg=161              cterm=bold
        hi Label           ctermfg=156              cterm=none
        hi Operator        ctermfg=82
        hi keyword         ctermfg=161              cterm=bold
        hi Exception       ctermfg=118              cterm=bold

        hi PreProc         ctermfg=118
        hi Include         ctermfg=32
        hi Define          ctermfg=168
        hi Macro           ctermfg=168
        hi PreCondit       ctermfg=75               cterm=bold

        hi Type            ctermfg=81               cterm=none
        hi StorageClass    ctermfg=208
        hi Structure       ctermfg=32               cterm=bold
        hi Typedef         ctermfg=81

        hi Special         ctermfg=81
        hi SpecialChar     ctermfg=161              cterm=bold
        hi Tag             ctermfg=161
        hi Delimiter       ctermfg=241
        hi SpecialComment  ctermfg=245              cterm=bold
        hi Debug           ctermfg=225              cterm=bold

        hi Underlined      ctermfg=244              cterm=underline
        hi Ignore          ctermfg=244  ctermbg=232
        hi Error           ctermfg=219  ctermbg=89
        hi Todo            ctermfg=231  ctermbg=232 cterm=bold

        hi TabLine         ctermfg=232  ctermbg=249 cterm=none
        hi TabLineSel      ctermfg=232  ctermbg=198 cterm=bold
        hi TabLineFill                  ctermbg=249 cterm=none

        hi Search          ctermfg=232  ctermbg=202 cterm=bold

        if has('spell')
            hi SpellBad                 ctermbg=124
            hi SpellCap                 ctermbg=125
            hi SpellLocal               ctermbg=125
            hi SpellRare   ctermfg=none ctermbg=none cterm=none
        endif

        if get(g:, 'mopkai_is_not_set_normal_ctermbg', 0)
            hi FoldColumn      None
            hi FoldColumn      ctermfg=67
        else
            hi FoldColumn      ctermfg=67  ctermbg=233
        endif
        hi Folded          ctermfg=67  ctermbg=234

        hi Cursor          ctermfg=16  ctermbg=253 cterm=none
        hi CursorLine                  ctermbg=234 cterm=none
        hi CursorLineNr    ctermfg=208             cterm=none

        hi DiffAdd                     ctermbg=24
        hi DiffChange      ctermfg=181 ctermbg=239
        hi DiffDelete      ctermfg=162 ctermbg=53
        hi DiffText                    ctermbg=102 cterm=bold

        hi Directory       ctermfg=118               cterm=bold
        hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
        hi IncSearch       ctermfg=193 ctermbg=16

        hi SpecialKey      ctermfg=81

        hi MatchParen      ctermfg=208  ctermbg=233 cterm=bold
        hi ModeMsg         ctermfg=229
        hi MoreMsg         ctermfg=229

        " complete menu
        hi Pmenu           ctermfg=81  ctermbg=16
        hi PmenuSel        ctermfg=81  ctermbg=244
        hi PmenuSbar                   ctermbg=232
        hi PmenuThumb      ctermfg=81

        hi Question        ctermfg=81

        " marks column
        if get(g:, 'mopkai_is_not_set_normal_ctermbg', 0)
            hi SignColumn      None
            hi SignColumn      ctermfg=118
        else
            hi SignColumn      ctermfg=118 ctermbg=233
        endif
        hi StatusLine      ctermfg=238 ctermbg=253
        hi StatusLineNC    ctermfg=244 ctermbg=232
        hi Title           ctermfg=166


        hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
        hi VisualNOS                   ctermbg=238
        hi Visual                      ctermbg=234
        hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
        hi WildMenu        ctermfg=81  ctermbg=16

        hi CursorColumn                ctermbg=236
        hi ColorColumn                 ctermbg=236
        hi LineNr          None
        hi LineNr          ctermfg=250
        hi NonText         ctermfg=59

        hi SpecialKey      ctermfg=59

endif
