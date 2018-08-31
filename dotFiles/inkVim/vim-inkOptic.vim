
        if has("digraphs")
                digraph -- 8212               " em dash
                digraph `` 8220               " left double quotation mark
                digraph '' 8221               " right double quotation mark
                digraph ,, 8222               " double low-9 quotation mark
        endif


        "Airline
                let g:ctags_statusline=1
                let generate_tags=1
                set noshowmode
                set showcmd      " Show partial commands in status line and
                "----------------------------------------
                let g:airline#extensions#tabline#enabled = 2
                let g:airline#extensions#tabline#fnamemod = ':t'
                let g:airline#extensions#tabline#buffer_min_count = 1
                "------------------------------------------

        function! LightlineFilename()
                let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
                let modified = &modified ? ' +M' : ''
                return filename . modified
        endfunction

                hi statusline ctermbg=Cyan ctermfg=Black  cterm=bold
                hi StatusLineNC  ctermbg=5 ctermfg=0 cterm=NONE
        "--------------------------------------------------------------
                "for less intrusive signs
                "highlight SignColumn ctermbg=255 guibg=#ffffd7
                "hi clear SignColumn
                "hi SignColumn ctermbg =4
        "--------------------------------------------------------------
                if exists("*gitgutter#highlight#define_highlights")
                        " let vim-gitgutter know we changed the SignColumn colors!
                        call gitgutter#highlight#define_highlights()
                endif

        "Curr line number row, same bg color in rel mode
                highlight clear LineNr
                highlight LineNr ctermfg=Black ctermbg=2

        "--------------------------------------------------------------
        " number column aka gutter on the left
                highlight LineNr ctermbg=3 guibg=#ffffd7
        "--------------------------------------------------------------
                set colorcolumn=1,8,16,24,100,120
                highlight clear ColorColumn
                "highlight ColorColumn term=reverse ctermbg=1 guibg=DarkGray
                highlight ColorColumn ctermbg=DarkGray

        "--------------------------------------------------------------
                set cursorline
                "hi Cursor ctermbg=Cyan
                "hi CursorLine guibg=White ctermbg=1 term=bold cterm=bold

        " Get rid of italics (they look ugly)
                highlight htmlItalic            gui=NONE guifg=orange
                highlight htmlUnderlineItalic   gui=underline guifg=orange

        " Make error messages more readable
                highlight ErrorMsg              guifg=red guibg=white

        " for custom :match commands
                "highlight Red                   guibg=red ctermbg=red
                "highlight Green                 guibg=green ctermbg=green

        " gutter below the text
                highlight NonText ctermbg=0 guibg=#ffffd7

        " suppress intro message because the above makes it look bad
                set shortmess+=I

        " fold column aka gutter on the left
                highlight FoldColumn ctermbg=5 ctermfg=0 guibg=#ffffd7
        " easier on the eyes
                highlight Folded ctermbg=229 guibg=#ffffaf

        " cursor column
                highlight CursorColumn ctermbg=7 guibg=#ffffd7

        " avoid invisible color combination (red on red)
                highlight DiffText ctermbg=1

        "------------------------------------------
                match Todo / TST /
                2match Error / ERR /
                3match Title / Albert /
                syn match DoubleSpace " "
        "------------------------------------------
        "set matchpairs+=<:> " Match, to used with %
        "set mat=2            " How many tenths of a second to blink when matching brackets
        "------------------------------------------

                highlight Comment ctermbg=6 ctermfg=White cterm=bold
                highlight Comment ctermbg=3 ctermfg=White cterm=bold
                highlight Constant ctermbg=Blue
                hi VariableType ctermbg=Yellow
                hi VariableType ctermfg=brown
                hi VarName ctermfg=darkblue
                highlight Special ctermbg=0
                highlight Normal ctermbg=Black
                "highlight Cursor ctermbg=Green

                syn keyword VariableType real void String int nextgroup=VarName skipwhite
                syn match VarName '\i\+' contained
                hi VariableType ctermbg=LightYellow
                hi VariableType ctermfg=brown
                hi VarName ctermfg=darkblue

                highlight NonText  ctermbg=DarkBlue  ctermfg=gray guifg=gray term=standout
                highlight SpecialKey  ctermbg=Blue  ctermfg=gray guifg=gray term=standout
                "highlight MatchParen         gui=bold guibg=NONE guifg=lightblue cterm=bold ctermbg=255
                highlight SpellBad            cterm=underline ctermfg=red ctermbg=NONE
                highlight SpellCap            cterm=underline ctermfg=blue ctermbg=NONE

                highlight StatusLine          ctermfg=white ctermbg=black cterm=bold
                highlight StatusLineNC        ctermfg=white ctermbg=black cterm=NONE
                highlight VertSplit           ctermfg=white ctermbg=black cterm=NONE

                "My stuff ---------------------------------
                hi CustomPink ctermbg=205 guibg=hotpink guifg=black ctermfg=magenta
                call matchadd('CustomPink', '\<System\>')

                highlight TagListTagName    ctermfg=250
                highlight TagListTagScope   ctermfg=045
                highlight TagListTitle      ctermfg=226
                highlight TagListComment    ctermfg=235
                highlight TagListFileName   ctermfg=255 ctermbg=232

                highlight Comment ctermbg=6 ctermfg=White cterm=bold
                highlight Comment ctermbg=3 ctermfg=White cterm=bold

                " cyan
                highlight TagbarHighlight       ctermfg=051 ctermbg=none cterm=bold
                " gray
                highlight TagbarComment         ctermfg=238 ctermbg=none cterm=none
                " green
                highlight TagbarKind            ctermfg=154 ctermbg=none cterm=bold
                " dark green
                highlight TagbarNestedKind      ctermfg=070 ctermbg=none cterm=none
                " blue
                highlight TagbarScope           ctermfg=039 ctermbg=none cterm=none
                " yellow
                highlight TagbarType            ctermfg=190 ctermbg=none cterm=none
                " orange
                highlight TagbarSignature       ctermfg=202 ctermbg=none cterm=none
                " pink
                highlight TagbarPseudoID        ctermfg=205 ctermbg=none cterm=bold
                " red
                highlight TagbarFoldIcon        ctermfg=197 ctermbg=none cterm=none
                " dark green
                highlight TagbarAccessPublic    ctermfg=022 ctermbg=none cterm=none
                " dark red
                highlight TagbarAccessProtected ctermfg=088 ctermbg=none cterm=bold
                " red
                highlight TagbarPrivate         ctermfg=196 ctermbg=none cterm=italic



        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " My colour overrides
                highlight NonText               ctermfg=gray guifg=gray term=standout
                highlight SpecialKey            ctermfg=gray guifg=gray term=standout
                highlight MatchParen            gui=bold guibg=NONE guifg=lightblue cterm=bold ctermbg=255
                highlight SpellBad              cterm=underline ctermfg=red ctermbg=NONE
                highlight SpellCap              cterm=underline ctermfg=blue ctermbg=NONE

                highlight StatusLine          ctermfg=white ctermbg=red cterm=bold
                highlight StatusLineNC        ctermfg=white ctermbg=green cterm=NONE
                highlight VertSplit           ctermfg=white ctermbg=blue cterm=NONE

                " for custom :match commands
                highlight Red                   guibg=red ctermbg=red
                highlight Green                 guibg=green ctermbg=green

                " gutter on the right of the text
                highlight ColorColumn ctermbg=5

                " gutter below the text
                highlight NonText ctermbg=2
                set shortmess+=I " suppress intro message because the above makes it look bad

                " fold column aka gutter on the left
                highlight FoldColumn ctermbg=3

