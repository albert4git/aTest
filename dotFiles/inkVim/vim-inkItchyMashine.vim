        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "   (_)            __   _(_)_ __ ___             (_)
        "   / |  itchy     \ \ / / | '_ ` _ \            / |
        "   | |             \ V /| | | | | | |           | |
        "   |_|            (_)_/ |_|_| |_| |__|          |_|
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        set viminfo='10,\"100,:20,%,n~/.viminfo "help :viminfo, notice permis.n is wrong on viminfo
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

        "-AAA1--Appearance--Edit--Clipboard--Bell--ExpandTab-Hist--SmartEnter-------------------{{{
        if &compatible | set nocompatible | endif
        " Appearance  # matchtime=1
                silent! set number background=dark display=lastline,uhex nowrap wrapmargin=0 guioptions=ce key=
                silent! set noshowmatch  noshowmode shortmess+=I cmdheight=1 cmdwinheight=10 showbreak=
                silent! set noshowcmd noruler rulerformat= laststatus=2 statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c
                silent! set title titlelen=100 titleold= titlestring=%f noicon norightleft showtabline=1
                silent! set cursorline nocursorcolumn colorcolumn= concealcursor=nvc conceallevel=0 norelativenumber
                silent! set list listchars=tab:>\ ,nbsp:_ synmaxcol=3000 ambiwidth=double breakindent breakindentopt=
                silent! set nosplitbelow nosplitleft startofline linespace=0 whichwrap=b,s scrolloff=1 sidescroll=0
                silent! set equalalways nowinfixwidth nowinfixheight winminwidth=3 winminheight=3 nowarn noconfirm
                silent! set fillchars=vert:\|,fold:\  eventignore= helplang=en viewoptions=options,cursor virtualedit=
                set splitbelow splitright

        " Editing
                silent! set iminsert=0 imsearch=0 nopaste pastetoggle= nogdefault comments& commentstring=#\ %s
                silent! set smartindent autoindent shiftround shiftwidth=8 expandtab tabstop=8 smarttab softtabstop=8
                silent! set foldclose=all foldcolumn=0 nofoldenable foldlevel=0 foldmarker& foldmethod=indent
                silent! set textwidth=0 backspace=indent,eol,start nrformats=hex formatoptions=cmMj nojoinspaces
                silent! set nohidden autoread noautowrite noautowriteall nolinebreak mouse= modeline& modelines&
                silent! set noautochdir write nowriteany writedelay=0 verbose=0 verbosefile= notildeop noinsertmode
                silent! set tags=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
                silent! set tags+=~/Documents/scala/tags,~/Documents/*/tags tagstack

                setlocal foldmarker={{{,}}}
                setlocal foldmethod=marker
                setlocal foldminlines=7
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
                autocmd vimrc FileType * execute 'setlocal ' . (search('^\t.*\n\t.*\n\t', 'n') ? 'no' : '') . 'expandtab'
                autocmd vimrc BufWinEnter * if &buftype == 'terminal' | setlocal nonumber | endif

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
                "-1.1-Extra vi-compatibility----------------------------------------------------{{{
                        set switchbuf=useopen    " reveal already opened files from the
                        set formatoptions-=o     " don't start new lines w/ comment leader on pressing 'o'
                        au filetype vim set formatoptions-=o
                "1.1}}}
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

                command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
                                        \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))

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

        "-AAA12-[unite-completion]--------------------------------------------------------------{{{
                " unite.vim Ultimate interface to unite all sources
                "   - :Unite [{options}] {source's'}
                "       - {source's'}
                "           - parameters of source
                "               - e.g. file:foo:bar -- here ['foo', 'bar'] is parameters
                "               - e.g. file:foo\:bar -- use \ to escape
                "               - e.g. file:foo::bar -- ['foo', '', 'bar']
                "   - press 'I' to search after prompt '>'
                "       - *word,
                "       - **/foo (directory recursively)
                "       - foo bar (AND)
                "       - foo|bar (OR)
                "       - foo !bar (negative)
                "   - :UniteResume, :UniteBookmarkAdd
                " let g:unite_no_default_keymappings = 1 " don't map default key mappings
                let g:unite_update_time = 500 " update time interval of candidates
                let g:unite_enable_start_insert = 1 " startup into insert mode
                let g:unite_split_rule = "topleft"
                let g:unite_enable_split_vertically = 0 " 1:split unite window vertically
                let g:unite_winheight = 15
                let g:unite_winwidth = 50
                let g:unite_kind_openable_cd_command = "cd"
                let g:unite_kind_openable_lcd_command = "lcd"
                let g:unite_cursor_line_highlight = "PmenuSel"
                let g:unite_abbr_highlight = "Normal"
                let g:unite_enable_use_short_source_names = 0
                let g:unite_quick_match_table = {}
                let g:unite_data_directory = expand('~/.unite')
        "-12-Unite-}}}

        "-AAA13-Ctrl-P--------------------------------------------------------------------------{{{
                let g:ctrlp_dont_split = 'NERD_tree_2'
                let g:ctrlp_jump_to_buffer = 0
                let g:ctrlp_working_path_mode = 0
                let g:ctrlp_match_window_reversed = 1
                let g:ctrlp_split_window = 0
                let g:ctrlp_max_height = 20
                let g:ctrlp_extensions = ['tag']

                let g:ctrlp_map = '<leader>,'
                nnoremap <leader>. :CtrlPTag<cr>
                nnoremap <leader>b :CtrlPBuffer<cr>

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

        "-16-vnoremap-}}}

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

