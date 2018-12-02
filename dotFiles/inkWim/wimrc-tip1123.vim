
            "main settings
            set nocompatible
            syntax enable
            filetype plugin on
            filetype indent on
            set hidden
            set tabstop=4
            set mouse=a
            set showbreak=>
            set whichwrap+=<,>,[,],h,l
            set display+=lastline
            set rulerformat=%22(%M%n\ %=%l,%c%V\ %P%)
            set selectmode=mouse
            set selection=inclusive
            set showcmd
            set showmatch
            set matchtime=8
            set shiftwidth=4
            set textwidth=0
            set scrolloff=2
            set winaltkeys=no
            set nohls
            set ruler
            set laststatus=2
            set backspace=2
            set formatoptions-=c
            set formatoptions-=o
            set formatoptions+=r
            set ignorecase
            set incsearch
            set autoindent
            set smartindent

            "terms
            if(&term == "Eterm")
                set ttymouse=xterm
            endif

            "the whitespace indicators
            set listchars=precedes:$,extends:$,tab:??,trail:?
            "set list
            highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen
            "highlight leading spaces and trailing whitespace
            match WhiteSpaceEOL /\(^\s*\)\@<=\ \|\s\+$/
            autocmd WinEnter * match WhiteSpaceEOL /\(^\s*\)\@<=\ \|\s\+$/
            nnoremap \wsh :highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen<enter>
            nnoremap \wsa :match WhiteSpaceEOL /\(^\s*\)\@<=\ \\|\s\+$/<enter>
            "highlight only trailing whitespace
            nnoremap \wst :match WhiteSpaceEOL /\s\+$/<enter>
            nnoremap \cs1 :colorscheme desert<enter>:normal \wsh<enter><c-l>

            "autos
            autocmd BufRead crap.txt set nowrap
            autocmd BufReadPost quickfix if(!strlen(bufname("%"))) | set nobuflisted | endif
            autocmd FileType * set fo-=c fo-=o fo+=r
            autocmd FileType vim normal \lc"
            autocmd FileType cs,c,cpp,java,jsp normal \lc/

            "global vars
            let g:leave_my_textwidth_alone = 1
            let g:leave_my_cursor_position_alone = 1
            let g:miniBufExplUseSingleClick = 1

            "save and exit
            noremap <f3> <esc>:w<enter>
            inoremap <f3> <c-g>u<esc>:w<enter>gi
            cnoremap <f3> <end><c-u><bs>
            noremap <f4> <esc>:qa!<enter>
            inoremap <f4> <esc>:qa!<enter>
            cnoremap <f4> <c-c>:qa!<enter>
            noremap <m-d> <esc>:w<enter>
            inoremap <m-d> <esc>:w<enter>`^
            inoremap <m-c> <c-g>u<esc>:w<enter>gi
            nnoremap <m-e> :confirm qa<enter>
            inoremap <m-e> <esc>:confirm qa<enter>
            vnoremap <m-e> <esc>:confirm qa<enter>
            cnoremap <m-e> <end><c-u><bs>
            cnoremap <c-g> <end><c-u><bs>
            noremap \\ :confirm qa<enter>
            inoremap \\ <esc>:confirm qa<enter>

            "stuff for commentation
            set timeout timeoutlen=700 ttimeoutlen=90
            "set <m-w>=w
            "set <m-q>=q
            let g:commentprefix="#"
            nnoremap <silent> \lc/ :let g:commentprefix="\\/\\/"<enter>
            nnoremap <silent> \lc" :let g:commentprefix="\""<enter>
            nnoremap <silent> \lc' :let g:commentprefix="'"<enter>
            nnoremap <silent> \lc; :let g:commentprefix=";"<enter>
            nnoremap <silent> \lc# :let g:commentprefix="#"<enter>
            nnoremap <silent> \lc! :let g:commentprefix="!"<enter>
            noremap <silent> <m-w> :s/^/<c-r>=commentprefix<enter>/<enter>:noh<enter>
            noremap <silent> <m-q> :s/^<c-r>=commentprefix<enter>//<enter>:noh<enter>
            inoremap <silent> <m-w> <esc>:s/^/<c-r>=commentprefix<enter>/<enter>:noh<enter>A
            inoremap <silent> <m-q> <esc>:s/^<c-r>=commentprefix<enter>//<enter>:noh<enter>A
            "for c# coding:
            iabbrev /// /// <summary><enter><c-u>///<enter><c-u>/// </summary><up>

            "emacs
            inoremap <m-f> <esc>:normal e<enter>a
            inoremap <m-b> <c-o>b
            cnoremap <m-f> <s-right>
            cnoremap <m-b> <s-left>

            inoremap <m-j> <c-o>gj
            inoremap <m-k> <c-o>gk
            cnoremap <m-j> <c-n>
            cnoremap <m-k> <c-p>
            noremap! <m-h> <left>
            noremap! <m-l> <right>
            inoremap <m-J> <c-x><c-e>
            inoremap <m-K> <c-x><c-y>
            cnoremap <m-J> <down>
            cnoremap <m-K> <up>
            noremap <m-J> <c-e>
            noremap <m-K> <c-y>
            noremap! <m-H> <home>
            noremap! <m-L> <end>
            noremap <m-H> <home>
            noremap <m-L> <end>
            noremap <m-h> <pageup>
            noremap <m-l> <pagedown>
            noremap <m-j> gj
            noremap <m-k> gk

            inoremap <m-{> <esc>{i
            inoremap <m-}> <esc>}i
            nnoremap <c-j> i<enter><esc>
            inoremap <m-_> <c-o>_
            inoremap <m-.> <c-a>
            "these five are great:
            inoremap <m-o> <c-g>u<esc>o
            inoremap <m-O> <c-g>u<esc>O
            noremap <m-o> o<esc>
            noremap <m-O> O<esc>
            nnoremap <m-:> :ls\|sleep 900m<enter><enter>

            " * is x primary selection, + is clipboard, " is vim
            nnoremap <m-+> :let @+ = @"<enter>
            nnoremap <m-"> :let @" = @+<enter>

            "better escape mapping: tab
            inoremap <m-i> <tab>
            nnoremap <tab> <esc>
            vnoremap <tab> <esc>gV
            onoremap <tab> <esc>
            inoremap <tab> <esc>`^

            nmap [6^ :bn<enter>
            nmap <c-pagedown> :bn<enter>
            nmap [5^ :bp<enter>
            nmap <c-pageup> :bp<enter>
            nmap [3^ :call Kwbd(1)<enter>
            nmap <c-del> :call Kwbd(1)<enter>

            nmap \sh :source ~/.vim/stuff/vimsh/vimsh.vim<enter>
            nmap \te :source ~/.vim/stuff/tetris.vim<enter>
            nmap \tl :source ~/.vim/stuff/taglist.vim<enter>:Tlist<enter>
            nmap \sc :runtime autoload/syntaxcomplete.vim<enter>
            nmap \pb :ProjectBrowse .<enter>
            nmap \ss :set spell<enter>
            nmap \us :set nospell<enter>
            nmap \sw :set wrap<enter>
            nmap \uw :set nowrap<enter>
            nmap \ls1 :set ls=1<enter>
            nmap \ls2 :set ls=2<enter>
            noremap <m-v> <c-v>
            noremap! <m-z>v <c-v>
            "in case i forget
            nnoremap <m-x>v :echo "This is Vim " . v:version . " Crap Edition"<enter>
            nnoremap Y y$
            nnoremap S 0D
            vnoremap <bs> d
            nnoremap <bs> X
            nnoremap <space> i<space><esc>l

            "macro related
            noremap <f2> @q
            inoremap <f2> <esc>`^@q
            set t_F8=[12?
            "these are to end recording while in selection mode
            vnoremap <t_F8> :normal q<enter>
            vnoremap <m-f2> :normal q<enter>
            inoremap <t_F8> <c-o>q
            inoremap <m-f2> <c-o>q

            "delete the buffer; keep windows; create scratch buffer when no buffers left
            function Kwbd(kwbdStage)
                if(a:kwbdStage == 1)
                    if(!buflisted(winbufnr(0)))
                        bd!
                        return
                    endif
                    let g:kwbdBufNum = bufnr("%")
                    let g:kwbdWinNum = winnr()
                    windo call Kwbd(2)
                    execute "normal " . g:kwbdWinNum . ""
                    let g:buflistedLeft = 0
                    let g:bufFinalJump = 0
                    let l:nBufs = bufnr("$")
                    let l:i = 1
                    while(l:i <= l:nBufs)
                        if(l:i != g:kwbdBufNum)
                            if(buflisted(l:i))
                                let g:buflistedLeft = g:buflistedLeft + 1
                            else
                                if(bufexists(l:i) && !strlen(bufname(l:i)) && !g:bufFinalJump)
                                    let g:bufFinalJump = l:i
                                endif
                            endif
                        endif
                        let l:i = l:i + 1
                    endwhile
                    if(!g:buflistedLeft)
                        if(g:bufFinalJump)
                            windo if(buflisted(winbufnr(0))) | execute "b! " . g:bufFinalJump | endif
                    else
                        enew
                        let l:newBuf = bufnr("%")
                        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
                endif
                execute "normal " . g:kwbdWinNum . ""
            endif
            if(buflisted(g:kwbdBufNum) || g:kwbdBufNum == bufnr("%"))
                execute "bd! " . g:kwbdBufNum
            endif
            if(!g:buflistedLeft)
                set buflisted
                set bufhidden=delete
                set buftype=nofile
                setlocal noswapfile
                normal athis is the scratch buffer
            endif
        else
            if(bufnr("%") == g:kwbdBufNum)
                let prevbufvar = bufnr("#")
                if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != g:kwbdBufNum)
                    b #
                else
                    bn
                endif
            endif
        endif
        endfunction

        "undo mods
        inoremap <c-w> <c-g>u<c-w>
        inoremap <enter> <c-g>u<enter>
        "inoremap <bs> <c-g>u<bs>
        "inoremap <del> <c-g>u<del>

        "alt-backspace stuff
        set t_F9=[3?
        map! <t_F9> <m-f><c-w>
        map! <m-del> <m-f><c-w>
        map! ? <c-w>
        map! <m-bs> <c-w>

        "selection of indented region
        nmap \sir :call SelectIndented()<enter>
        function SelectIndented()
            let temp_var = indent(line("."))
            while indent(line(".")-1) >= temp_var
                exe "normal k"
            endwhile
            exe "normal V"
            while indent(line(".")+1) >= temp_var
                exe "normal j"
            endwhile
        endfun

        "copy/paste stuff
        nnoremap <silent> <sid>Paste :call <sid>Paste()<cr>
        vnoremap <c-x> "+x
        vnoremap <c-c> "+y
        map <c-v> "+gP
        cmap <c-v> <c-r>+
        func! <sid>Paste()
            let ove = &ve
            set ve=all
            normal `^
            if @+ != ''
                normal "+gP
            endif
            let c = col(".")
            normal i
            if col(".") < c
                normal l
            endif
            let &ve = ove
        endfunc
        inoremap <script> <c-v> x<bs><esc><sid>Pastegi
        vnoremap <script> <c-v> "-c<esc><sid>Paste

        "for the wildmenu and menu stuff
        nmap \me :source $VIMRUNTIME/menu.vim<enter>
        set wildmenu
        set wildmode=list:longest,full
        set cpo-=<
        "set wcm=<c-z>
        "nmap \mu :emenu <c-z>

        "go to scratch buffer
        if(!strlen(bufname("%")))
            call Kwbd(1)
        endif


