
"-AAA14-Cyan------------------------------------------------------------------------------------------------{{{
        highlight DiffChange        cterm=bold ctermbg=7 
        "------------------------------------------------------------------------------------------
        if has('spell')
                        hi SpellBad     ctermfg=11    ctermbg=160
                        hi SpellCap     ctermfg=11    ctermbg=166
                        hi SpellLocal   ctermfg=11    ctermbg=9
        endif
        "------------------------------------------------------------------------------------------
        "highlight conflict markers
        highlight ErrorMsg  ctermfg=red ctermfg=white
        match ErrorMsg '\v^[<\|=|>]{7}([^=].+)?$'
        "shortcut to jump to next conflict marker
        nnoremap <silent> <leader>c /\v^[<\|=>]{7}([^=].+)?$<CR>
        "------------------------------------------------------------------------------------------
        highlight Folded ctermbg=10
        highlight FoldColumn ctermbg=9 ctermfg=0 guibg=#ffffd7
        highlight DiffText ctermbg=1
        "------------------------------------------------------------------------------------------
                hi Define         ctermfg=11       ctermbg=22 
                hi MatchParen     ctermfg=11       ctermbg=39  cterm=bold
                hi Delimiter      ctermfg=51       ctermbg=56  cterm=bold
                "--------------------------------------------------------------------------
                hi NonText        ctermfg=201      ctermbg=88 
                hi Error          ctermfg=196      ctermbg=232  
                hi ErrorMsg       ctermfg=196      ctermbg=232  
                hi Exception      ctermfg=201      ctermbg=103 
                hi Keyword        ctermfg=201      ctermbg=1 
                hi Label          ctermfg=201      ctermbg=3 
                "--------------------------------------------------------------------------
                "--------------------------------------------------------------------------
                set tabpagemax=15
                set signcolumn=yes
                hi signcolumn  ctermbg=10
                let w:persistent_cursorline = 1
                hi Search  ctermbg=11 ctermfg=9 term= bold
                set cursorcolumn
                hi CursorLine                  ctermbg=8
                set matchtime=3
                set linebreak
                set showbreak=↪
                "------------------------------------------------------------------------------------------
                set guifont=Monospace\ 16
                set cinwords=if,else,while,do,for,switch,case
                hi ColorColumn     ctermbg=22
                set colorcolumn=92,100,112,120
                hi LineNr ctermfg=16 ctermbg=40 
                hi Normal  ctermbg=236
                highlight Visual cterm=bold ctermbg=2 ctermfg=NONE
                set list
                set listchars=tab:▸\
                hi Cursor ctermbg=2 term= bold
                hi Comment         ctermfg=14
                hi Number          ctermfg=11
                set matchpairs=(:),{:},[:],<:>
                "set colorcolumn=+1
                "set nuw =5
                "-------------------------------------------------------------------------------
                "au! BufNewFile,BufRead *.vim, *.html, *.css
                "                       \ set tabstop=8
                "                       \ set softtabstop=8
                "                       \ set shiftwidth=8
                "                       \ set colorcolumn=2,92,100,112,120
                "-------------------------------------------------------------------------------
"-14Cyan-}}}
