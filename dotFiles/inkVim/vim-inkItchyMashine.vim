"-surok----------------------------------------------------------------------------------------------------------------
"                        (_)            __   _(_)_ __ ___             (_)
"                        / |  itchy     \ \ / / | '_ ` _ \            / |
"                        | |             \ V /| | | | | | |           | |
"                        |_|            (_)_/ |_|_| |_| |__|          |_|
"-surok----------------------------------------------------------------------------------------------------------------
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

        let g:bling_time = 42
        let g:bling_color_fg = 'green'
        let g:bling_color_cterm = 'reverse'
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "!" map <LocalLeader>s :source $MYVIMRC<CR>
        "!" map <LocalLeader>v :e $MYVIMRC<CR>
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
                "-AAA1.1-Extra vi-compatibility---------------------------------------------------{{{
                        set switchbuf=useopen    " reveal already opened files from the
                        set formatoptions-=o     " don't start new lines w/ com leader on press 'o'
                        au filetype vim set formatoptions-=o
                "1.1}}}
        " Editing
                silent! set iminsert=0 imsearch=0 nopaste pastetoggle= nogdefault comments& commentstring=#\ %s
                silent! set smartindent autoindent shiftround shiftwidth=8 expandtab tabstop=8 smarttab softtabstop=8
                silent! set foldclose=all foldcolumn=0 nofoldenable foldlevel=0 foldmarker& foldmethod=indent
                silent! set textwidth=0 backspace=indent,eol,start nrformats=hex formatoptions=cmMj nojoinspaces
                silent! set nohidden autoread noautowrite noautowriteall nolinebreak mouse= modeline& modelines&
                silent! set noautochdir write nowriteany writedelay=0 verbose=0 verbosefile= notildeop noinsertmode
                "
                "silent! set tags+=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
                "silent! set tags=tags,./tags 

                "set tw = 300
                "easier on the eyes
                "-???- set formatoptions = tcqw
                highlight Folded ctermbg=1
                setlocal foldmarker={{{,}}}
                setlocal foldmethod=marker
                setlocal foldminlines=6
                set foldcolumn=1        "Add a bit extra margin to the left
                " Mappings to easily toggle fold levels
                nnoremap z0 :set foldlevel=0<cr>
                nnoremap z1 :set foldlevel=1<cr>
                nnoremap z2 :set foldlevel=2<cr>
                nnoremap z3 :set foldlevel=3<cr>
                nnoremap z4 :set foldlevel=4<cr>
                nnoremap z5 :set foldlevel=5<cr>
                "set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

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

        " Enter, I never use the default behavior of <cr> and this saves me a keystroke...
                inoremap <C-m>  <cr>
                nnoremap <C-m>  <cr>
                nnoremap <cr> o<esc>

        " Smart Enter -???-
                inoremap <silent><expr> <CR> (pumvisible() && bufname('%') !=# '[Command Line]' ? "\<C-e>\<CR>" : "\<C-g>u\<CR>")

        " Go to the first non-blank character of the line after paragraph motions
                noremap } }^

        " select last paste
                nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

        " Command line history
                set history=4024
                cnoremap <C-p> <Up>
                cnoremap <C-n> <Down>
                cnoremap <Up> <C-p>
                cnoremap <Down> <C-n>

        " Visual shifting (does not exit Visual mode)
                vnoremap < <gv
                vnoremap > >gv

        " Allow using the repeat operator with a visual selection (!)
        " http://stackoverflow.com/a/8064607/127816
                vnoremap . :normal .<CR>

        " For when you forget to sudo.. Really Write the file.
                cmap w!! w !sudo tee % >/dev/null

        " switch to the directory of the open buffer
                map cd :cd %:p:h<cr>

                set nowrap
                set mouse=a

        "-1-}}}

        "-AAA1.2--Demian-Conway-----------------------------------------------------------------{{{
                "====[ I hate modelines ]===================
                set modelines=0
                set autowrite "Save buffer automatically when changing files
                set updatecount=10 "Save buffer every 10 chars typed

                " +--Disable hlsearch while loading viminfo
                " | +--Remember marks for last 500 files
                " | | +--Remember up to 10000 lines in each register
                " | | | +--Remember up to 1MB in each register
                " | | | | +--Remember last 1000 search patterns
                " | | | | | +---Remember last 1000 commands
                " | | | | | |
                " v v v v v v
                set viminfo=h,'500,<10000,s1000,/1000,:1000
                "set viminfo='100,\"100,:200,%,n~/.viminfo "help :viminfo, notice permis.n is wrong on viminfo
                "====[ Toggle visibility of naughty characters ]============

                " Make naughty characters visible...
                " (uBB is right double angle, uB7 is middle dot)
                "? set lcs=tab:»·,trail:␣,nbsp:˷
                highlight InvisibleSpaces ctermfg=Blue ctermbg=Black
                call matchadd('InvisibleSpaces', '\S\@<=\s\+\%#\ze\s*$', -10)

                " Indent/outdent current block...
                nmap %% $>i}``
                nmap $$ $<i}``
        "-1-}}}

        "-AAA2--F12-TagbarToggle--F2-Help--cTAG--F3-SCRATCH--F4-ZYIW--<L>s-Sign-----------------{{{
                "-???- set pastetoggle=<Fxxx>
                nnoremap <F12> :TagbarToggle<CR>
                "-???------------------------------------------------------------------------------
                "-open-ctag in tab/vertical split
                "-map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

                "--YYY-----------------------------------------------------------------------------
                map <F2> "zyiw:exe "vertical h ".@z.""<CR>
                autocmd filetype vim noremap <buffer> <F2> <Esc>:help <C-r><C-w><CR>
                autocmd filetype vim noremap! <buffer> <F2> <Esc>:help <C-r><C-w><CR>

                "map <Fx> "zyiw:exe "vs ".@z.""<CR>
                map <C-F12> :Scratch<CR>
                map <S-F12> :ScratchPreview<CR>

                "--???-----------------------------------------------------------------------------
                sign define fixme text=!! linehl=Todo
                function! SignFixme()
                        execute(":sign place ".line(".")." line=".line(".")." name=fixme file=".expand("%:p"))
                endfunction
                map <Leader>1 :call SignFixme()<CR>

        "-2-}}}

        "-AAA3--CleanExtrSps--WindResiz--Jump---------------------------------------------------{{{
                hi def DoubleSpace ctermbg=Blue
                set ruler
                set hidden
                set cinoptions=N-s,g0,+2s,l-s,i2s
                "----------------------------------------------------------------------------------

                nnoremap <m-right> :vertical resize +3<cr>
                nnoremap <m-left> :vertical resize -3<cr>
                nnoremap <m-up> :resize +3<cr>
                nnoremap <m-down> :resize -3<cr>

                """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                ""DDD""
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
                        "nnoremap <C-]> :silent! call JumpToTag()<cr>
                        nnoremap <C-;> :silent! call JumpToTag()<cr>
                        nnoremap <S-C-]> :silent! call JumpToTagInSplit()<cr>
                """""""
                """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                "#- go to last edit position when opening files -#
                au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

        "-3-}}}

        "-AAA4--EnterO--ReSel-LastPast--FormatBlock--UnFuck--Join--Typos--Maps--Abbr------------{{{
                " Yank to end of line
                nnoremap Y y$

                " Formatting, TextMate-style
                vnoremap W gq
                nnoremap W gqip

                "-HHJ- Keep the cursor in place while joining lines
                nnoremap H mzJ`z

                "??? Sel (charwise) cont of the cur line, Great for pasting Python lines into REPLs
                "nnoremap vv ^vg_

                " Typos ???
                command! -bang E e<bang>
                command! -bang Q q<bang>
                command! -bang W w<bang>
                command! -bang QA qa<bang>
                command! -bang Qa qa<bang>
                command! -bang Wa wa<bang>
                command! -bang WA wa<bang>
                command! -bang Wq wq<bang>
                command! -bang WQ wq<bang>

                "DDD Unfuck my screen
                nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

                " Bash like keys for the command line
                " cnoremap <C-K> <C-U>
                cnoremap <C-A> <Home>
                cnoremap <C-E> <End>
                cnoremap <C-P> <Up>
                cnoremap <C-N> <Down>

                iabbr === "------------------------------------------------------------------------
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
                imap jj <Esc>
                noremap ss :w<cr>
                noremap qq :q<cr>
                noremap sq :wq<cr>

        "-4-}}}

        "-AAA5--GitGutter-----------------------------------------------------------------------{{{
                "let g:gitgutter_highlight_lines = 1
                let g:gitgutter_signs = 1
                let g:gitgutter_max_signs = 1000

                "-???-
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
                "-TODO- 

                if has("eval")
                        " don't override ^J/^K -- I don't mind ^J, but ^K is digraphs
                        let g:UltiSnipsJumpForwardTrigger="<tab>"
                        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
                        "-???-
                        let g:UltiSnipsListSnippets="<C-R><tab>"
                endif
                        imap <C-b>    <Plug>(neosnippet_expand_or_jump)
                        smap <C-b>    <Plug>(neosnippet_expand_or_jump)
                        xmap <C-b>    <Plug>(neosnippet_expand_target)
                        set omnifunc=syntaxcomplete#Complete

                if !exists('g:neocomplete#force_omni_input_patterns')
                        let g:neocomplete#force_omni_input_patterns = {}
                endif

                "-[preview]-window
                set previewheight=15
                set report=0 " always report changed lines
                "-------------------------------------------------------------------------------
                nnoremap <silent> vv <C-w>v
                "----------------------------------------------------------------------------------
                "-Line Transporter-
                nnoremap <C-down> :m .+1<CR>==
                nnoremap <C-up> :m .-2<CR>==
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
                "--------------------------------------------------------------------------------
                let g:deoplete#sources#jedi#statement_length = 30
                let g:deoplete#sources#jedi#show_docstring = 1
                let g:deoplete#sources#jedi#short_types = 1
                "--------------------------------------------------------------------------------
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
                call deoplete#custom#source('TernJS',        'mark', '⌁')
                call deoplete#custom#source('go',            'mark', '⌁')
                call deoplete#custom#source('jedi',          'mark', '⌁')
                call deoplete#custom#source('vim',           'mark', 'vi')
                call deoplete#custom#source('neosnippet',    'mark', '⌘')
                call deoplete#custom#source('tag',           'mark', '⌦')
                call deoplete#custom#source('around',        'mark', '↻')
                call deoplete#custom#source('buffer',        'mark', 'ℬ')
                call deoplete#custom#source('tmux-complete', 'mark', '⊶')
                call deoplete#custom#source('syntax',        'mark', '♯')
                call deoplete#custom#source('member', 'mark', '.')

        "-7-}}}

        "-AAA8--QuickRun--Compiler-CPP-Java--------------------------------------------------------{{{
                "-JAVA- https://github.com/Shougo/deoplete.nvim/issues/277
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


        "-AAA10-Conflict-Markers--YankRing--ComplAllGUI--InsertLine-???-------------------------{{{
                "vim-flake8 default configuration
                        let g:flake8_show_in_gutter=1
                "-???-highlight conflict markers
                        match ErrorMsg '\v^[<\|=|>]{7}([^=].+)?$'
                "-???-shortcut to jump to next conflict marker-???-
                "Errors confclits
                        nnoremap <silent> <Leader>c /\v^[<\|=>]{7}([^=].+)?$<CR>

        "-10-}}}

        "-AAA11-QuickFix---Search---------------------------------------------------------------{{{

                "-Open-Quickfix-window-automatically---------------------------
                autocmd vimrc QuickfixCmdPost [^l]* nested copen | wincmd p
                autocmd vimrc QuickfixCmdPost l* nested lopen | wincmd p
                "--------------------------------------------------------------
                "-on-quickfix--------------------------------------------------
                map         <S-F8>     :copen<CR>
                imap        <S-F8>     <C-O><C-F8>
                "-off-quickfix-------------------------------------------------
                map         <C-F8>     :cclose<CR>
                imap        <C-F8>     <C-O><S-F7>
                "--------------------------------
                nnoremap <Leader>b :cprev<cr>zvzz
                nnoremap <Leader>n :cnext<cr>zvzz
                "turn-on-location-list-----------------------------------------
                "--------------------------------------------------------------
                map             <S-F9>          :lopen<CR>
                imap            <S-F9>          <C-O><C-F9>
                "turn-off-location-list-----------------------------------------
                map             <C-F9>          :lclose<CR>
                imap            <C-F9>          <C-O><S-F9>
                "--------------------------------------------------------------
                nnoremap <LocalLeader>b :lprev<cr>zvzz
                nnoremap <LocalLeader>n :lnext<cr>zvzz
                "--------------------------------------------------------------
                "--------------------------------------------------------------
                " <F4> = next error/grep match
                map             <F4>            :FirstOrNextInList<CR>
                imap            <F4>            <C-O><F4>
                " <S-F4> = previous error/grep match
                map             <S-F4>          :PrevInList<CR>
                imap            <S-F4>          <C-O><S-F4>
                " <C-F4> = current error/grep match
                map             <C-F4>          :CurInList<CR>
                imap            <C-F4>          <C-O><C-F4>

                "--------------------------------------------------------------
                silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
                set nospell
                "nnoremap zz z=
                "nnoremap z= :echo "use zz you idiot"<cr>
                "-----------------------------EX:-----------------------------------------
                "Pull word under cursor into LHS of a subs ztitute (for quick search and replace)
                nnoremap <Leader>w :%s#\<<C-r>=expand("<cword>")<CR>\>#
                nnoremap <Leader>l :%s#\<<C-r>=getline(".")<CR>\>#
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

                map <C-F10> :call OnlineDoc8()<CR>
                " OnlineDoc8
                "-------------------------------------------------------------------------------
                "----------------------------------------------------------------------------------
                " Super useful! From an idea by Michael Naumann
                vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
                vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
                "----------------------------------------------------------------------------------
                nnoremap <Leader>g :grep -R <cword> .<cr>
                nnoremap <Leader><Leader> :Ag <cword> .<cr>
                map <C-F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

        "-14-Search-QFix-}}}

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
                "------------------------------------------------------------------------------
                "------------------------------------------------------------------------------
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
                "------------------------------------------------------------------------------

        "-16-vnoremap-}}}

        "-UnitE --------------------------------------------------------------------------------{{{
        "-FZF---------------------------------------------------------------------
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
                "------------------------------------------------------------------------
                call deoplete#custom#option('refresh_always', v:true)
                let g:deoplete#enable_ignore_case = 1
                let g:deoplete#enable_smart_case = 1
                let g:deoplete#enable_camel_case = 1
                let g:deoplete#enable_refresh_always = 1
                let g:deoplete#max_abbr_width = 0
                let g:deoplete#max_menu_width = 0

                "-X-Insert Mode Completion-X--YYY-------------
                "let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
                "inoremap <silent> <C-]> <C-x><C-]>
                "inoremap <silent> <C-u> <C-x><C-u>
                "inoremap <silent> <C-o> <C-x><C-o>
                inoremap <silent> <C-k> <C-x><C-k>
                inoremap <silent> <C-d> <C-x><C-d>
                inoremap <silent> <C-f> <C-x><C-f>
                inoremap <silent> <C-l> <C-x><C-l>
                " This is the default extra key bindings
                imap <C-o> <plug>(fzf-complete-word)
                imap <C-S> <plug>(fzf-complete-line)
                "imap <c-x><c-f> <plug>(fzf-complete-path)
                "imap <c-x><c-j> <plug>(fzf-complete-file-ag)
                "imap <c-x><c-l> <plug>(fzf-complete-line)

        "-Unite-
                "#EEE# Toggle Two 
                nnoremap <C-e> :e#<CR>
                " command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
                "                        \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))
                "-------------------------------------------------------------------------
                "!" command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
                "-------------------------------------------------------------------------
                " The Silver Searcher
                if executable('ag')
                        " Use ag over grep
                        set grepprg=ag\ --nogroup\ --nocolor
                        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
                        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
                        " ag is fast enough that CtrlP doesn't need to cache
                        let g:ctrlp_use_caching = 0
                endif

                let g:ctrlp_map='<c-p>'
                let g:ctrlp_cmd = 'CtrlPMRU'
                let g:ctrlp_extensions = ['tag']
                let g:ctrlp_match_window_bottom = 0
                let g:ctrlp_match_window_reversed = 0
                let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
                let g:ctrlp_dotfiles = 0
                let g:ctrlp_switch_buffer = 0
                let g:ctrlp_working_path_mode = 0
                let g:ctrlp_working_path_mode = 'ar'
                "-------------------------------------------------------------------------------
                "-------------------------------------------------------------------------------
                nmap <C-u> :Unite file buffer file_mru <CR>
                nnoremap <C-\> :Unite line<CR>
                nnoremap <Leader>m :Unite file buffer file_mru <CR>
                nnoremap <Leader>\ :Unite grep<CR>
                nnoremap <Leader>i :Unite -silent history/yank<CR>
                nnoremap <C-h> :UniteWithCursorWord -silent help<CR>
                nnoremap <Leader>h :UniteWithCursorWord -silent help<CR>
                " buffer search--------------------------------------
                nnoremap <Leader>f :Unite -silent -no-split -start-insert -auto-preview
                        \ line<CR>
                "-outlines (also ctags)------------------------------------
                nnoremap <Leader>t :Unite -silent -vertical -winwidth=40
                                        \ -direction=topleft -toggle outline<CR>
                "-???-Line------------------------------------------------------------
                nnoremap <Leader>v :UniteWithCursorWord -silent -no-split -auto-preview
                        \ line<CR>
                "-------------------------------------------------------------------------------
                " nnoremap <Leader>' :Unite file buffer bookmark file_mru history/yank file_rec <CR>
                " call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
                " \ 'ignore_pattern', join([
                " \ '\.git/',
                " \ ], '\|'))
                "-------------------------------------------------------------------------------
                call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
                                        \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))
                "-------------------------------------------------------------------------------
                call unite#filters#matcher_default#use(['matcher_fzf'])
                "-------------------------------------------------------------------------------
                call unite#filters#matcher_default#use(['matcher_fuzzy'])
                call unite#filters#sorter_default#use(['sorter_rank'])
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
                " let g:unite_candidate_icon = '∘'
                let g:unite_source_history_yank_enable = 1
                let g:unite_enable_start_insert = 0
                let g:unite_enable_short_source_mes = 0
                let g:unite_force_overwrite_statusline = 0
                let g:unite_prompt = '>>> '
                let g:unite_marked_icon = '✓'
                let g:unite_winheight = 15
                let g:unite_update_time = 200
                let g:unite_split_rule = 'botright'
                let g:unite_data_directory ='~/.vim/tmp/unite'
                let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
                let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
                let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
        "-UnitE-}}}

        " Wildmenu completion------------------------------------------------------------------{{{
                " Save when losing focus
                au FocusLost * :silent! wall
                set wildmenu
                set wildmode=list:longest
                set wildignore+=.hg,.git,.svn                    " Version control
                set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
                set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
                set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
                set wildignore+=*.spl                            " compiled spelling word lists
                set wildignore+=*.sw?                            " Vim swap files
                set wildignore+=*.DS_Store                       " OSX bullshit
                set wildignore+=*.luac                           " Lua byte code
                set wildignore+=migrations                       " Django migrations
                set wildignore+=*.pyc                            " Python byte code
                set wildignore+=*.orig                           " Merge resolution files
                set wildignore+=*.fasl                           " Lisp FASLs
                set wildignore+=*.dx64fsl                        " CCL
                " Clojure/Leiningen
                set wildignore+=classes
                set wildignore+=lib
        "-Wild-}}}
        "-------------------------------------------------------------------
        " cyan
        highlight TagbarHighlight   ctermfg=051 ctermbg=none cterm=bold
        highlight TagListTagName    ctermfg=250
"-surok----------------------------------------------------------------------------------------------------------------
"-surok----------------------------------------------------------------------------------------------------------------
        function! s:fzf_statusline()
                " Override statusline as you like
                highlight fzf1 ctermfg=161 ctermbg=251
                highlight fzf2 ctermfg=23 ctermbg=251
                highlight fzf2 ctermfg=237 ctermbg=251
                setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
        endfunction
        autocmd! User FzfStatusLine call <SID>fzf_statusline()

"-surok----------------------------------------------------------------------------------------------------------------
"-surok----------------------------------------------------------------------------------------------------------------
