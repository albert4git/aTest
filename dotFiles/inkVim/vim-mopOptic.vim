        "-------------------------------------------------------------------
        "TODO TST  ERR  Albert TRUMP
        match  Todo / TODO /
        2match Error / ERR /
        3match Title / Albert /
        "-----------------------------------------------------------
        syn keyword VariableType real void String int nextgroup=VarName skipwhite
        syn match VarName '\i\+' contained
        "-----------------------------------------------------------
        hi VariableType ctermbg=LightYellow
        hi VariableType ctermfg=brown
        hi VarName ctermfg=darkblue
        "-----------------------------------------------------------
        syn match DoubleSpace " "
        "-----------------------------------------------------------
        if has("digraphs")
                digraph -- 8212               " em dash
                digraph `` 8220               " left double quotation mark
                digraph '' 8221               " right double quotation mark
                digraph ,, 8222               " double low-9 quotation mark
        endif
        "-----------------------------------------------------------
        "Airline
        let g:ctags_statusline=1
        let generate_tags=1
        set noshowmode
        set showcmd      " Show partial commands in status line and
        "----------------------------------------
        let g:airline#extensions#tabline#enabled = 2
        let g:airline#extensions#tabline#fnamemod = ':t'
        let g:airline#extensions#tabline#buffer_min_count = 1
        let g:airline_section_c = '%{strftime("%D - %H:%M")}'
        """"
        """"
        "let g:airline_theme='powerlineish'
        "let g:airline_theme='wombat'
        "let g:airline_theme='badwolf'
        "let g:airline_theme='sol'
        "let g:airline_theme='solarized'
        let g:airline_theme='light'

        let g:airline_powerline_fonts=1
        let g:airline#extensions#branch#enabled=1
        let g:airline#extensions#whitespace#enabled = 1
        let g:airline#extensions#hunks#non_zero_only = 1
        "-----------------------------------------------------------
        function! LightlineFilename()
                let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
                let modified = &modified ? ' +M' : ''
                return filename . modified
        endfunction
        "-----------------------------------------------------------
        hi statusline ctermbg=Cyan ctermfg=Black  cterm=bold
        hi StatusLineNC  ctermbg=5 ctermfg=0 cterm=NONE
        "--------------------------------------------------------------
        "for less intrusive signs
        "highlight SignColumn ctermbg=255 guibg=#ffffd7
        "--------------------------------------------------------------
        if exists("*gitgutter#highlight#define_highlights")
                " let vim-gitgutter know we changed the SignColumn colors!
                call gitgutter#highlight#define_highlights()
        endif
        "highlight LineNr ctermfg=1 ctermbg=6
        highlight LineNr ctermfg=5

        "easier on the eyes
        highlight Folded ctermbg=0

        "set fillchars=vert:│,fold:-
        highlight VertSplit cterm=reverse ctermbg=150

        set tabpagemax=15               " Only show 15 tabs
        set showmode                    " Display the current mode
        set cursorline                  " Highlight current line
        set colorcolumn=1,8,16,24,100,120
        highlight clear ColorColumn
        "highlight ColorColumn term=reverse ctermbg=1 guibg=DarkGray
        highlight ColorColumn ctermbg=DarkGray
        highlight clear SignColumn      " SignColumn should match background
        "hi SignColumn ctermbg =0
        highlight clear LineNr          " Current line number row will have same background color in relative mode
        set showcmd                     " Show partial commands in status line and
        set ruler                       " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids

        "suppress intro message because the above makes it look bad
        set shortmess+=I
        highlight ErrorMsg              guifg=red guibg=white
        "fold column aka gutter on the left
        highlight FoldColumn ctermbg=5 ctermfg=0 guibg=#ffffd7
        "easier on the eyes
        highlight Folded ctermbg=6 guibg=#ffffaf
        "cursor column
        highlight CursorColumn ctermbg=7
        "avoid invisible color combination (red on red)
        highlight DiffText ctermbg=1
        " gutter on the right of the text
        highlight ColorColumn ctermbg=5
        hi Search ctermbg=yellow
        "-------------------------------------------------------------------------------
        "set fillchars=vert:│,fold:-
        highlight VertSplit cterm=reverse ctermbg=150
        "-------------------------------------------------------------------
        highlight LineNr ctermfg=1 ctermbg=200 "pink
        highlight LineNr ctermfg=1 ctermbg=220 "yello
        highlight LineNr ctermfg=1 ctermbg=230 "white
        highlight LineNr ctermfg=1 ctermbg=240 "DarkGray
        highlight LineNr ctermfg=1 ctermbg=250 "lightGray
        highlight LineNr ctermfg=1 ctermbg=190 "yellowBright
        highlight LineNr ctermfg=1 ctermbg=180 "rosaCream
        highlight LineNr ctermfg=1 ctermbg=170 "pinkPlume
        highlight LineNr ctermfg=1 ctermbg=160 "redOrange
        highlight LineNr ctermfg=1 ctermbg=150 "lightGreen
        highlight LineNr ctermfg=1 ctermbg=140 "lightPurple
        highlight LineNr ctermfg=1 ctermbg=130 "darkOrange
        highlight LineNr ctermfg=1 ctermbg=120 "mintBright
        highlight LineNr ctermfg=1 ctermbg=110 "lightBlue
        highlight LineNr ctermfg=1 ctermbg=100 "DarkYellow
        highlight LineNr ctermfg=1 ctermbg=90  "Purple
        highlight LineNr ctermfg=1 ctermbg=80  "brightLightBlue
        highlight LineNr ctermfg=1 ctermbg=70  "lightGreen
        highlight LineNr ctermfg=1 ctermbg=50  "lightGreenBlue
        highlight LineNr ctermfg=1 ctermbg=230 "white
        highlight LineNr ctermfg=1 ctermbg=30  "DarkCyan
        highlight LineNr ctermfg=1 ctermbg=20  "Blue
        highlight LineNr ctermfg=1 ctermbg=10  "NiceGreen
        highlight LineNr ctermfg=1 ctermbg=9   "NiceReds
        highlight LineNr ctermfg=1 ctermbg=8   "DarkGray
        highlight LineNr ctermfg=1 ctermbg=7   "LightGray
        highlight LineNr ctermfg=1 ctermbg=160 "redOrange
        highlight LineNr ctermfg=1 ctermbg=120 "mintBright
        "-------------------------------------------------------------------
        "hi SignColumn ctermbg =0
        "-------------------------------------------------------------------
        hi rustomPink ctermbg=190
        hi darkOrange   ctermbg=130
        hi redOrange    ctermbg=160
        hi mintBright   ctermbg=120
        hi niceGreen    ctermbg=10
        hi lightGreen   ctermbg=70
        hi lightGreenBlue ctermbg=50
        hi customPink   ctermbg=200 ctermfg=White
        hi lightGray   ctermbg=7
        hi darkGray   ctermbg=8
        hi darkCyan   ctermbg=30
        hi darkCyan   ctermbg=30
        hi rosaCream    ctermbg=180
        hi rosaWhite    ctermbg=230
        "-----------------------------------------------
        "call matchadd('mintBright', '\<map\>')
        "call matchadd('lightGreenBlue', '\<nmap\>')
        "call matchadd('lightGray', '\<imap\>')
        "-----------------------------------------------
        call matchadd('lightGray', '*inore.')
        "-----------------------------------------------
        call matchadd('darkGray', '\<*.nnore.\>')
        call matchadd('darkGray', '\<*.vnore.\>')
        call matchadd('darkGray', '\<*.inore.\>')
        "-----------------------------------------------
        call matchadd('customPink', '\<*.C-F.\>')
        call matchadd('customPink', '\<*.S-F.\>')
        call matchadd('customPink', '\<*C-x*\>')
        call matchadd('customPink', '\<*c-x*\>')
        call matchadd('darkOrange', '\<*-C-F-*\>')
        call matchadd('redOrange', '\<*C-f\>')
        "-------------------------------------------------------------------
        call matchadd('rosaWhite', '\<Leader\>')
        "-----------------------------------------------
        call matchadd('customPink', '\<F2\>')
        call matchadd('customPink', '\<F3\>')
        call matchadd('customPink', '\<F4\>')
        call matchadd('customPink', '\<F5\>')
        call matchadd('customPink', '\<F6\>')
        call matchadd('customPink', '\<F7\>')
        call matchadd('customPink', '\<F8\>')
        call matchadd('customPink', '\<F9\>')
        call matchadd('customPink', '\<F10\>')
        "-------------------------------------------------------------------
        call matchadd('customPink', '\<*C-}*\>')
        call matchadd('customPink', '\<*C-]*\>')
        call matchadd('customPink', '\<*C-)*\>')
        call matchadd('customPink', '\<*C-1*\>')
        call matchadd('customPink', '\<*C-2*\>')
        call matchadd('customPink', '\<*C-3*\>')
        call matchadd('customPink', '\<*C-4*\>')
        call matchadd('customPink', '\<*C-5*\>')
        call matchadd('customPink', '\<*C-6*\>')
        call matchadd('customPink', '\<*C-7*\>')
        call matchadd('customPink', '\<*C-8*\>')
        call matchadd('customPink', '\<*C-9*\>')
        "-------------------------------------------------------------------
        call matchadd('customPink', '\<*C-a*\>')
        call matchadd('customPink', '\<*C-a*\>')
        call matchadd('customPink', '\<*C-b*\>')
        call matchadd('customPink', '\<*C-c*\>')
        call matchadd('customPink', '\<*C-d*\>')
        call matchadd('customPink', '\<*C-e*\>')
        call matchadd('customPink', '\<*C-f*\>')
        call matchadd('customPink', '\<*C-g*\>')
        call matchadd('customPink', '\<*C-h*\>')
        call matchadd('customPink', '\<*C-k*\>')
        call matchadd('customPink', '\<*C-l*\>')
        call matchadd('customPink', '\<*C-m*\>')
        call matchadd('customPink', '\<*C-n*\>')
        call matchadd('customPink', '\<*C-o*\>')
        call matchadd('customPink', '\<*C-p*\>')
        call matchadd('customPink', '\<*C-r*\>')
        call matchadd('customPink', '\<*C-s*\>')
        call matchadd('customPink', '\<*C-t*\>')
        call matchadd('customPink', '\<*C-u*\>')
        call matchadd('customPink', '\<*C-v*\>')
        call matchadd('customPink', '\<*C-w*\>')
        call matchadd('customPink', '\<*C-x*\>')
        call matchadd('customPink', '\<*C-y*\>')
        call matchadd('customPink', '\<*C-z*\>')
        "-------------------------------------------------------------------
        call matchadd('customPink', '\<*C-A*\>')
        call matchadd('customPink', '\<*C-B*\>')
        call matchadd('customPink', '\<*C-C*\>')
        call matchadd('customPink', '\<*C-D*\>')
        call matchadd('customPink', '\<*C-E*\>')
        call matchadd('customPink', '\<*C-F*\>')
        call matchadd('customPink', '\<*C-G*\>')
        call matchadd('customPink', '\<*C-H*\>')
        call matchadd('customPink', '\<*C-K*\>')
        call matchadd('customPink', '\<*C-L*\>')
        call matchadd('customPink', '\<*C-M*\>')
        call matchadd('customPink', '\<*C-N*\>')
        call matchadd('customPink', '\<*C-O*\>')
        call matchadd('customPink', '\<*C-P*\>')
        call matchadd('customPink', '\<*C-R*\>')
        call matchadd('customPink', '\<*C-S*\>')
        call matchadd('customPink', '\<*C-T*\>')
        call matchadd('customPink', '\<*C-U*\>')
        call matchadd('customPink', '\<*C-V*\>')
        call matchadd('customPink', '\<*C-W*\>')
        call matchadd('customPink', '\<*C-X*\>')
        call matchadd('customPink', '\<*C-Y*\>')
        call matchadd('customPink', '\<*C-z*\>')
        
