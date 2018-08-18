""--set iskeyword-=.                    " '.' is an end of word designator
""--set iskeyword-=#                    " '#' is an end of word designator
""--set iskeyword-=-                    " '-' is an end of word designator
set cinwords=if,else,while,do,for,switch,case
syn keyword VariableType real void String int nextgroup=VarName skipwhite

" Highlight 81-st column----------------------------------------------------
highlight clear ColorColumn
highlight ColorColumn term=reverse ctermbg=Red guibg=Red

"--------------------------------------------------------------------------------
hi VariableType ctermbg=Yellow
hi VariableType ctermfg=brown
hi VarName ctermfg=darkblue

"--------------------------------------------------------------------------------
hi CustomPink ctermbg=205 guibg=hotpink guifg=black ctermfg=black
call matchadd('CustomPink', '\<printf\>')

"--------------------------------------------------------------------------------
hi statusline ctermbg=White ctermfg=DarkBlue
hi StatusLine         ctermfg=5     ctermbg=4     cterm=NONE
hi StatusLineNC       ctermfg=6     ctermbg=3     cterm=NONE
hi statusline ctermfg=White
hi StatusLine cterm=bold
"hi statuslineNC ctermfg=White
"hi statuslineNC ctermbg=DarkGray
"--------------------------------------------------------------------------------
