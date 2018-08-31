        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "   (_)            __   _(_)_ __ ___             (_)
        "   / |  itchy     \ \ / / | '_ ` _ \            / |
        "   | |             \ V /| | | | | | |           | |
        "   |_|            (_)_/ |_|_| |_| |__|          |_|
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-surok

        "noremap ; :
        syntax enable
        syntax on

        " It's 2018.
        noremap j gj
        noremap k gk
        noremap gj j
        noremap gk k

        " Auto commands
        augroup vimrc
                autocmd!
        augroup END

        " Maybe these mappings should be moved into FT_C() ?
        map             ,h              :call ToggleHeader()<CR>
        map             <C-F6>          ,h
        imap            <C-F6>          <C-O><C-F6>

        map <Leader>s :source MYVIMRC<CR>
        map <Leader>e :e MYVIMRC<CR>
        "set pastetoggle=<F8>

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        set viminfo='100,\"100,:200,%,n~/.viminfo "help :viminfo, notice permis.n is wrong on viminfo
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        "-AAA0-Extra vi-compatibility-----------------------------------------------------------{{{
                set switchbuf=useopen    " reveal already opened files from the
                set formatoptions-=o     " don't start new lines w/ comment leader on pressing 'o'
                au filetype vim set formatoptions-=o
        "1.1}}}

        "-AAA1--Appearance--Edit--Clipboard--Bell--ExpandTab-Hist--SmartEnter-------------------{{{
        if &compatible | set nocompatible | endif
        " Appearance  # matchtime=1
                silent! display=lastline,uhex nowrap wrapmargin=0 guioptions=ce key=
                silent! set noshowmatch  noshowmode shortmess+=I cmdheight=1 cmdwinheight=10 showbreak=
                silent! set noshowcmd noruler rulerformat= laststatus=2 statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c
                silent! set title titlelen=100 titleold= titlestring=%f noicon norightleft showtabline=1
                silent! set cursorline nocursorcolumn colorcolumn= concealcursor=nvc conceallevel=0 norelativenumber
                silent! set list listchars=tab:>\ ,nbsp:_ synmaxcol=3000 ambiwidth=double breakindent breakindentopt=
                silent! set nosplitbelow nosplitleft startofline linespace=0 whichwrap=b,s scrolloff=1 sidescroll=0
                silent! set equalalways nowinfixwidth nowinfixheight winminwidth=3 winminheight=3 nowarn noconfirm
                silent! set fillchars=vert:\|,fold:\  eventignore= helplang=en viewoptions=options,cursor virtualedit=
                set splitbelow splitright
                set number
                "background=dark
        " Editing
                silent! set iminsert=0 imsearch=0 nopaste pastetoggle= nogdefault comments& commentstring=#\ %s
                silent! set smartindent autoindent shiftround shiftwidth=8 expandtab tabstop=8 smarttab softtabstop=8
                silent! set foldclose=all foldcolumn=0 nofoldenable foldlevel=0 foldmarker& foldmethod=indent
                silent! set textwidth=0 backspace=indent,eol,start nrformats=hex formatoptions=cmMj nojoinspaces
                silent! set nohidden autoread noautowrite noautowriteall nolinebreak mouse= modeline& modelines&
                silent! set noautochdir write nowriteany writedelay=0 verbose=0 verbosefile= notildeop noinsertmode
                silent! set tags=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
                silent! set tags+=~/Documents/scala/tags,~/Documents/*/tags tagstack

                "???"set formatoptions = tcqw
                " set tw = 150

                setlocal foldmarker={{{,}}}
                setlocal foldmethod=marker
                setlocal foldminlines=7
                "set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

                " Mappings to easily toggle fold levels
                nnoremap z0 :set foldlevel=0<cr>
                nnoremap z1 :set foldlevel=1<cr>
                nnoremap z2 :set foldlevel=2<cr>
                nnoremap z3 :set foldlevel=3<cr>
                nnoremap z4 :set foldlevel=4<cr>
                nnoremap z5 :set foldlevel=5<cr>

        " Clipboard
                silent! set clipboard=unnamed
                silent! set clipboard+=unnamedplus

        " Performance
                silent! set updatetime=300 timeout timeoutlen=500 ttimeout ttimeoutlen=50 ttyfast lazyredraw

        " Bell-Bell-Bell
                silent! set noerrorbells visualbell t_vb=

        " Move to the directory each buffer
                autocmd vimrc BufEnter * silent! lcd %:p:h

        " Fix window position of help
                autocmd vimrc FileType help if &l:buftype ==# 'help' | wincmd K | endif

        " Always open read-only when a swap file is found
                autocmd vimrc SwapExists * let v:swapchoice = 'o'

        " Automatically set expandtab
               " autocmd vimrc FileType * execute 'setlocal ' . (search('^\t.*\n\t.*\n\t', 'n') ? 'no' : '') . 'expandtab'
                " autocmd vimrc BufWinEnter * if &buftype == 'terminal' | setlocal nonumber | endif

        " Setting lazyredraw causes a problem on startup
                autocmd vimrc VimEnter * redraw

        " Smart Enter
                inoremap <silent><expr> <CR> (pumvisible() && bufname('%') !=# '[Command Line]' ? "\<C-e>\<CR>" : "\<C-g>u\<CR>")

        " Go to the first non-blank character of the line after paragraph motions
                noremap } }^

        " select last paste
                nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

        " Command line history
                set history=4024
                cnoremap <C-p> <Up>
                cnoremap <C-n> <Down>
                "cnoremap <Up> <C-p>
                "cnoremap <Down> <C-n>

        " Visual shifting (does not exit Visual mode)
                vnoremap < <gv
                vnoremap > >gv

        " Allow using the repeat operator with a visual selection (!)
        " http://stackoverflow.com/a/8064607/127816
                vnoremap . :normal .<CR>

        " For when you forget to sudo.. Really Write the file.
                cmap w!! w !sudo tee % >/dev/null

        " switch to the directory of the open buffer
                map <leader>cd :cd %:p:h<cr>
                set nowrap
                set mouse=a
        "-1-}}}

        "-AAA2--F12-TagbarToggle--F2-Help--cTAG--F3-SCRATCH--F4-ZYIW--<L>s-Sign-----------------{{{

                nnoremap <F12> :TagbarToggle<CR>

                "----------------------------------------------------------------------------------
                "-open-ctag in tab/vertical split
                map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

                "----------------------------------------------------------------------------------
                " Bind <F1> to show the keyword under cursor general help can still be entered manually, with :h
                map <F2> "zyiw:exe "vertical h ".@z.""<CR>
                autocmd filetype vim noremap <buffer> <F2> <Esc>:help <C-r><C-w><CR>
                autocmd filetype vim noremap! <buffer> <F2> <Esc>:help <C-r><C-w><CR>

                "map <Fx> "zyiw:exe "vs ".@z.""<CR>
                map <F3> :Scratch<CR>
                map <S-F3> :ScratchPreview<CR>

                map <F4> "zyiw<C-w>wo<Esc>"zp<C-w>W
                map <S-F4> "zY<C-w>wo<Esc>"zp<C-w>W

                "----------------------------------------------------------------------------------
                sign define fixme text=!! linehl=Todo
                function! SignFixme()
                        execute(":sign place ".line(".")." line=".line(".")." name=fixme file=".expand("%:p"))
                endfunction
                map <leader>s :call SignFixme()<CR>

        "-2-}}}

        "-AAA3--CleanExtrSps--WindResiz--Jump---------------------------------------------------{{{

                """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " Agutomatically clean / delete whitespace, trailing dos returns
                autocmd BufRead * silent! %s/[\r \t]\+\$//

                " Delete trailing white space on save, useful for some filetypes ;)
                fun! CleanExtraSpaces()
                        let save_cursor = getpos(".")
                        let old_query = getreg('/')
                        silent! %s/\s\+$//e
                        call setpos('.', save_cursor)
                        call setreg('/', old_query)
                endfun
                "#==>
                if has("autocmd")
                        autocmd BufWritePre *.vim,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
                endif
                """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                "hi def DoubleSpace ctermbg=Gray
                "set noruler
                set hidden
                set cinoptions=N-s,g0,+2s,l-s,i2s

                " right/up :Wind. bigger
                " left/down :Wind. smaller
                nnoremap <m-right> :vertical resize +3<cr>
                nnoremap <m-left> :vertical resize -3<cr>
                nnoremap <m-up> :resize +3<cr>
                nnoremap <m-down> :resize -3<cr>

                """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                """""""
                        function! JumpTo(jumpcommand)
                                execute a:jumpcommand
                                call FocusLine()
                                Pulse
                        endfunction

                        function! JumpToInSplit(jumpcommand)
                                execute "normal! \<c-w>v"
                                execute a:jumpcommand
                                Pulse
                        endfunction

                        function! JumpToTag()
                                call JumpTo("normal! \<c-]>")
                        endfunction

                        function! JumpToTagInSplit()
                                call JumpToInSplit("normal! \<c-]>")
                        endfunction

                        nnoremap <c-]> :silent! call JumpToTag()<cr>
                        nnoremap <c-\> :silent! call JumpToTagInSplit()<cr>
                """""""
                """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

                " gi already moves to "last place you exited insert mode", so we'll map gI to
                " something similar: move to last change
                nnoremap gI `.

                "#- go to last edit position when opening files -#
                au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

        "-3-}}}

        "-AAA4--EnterO--ReSel-LastPast--FormatBlock--UnFuck--Join--Typos--Maps--Abbr------------{{{
                " Enter, I never use the default behavior of <cr> and this saves me a keystroke...
                inoremap <C-m>  <cr>
                nnoremap <C-m>  <cr>
                nnoremap <cr> o<esc>

                " Yank to end of line
                nnoremap Y y$

                " Reselect last-pasted text
                nnoremap gv `[v`]

                " Formatting, TextMate-style
                vnoremap W gq
                nnoremap W gqip

                " Keep the cursor in place while joining lines
                nnoremap H mzJ`z

                "Select (charwise) cont of the cur line, Great for pasting Python lines into REPLs.
                nnoremap vv ^vg_

                " Typos
                command! -bang E e<bang>
                command! -bang Q q<bang>
                command! -bang W w<bang>
                command! -bang QA qa<bang>
                command! -bang Qa qa<bang>
                command! -bang Wa wa<bang>
                command! -bang WA wa<bang>
                command! -bang Wq wq<bang>
                command! -bang WQ wq<bang>

                " Unfuck my screen
                nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

                " Bash like keys for the command line
                " cnoremap <C-K> <C-U>
                cnoremap <C-A> <Home>
                cnoremap <C-E> <End>
                cnoremap <C-P> <Up>
                cnoremap <C-N> <Down>

                "-X-Insert Mode Completion-X---------------
                inoremap <silent> <C-]> <C-x><C-]>
                inoremap <silent> <C-o> <C-x><C-o>
                inoremap <silent> <C-k> <C-x><C-k>
                inoremap <silent> <C-d> <C-x><C-d>
                inoremap <silent> <C-u> <C-x><C-u>
                inoremap <silent> <C-f> <C-x><C-f>
                inoremap <silent> <C-l> <C-x><C-l>
                inoremap <c-f> <c-x><c-f>
                inoremap <c-]> <c-x><c-]>
                inoremap <c-l> <c-x><c-l>

                "------------------------------------------
                iabbr === ---------------------------------------------------------------------------------
                iabbr str start
                iabbr supe superuser
                iabbr que question
                iabbrev #i #include
                iabbrev #d #define
                iab cmnt /*<CR><CR>*/<Up>
                iabbrev @@  alf@nomail.com
                iabbrev ccopy Copyright 2013 Alf , no rights reserved.
                iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
                iab ydate <c-r>=strftime("%Y %b %d")<cr>

                "------------------------------------------
                iabbr str start
                imap jj <Esc>
                noremap jj :w<cr>
                noremap qq :q<cr>
        "-4-}}}

        "-AAA5--GitGutter-----------------------------------------------------------------------{{{
                "let g:gitgutter_highlight_lines = 1
                let g:gitgutter_signs = 1
                let g:gitgutter_max_signs = 1000

                nmap ]c <Plug>GitGutterNextHunk
                nmap [c <Plug>GitGutterPrevHunk
                nmap <Leader>hs <Plug>GitGutterStageHunk
                nmap <Leader>hu <Plug>GitGutterUndoHunk

                highlight GitGutterAdd ctermfg=green
                highlight GitGutterChange ctermfg=yellow
                highlight GitGutterDelete ctermfg=red
                highlight GitGutterChangeDelete ctermfg=yellow
        "-5-}}}

        "-AAA6--thesaur--Complet-Ulti-NeoSnipp--NeoComp--C-s-FZF-Compl-Line--Pumheight--Preview-{{{

                "set file path completion.
                set path+=.,/usr/include,/usr/local/include

                set thesaurus=mthesaur.txt
                set dictionary+="~/git/aTest/redVim/dikt/english-words.txt"
                let s:thesaurus_pat = "~/git/aTest/redVim/dikt/.txt"

                if has("eval")
                        " don't override ^J/^K -- I don't mind ^J, but ^K is digraphs
                        let g:UltiSnipsJumpForwardTrigger="<tab>"
                        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
                        let g:UltiSnipsListSnippets="<C-R><tab>"
                endif
                        imap <C-b>    <Plug>(neosnippet_expand_or_jump)
                        smap <C-b>    <Plug>(neosnippet_expand_or_jump)
                        xmap <C-b>    <Plug>(neosnippet_expand_target)
                        set omnifunc=syntaxcomplete#Complete

                if !exists('g:neocomplete#sources#omni#input_patterns')
                        let g:neocomplete#sources#omni#input_patterns = {}
                endif

                if !exists('g:neocomplete#force_omni_input_patterns')
                        let g:neocomplete#force_omni_input_patterns = {}
                endif

                imap <c-s> <plug>(fzf-complete-line)

                " Insert completion
                silent! set complete& completeopt=menu infercase pumheight=10 noshowfulltag shortmess+=c
                let g:tq_mthesaur_file="~/git/aTest/redVim/dikt/mthesaur.txt"
                set dictionary+=~/git/aTest/redVim/dikt/english-words.txt

                "-[completion]-auto popup menu: Tab, C-x + C-?, C-y, C-e
                set complete=.,w,b,t,i,u,k       " completion buffers
                "            | | | | | | |
                "            | | | | | | `-dict
                "            | | | | | `-unloaded buffers
                "            | | | | `-include files
                "            | | | `-tags
                "            | | `-other loaded buffers
                "            | `-windows buffers
                "            `-the current buffer
                set completeopt=menuone " menu,menuone,longest,preview
                set completeopt-=preview " dont show preview window

                "-[preview]-window
                set previewheight=15
                set report=0 " always report changed lines
        "-6-}}}

        "-AAA7--Deoplete------------------------------------------------------------------------{{{

                let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-6.0/lib/libclang.so.1"
                let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
                let g:deoplete#sources#clang#sort_algo = 'priority' " alphabetical
                "-------------------------------------------------------------------------------
                let g:deoplete#enable_at_startup = 1
                call deoplete#custom#option('sources', {
                        \ 'tex' : ['buffer', 'dictionary', 'file', 'omni']
                        \})
                call deoplete#custom#source('omni', 'input_patterns', {
                        \ 'tex' : '\\(?:'
                        \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
                        \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                        \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
                        \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
                        \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
                        \ . '|\w*'
                        \ .')',
                        \}
                        \)
                "--------------------------------------------------------------------------------
                call deoplete#custom#option('refresh_always', v:true)
                let g:deoplete#enable_ignore_case = 1
                let g:deoplete#enable_smart_case = 1
                let g:deoplete#enable_camel_case = 1
                let g:deoplete#enable_refresh_always = 1
                let g:deoplete#max_abbr_width = 0
                let g:deoplete#max_menu_width = 0

                "--------------------------------------------------------------------------------
                let g:deoplete#sources#ternjs#timeout = 3
                let g:deoplete#sources#ternjs#types = 1
                let g:deoplete#sources#ternjs#docs = 1
                call deoplete#custom#source('_', 'min_pattern_length', 2)
                "--------------------------------------------------------------------------------
                let g:deoplete#skip_chars = ['(', ')', '<', '>']
                let g:deoplete#tag#cache_limit_size = 800000
                let g:deoplete#file#enable_buffer_path = 1

                let g:deoplete#sources#jedi#statement_length = 30
                let g:deoplete#sources#jedi#show_docstring = 1
                let g:deoplete#sources#jedi#short_types = 1

                "--------------------------------------------------------------------------------
                call deoplete#custom#source('padawan',       'rank', 660)
                call deoplete#custom#source('go',            'rank', 650)
                call deoplete#custom#source('vim',           'rank', 640)
                call deoplete#custom#source('flow',          'rank', 630)
                call deoplete#custom#source('TernJS',        'rank', 620)
                call deoplete#custom#source('jedi',          'rank', 610)
                call deoplete#custom#source('omni',          'rank', 600)
                call deoplete#custom#source('neosnippet',    'rank', 510)
                call deoplete#custom#source('member',        'rank', 500)
                call deoplete#custom#source('file_include',  'rank', 420)
                call deoplete#custom#source('file',          'rank', 410)
                call deoplete#custom#source('tag',           'rank', 400)
                call deoplete#custom#source('around',        'rank', 330)
                call deoplete#custom#source('buffer',        'rank', 320)
                call deoplete#custom#source('dictionary',    'rank', 310)
                call deoplete#custom#source('tmux-complete', 'rank', 300)
                call deoplete#custom#source('syntax', 'rank', 200)
                "--------------------------------------------------------------------------------
                call deoplete#custom#source('omni',          'mark', '⌾')
                call deoplete#custom#source('flow',          'mark', '⌁')
                call deoplete#custom#source('padawan',       'mark', '⌁')
                call deoplete#custom#source('TernJS',        'mark', '⌁')
                call deoplete#custom#source('go',            'mark', '⌁')
                call deoplete#custom#source('jedi',          'mark', '⌁')
                call deoplete#custom#source('vim',           'mark', '⌁')
                call deoplete#custom#source('neosnippet',    'mark', '⌘')
                call deoplete#custom#source('tag',           'mark', '⌦')
                call deoplete#custom#source('around',        'mark', '↻')
                call deoplete#custom#source('buffer',        'mark', 'ℬ')
                call deoplete#custom#source('tmux-complete', 'mark', '⊶')
                call deoplete#custom#source('syntax',        'mark', '♯')
                call deoplete#custom#source('member', 'mark', '.')

        "-7-}}}

        "-AAA8--QuickRun--Compiler--Java--------------------------------------------------------{{{

                "-JAVA- https://github.com/Shougo/deoplete.nvim/issues/277
                "----------------------------------------------------------------------------------
                "Compiler javac
                "set makeprg =javac\ hello2W.java
                "----------------------------------------------------------------------------------
                let g:quickrun_known_file_types = {
                                        \"cpp": ["!g++ %", "./a.out"],
                                        \"c": ["!gcc %", "./a.out"],
                                        \"php": ["!php %"],
                                        \"vim": ["source %"],
                                        \"py": ["!python %"],
                                        \}
        "-8-}}}

        "-AAA9--Surround-'_'--onoremap-???-XXX--------------------------------------------------{{{

        "Quote current selection TODO: This only works for selections that are created "forwardly"
                vnoremap <localleader>" <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>ll
                vnoremap <localleader>' <esc>a'<esc>gvo<esc>i'<esc>gvo<esc>ll
        "Quote words under cursor
                nnoremap <leader>' viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l
                nnoremap <leader>' viW<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l

        " Define operator-pending mappings to quickly apply commands to function names
        "XXX and/or parameter lists in the current line
                onoremap inf :<c-u>normal! 0f(hviw<cr>
                onoremap anf :<c-u>normal! 0f(hvaw<cr>
                onoremap in( :<c-u>normal! 0f(vi(<cr>
                onoremap an( :<c-u>normal! 0f(va(<cr>

        "-Next---TAG---
                onoremap int :<c-u>normal! 0f<vit<cr>
                onoremap ant :<c-u>normal! 0f<vat<cr>

        " Function argument selection (change "around argument", change "inside argument")
                onoremap ia :<c-u>execute "normal! ?[,(]\rwv/[),]\rh"<cr>
                vnoremap ia :<c-u>execute "normal! ?[,(]\rwv/[),]\rh"<cr>

        "-9-}}}

        "-AAA10-Conflict-Markers--YankRing--ComplAllGUI--InsertLine-???-------------------------{{{
                "vim-flake8 default configuration
                        let g:flake8_show_in_gutter=1
                "highlight conflict markers
                        match ErrorMsg '\v^[<\|=|>]{7}([^=].+)?$'
                "shortcut to jump to next conflict marker

                "Errors confclits
                        nnoremap <silent> <leader>c /\v^[<\|=>]{7}([^=].+)?$<CR>

                "XXX YankRing stuff
                        let g:yankring_history_dir = '$HOME/.vim/tmp'

                "Alt-Backspace  deletes word backwards
                        cnoremap        <A-BS>          <C-W>

                "Do not lose -complete all- (gvim-only)
                        cnoremap        <C-S-A>         <C-A>

                "XXX ??? ToDo Insert line under cursor (builtin in vim 8.0.1787)
                        cnoremap        <C-R><C-L>      <C-R>=getline(".")<CR>
        "-10-}}}

        "-AAA11-QuickFix------------------------------------------------------------------------{{{
                augroup ft_quickfix
                        au!
                        au filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0
                        " vimscript is a joke
                        au filetype qf nnoremap <buffer> <cr> :execute "normal! \<lt>cr>"<cr>
                augroup end

                " <C-F8> = turn off quickfix
                        map         <S-F8>     :cclose<CR>
                        imap        <S-F8>     <C-O><S-F7>
                " <C-F8> =    off quickfix

                map         <C-F8>     :copen<CR>
                imap        <C-F8>     <C-O><C-F8>

                " Open Quickfix window automatically
                autocmd vimrc QuickfixCmdPost [^l]* nested copen | wincmd p
                autocmd vimrc QuickfixCmdPost l* nested lopen | wincmd p

                " <S-F9> = turn off location list
                        map             <S-F9>          :lclose<CR>
                        imap            <S-F9>          <C-O><S-F9>
                " <S-F9> = turn off location list
                        map             <C-F9>          :lopen<CR>
                        imap            <C-F9>          <C-O><C-F9>
        "-11-QFix-}}}



        "-AAA14-Search--------------------------------------------------------------------------{{{
                set nospell
                "nnoremap zz z=
                nnoremap z= :echo "use zz you idiot"<cr>

                "-------------------------------------------------------------------------
                "Pull word under cursor into LHS of a substitute (for quick search and replace)
                        nnoremap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#
                        nnoremap <leader>; :<C-r>=getline(".")<CR>

                "-------------------------------------------------------------------------
                silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
                "-------------------------------------------------------------------------
                " Clear hlsearch and set nopaste
                nnoremap <silent> <Esc><Esc> :<C-u>set nopaste<CR>:nohlsearch<CR>
                "-------------------------------------------------------------------------
                nmap <silent> n nzz
                nmap <silent> N Nzz
                nmap <silent> g* g*zz
                nmap <silent> g# g#zz

                "-------------------------------------------------------------------------
                let wordUnderCursor = expand("<cword>")
                let currentLine   = getline(".")

                function! OnlineDoc8()
                        let s:browser = "firefox"
                        let s:wordUnderCursor = expand("<cword>")
                        let s:langs = ["c", "cpp", "ruby", "python", "php", "java", "css"]
                        if  ((match(s:langs, &ft) > -1) && (&ft != ""))
                                let s:url = "http://www.google.com/search\\?q=".s:wordUnderCursor."+lang:".&ft
                        else
                                let s:url = "http://www.google.com/search\\?q=".s:wordUnderCursor
                        endif
                        let s:cmd ="silent ! " . s:browser . " " . s:url
                        execute s:cmd
                        redraw!
                endfunction
                map <F10> :call OnlineDoc8()<CR>
                map <S-F10> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
                "------------------------------------------------------------------------------------------
                "-Line Transporter-
                nnoremap <C-down> :m .+1<CR>==
                nnoremap <C-up> :m .-2<CR>==

                "------------------------------------------------------------------------------------------
                " Super useful! From an idea by Michael Naumann
                vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
                vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

                "------------------------------------------------------------------------------------------
                "nnoremap K *N:grep! "\b<c-r><c-w>\b"<cr>:cw<cr>
                "bind \ (backward slash) to grep shortcut
                "nnoremap \ :Ag<SPACE>
                nnoremap <leader>g :grep -R <cword> .<cr>
                nnoremap <leader>l :lgrep -R <cword> .<cr>
                nnoremap <leader><leader> :Ag <cword> .<cr>
                nmap <Leader>m [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
        "-14-Search-}}}

        "-AAA16-vnoremap-ipk$-------------------------------------------------------------------{{{
                function! ShowFuncKeys(bang)
                        for i in range(1,12)
                                redir! => map
                                exe "silent " . (a:bang == "!" ? 'verbose' : '') . " map<F" . i . ">"
                                redir end
                                if map !~ 'No mapping found'
                                        echomsg map
                                endif
                        endfor
                endfunction
                com! -bang ShowFuncKeys :call ShowFuncKeys(<q-bang>)

                function! s:ShowMaps()
                        let old_reg = getreg("a")          " save the current content of register a
                        let old_reg_type = getregtype("a") " save the type of the register as well
                        try
                                redir @a                           " redirect output to register a
                                " Get the list of all key mappings silently, satisfy"
                                " Press ENTER to continue"
                                silent map | call feedkeys("\<CR>")
                                redir END                          " end output redirection
                                vnew                               " new buffer in vertical window
                                put a                              " put content of register
                                " Sort on 4th character column which is the key(s)
                                %!sort -k1.4,1.4
                        finally                              " Execute even if exception is raised
                                call setreg("a", old_reg, old_reg_type) " restore register a
                        endtry
                endfunction
                com! ShowMaps call s:ShowMaps()      " Enable :ShowMaps to call the function

                nnoremap \m :ShowMaps<CR>            " Map keys to call the function
                " The Silver Searcher
                if executable('ag')
                        " Use ag over grep
                        set grepprg=ag\ --nogroup\ --nocolor
                        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
                        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
                        " ag is fast enough that CtrlP doesn't need to cache
                        let g:ctrlp_use_caching = 0
                endif
                " bind K to grep word under cursor
                " cnoremap <C-p> <Up>
                nnoremap <C-a> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

                "#EEE#
                nnoremap <C-E> :e#<CR>

                " bind \ (backward slash) to grep shortcut
                " command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
                "                        \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))
                "

                command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
                nnoremap \ :Ag<SPACE>
                "
                "- :Ag -i Stripe app/models
                "- Standard ag arguments may be passed in at this point:
                "

        "-16-vnoremap-}}}

                "---------------------------------------------------------------------------------
                "#one#
                vnoremap <F5>  i(
                vnoremap <S-F5>  a(
                "#two#
                vnoremap <F6> ipk$
                vnoremap <S-F6> ip
                vnoremap <C-F6> ap
                "#three#
                vnoremap <F7> i{k$
                vnoremap <S-F7> i{
                vnoremap <C-F7> a{k$
                "#vier#
                inoremap <C-q> ()<esc>i
                inoremap <C-w> {<esc>o}<esc>O

                "---------------------------------------------------------------------------------
                map  <A-!>  1gt
                map  <A-@>  2gt
                map  <A-#>  3gt
                map  <A-$>  4gt
                map  <A-%>  5gt
                map  <A-^>  6gt
                map  <A-&>  7gt
                map  <A-*>  8gt

                "---------------------------------------------------------------------------------
                " <S-F3> = turn off location list
                map             <S-F3>          :lclose<CR>
                imap            <S-F3>          <C-O><S-F3>

                " <C-F3> = turn off quickfix
                map             <C-F3>          :cclose<CR>
                imap            <C-F3>          <C-O><C-F3>

                "---------------------------------------------------------------------------------
                " <F4> = next error/grep match
                "" depends on plugin/quickloclist.vim
                map             <F4>            :FirstOrNextInList<CR>
                imap            <F4>            <C-O><F4>
                " <S-F4> = previous error/grep match
                map             <S-F4>          :PrevInList<CR>
                imap            <S-F4>          <C-O><S-F4>
                " <C-F4> = current error/grep match
                map             <C-F4>          :CurInList<CR>
                imap            <C-F4>          <C-O><C-F4>

                """ <F5> = close location list (overriden by ImportName in .py files)
                ""map             <F5>            :lclose<CR>
                ""imap            <F5>            <C-O><F5>

                "---------------------------------------------------------------------------------
                " <F9> = make (often overwritten by filetype plugins)
                map             <F9>    :Make<CR>
                imap            <F9>    <C-O><F9>
                " <S-F9> = toggle quickfix window
                map             <S-F9>  :call asyncrun#quickfix_toggle(8)<bar>call mg#statusline_update()<CR>
                imap            <S-F9>  <C-O><S-F9>

                "---------------------------------------------------------------------------------
                " Make fugitive's fake buffers visually distinguishable
                augroup MakeFugitiveVisible
                au!
                au BufNew,BufReadPost fugitive://* Margin 0
                augroup END

                "---------------------------------------------------------------------------------
                if ! exists('g:TagHighlightSettings')
                        let g:TagHighlightSettings = {}
                endif

                let g:TagHighlightSettings['ForcedPythonVariant'] = 'if_pyth'
                let g:TagHighlightSettings['CtagsExecutable'] = 'etags'

                let g:TagHighlightSettings['TagFileName'] = 'tags'
                nmap <leader>re :UpdateTypesFile<CR>

                "---------------------------------------------------------------------------------

                " Some helpers to edit mode
                cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
                map <leader>e  :e %%


        "-AAA13-CtrlP---------------------------------------------------------------------------{{{

                "CtrlP
                let g:ctrlp_match_window_bottom = 0
                let g:ctrlp_match_window_reversed = 0
                let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
                let g:ctrlp_working_path_mode = 0
                let g:ctrlp_dotfiles = 0
                let g:ctrlp_switch_buffer = 0

                let g:ctrlp_dont_split = 'NERD_tree_2'
                let g:ctrlp_jump_to_buffer = 0
                let g:ctrlp_split_window = 0
                let g:ctrlp_max_height = 20
                let g:ctrlp_extensions = ['tag']

                nnoremap ; :CtrlPBuffer<CR>
                let g:ctrlp_map = '<leader>,'
                nnoremap <leader>. :CtrlPTag<cr>

                let g:ctrlp_prompt_mappings = {
                                        \ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
                                        \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
                                        \ 'PrtHistory(-1)':       ['<c-n>'],
                                        \ 'PrtHistory(1)':        ['<c-p>'],
                                        \ 'ToggleFocus()':        ['<c-tab>'],
                                        \ }

                let my_ctrlp_ffind_command = "ffind --semi-restricted --dir %s --type e -B -f"
                let g:ctrlp_user_command = my_ctrlp_ffind_command

        "-13-CtrlP-}}}

        "-------------------------------------------------------------------------------
        nnoremap <silent> vv <C-w>v
        "-------------------------------------------------------------------------------
        nnoremap <silent> R :GitGrep <cword><CR>
        "-------------------------------------------------------------------------------

        "-UnitE --------------------------------------------------------------------------------{{{
                "-Unite-
                nmap <C-u> :Unite file buffer bookmark file_mru <CR>
                nnoremap <Leader>' :Unite file buffer bookmark file_mru history/yank<CR>
                "-??? Line
                nnoremap <C-\> :Unite line<CR>
                "-files
                nnoremap <silent><Leader>m :Unite -silent file_mru<CR>
                " buffer search
                nnoremap <silent><Leader>f :Unite -silent -no-split -start-insert -auto-preview
                        \ line<CR>
                "-???
                nnoremap <silent><Leader>v :UniteWithCursorWord -silent -no-split -auto-preview
                        \ line<CR>
                "-yankring
                nnoremap <silent><Leader>i :Unite -silent history/yank<CR>
                "-help
                nnoremap <silent> <C-h> :UniteWithCursorWord -silent help<CR>
                "-outlines (also ctags)
                nnoremap <silent><Leader>t :Unite -silent -vertical -winwidth=40
                                        \ -direction=topleft -toggle outline<CR>
                "-------------------------------------------------------------------------------
                call unite#filters#matcher_default#use(['matcher_fuzzy'])
                call unite#filters#sorter_default#use(['sorter_rank'])
                call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
                                        \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))
                "-------------------------------------------------------------------------------
                call unite#filters#matcher_default#use(['matcher_fzf'])
                "-------------------------------------------------------------------------------
                if executable('ag')
                        let g:unite_source_grep_command = 'ag'
                        let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
                        let g:unite_source_grep_recursive_opt = ''
                endif
                "-------------------------------------------------------------------------------
                let g:unite_source_history_yank_save_clipboard = 1
                let g:unite_source_mark_marks = "abcdefghijklmnopqrstuvwxyz"

                        \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""
                "-------------------------------------------------------------------------------
                let g:unite_source_history_yank_enable = 1
                let g:unite_enable_start_insert = 0
                let g:unite_enable_short_source_mes = 0
                let g:unite_force_overwrite_statusline = 0
                let g:unite_prompt = '>>> '
                let g:unite_marked_icon = '✓'
                " let g:unite_candidate_icon = '∘'
                let g:unite_winheight = 15
                let g:unite_update_time = 200
                let g:unite_split_rule = 'botright'
                let g:unite_data_directory ='~/.vim/tmp/unite'
                let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
                let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
                let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
        "-UnitE-}}}
"-surok
