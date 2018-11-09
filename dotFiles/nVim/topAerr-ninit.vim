"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-NeoVimMix4-"-""-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"
"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-
        "set runtimepath+=~/.vim/plugged/vimproc/
        set path+=.,/usr/include,/usr/local/include
        set thesaurus=~/git/aTest/dotFiles/DICT/mthesaur.txt
        let s:thesaurus_pat = "~/git/aTest/dotFiles/DICT/mthesaur.txt"
        set dictionary=/home/red/git/aTest/dotFiles/DICT/english-words.txt
        set shell=/bin/bash
        set nocompatible
        set nospell
        filetype on
        filetype plugin on
        filetype indent on
        let maplocalleader=','
        let mapleader=' '
        "---------------------
        augroup vimrc
                autocmd!
        augroup END
        "------------------------------------------------------------------------------------------
        autocmd! bufwritepost .vimrc source ~/.vimrc
        "------------------------------------------------------------------------------------------
        "-MmMmMmMmMmMmMmM-
        "nmap ; :
        "-MMM-set <m-a> = ^[a
        map <m-b> ggVG
        nnoremap <m-;> :ls\|sleep<enter><enter>
        "-MmMmMmMmMmMmMmM-
        map <M-1> :confirm :b1 <CR>
        map <M-2> :confirm :b2 <CR>
        map <M-3> :confirm :b3 <CR>
        map <M-4> :confirm :b4 <CR>
        map <M-5> :confirm :b5 <CR>
        "------------------------------------------------------------------------------------------
        "Last modified: Mo Okt 22, 2018  12:52
        function! LastMod()
                if line("$") > 30
                        let l = 30
                else
                        let l = line("$")
                endif
                exe "1," . l . "g/Last modified: Mo Okt 22, 2018  12:52
                                        \ strftime("%a %b %d, %Y  %I:%M%p")
        endfun
        " This auto command will call LastMod function everytime you save a file
        autocmd BufWrite *   ks|call LastMod()|'s
        "------------------------------------------------------------------------------------------
        "In my Python or Ruby scripts, the first line is always a shebang line. I create it automatically using
        augroup Shebang
                autocmd BufNewFile *.py  0put =\"#!/usr/bin/env python\<nl># -*- coding: iso-8859-15 -*-\<nl>\"|$
                autocmd BufNewFile *.rb  0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
                autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
                autocmd BufNewFile *.\(cc\|hh\)  0put =\"//\<nl>//  \".expand(\"<afile>:t\").\"  --  \<nl>//\<nl>\"|2|start!
        augroup END
        "------------------------------------------------------------------------------------------

        "-nPlug------------------------------------------------------------------------------------
        source ~/git/aTest/dotFiles/nVim/nPlug.vim
        "source ~/git/aTest/dotFiles/nVim/mix/n-neonwave.vim source
        "source ~/git/aTest/dotFiles/nVim/mix/n-mopkai.vim
        source ~/git/aTest/dotFiles/nVim/mix/n-badwolf.vim 
        " colorscheme mopkai
        syntax on
        syntax enable
"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-
"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-

"-AAA0-Tags-BackUp------------------------------------------------------------------------------------------{{{
        " Ctags {
                set tags=./tags;/,~/.vimtags
                " Make tags placed in .git/tags file available in all levels of a repository
                let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
                if gitroot != ''
                let &tags = &tags . ',' . gitroot . '/.git/tags'
                endif
        "-}
        let g:easytags_auto_highlight = 1
        let g:easytags_syntax_keyword = 'always'
        let g:easytags_events = ['BufWritePost']
        " let g:easytags_file = '~/.vim/tags'
        "------------------------------------------------------------------------------------------
        set backup                        " enable backups
        set noswapfile
        set undodir=~/.config/nvim/undoDir/      " undo files
        set backupdir=~/.config/nvim/backUpDir/  " backups
        set directory=~/.config/nvim/swapDir/    " swap files

        if !isdirectory(expand(&undodir))
            call mkdir(expand(&undodir), "p")
        endif
        if !isdirectory(expand(&backupdir))
            call mkdir(expand(&backupdir), "p")
        endif
        if !isdirectory(expand(&directory))
            call mkdir(expand(&directory), "p")
        endif
        "------------------------------------------------------------------------------------------
        set undofile
        set undoreload=10000
        set matchtime=3
        set showbreak=↪
        set linebreak
        set colorcolumn=+1
        "------------------------------------------------------------------------------------------
        set cf         " Enable error files & error jumping.
        set nu
        set autowrite  " Writes on make/shell commands
        set guifont=Monospace\ 14
        set cinwords=if,else,while,do,for,switch,case
        set matchpairs=(:),{:},[:],<:>
"-0Tags-}}}
"-AAA1-Remap-qq----------------------------------------------------------------------------------------------{{{
        imap jj <Esc>
        noremap ss :wa<cr>
        noremap qq :wa<cr> :bd<cr>
        noremap sq :wa<cr> :qa<cr>
        noremap qa :qa!<cr>
        nnoremap ZZ  <Nop> "-Disable-ZZ-
        nnoremap ge :w<CR>:e #<CR>
        nnoremap ee :e#<CR>
        "-It's-2018--------------------------
        noremap j gj
        noremap k gk
        noremap gj j
        noremap gk k
        " Bash like keys for the command line
        cnoremap <C-A> <Home>
        cnoremap <C-E> <End>
        cnoremap <C-d> <Del>
        "------------------------------------
        nnoremap <C-P> <Up>
        nnoremap <C-N> <Down>
        nnoremap Q q
        "Underline the current line with '-'
        nmap <silent> <leader>- :t.<CR>Vr-
        "Select entire buffer
        nnoremap aa ggVG
        "Same when jumping around
        nnoremap <c-o> <c-o>zz
        nnoremap <c-i> <c-i>zz
        "Useful save mappings.
        nnoremap <silent> <Leader>u :<C-u>update<CR>
        " Yank to end of line
        nnoremap Y y$
        "-HHJ- Keep the cursor in place while joining lines
        nnoremap H mzJ`z
        "Split?? The normal use of S is covered by cc, so don't worry about shadowing it.
        nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
        "#- go to last edit position when opening files -#
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
        "nnoremap vv ^vg_
        nnoremap <silent> vv <C-w>v
"-1Remap-}}}

"-AAA2--SetUp-Appearance--Edit--Clipboard--Bell--ExpandTab-Hist--SmartEnter---------------------------------{{{
        let g:bling_time = 42
        let g:bling_color_fg = 'green'
        let g:bling_color_cterm = 'reverse'
        "-magic--------    
        silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
        "-Appearance--- 
        silent! display=lastline,uhex nowrap wrapmargin=0 guioptions=ce key=
        silent! set noshowmatch  noshowmode shortmess+=I cmdheight=1 cmdwinheight=10 
        silent! set noshowcmd noruler rulerformat= laststatus=2 statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c
        silent! set title titlelen=100 titleold= titlestring=%f noicon norightleft showtabline=1
        silent! set cursorline nocursorcolumn colorcolumn= concealcursor=nvc conceallevel=0 norelativenumber
        silent! set list listchars=tab:>\ ,nbsp:_ synmaxcol=500 ambiwidth=double breakindent breakindentopt=
        silent! set nosplitbelow nosplitleft startofline linespace=0 whichwrap=b,s scrolloff=1 sidescroll=0
        silent! set equalalways nowinfixwidth nowinfixheight winminwidth=3 winminheight=3 nowarn noconfirm
        silent! set fillchars=vert:\|,fold:\  eventignore= helplang=en viewoptions=options,cursor virtualedit=
        set splitbelow splitright
        "-AAA2.1-Extra vi-compatibility---------------------------------------------------------{{{
                set switchbuf=useopen    " reveal already opened files from the
                set formatoptions-=o     " don't start new lines w/ com leader on press 'o'
                au filetype vim set formatoptions-=o
        "-2.1-}}}

        "-Editing----------------------------------------------------------------------------------
        silent! set iminsert=0 imsearch=0 nopaste pastetoggle= nogdefault comments& commentstring=#\ %s
        silent! set smartindent autoindent shiftround shiftwidth=8 expandtab tabstop=4 smarttab softtabstop=8
        silent! set foldclose=all foldcolumn=0 nofoldenable foldlevel=0 foldmarker& foldmethod=indent
        silent! set textwidth=0 backspace=indent,eol,start nrformats=hex formatoptions=cmMj nojoinspaces
        silent! set nohidden autoread noautowrite noautowriteall nolinebreak mouse= modeline& modelines&
        silent! set noautochdir write nowriteany writedelay=0 verbose=0 verbosefile= notildeop noinsertmode
        set modelines=0
        "------------------------------------------------------------------------------------------
        "set tw = 300
        set synmaxcol=800
        highlight Folded ctermbg=1
        setlocal foldmarker={{{,}}}
        setlocal foldmethod=marker
        setlocal foldminlines=6
        set foldcolumn=1 
        "-Mappings to easily toggle fold levels
        nnoremap z1 :set foldlevel=1<cr>
        nnoremap z2 :set foldlevel=2<cr>
        nnoremap z3 :set foldlevel=3<cr>
        nnoremap z4 :set foldlevel=4<cr>
        nnoremap z5 :set foldlevel=5<cr>
        " Make zO recursively open whatever fold we're in, even if it's partially open.
        nnoremap zO zczO
        " Focus the current line.  Basically:
        " 1. Close all folds.
        " 2. Open just the folds containing the current line.
        " 3. Move the line to a bit (25 lines) down from the top of the screen.
        " 4. Pulse the cursor line.  My eyes are bad.
        " This mapping wipes out the z mark, which I never use.
        " I use :sus for the rare times I want to actually background Vim.
        function! FocusLine()
                let oldscrolloff = &scrolloff
                set scrolloff=0
                execute "keepjumps normal! mzzMzvzt25\<c-y>\<cr>"
                let &scrolloff = oldscrolloff
        endfunction
        nnoremap <c-z> :call FocusLine()<cr>
        "------------------------------------------------------------------------------------------
        "set whichwrap=b,s,h,l,<,>,[,]
        silent! set clipboard=unnamed
        silent! set clipboard+=unnamedplus
        "-Performance
        silent! set updatetime=300 timeout timeoutlen=300 ttimeout ttimeoutlen=50 ttyfast lazyredraw
        "-Bell-Bell-Bell
        silent! set noerrorbells visualbell t_vb=
        "-Fix window position of help
        autocmd vimrc FileType help if &l:buftype ==# 'help' | wincmd K | endif
        "-Always open read-only when a swap file is found
        autocmd vimrc SwapExists * let v:swapchoice = 'o'
        "-Setting lazyredraw causes a problem on startup
        autocmd vimrc VimEnter * redraw
        "-Enter, I never use the default behavior of <cr> and this saves me a keystroke...
        nnoremap <cr> o<esc>
        "-Smart Enter -???-
        inoremap <silent><expr> <CR> (pumvisible() && bufname('%') !=# '[Command Line]' ? "\<C-e>\<CR>" : "\<C-g>u\<CR>")
        "-Go to the first non-blank character of the line after paragraph motions
        noremap } }^
        "-select last paste
        nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'
        "-Command line history
        set history=4024
        "-Visual shifting (does not exit Visual mode)
        vnoremap < <gv
        vnoremap > >gv
        "-Allow using the repeat operator with a visual selection (!)
        vnoremap . :normal .<CR>
        "-For when you forget to sudo.. Really Write the file.
        cmap w!! w !sudo tee % >/dev/null
        "-Move to the directory each buffer
        autocmd vimrc BufEnter * silent! lcd %:p:h
        "-SWITCH TO THE DIRECTORY OF THE OPEN BUFFER
        map cd :cd %:p:h<cr>
        "------------------------------------------------------------------------------------------
        set nosm
        set wmh=0
        "------------------------------------------------------------------------------------------
        set nowrap
        set mouse=a
"-2SetUp-}}}
"-AAA3-SyntaxColor------------------------------------------------------------------------------------------{{{
        nnoremap ( <c-x>:y x\|@x<cr>
        nnoremap ) <c-a>:y x\|@x<cr>

        set list
        set listchars=tab:▸\
        "set listchars=tab:›\ ,trail:•,extends:#,nbsp:. set listchars=tab:▸\ ,eol:¬,trail:⋅

        " Show syntax highlighting groups for word under cursor
        nmap <F4> :call <SID>SynStack()<CR>
        function! <SID>SynStack()
                if !exists("*synstack")
                        return
                endif
                echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
        endfunc
        "------------------------------------------------------------------------------------------
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
        "------------------------------------------------------------------------------------------
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
"-3SynColor-}}}

"-AAA4-CScope-----------------------------------------------------------------------------------------------{{{
        nnoremap ff :call CscopeFindInteractive(expand('<cword>'))<CR>
        " nnoremap <leader>f :call CscopeFindInteractive(expand('<cword>'))<CR>
        " nnoremap <leader>\ :call ToggleLocationList()<CR>
        " " s: Find this C symbol
        " nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
        " " g: Find this definition
        " nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
        " " d: Find functions called by this function
        " nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
        " " c: Find functions calling this function
        " nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
        " " t: Find this text string
        " nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
        " " e: Find this egrep pattern
        " nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
        " " f: Find this file
        " nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
        " " i: Find files #including this file
        " nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
"-4CScope-}}}
"-AAA5-Ulty--NeoSnippet--Ctrl-B-----------------------------------------------------------------------------{{{
        if has("eval")
                " don't override ^J/^K -- I don't mind ^J, but ^K is digraphs
                let g:UltiSnipsJumpForwardTrigger="<tab>"
                let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
                let g:UltiSnipsListSnippets="<C-R><tab>"
        endif
        "----------
        "----------
        imap <C-b>    <Plug>(neosnippet_expand_or_jump)
        smap <C-b>    <Plug>(neosnippet_expand_or_jump)
        xmap <C-b>    <Plug>(neosnippet_expand_target)
        "----------
        "----------
        "let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_auto_select = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#auto_completion_start_length = 3 "-zzz
        let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB
        let g:neocomplete#enable_fuzzy_completion = 1
        "----------
        "----------
        set previewheight=15
        set report=0 " always report changed lines
"-5Snipp-}}}
"-AAA6-Deoplete---------------------------------------------------------------------------------------------{{{
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
        "-Omni-Completion--------------------------------------------------------------------------
        set omnifunc=syntaxcomplete#Complete
        set completeopt=menu,preview,longest
        set pumheight=10
        hi Pmenu  ctermfg=202 ctermbg=14
        "hi Pmenu  ctermfg=197 ctermbg=51
        hi PmenuSbar   ctermfg=11 ctermbg=5 cterm=NONE
        hi PmenuThumb  ctermfg=12 ctermbg=2 cterm=NONE
        "Automatically open and close the popup menu / preview window
        "au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        "silent! set complete& completeopt=menu infercase pumheight=10 noshowfulltag shortmess+=c
        "----------
        call deoplete#custom#source('_', 'min_pattern_length', 4)
        call deoplete#custom#option('refresh_always', v:true)
        call deoplete#custom#source('dictionary', 'mark', '⊶')
        call deoplete#custom#source('syntax',        'mark', '♯')
        call deoplete#custom#source('tag',           'mark', '⌦')
        call deoplete#custom#source('omni',          'mark', '⌾')
        call deoplete#custom#source('vim',           'mark', 'vi')
        call deoplete#custom#source('neosnippet',    'mark', '⌘')
        call deoplete#custom#source('jedi',          'mark', '⌁')
        call deoplete#custom#source('around',        'mark', '↻')
        call deoplete#custom#source('buffer',        'mark', 'ℬ')
        call deoplete#custom#source('member', 'mark', '.')
        "----------
        let g:deoplete#enable_ignore_case = 1
        let g:deoplete#enable_smart_case = 1
        let g:deoplete#enable_camel_case = 1
        let g:deoplete#enable_refresh_always = 1
        let g:deoplete#max_abbr_width = 0
        let g:deoplete#max_menu_width = 0
        "----------
        "inoremap <silent> <C-]> <C-x><C-]>
        "inoremap <silent> <C-u> <C-x><C-u>
        "----------
        inoremap <silent> <C-o> <C-x><C-o>
        inoremap <silent> <C-k> <C-x><C-k>
        inoremap <silent> <C-d> <C-x><C-d>
        inoremap <silent> <C-f> <C-x><C-f>
        inoremap <silent> <C-l> <C-x><C-l>
"-6Deoplete-}}}

"-AAA7-Ag--CtrlP--Unite--------------------------------------------------------------------------------------{{{
        "------------------------------------------------------------------------------------------
        let g:ctrlp_map='<c-q>'
        nnoremap <leader>q :CtrlP<cr>
        let g:ctrlp_cmd = 'CtrlPMRU'
        let g:ctrlp_extensions = ['tag']
        let g:ctrlp_match_window_bottom = 0
        let g:ctrlp_match_window_reversed = 0
        let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
        let g:ctrlp_dotfiles = 0
        let g:ctrlp_switch_buffer = 0
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_working_path_mode = 'ar'
        "------------------------------------------------------------------------------------------
        imap <C-r> <plug>(fzf-complete-word)
        imap <C-\> <plug>(fzf-complete-line)
        "------------------------------------------------------------------------------------------
        nmap <C-u> :Unite buffer file_mru file <CR>
        nnoremap <Leader>u :Unite history/yank file_mru file buffer file_rec bookmark <CR>
        nnoremap <Leader>h :UniteWithCursorWord -silent help<CR>
        nnoremap <Leader>i :Unite -silent history/yank<CR>
        nnoremap <Leader>v :UniteWithCursorWord -silent -no-split -auto-preview line<CR>
        nnoremap <Leader>t :Unite -silent -vertical -winwidth=40  -direction=topleft -toggle outline<CR>
        "nnoremap <Leader>\ :Unite grep<CR>
        "nnoremap <Leader>' :Unite  buffer bookmark  <CR>
        "nnoremap <silent><Leader>; :Unite -silent -toggle grep:%::FIXME\|TODO\|NOTE\|zzz\|COMBAK\|@todo<CR>
        "------------------------------------------------------------------------------------------
        call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
                                \ 'ignore_pattern', join([
                                \ '\.git/',
                                \ ], '\|'))
        "------------------------------------------------------------------------------------------
        call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
                                \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))
        "----------------------------------------------------------------------------------
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        call unite#filters#matcher_default#use(['matcher_fzf'])
        call unite#filters#sorter_default#use(['sorter_rank'])
        "------------------------------------------------------------------------------------------
        if executable('ag')
                let g:unite_source_grep_command = 'ag'
                let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
                let g:unite_source_grep_recursive_opt = ''
        endif
        "----------------------------------------------------------------------------------
        let g:unite_source_history_yank_save_clipboard = 1
        let g:unite_source_mark_marks = "abcdefghijklmnopqrstuvwxyz"
                \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""
        "------------------------------------------------------------------------------------------
        let g:unite_candidate_icon = '∘'
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
        "------------------------------------------------------------------------------------------
        "------------------------------------------------------------------------------------------
        " Use the the_silver_searcher if possible (much faster than Ack)
        if executable('ag')
                let g:ackprg = 'ag --vimgrep --smart-case'
        endif
        "------------------------------------------------------------------------------------------
        if executable('ag')
                let g:ag_working_path_mode="r"
                " Use ag over grep
                set grepprg=ag\ --nogroup\ --nocolor
                " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
                let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
                " ag is fast enough that CtrlP doesn't need to cache
                let g:ctrlp_use_caching = 0
        endif

"-7-}}}

"-AAA8--GitGutter-------------------------------------------------------------------------------------------{{{
        "let g:gitgutter_highlight_lines = 1
        let g:gitgutter_signs = 1
        let g:gitgutter_max_signs = 2000
        "------------------------------------------------------------------------------------------
        nmap ]c <Plug>GitGutterNextHunk
        nmap [c <Plug>GitGutterPrevHunk
        " nmap <Leader>hs <Plug>GitGutterStageHunk
        " nmap <Leader>hu <Plug>GitGutterUndoHunk
        "------------------------------------------------------------------------------------------
        highlight GitGutterAdd ctermfg=green
        highlight GitGutterChange ctermfg=yellow
        highlight GitGutterDelete ctermfg=red
        highlight GitGutterChangeDelete ctermfg=yellow
        "------------------------------------------------------------------------------------------
        if exists("*gitgutter#highlight#define_highlights")
                " let vim-gitgutter know we changed the SignColumn colors!
                call gitgutter#highlight#define_highlights()
        endif
"-8-}}}
"-AAA9--Abbr------------------------------------------------------------------------------------------------{{{
        " => Command mode related ???
        cno $h e ~/
        cno $d e ~/Desktop/
        cno $j e ./
        cno $c e <C-\>eCurrentFileDir("e")<cr>
        " $q is super useful when browsing on the command line
        " it deletes everything until the last slash 
        cno $q <C-\>eDeleteTillSlash()<cr>
        " Map auto complete of (, ", ', [
        inoremap $1 ()<esc>i
        inoremap $2 []<esc>i
        inoremap $3 {}<esc>i
        inoremap $4 {<esc>o}<esc>O
        inoremap $q ''<esc>i
        inoremap $e ""<esc>i
        "------------------------------------------------------------------------------------------
        command! -bang E e<bang>
        command! -bang Q q<bang>
        command! -bang W w<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Wq wq<bang>
        command! -bang WQ wq<bang>
        "Unfuck my screen
        nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

        iabbrev yyy "---------------------------------------------------------------------------------
        iabbrev yyy1 "---------------------------------------------------------------------------------------------
        iabbrev yyy2 "-----------------------------------------------------------------------------------------------------{{{
        iabbrev yyy3 "-}}}
        iabbrev yyy4 "....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9....+...10....+...11....+..12<esc>

          iabbrev mispell misspell
          iabbrev funciton function
          iabbrev functiton function
          iabbrev fucntion function
          iabbrev funtion function
          iabbrev erturn return
          iabbrev retunr return
          iabbrev reutrn return
          iabbrev reutn return
          iabbrev queyr query
          iabbrev htis this
          iabbrev foreahc foreach
          iabbrev forech foreach

        iabbrev str start
        iabbrev que question
        iabbrev #i #include
        iabbrev #d #define
        iabbrev cmnt /*<CR><CR>*/<Up>
        iabbrev @@  alf@nomail.com
        iabbrev ccopy Copyright 2013 Alf , no rights reserved.
        iabbrev xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
        iabbrev ydate <c-r>=strftime("%Y %b %d")<cr>
        iabbrev todo TODO
"-9Abbr-}}}

"-AAA10--Jump-----------------------------------------------------------------------------------------------{{{
        set hidden
        set cinoptions=N-s,g0,+2s,l-s,i2s
        "------------------------------------------------------------------------------------------
        nnoremap <m-right> :vertical resize +3<cr>
        nnoremap <m-left> :vertical resize -3<cr>
        nnoremap <m-up> :resize +3<cr>
        nnoremap <m-down> :resize -3<cr>
        "------------------------------------------------------------------------------------------
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

                nnoremap <C-]> :silent! call JumpToTag()<cr>
                nnoremap <C-s> :silent! call JumpToTagInSplit()<cr>
        "------------------------------------------------------------------------------------------
                function PreviewTag3(top)
                        set previewheight=25
                        exe "silent! pclose"
                        if &previewwindow " don't do this in the preview window
                                return
                        endif
                        let w = expand("<cword>") " get the word under cursor
                        exe "ptjump " . w
                        " if any non False arg, open in simple horiz window so simply return
                        if a:top
                                return
                        endif
                        " otherwise, make it vertical
                        exe "silent! wincmd P"
                        if &previewwindow " if we really get there...
                                if has("folding")
                                        silent! .foldopen " don't want a closed fold
                                endif
                                wincmd L " move preview window to the left
                                wincmd p " back to caller
                                if !&previewwindow " got back
                                        wincmd _ endif
                        endif
                endfunction
        "inoremap <C-]> <Esc>:call PreviewTa2(0)<CR>
        "nnoremap <C-]> :call PreviewTag3(0)<CR>
"-10Jump-}}}
"-AAA11--BookMarks------------------------------------------------------------------------------------------{{{
        "let g:bookmark_save_per_working_dir = 1`     
        "let g:bookmark_manage_per_buffer = 1`        
        "let g:bookmark_auto_save_file = '/bookmarks'`
        " |------------------------------------------|-------------|------------------------------|
        " | Action                                   | Shortcut    | Command                      |
        " |------------------------------------------|-------------|------------------------------|
        " | Add/remove bookmark at current line      | `mm`        | `:BookmarkToggle`            |
        " | Add/edit/remove annotation at current li | `mi`        | `:BookmarkAnnotate <TEXT>`   |
        " | Jump to next bookmark in buffer          | `mn`        | `:BookmarkNext`              |
        " | Jump to previous bookmark in buffer      | `mp`        | `:BookmarkPrev`              |
        " | Show all bookmarks (toggle)              | `ma`        | `:BookmarkShowAll`           |
        " | Clear bookmarks in current buffer only   | `mc`        | `:BookmarkClear`             |
        " | Clear bookmarks in all buffers           | `mx`        | `:BookmarkClearAll`          |
        " | Move up bookmark at current line         | `[count]mkk`| `:BookmarkMoveUp [<COUNT>]`  |
        " | Move down bookmark at current line       | `[count]mjj`| `:BookmarkMoveDown [<COUNT>]`|
        " | Move bookmark at current line to another | `[count]mg` | `:BookmarkMoveToLine <LINE>` |
        " | Save all bookmarks to a file             |             | `:BookmarkSave <FILE_PATH>`  |
        " | Load bookmarks from a file               |             | `:BookmarkLoad <FILE_PATH>`  |
        " |------------------------------------------|-------------|------------------------------|
        let g:bookmark_auto_close = 1
        let g:bookmark_highlight_lines = 1          
        let g:bookmark_show_warning = 0           
        let g:bookmark_show_toggle_warning = 0      
        let g:bookmark_sign = '♥'
        let g:bookmark_highlight_lines = 1
        let g:bookmark_save_per_working_dir = 1
        let g:bookmark_auto_save = 1
        "------------------------------------------------------------------------------------------
        nmap <Leader>m <Plug>BookmarkShowAll
        "------------------------------------------------------------------------------------------
        let g:bookmark_no_default_key_mappings = 1
        function! BookmarkMapKeys()
                nmap mm :BookmarkToggle<CR>
                nmap mi :BookmarkAnnotate<CR>
                nmap mn :BookmarkNext<CR>
                nmap mp :BookmarkPrev<CR>
                nmap ma :BookmarkShowAll<CR>
                nmap mc :BookmarkClear<CR>
                nmap mx :BookmarkClearAll<CR>
                nmap mkk :BookmarkMoveUp
                nmap mjj :BookmarkMoveDown
        endfunction
        "------------------------------------------------------------------------ 
        function! BookmarkUnmapKeys()
                unmap mm
                unmap mi
                unmap mn
                unmap mp
                unmap ma
                unmap mc
                unmap mx
                unmap mkk
                unmap mjj
        endfunction
        autocmd BufEnter * :call BookmarkMapKeys()
        autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
"-11BookMarks-}}}

"-AAA12-MiniPlugIn------------------------------------------------------------------------------------------{{{
        command! ErrorsToggle call ErrorsToggle()
        function! ErrorsToggle() 
                if exists("w:is_error_window")
                        unlet w:is_error_window
                        exec "q"
                else
                        exec "Errors"
                        lopen
                        let w:is_error_window = 1
                endif
        endfunction
        "----------
        "----------
        command! LocationToggle call LocationToggle()
        function! LocationToggle()
                if exists("w:is_location_window")
                        unlet w:is_location_window
                        exec "q"
                else
                        lopen
                        let w:is_location_window = 1
                endif
        endfunction
        "----------
        "----------
        command! -bang -nargs=? QFixToggle call QFixToggle(<bang>0)
        function! QFixToggle(forced)
                if exists("g:qfix_win") && a:forced == 0
                        cclose
                        unlet g:qfix_win
                else
                        copen 10
                        let g:qfix_win = bufnr("$")
                endif
        endfunction
        "-nmap <silent> <fx> :ErrorsToggle<cr>
        "-Open-Quickfix-window-automatically---------------------------
        autocmd vimrc QuickfixCmdPost [^l]* nested copen | wincmd p
        autocmd vimrc QuickfixCmdPost l* nested lopen | wincmd p
        "--------------------------------------------------------------
        "-Next error/grep match
        map          <F7>       :FirstOrNextInList<CR>
        imap         <F7>       <C-O><F7>
        "-previous error/grep match
        map          <S-F7>      :PrevInList<CR>
        imap         <S-F7>      <C-O><S-F7>
        "-current error/grep match
        map          <C-F7>      :CurInList<CR>
        imap         <C-F7>      <C-O><C-F7>
        "-on-quickfix--------------------------------------------------
        nmap <silent> <F9> :QFixToggle<cr>
        map         <S-F9>     :copen<CR>
        imap        <S-F9>     <C-O><C-F9>
        map         <C-F9>     :cclose<CR>
        imap        <C-F9>     <C-O><C-F9>
        "--------------------------------
        nnoremap <LocalLeader>b :cprev<cr>zvzz
        nnoremap <LocalLeader>n :cnext<cr>zvzz
        "-on-location-list----------------------------------------------
        nmap <silent> <f8> :LocationToggle<cr>
        map         <S-F8>     :lopen<CR>
        imap        <S-F8>     <C-O><C-F8>
        map         <C-F8>     :lclose<CR>
        imap        <C-F8>     <C-O><S-F8>
        nnoremap <Leader>n :lnext<cr>zvzz
        nnoremap <Leader>b :lprev<cr>zvzz
        "---------------------------------------------------------------
        "Ex: Pull word under cursor into LHS of a subs ztitute (replace)
        nnoremap <LocalLeader>w :%s#\<<C-r>=expand("<cword>")<CR>\>#
        nnoremap <LocalLeader>z :%s#\<<C-r>=getline(".")<CR>\>#
        "-------------------------------------------------------------------------
        " Clear hlsearch and set nopaste
        nnoremap <silent> <Esc><Esc> :<C-u>set nopaste<CR>:nohlsearch<CR>
        "-------------------------------------------------------------------------
        nmap <silent> n nzz
        nmap <silent> N Nzz
        nmap <silent> g* g*zz
        nmap <silent> g# g#zz
        " Super useful! From an idea by Michael Naumann
        vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
        vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
        "----------------------------------------------------------------------------------
        "nnoremap <Leader>g :grep -R <cword> .<cr>
        "----------------------------------------------------------------------------------
        nnoremap <Leader>l :lgrep -R <cword> .<cr>
        nnoremap <Leader>g :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
        nnoremap <Leader>a :Ack <cword> .<cr>

        " Find file in current directory and edit it
        function! Find(name)
                let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
                let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
                if l:num < 1
                        echo "'".a:name."' not found"
                        return
                endif

                if l:num != 1
                        echo l:list
                        let l:input=input("Which ? (CR=nothing)\n")

                        if strlen(l:input)==0
                                return
                        endif

                        if strlen(substitute(l:input, "[0-9]", "", "g"))>0
                                echo "Not a number"
                                return
                        endif

                        if l:input<1 || l:input>l:num
                                echo "Out of range"
                                return
                        endif

                        let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
                else
                        let l:line=l:list
                endif

                let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
                execute ":e ".l:line
        endfunction
        command! -nargs=1 Find :call Find("<args>")
        "------------------------------------------------------------------------------------------
        function! GoToOpenFold(direction)
                let start = line('.')
                if (a:direction == "next")
                        while (foldclosed(start) != -1)
                                let start = start + 1
                        endwhile
                else
                        while (foldclosed(start) != -1)
                                let start = start - 1
                        endwhile
                endif
                call cursor(start, 0)
        endfunction

        nmap ]z :cal GoToOpenFold("next")
        nmap [z :cal GoToOpenFold("prev")
        "------------------------------------------------------------------------------------------
        "------------------------------------------------------------------------------------------
        "------------------------------------------------------------------------------------------
        " function! MakeSession()
        "         let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
        "         if (filewritable(b:sessiondir) != 2)
        "                 exe 'silent !mkdir -p ' b:sessiondir
        "                 redraw!
        "         endif
        "         let b:filename = b:sessiondir . '/session.vim'
        "         exe "mksession! " . b:filename
        " endfunction
        "
        " function! LoadSession()
        "         let b:sessiondir  = $HOME . "/.vim/sessions" . getcwd()
        "         let b:sessionfile = b:sessiondir . "/session.vim"
        "         if (filereadable(b:sessionfile))
        "                 exe 'source ' b:sessionfile
        "         else
        "                 echo "No session loaded."
        "         endif
        " endfunction
        "
        " au VimEnter * :call LoadSession()
        " au VimLeave * :call MakeSession()
        "------------------------------------------------------------------------------------------
        "-MmMmMmMmMmMmMmM-
        "nmap ; :
        "-MMM-set <m-a> = ^[a
        map <m-b> ggVG
        nnoremap <m-;> :ls\|sleep<enter><enter>
        "-MmMmMmMmMmMmMmM-
        map <M-1> :confirm :b1 <CR>
        map <M-2> :confirm :b2 <CR>
        map <M-3> :confirm :b3 <CR>
        map <M-4> :confirm :b4 <CR>
        map <M-5> :confirm :b5 <CR>
        "------------------------------------------------------------------------------------------

"-12Mini-}}}
"-AAA13-NERD-Tree-------------------------------------------------------------------------------------------{{{
        noremap  <F3> :NERDTreeToggle<cr>
        inoremap <F3> <esc>:NERDTreeToggle<cr>

        augroup ps_nerdtree
                au!
                au Filetype nerdtree setlocal nolist
                au Filetype nerdtree nnoremap <buffer> H :vertical resize -10<cr>
                au Filetype nerdtree nnoremap <buffer> L :vertical resize +10<cr>
                " au Filetype nerdtree nnoremap <buffer> K :q<cr>
        augroup END

        let NERDTreeHighlightCursorline = 1
        let NERDTreeIgnore = ['\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                        \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                        \ '.*\.o$', 'db.db', 'tags.bak', '.*\.pdf$', '.*\.mid$',
                        \ '^tags$',
                        \ '^.*\.meta$',
                        \ '^.*\.fasl$',
                        \ '^.*\.dx64fsl$',
                        \ '.*\.bcf$', '.*\.blg$', '.*\.fdb_latexmk$', '.*\.bbl$', '.*\.aux$', '.*\.run.xml$', '.*\.fls$',
                        \ '.*\.midi$']

        let NERDTreeMinimalUI = 1
        let NERDTreeDirArrows = 1
        let NERDChristmasTree = 1
        let NERDTreeChDirMode = 2
        let NERDTreeMapJumpFirstChild = 'gK'
"-13Nerd-}}}

"-AAA14-Fugitive--------------------------------------------------------------------------------------------{{{
        augroup ft_fugitive
                au!
                nnoremap <leader>gd :Gdiff<cr>
                nnoremap <leader>gs :Gstatus<cr>
                nnoremap <leader>gw :Gwrite<cr>
                nnoremap <leader>ga :Gadd<cr>
                nnoremap <leader>gb :Gblame<cr>
                nnoremap <leader>gco :Gcheckout<cr>
                nnoremap <leader>gci :Gcommit<cr>
                nnoremap <leader>gm :Gmove<cr>
                nnoremap <leader>gr :Gremove<cr>
                nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>
                au BufNewFile,BufRead .git/index setlocal nolist
        augroup END
        " Hub zzz
        " vnoremap <leader>H :Gbrowse<cr>
        " nnoremap <leader>H V:Gbrowse<cr>
        " (Upstream) Hub"
        " vnoremap <leader>u :Gbrowse @upstream<cr>
        " nnoremap <leader>u V:Gbrowse @upstream<cr>
"-14-}}}
"-AAA15-Diff------------------------------------------------------------------------------------------------{{{
         " This is from https://github.com/sgeb/vim-diff-fold/ without the extra
         function! DiffFoldLevel()
                 let l:line=getline(v:lnum)
                 if l:line =~# '^\(diff\|Index\)'  " file
                         return '>1'
                 elseif l:line =~# '^\(@@\|\d\)'   " hunk
                         return '>2'
                 elseif l:line =~# '^\*\*\* \d\+,\d\+ \*\*\*\*$' " context: file1
                         return '>2'
                 elseif l:line =~# '^--- \d\+,\d\+ ----$'     " context: file2
                         return '>2'
                 else
                         return '='
                 endif
         endfunction
        "------------------------------------------------------------------------------------------
         augroup ft_diff
             au!
             " autocmd FileType diff setlocal foldmethod=expr
             autocmd FileType diff setlocal foldexpr=DiffFoldLevel()
         augroup END
         " See :help DiffOrig
                command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis \ | wincmd p | diffthis
         " Diffget/diffput in visual mode
                vmap            dg             :diffget<CR>
                vmap            dp             :diffput<CR>
         " diff-diff-diff
                nnoremap <silent> <expr> <leader>d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"
         " Diffoff-Diffoff
                nnoremap do :diffoff!<cr>
         " diffoff used to set wrap as a side effect
                command! Diffoff        diffoff | setlocal nowrap
"-15Diff-}}}

"-AAA16-SyntasticCheck--------------------------------------------------------------------------------------{{{
        noremap <C-F10> :SyntasticCheck<CR>
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        ""let g:syntastic_java_checkers = ['checkstyle']
        ""let g:syntastic_java_javac_executable = '~/.vim/plugged/syntastic/syntax_checkers/java/javac.vim'
        let g:systastic_python_checkers = ['pylint', 'python']
        let g:syntastic_mode_map = {'mode': 'active'}
        let g:syntastic_python_pylint_quiet_messages = {}
        let g:syntastic_enable_signs = 1
        let g:syntastic_auto_jump = 1
        let g:syntastic_enable_highlighting = 1
        let g:syntastic_echo_current_error  = 1
        let g:syntastic_javascript_checkers=['jshint']
        let g:syntastic_php_checkers=['php']
        let g:syntastic_css_checkers=['csslint']
        let g:syntastic_check_on_w = 1
"-16-}}}
"-AAA17-Doc8------------------------------------------------------------------------------------------------{{{
        let wordUnderCursor = expand("<cword>")
        let currentLine   = getline(".")
        "------------------------------------------------------------------------------------------
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
        "------------------------------------------------------------------------------------------
        function! OpenUrlUnderCursor()
                let path="/Applications/Safari.app"
                execute "normal BvEy"
                let url=matchstr(@0, '[a-z]*:\/\/[^ >,;]*')
                if url != ""
                        silent exec "!open -a ".path." '".url."'" | redraw! 
                        echo "opened ".url
                else
                        echo "No URL under cursor."
                endif
        endfunction
        nmap <leader>o :call OpenUrlUnderCursor()<CR>
        " OnlineDoc8
        "------------------------------------------------------------------------------------------
"-17--}}}

"-AAA18-Cyan------------------------------------------------------------------------------------------------{{{
        " highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
        " highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
        " highlight DiffChange        cterm=bold ctermbg=11 ctermfg=227
        highlight DiffChange        cterm=bold ctermbg=10 "greenBright
        highlight DiffChange        cterm=bold ctermbg=8 "gray
        highlight DiffChange        cterm=bold ctermbg=7 "red
        "------------------------------------------------------------------------------------------
        highlight Visual cterm=bold ctermbg=0 ctermfg=NONE
        highlight TagbarHighlight   ctermfg=051 ctermbg=none cterm=bold
        highlight TagListTagName    ctermfg=250
        "------------------------------------------------------------------------------------------
        "suppress intro message because the above makes it look bad
        set shortmess+=I
        highlight ErrorMsg  guifg=red guibg=white
        "easier on the eyes
        highlight Folded ctermbg=10
        "fold column aka gutter on the left
        highlight FoldColumn ctermbg=9 ctermfg=0 guibg=#ffffd7
        "avoid invisible color combination (red on red)
        highlight DiffText ctermbg=1
        set tabpagemax=15
        set cursorline
        set cursorcolumn
        let w:persistent_cursorline = 1
        "hi Search                  ctermbg=10
        hi CursorLine                  ctermbg=16
        hi CursorColumn                ctermbg=16
        hi ColorColumn                 ctermbg=53
        set colorcolumn=1,8,92,100,112,120
        hi LineNr ctermfg=1 ctermbg=153 
        hi Normal  ctermbg=236
        let g:indentLine_color_term = 133
        set nuw =5
        highlight Cursor ctermbg=2 term= bold
        hi Comment         ctermfg=14
        hi Number          ctermfg=10
"-18Cyan-}}}
"-AAA19-Airline---------------------------------------------------------------------------------------------{{{
        let g:airline_theme='powerlineish'
        "--Airline------------------------------
        let g:ctags_statusline=1
        let generate_tags=1
        set noshowmode
        set showmode                    " Display the current mode
        set showcmd      " Show partial commands in status line and
        "-------------------------------------------------------------------------------
        let g:airline#extensions#tabline#enabled = 2
        let g:airline#extensions#tabline#fnamemod = ':t'
        let g:airline#extensions#tabline#buffer_min_count = 1
        let g:airline_section_c = '%{strftime("%D - %H:%M")}'
        "let g:airline_theme='powerlineish'
        "let g:airline_theme='solarized'
        let g:airline_theme='light'
        let g:airline_powerline_fonts=1
        let g:airline#extensions#branch#enabled=1
        let g:airline#extensions#whitespace#enabled = 1
        let g:airline#extensions#hunks#non_zero_only = 1
        "-----------------------------------------------------------
        hi statusline ctermbg=Cyan ctermfg=Black  cterm=bold
        hi StatusLineNC  ctermbg=5 ctermfg=0 cterm=NONE
        hi signcolumn  ctermbg=15
        "-----------------------------------------------------------
        hi VariableType ctermbg=LightYellow
        hi VariableType ctermfg=brown
        hi VarName ctermfg=darkblue
        "-----------------------------------------------------------
        "- TODO - TST - ERR - Albert - TRUMP
        " match  Todo / TODO /
        " 2match Error / ERR /
        " 3match Title / Albert /
        "-???-----------------------------------------------------------------------------
        if &term =~ "xterm\\|rxvt"
                "use an orange cursor in insert mode
                let &t_SI = "\<Esc>]12;orange\x7"
                "use a red cursor otherwise
                let &t_EI = "\<Esc>]12;cyan\x7"
                silent !echo -ne "\033]12;green\007"
                "reset cursor when vim exits
                autocmd VimLeave * silent !echo -ne "\033]112\007"
                "use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
        endif
"-19-}}}

"-AAA20-Wildmenu--------------------------------------------------------------------------------------------{{{
        au FocusLost * :silent! wall     "Save when losing focus
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
        " Command line
        " silent! set wildchar=9 nowildmenu wildmode=list:longest wildoptions= wildignorecase cedit=<C-k>
"-20Wild-}}}
"-AAA21-Navi-Supertab---------------------------------------------------------------------------------------{{{
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-H> <C-W>h<C-W>|
        map <C-L> <C-W>l<C-W>|
        map <C-=> <C-W>=
        "------------------------------------------------------------------------------------------
        nnoremap <S-j> :bn<cr>
        nnoremap <S-k> :bp<cr>
        nnoremap <m-j> :bn<cr>
        nnoremap <m-k> :bp<cr>
        "-SCROLL-----------------------------------------------------------------------------------
        noremap <expr> <C-up> (line('w0') <= 1         ? 'k' : "\<C-y>")
        noremap <expr> <C-down> (line('w$') >= line('$') ? 'j' : "\<C-e>")

        "-Reselect last-pasted text----------------------------------------------------------------
        nnoremap gv `[v`]

        "-zt is okay for putting something at the top of the screen, but when I'm
        nnoremap zh mzzt10<c-u>`z

        "-HTML-Tag-Closing-------------------------------------------------------------------------
        inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a
        nnoremap <F12> :TagbarToggle<CR>
        noremap! <buffer> <F2> <Esc>:help <C-r><C-w><CR>
        "-----------------------
        map <C-F12> :Scratch<CR>
        map <S-F12> :ScratchPreview<CR>
        " Fix window position of help
        autocmd vimrc FileType help if &l:buftype ==# 'help' | wincmd K | endif
        "------------------------------------------------------------------------------------------
        let g:SuperTabDefaultCompletionType = "<c-n>"
        let g:SuperTabLongestHighlight = 1
        let g:SuperTabCrMapping = 1
        "------------------------------------------------------------------------------------------
        "-show-highlight-group under cursor
        map             <S-F11>         :ShowHighlightGroup<CR>
        "-show-syntax-stack under cursor
        map             <C-F11>         :ShowSyntaxStack<CR>

"-21-}}}

"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-
"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-
execute 'nnoremap \. :edit' resolve(expand('~/.config/nvim/init.vim')) '<CR>'
execute 'nnoremap \, :edit' resolve(expand('~/.bashrc')) '<CR>'
"!" map <LocalLeader>s :source $MYVIMRC<CR>
"!" map <LocalLeader>v :e $MYVIMRC<CR>
"--------------------------------------------------------------------------------------------------------------
" autocmd filetype cpp nnoremap <F7> :!g++ % -ggdb -o %:r <CR>
" autocmd filetype cpp nnoremap <F7> :!g++ % -ggdb -o %:r && ./%:r <CR>
" autocmd filetype cpp nnoremap <F7> :!g++ % -ggdb -o %:r && gdb -tui %:r <CR>
"--------------------------------------------------------------------------------------------------------------
"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-
