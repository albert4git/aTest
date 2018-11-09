        " highlight clear ColorColumn
        " highlight clear SignColumn      " SignColumn should match background
        " highlight clear LineNr          " Current line number row will have same background color in relative mode
        "-----------------------------------------------------------
        " function! LightlineFilename()
        "         let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
        "         let modified = &modified ? ' +M' : ''
        "         return filename . modified
        " endfunction
        "-------------------------------------------------------------------
        "TODO TST  ERR  Albert TRUMP
        " match  Todo / TODO /
        " 2match Error / ERR /
        " 3match Title / Albert /
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
        hi customPink   ctermbg=241 ctermfg=White
        hi lightGray   ctermbg=12
        hi darkGray   ctermbg=8
        hi darkCyan   ctermbg=30
        hi darkCyan   ctermbg=30
        hi rosaCream    ctermbg=180
        hi rosaWhite    ctermbg=4
        "-----------------------------------------------
        "call matchadd('mintBright', '\<map\>')
        "call matchadd('lightGreenBlue', '\<nmap\>')
        "call matchadd('lightGray', '\<imap\>')


        "-----------------------------------------------
        hi customPink   ctermbg=241 ctermfg=White
        hi lightGray   ctermbg=12
        hi darkGray   ctermbg=8
        "-----------------------------------------------
        call matchadd('lightGray', '*inore.')
        "-----------------------------------------------
        call matchadd('darkGray', '\<*.nnore.\>')
        call matchadd('darkGray', '\<*.vnore.\>')
        call matchadd('darkGray', '\<*.inore.\>')
        call matchadd('customPink', '\<F2\>')
        call matchadd('customPink', '\<F3\>')
        call matchadd('customPink', '\<F4\>')
        call matchadd('customPink', '\<F5\>')
        call matchadd('customPink', '\<F6\>')
        call matchadd('customPink', '\<F7\>')
        call matchadd('customPink', '\<F8\>')
        call matchadd('customPink', '\<F9\>')
        call matchadd('customPink', '\<F10\>')
        "-----------------------------------------------
        call matchadd('customPink', '\<*.C-F.\>')
        call matchadd('customPink', '\<*.S-F.\>')
        call matchadd('customPink', '\<*C-x*\>')
        call matchadd('customPink', '\<*c-x*\>')
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
        
        call matchadd('darkOrange', '\<*-C-F-*\>')
        call matchadd('redOrange', '\<*C-f\>')
        "-------------------------------------------------------------------
        call matchadd('rosaWhite', '\<Leader\>')
        "-----------------------------------------------
