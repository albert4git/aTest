"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-NeoVimMix65FZF-NV-Unite"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"
" File: ninitOkt18.vim
" Author: yourname
" Last Modified: 10 Feb 2019
"-This-can-be-fixed-by-running-
":filetype detect
"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-
"======================================================================================================================
" file:///home/red/Desktop/SUCHE/AAA%20big%20collection%20of%20Unix_Linux%20%E2%80%98find%E2%80%99%20command%20examples%20|%20alvinalexander.com.shtml
"======================================================================================================================
        "set path+=.,~/git/aTest/pyLabGitPdbPythonMode27/, ~/git/aTest/dotFiles/nVim/
        set path+=.,/home/red/git/aTest/pyLabGitPdbPythonMode27
        "set runtimepath+=~/.vim/plugged/vimproc/
        "???  let &runtimepath.=',/home/red/git/aTest/dotFiles/nVim/myPy4Vim/'
        "nope let runtimepath+=/home/red/git/aTest/dotFiles/nVim/myPy4Vim/
        "let $PATH=substitute("~/bin:~/local/bin:~/.rbenv/shims:~/.svm/current/rt/bin:", "\\~", $HOME, "g").$PATH
        "-----------------------------------------------------------------------------------
        set runtimepath+=~/vim-amake
        "-----------------------------------------------------------------------------------
        let $MYVIMRC='~/.config/nvim/init.vim'
        set thesaurus=~/git/aTest/dotFiles/DICT/mthesaur.txt
        let s:thesaurus_pat = "~/git/aTest/dotFiles/DICT/mthesaur.txt"
        set dictionary+=/home/red/git/aTest/dotFiles/DICT/english-words.txt
        "set dictionary="/usr/dict/words"     
        set shell=/bin/bash
        set nocompatible
        filetype on
        set helplang=en,de
        filetype plugin on
        filetype indent on
        let maplocalleader=','
        let mapleader=' '
        set encoding=utf-8
        set shell=/bin/zsh
        "BUDISM harosho
        "------------------------------------------------------------------------------------------
        augroup vimrc
                autocmd!
        augroup END
        "------------------------------------------------------------------------------------------
        "Ex: :Ex Pull word under cursor into :Ex LHS of a subs ztitute (replace)
        ">> 1y$  //yank current row to register 1
        ">> CTRL-R 1  
        "<C-r>a to paste from register a
        nnoremap <LocalLeader>w :<C-r>=expand("<cword>")<CR>
        nnoremap <LocaLeader>z :<C-r>=getline(".")<CR>
        "------------------------------------------------------------------------------------------
        function! ScriptExecute()
                :!chmod u+x %
                :w
        endfunction
        "------------------------------------------------------------------------------------------
        augroup ScriptExecutePermission
                autocmd!
                autocmd BufWritePost *.sh :call ScriptExecute()
        augroup END
        "------------------------------------------------------------------------------------------
        augroup SourceVimrc
                autocmd!
                autocmd bufwritepost .vimrc source $MYVIMRC
        augroup END
        "------------------------------------------------------------------------------------------
        set background=dark
        syntax on
        syntax enable
        "###Pymode???
        let g:pymode_python = 'python3'


        set diffopt+=vertical 
        "???2019
        set iskeyword+=.
        "------------------------------------------------------------------------------
        setlocal spell
        set nospell
        set spelllang=en_us
        set spellsuggest=best    " default and fast list.
        " set spelllang=de,tech_speak spell
        " set spellfile=~/.vim/spell/techspeak.utf-8.add
        " set spellfile=~/.vim/spell/en.utf-8.add           " 'zg': add, 'zw': remove.
        "------------------------------------------------------------------------------
        function! FixVimSpellcheck()
                if &spell
                        normal! 1z=
                else
                        set spell
                        normal! 1z=
                        set nospell
                endif
        endfunction
        nnoremap z= :call FixVimSpellcheck()<cr>
        "???, disable the zg (add to dictionary) shortcut
        nnoremap zg z=
        "------------------------------------------------------------------------------------------
        " error: zg, zG, zw, zW, zug, zuG, zuw,
        " zuW, z=, u
        " For z=, all identical misspellings in the buffer are
        " replaced with the chosen suggestion (via :spellrepall).
        "------------------------------------------------------------------------------------------
        " I use two languages: Lithuanian and English. But I also want to add
        " a special pseudo-language to contain identifiers extracted from tags
        " file (this will eliminate false hits like printf).
        " set spelllang=lt,en,fromtags
        " https://rtfb.lt/projects/vim-dox-spell/index.html
        "------------------------------------------------------------------------------------------
        "char = can be removed from the list of valid filename char. JAVA_HOME=/opt/java/jdk1.4
        set isfname-==
        "------------------------------------------------------------------------------------------
        "- go to last edit position when opening files -
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"-AAA14-Doc8------------------------------------------------------------------------------------------------{{{
        let wordUnderCursor = expand("<cword>")
        let currentLine   = getline(".")
"-14--}}}

"-AAA1-Tags-BackUp------------------------------------------------------------------------------------------{{{
        set tags=./tags;/,~/.vimtags
        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
                let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
        "------------------------------------------------------------------------------------------
        set noswapfile
        set backup                               " enable backups
        set undodir=~/.config/nvim/undoDir/      " undo files
        set backupdir=~/.config/nvim/backUpDir/  " backups
        set directory=~/.config/nvim/swapDir/    " swap files
        "------------------------------------------------------------------------------------------
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
        set nu
        set cf         " Enable error files & error jumping.
        set autowrite  " Writes on make/shell commands
        set guifont=Monospace\ 12
        set cinwords=if,else,while,do,for,switch,case
        set matchpairs=(:),{:},[:],<:>
"-1Tags-}}}
"-AAA2--PreSetUp-Appearance--Edit--Clipboard--Bell--ExpandTab-Hist--SmartEnter------------------------------{{{
        let g:bling_time = 42
        let g:bling_color_fg = 'green'
        let g:bling_color_cterm = 'reverse'
        "-magic--------    
        silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
            " \v: 'very magic', make every character except a-zA-Z0-9 and '_' have special meaning
            " use \v and \V to switch 'very magic' on or off.
            " \m, \M: 'magic' mode.
            " use \m and \M to switch 'magic' on or off.
        "-Appearance--- 
        silent! display=lastline,uhex nowrap wrapmargin=0 guioptions=ce key=
        silent! set noshowmatch  noshowmode cmdheight=1 cmdwinheight=10 
        silent! set noshowcmd noruler rulerformat= laststatus=2 statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c
        silent! set title titlelen=100 titleold= titlestring=%f noicon norightleft showtabline=1
        silent! set cursorline nocursorcolumn colorcolumn= concealcursor=nvc conceallevel=0 norelativenumber
        silent! set list listchars=tab:>\ ,nbsp:_ synmaxcol=500 ambiwidth=double breakindent breakindentopt=
        silent! set nosplitbelow nosplitleft startofline linespace=0 whichwrap=b,s scrolloff=1 sidescroll=0
        silent! set equalalways nowinfixwidth nowinfixheight winminwidth=3 winminheight=3 nowarn noconfirm
        silent! set fillchars=vert:\|,fold:\  eventignore= helplang=en viewoptions=options,cursor virtualedit=
        set splitbelow splitright
        set noruler
        set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                        "    means that the current buffer can be put
                                        "    to background without being written; and
                                        "    that marks and undo history are preserved
        "-Editing----------------------------------------------------------------------------------
        silent! set iminsert=0 imsearch=0 nopaste pastetoggle= nogdefault comments& commentstring=#\ %s
        silent! set smartindent autoindent shiftround shiftwidth=8 expandtab tabstop=4 smarttab softtabstop=8
        silent! set foldclose=all foldcolumn=0 nofoldenable foldlevel=0 foldmarker& foldmethod=indent
        silent! set textwidth=0 backspace=indent,eol,start nrformats=hex formatoptions=cmMj nojoinspaces
        silent! set nohidden autoread noautowrite noautowriteall nolinebreak mouse= modeline& modelines&
        silent! set noautochdir write nowriteany writedelay=0 verbose=0 verbosefile= notildeop noinsertmode
        set modelines=0
        "-AAA2.1-Extra vi-compatibility---------------------------------------------------------{{{
                set switchbuf=useopen    " reveal already opened files from the
                set formatoptions-=o     " don't start new lines w/ com leader on press 'o'
                " do not auto insert comment chars on newline
                autocmd! FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
                " Global
                set hidden               " Hide buffer instead of abandoning when unloading
                set ruler                " ???
        "-2.1-}}}
        "------------------------------------------------------------------------------------------
        set synmaxcol=801
        highlight Folded ctermbg=1
        setlocal foldmarker={{{,}}}
        setlocal foldmethod=marker
        setlocal foldminlines=6
        set foldcolumn=1 
        "------------------------------------------------------------------------------------------
        "set whichwrap=b,s,h,l,<,>,[,]
        silent! set clipboard=unnamed
        silent! set clipboard+=unnamedplus
        "-Performance
        silent! set updatetime=300 timeout timeoutlen=300 ttimeout ttimeoutlen=50 ttyfast lazyredraw
        silent! set noerrorbells visualbell t_vb=

        "-Always open read-only when a swap file is found
        autocmd! vimrc SwapExists * let v:swapchoice = 'o'
        "-Setting lazyredraw causes a problem on startup
        autocmd! vimrc VimEnter * redraw
        "-Enter-I-never-use the default behavior of <cr> and this saves me a keystroke...
        nnoremap <cr> o<esc>
        "-Smart Enter -???-
        inoremap <silent><expr> <CR> (pumvisible() && bufname('%') !=# '[Command Line]' ? "\<C-e>\<CR>" : "\<C-g>u\<CR>")
        "-Go to the first non-blank character of the line after paragraph motions
        noremap } }^
        "-Command line history
        set history=4024
        "-Visual shifting (does not exit Visual mode)
        nnoremap > v>
        nnoremap < v<
        vnoremap < <gv
        vnoremap > >gv
        "-Allow using the repeat operator with a visual selection (!)
        vnoremap . :normal .<CR>
        "-For when you forget to sudo.. Really Write the file.
        cmap w!! w !sudo tee % >/dev/null
        "-Move to the directory each buffer
        autocmd! vimrc BufEnter * silent! lcd %:p:h
        "-SWITCH TO THE DIRECTORY OF THE OPEN BUFFER
        map cd :cd %:p:h<cr>
        "------------------------------------------------------------------------------------------
        set nosm
        set wmh=0
        "------------------------------------------------------------------------------------------
        set nowrap
        set mouse=a
        set report=0 " always report changed lines
        "------------------------------------------------------------------------------------------
"-2SetUp-}}}



"-AAA3-UnPlug-nPlugStart------------------------------------------------------------------------------------{{{
call plug#begin()
        Plug 'c9s/helper.vim'
        Plug 'c9s/treemenu.vim'
        Plug 'tpope/vim-dispatch'
        Plug 'nixprime/cpsm'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
        Plug 'tomtom/tlib_vim'       
        "--------------------------------------------------------------------------------- 
        "Plug 'Shougo/vimshell.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'vim-jp/vital.vim'
        Plug 'lambdalisue/vital-Whisky/'
        Plug 'prabirshrestha/async.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'lambdalisue/gina.vim'
        Plug 'lambdalisue/vim-gita'
        Plug 'lambdalisue/suda.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'tpope/vim-tbone'
        Plug 'tmux-plugins/vim-tmux'

        Plug 'google/vim-maktaba'
        "-Strongly recommended: easy configuration of maktaba plugins.
        Plug 'google/vim-glaive'
                let g:myplugin_enablefeature = 1
                let g:myplugin_defaultdir = $HOME
                let g:myplugin_weirdmode = 'm'

                ""???### Add helloworld to the runtime path. (Normally this would be done with another
                "" Plugin command, but helloworld doesn't have a repository of its own.)
                "call maktaba#plugin#Install(maktaba#path#Join([maktaba#Maktaba().location,
                "                        \ 'examples', 'helloworld']))
                ""-------------------------------------------
                "call glaive#Install()
                ""-------------------------------------------
                "" Configure helloworld using glaive.
                "Glaive helloworld plugin[mappings] name='Bram'
                "" Real world example: configure vim-codefmt
                "Glaive codefmt google_java_executable='java -jar /path/to/google-java-format.jar'
        "------------------------------------------------------------------------- 
        Plug 'google/vim-codefmt'
                augroup autoformat_settings
                        autocmd FileType bzl AutoFormatBuffer buildifier
                        autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
                        autocmd FileType dart AutoFormatBuffer dartfmt
                        autocmd FileType go AutoFormatBuffer gofmt
                        autocmd FileType gn AutoFormatBuffer gn
                        autocmd FileType html,css,json AutoFormatBuffer js-beautify
                        autocmd FileType java AutoFormatBuffer google-java-format
                        autocmd FileType python AutoFormatBuffer yapf
                        " Alternative: autocmd FileType python AutoFormatBuffer autopep8
                augroup END
        "------------------------------------------------------------------------- 
        Plug 'google/vim-syncopate'
        "------------------------------------------------------------------------- 
        Plug 'tyru/capture.vim'
                ":Capture mes
                ":Capture map | map! | lmap
                ":Capture scriptnames
                ":Capture digraphs
        "-------------------------------------------------------------------------
        Plug 'exvim/ex-matchit'
        Plug 'AndrewRadev/undoquit.vim'
                let g:undoquit_mapping = ';q' 
                "c-w u 
        "-------------------------------------------------------------------------
        Plug 'AndrewRadev/switch.vim'
                let g:switch_mapping = "-"
                let g:switch_custom_definitions =
                                \ [
                                        \ ['true', 'false'], ['True', 'False'], ['TRUE', 'FALSE'],
                                        \ ['yes', 'no'], ['Yes', 'No'], ['YES', 'NO'],
                                        \ ['on', 'off'], ['On', 'Off'], ['ON', 'OFF'],
                                        \ ['up', 'down'], ['Up', 'Down'] ,['UP', 'DOWN'],
                                        \ ['set', 'unset'],
                                        \ ['is', 'isnot'] ,
                                        \ ['==', '!='] , ['<', '>'], ['<=', '>='], ['=~', '!~'],
                                        \ ['enable', 'disable'], ['Enable', 'Disable'],
                                        \ ['enabled', 'disabled'], ['Enabled', 'Disabled'],
                                        \ ['maximum', 'minimum'], ['Maximum', 'Minimum'],
                                        \ ['maximal', 'minimal'], ['Maximal', 'Minimal'],
                                        \ ['upper', 'lower'], ['Upper', 'Lower'],
                                        \ ['top', 'bottom'], ['Top', 'Bottom'],
                                        \ ['above', 'below'], ['Above', 'Below'],
                                        \ ['forward', 'backward'], ['Forward', 'Backward'],
                                        \ ['right', 'middle', 'left'], ['Right', 'Middle', 'Left'],
                                        \ ['next', 'previous'], ['Next', 'Previous'],
                                        \ ['first', 'last'], ['First', 'Last'],
                                        \ ['before', 'after'], ['Before', 'After'],
                                        \ ['more', 'less'], ['More', 'Less'],
                                        \ ['fast', 'slow'], ['Fast', 'Slow'],
                                        \ ['green', 'yellow', 'red'],
                                        \ ['one', 'two', 'three']
                                \ ]
                "--------------------------------------------------------------------------
                        let b:switch_custom_definitions = [
                                                \   {
                                                \     '\<[a-z0-9]\+_\k\+\>': {
                                                \       '_\(.\)': '\U\1'
                                                \     },
                                                \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
                                                \       '\([A-Z]\)': '_\l\1'
                                                \     },
                                                \   }
                                                \ ]
        "--------------------------------------------------------------------------------- 
        Plug 'brookhong/cscope.vim'
                nnoremap ff :call CscopeFindInteractive(expand('<cword>'))<CR>
        Plug 'unblevable/quick-scope'
                "let g:qs_enable=0
                augroup qs_colors
                        autocmd!
                        autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=10 cterm=underline
                        autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=50 cterm=underline
                augroup END
        "--------------------------------------
        Plug 'flazz/vim-colorschemes'
        Plug 'rafi/awesome-vim-colorschemes'
        "--------------------------------------
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        "--------------------------------------
        Plug 'MattesGroeger/vim-bookmarks'
                "-AAA-------------------------------------------------------------------{{{
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
                "------------------------------------------------------
                autocmd! BufEnter * :call BookmarkMapKeys()
                highlight BookmarkSign ctermbg=9 ctermfg=1
                highlight BookmarkLine ctermbg=9 ctermfg=1
                highlight BookmarkAnnotationLine ctermbg=9 ctermfg=1
                highlight BookmarkAnnotationSign ctermbg=9 ctermfg=1
                "------------------------------------------------------
                let g:bookmark_auto_close = 1
                let g:bookmark_highlight_lines = 1          
                let g:bookmark_show_warning = 0           
                let g:bookmark_show_toggle_warning = 0      
                let g:bookmark_sign = '♥'
                let g:bookmark_highlight_lines = 1
                let g:bookmark_save_per_working_dir = 1
                let g:bookmark_auto_save = 1
                let g:bookmark_save_per_working_dir = 1  
                "------------------------------------------------------
                "let g:bookmark_manage_per_buffer = 1`        
                "let g:bookmark_auto_save_file = '/bookmarks'`
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
                "-AAE-}}}
        Plug 'xolox/vim-misc'
        Plug 'tpope/vim-commentary'
        "-Intelligent-repeat-with '.'
        Plug 'tpope/vim-repeat'
        Plug 'thinca/vim-quickrun'
        Plug 'ivyl/vim-bling'
        "------------------------------------------------------------------------------------------
        "Plug 'xolox/vim-easytags'
        "        let g:easytags_file = '~/.vim/tags'
        "        let g:easytags_auto_highlight = 1
        "        let g:easytags_syntax_keyword = 'always'
        "        let g:easytags_events = ['BufWritePost']
        "        "------------------------------------------------------
        "        let g:easytags_languages = {
        "        \   'haskell': {
        "        \       'cmd': '~/.cabal/bin/lushtags',
        "        \       'args': [],
        "        \       'fileoutput_opt': '-f',
        "        \       'stdout_opt': '-f-',
        "        \       'recurse_flag': '-R'
        "        \   }
        "        \}
        "        "------------------------------------------------------
        "        "let g:easytags_events = ['BufReadPost', 'BufWritePost']
        "        let g:easytags_async = 1
        "        let g:easytags_resolve_links = 1
        "        " let g:easytags_dynamic_files = 2
        "        " let g:easytags_suppress_ctags_warning = 1
        "        " Prevent automatic ctag updates
        "        let g:easytags_auto_update = 0
        "        let g:easytags_auto_highlight = 0
        "        let g:easytags_on_cursorhold = 0
        "        " Scan recursively, not just current file
        "        let g:easytags_autorecurse = 1
        "        " Follow symbolic links
        "        let g:easytags_resolve_links = 1
        "        " Close tagbar after jumping to a tag
        "        let g:tagbar_autoclose = 1
        "        My current easytags config:
        "        set cpoptions+=d
        "        set tags=./.tags;,~/.vim/.vimtags
        "        let g:easytags_file = '~/.vim/.vimtags'
        "        let g:easytags_async = 1⋅
        "        let g:easytags_dynamic_files = 2 " create and use local tag files instead of global one
        "        let g:easytags_events = ['BufReadPost', 'BufWritePost'] " Update tags on read and save only
        "        let g:easyt
        "------------------------------------------------------------------------------------------
        Plug 'vim-scripts/tagselect'
        Plug 'ludovicchabant/vim-gutentags'
        "------------------------------------------------------------------------------------------
        Plug 'majutsushi/tagbar'
                highlight TagbarHighlight   ctermfg=051 ctermbg=9 cterm=bold
                highlight TagListTagName    ctermfg=250
                highlight TagbarFoldIcon    ctermfg=051 ctermbg=9 
                highlight TagbarHelp        ctermfg=051 ctermbg=9

                " highlight default link TagbarHelp       Comment
                " highlight default link TagbarHelpKey    Identifier
                " highlight default link TagbarHelpTitle  PreProc
                " highlight default link TagbarKind       Identifier
                " highlight default link TagbarNestedKind TagbarKind
                " highlight default link TagbarScope      Title
                " highlight default link TagbarType       Type
                " highlight default link TagbarSignature  SpecialKey
                " highlight default link TagbarPseudoID   NonText
                " highlight default link TagbarFoldIcon   Statement
                " highlight default link TagbarHighlight  Search
        "--------------------------------------------------------------------------------- 
        "Plug 'xolox/vim-session'
        "        " Persist the options of the session plug-in using the session plug-in...
        "        let g:session_persist_globals = ['&sessionoptions']
        "        call add(g:session_persist_globals, 'g:session_autoload')
        "        call add(g:session_persist_globals, 'g:session_autosave')
        "        call add(g:session_persist_globals, 'g:session_default_to_last')
        "        call add(g:session_persist_globals, 'g:session_persist_globals')
        "        "let g:loaded_session = 1
        "        let g:session_autosave = 'yes'
        "------------------------------------------------------------------------------------------
        Plug 'vim-scripts/genutils'
        Plug 'Yggdroot/indentLine'
                let g:indentLine_enabled = 1
                let g:indentLine_noConcealCursor='nc'
                let g:indentLine_color_term = 9
                "let g:indentLine_setConceal = 0
                "let g:indentLine_bgcolor_term = 202
        "-------------------------------------------------------------------------
        " Plug 'Shougo/vimfiler.vim'
        "         map fv :VimFiler<CR>
        "         map fd :VimFilerCurrentDir<CR>
        "------------------------------------------------------------------------------------------
        Plug 'scrooloose/syntastic'
                " Linting
                " let g:ale_sign_column_always = 1
                " let g:ale_sign_error = '>>'
                " let g:ale_sign_warning = '--'
                " let g:ale_linters = {
                " \   'javascript': ['eslint'],
                " \   'jsx': ['eslint'],
                " \   'python': ['flake8'],
                " \}
        "Plug 'w0rp/ale'
        "------------------------------------------------------------------------------------------
        Plug 'nvie/vim-flake8'
        "------------------------------------------------------------------------------------------
        Plug 'easymotion/vim-easymotion'
                let g:EasyMotion_smartcase = 1
                let g:EasyMotion_do_mapping = 0 "-Disable default mappings
                nmap <LocalLeader><LocalLeader> <Plug>(easymotion-overwin-w)
        "------------------------------------------------------------------------------------------
        Plug 'haya14busa/vim-easyoperator-line'
                xmap <LocalLeader>l <Plug>(easyoperator-line-select)
        "--------------------------------------------------------------------------------- 
        Plug 'mattboehm/vim-accordion'
                let g:accordion_mode="v"
        Plug 'vim-scripts/SpellCheck'
        "--------------------------------------------------------------------------------- 
        Plug 'echuraev/translate-shell.vim'
                let g:trans_directions_list = [
                                        \['en', 'de'],
                                        \['de', 'en'],
                                        \['en', 'ru'],
                                        \['ru', 'en'],
                                        \['en', 'ru', 'de'],
                                        \['', 'ru'],
                                        \['en', 'ja'],
                                        \['en', 'zh-CN'],
                                        \['en', 'zh-TW'],
                                        \['en', 'la'],
                                        \['en', 'es'],
                                        \['', ''],
                                        \]
                let g:trans_save_history = 1
        "--------------------------------------------------------------------------------- 
        "Plug 'vim-scripts/tinykeymap'
        "--------------------------------------------------------------------------------- 
        Plug 'skywind3000/vim-preview'
                "VSSplit
        "--------------------------------------------------------------------------------- 
        Plug 'kshenoy/vim-signature'
                " :SignatureListMarkers         : List all markers
                " :SignatureListMarkers 1       : List only the '!' marker
                " :SignatureListMarkers @       : List only the '@' marker
                " :SignatureListMarkers 0, 2    : List only ) marker with 2 lines of context
                " :SignatureListMarkers '', 2   : List all markers with 2 lines of context
                " :SignatureListMarkers '!@', 2 : List only the '!' and '@' markers and show
        "--------------------------------------------------------------------------------- 
        Plug 'krisajenkins/vim-pipe'
                autocmd BufNewFile,BufReadPost *.json setlocal filetype=javascript.json
                let b:vimpipe_command="lynx -dump -stdin"
                let b:vimpipe_command='jslint <(cat)'
                let b:vimpipe_command="python -m json.tool"
                let b:vimpipe_command="multimarkdown"
                " let b:vimpipe_filetype="html"
                " g:vimpipe_invoke_map    <LocalLeader>r
                " g:vimpipe_close_map     <LocalLeader>p

        "--------------------------------------------------------------------------------- 
        " Plug 'vim-scripts/dbext.vim'
        " Plug 'NLKNguyen/pipe.vim' "required
        " Plug 'NLKNguyen/pipe-mysql.vim'
        " let g:pipemysql_login_info = [
        "                         \ {
        "                         \    'description' : 'my server 1',
        "                         \    'ssh_address' : 'root@server1',
        "                         \    'ssh_port' : '',
        "                         \    'mysql_hostname' : 'somehostname',
        "                         \    'mysql_username' : 'my_username',
        "                         \    'mysql_password' : 'my_password',
        "                         \    'mysql_database' : 'cs332h20'
        "                         \ },
        "                         \ {
        "                         \    'description' : 'my local',
        "                         \    'mysql_hostname' : 'localhost',
        "                         \    'mysql_username' : 'root',
        "                         \    'mysql_password' : 'mypass',
        "                         \ }
        "                         \ ]
        "--------------------------------------------------------------------------------- 
        "Plug 'kezhenxu94/vim-mysql-plugin'
        "Plug 'integralist/vim-mypy'
        "Plug 'leafOfTree/vim-imagine'
        "--------------------------------------------------------------------------------- 
        Plug 'junegunn/gv.vim'
                " o or <cr> on a commit to display the content of it
                " o or <cr> on commits to display the diff in the range
                " O opens a new tab instead
                " gb for :Gbrowse
                " ]] and [[ to move between commits
                " . to start command-line with :Git [CURSOR] SHA à la fugitive
                " q to close
        "--------------------------------------------------------------------------------- 
        Plug 'alfredodeza/coveragepy.vim'
                ":Coveragepy report
                let g:coveragepy_uncovered_sign = '-'
        "--------------------------------------------------------------------------------- 
        Plug 'osyo-manga/vim-brightest'
                let g:brightest#highlight = { "group" : "Define" }
        "--------------------------------------------------------------------------------- 
        Plug 'airblade/vim-gitgutter'
                nmap ]c <Plug>GitGutterNextHunk
                nmap [c <Plug>GitGutterPrevHunk
        "------------------------------------------------------
                nmap hp <Plug>GitGutterPreviewHunk
                nmap hs <Plug>GitGutterStageHunk
                nmap hu <Plug>GitGutterUndoHunk
        "------------------------------------------------------
        Plug 'tpope/vim-fugitive'
        "----------------------------------------------------------------------------------
                " vnoremap <leader>H :Gbrowse<cr>
                " nnoremap <leader>H V:Gbrowse<cr>
                " vnoremap <leader>u :Gbrowse @upstream<cr>
                " nnoremap <leader>u V:Gbrowse @upstream<cr>
                " Usage:
                "   - :Git[!] [args]
                "   - :Gstatus
                "   - :Gcommit [args]
                "   - :Gedit/:Gsplit/:Gvsplit/:Gtabedit/:Gpedit [revision]
                "   - :Gwrite/:Gwq {path}
                "   - :Gmove {destination}
                "   - :Gremove
                "   - :{range}Gread [revision]/[args]
                "   - :Gdiff/:Gsdiff/:Gvdiff [revision]
                "   - :Ggrep/:Glgrep [args] -- :grep/:lgrep with git-grep as 'grepprg'
                "   - :Glog [args] -- load all previous revisions of current file into quickfix
                "   - :[range]Gblame {flags}
                "   - :[range]Gbrowse {revision}
                " auto open quickfix window for :Ggrep.
                " nnoremap <leader>gs :Gstatus<CR>
                " nnoremap <leader>gc :Gcommit -v -q<CR>
                " nnoremap <leader>ga :Gcommit --amend<CR>
                " nnoremap <leader>gt :Gcommit -v -q %<CR>
                " nnoremap <leader>gd :Gdiff<CR>
                " nnoremap <leader>ge :Gedit<CR>
                " nnoremap <leader>gr :Gread<CR>
                " nnoremap <leader>gw :Gwrite<CR><CR>
                " nnoremap <leader>gl :silent! Glog<CR>
                " nnoremap <leader>gp :Ggrep<Space>
                " nnoremap <leader>gm :Gmove<Space>
                " nnoremap <leader>gb :Git branch<Space>
                " nnoremap <leader>go :Git checkout<Space>
                " nnoremap <leader>gps :Dispatch! git push<CR>
                " nnoremap <leader>gpl :Dispatch! git pull<CR>
                " With that configuration, my workflow is:
                " <leader>gl to view history
                " ]q and [q to move between versions (unimpaired.vim)
                " <leader>gd to open diff
                " :q to end diff
        "---------------------------------------------------------------------------------- 
        Plug 'int3/vim-extradite'
                ":Extradite | :Extradite! -- vertical.
                let g:extradite_width = 60
                let g:extradite_showhash = 1 "show abbre commit hashes.
        "---------------------------------------------------------------------------------- 
        Plug 'brooth/far.vim'
        Plug 'aghareza/vim-gitgrep'
        Plug 'motemen/git-vim'
        Plug 'c9s/hypergit.vim'
                " <leader>G    toggle hypergit menu
                " <leader>ci   commit current file changes
                " <leader>ca   commit all changes
                " <leader>ga   add file to git repository
                " <leader>gb   branch manager buffer
                " <leader>gs   status manager buffer
                " <leader>gh   stash manager buffer
                " :GitCommit
                " :GitCommitAll
                " :GitCommitAmend
                " :GitStatus
                " :GitStash
                " :GitPush
                " :GitPull
        "--------------------------------------------------------------------------------- 
        Plug 'machakann/vim-highlightedyank'
                let g:highlightedyank_highlight_duration = -1
        "----------------------------------------------------------------------------------
        Plug 'kana/vim-textobj-user'
        Plug 'gilligan/textobj-gitgutter'
                vmap ih <Plug>(textobj-gitgutter-i)
        "----------------------------------------------------------------------------------
        Plug 'kana/vim-textobj-user'
        Plug 'kana/vim-textobj-diff'
        Plug 'reedes/vim-textobj-sentence'
        Plug 'kana/vim-textobj-function'
        Plug 'Julian/vim-textobj-brace'
        Plug 'glts/vim-textobj-indblock'
        Plug 'beloglazov/vim-textobj-quotes'
        "---gi-----------------------------------------------------------------------------
        Plug 'bps/vim-textobj-python'
        "---gi-----------------------------------------------------------------------------
        Plug 'terryma/vim-expand-region'
                 "-Default-settings. 
                 let g:expand_region_text_objects = {
                                         \ 'iw'  :0,
                                         \ 'iW'  :0,
                                         \ 'i"'  :0,
                                         \ 'i''' :1,
                                         \ 'ib'  :1,
                                         \ 'i)'  :1,
                                         \ 'iB'  :1, 
                                         \ 'i}'  :1, 
                                         \ 'i]'  :1,
                                         \ 'if'  :1,
                                         \ 'io'  :1,
                                         \ 'ip'  :1,
                                         \ 'ih'  :1
                                         \ }
        "----------------------------------------------------------------------------------
        "----------------------------------------------------------------------------------
        nmap <m-1> <esc>viq<left> 
                nmap <m-q> <esc>vaq<left> 
                        nmap <m-0> <esc>vab<left> 
                                nmap <m-3> <esc>viB 
                                        nmap <m-i> <esc>vio 
                                        nmap <m-9> <esc>vif 
                        nmap <m-8> <esc>vaf 
                nmap <m-7> <esc>vip 
        nmap <m-6> <esc>vih 
        "---------------------------------------------------------------------------------- 
        "---------------------------------------------------------------------------------- 
        " ci'q<<b>>({"  - 'change' insede "})</<b>>q'
        "-???- onoremap a i( , da ???-
        " vap / v2ap 
        " diw / daw 
        "---------------------------------------------------------------------------------- 
        inoremap <F1> <ESC>
        nnoremap <F1> <ESC>
        vnoremap <F1> <ESC>
        "---------------------------------------------------------------------------------- 
        nnoremap <buffer> <F2> <Esc>:help <C-r><C-w><CR>
        nnoremap <buffer> <C-F2> <Esc>:helpgrep <C-r><C-w><CR>
        "----------------------------------------------------------------------------------
        " Maybe these mappings should be moved into FT_C() ?
        " Toggle between .c (.cc, .cpp) and .h                          
        " ToggleHeader defined inHOME/.vim/plugin/cpph.vim
        map       ,h          :call ToggleHeader()<CR>
        map       <C-F6>      ,h
        imap      <C-F6>      <C-O><C-F6>
        "----------------------------------------------------------------------------------
        nnoremap <C-F7> :Scratch<CR>
        nnoremap <F7> :ScratchPreview<CR>
        "----------------------------------------------------------------------------------
        " There's no way to close the quickfix window without jumping to it and :q or
        " whatever. That's bad. Let me close it from anywhere
        "----------------------------------------------------------------------------------
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

        nnoremap <F8> :LocationToggle<cr>
                nnoremap <LocalLeader>n :lnext<cr>zvzz
                nnoremap <LocalLeader>b :lprev<cr>zvzz
        "----------------------------------------------------------------------------------
        function! ToggleQuickFix()
                if exists("g:qwindow")
                        cclose
                        execute "wincmd p"
                        unlet g:qwindow
                else
                        try
                                copen
                                execute "wincmd J"
                                let g:qwindow = 1
                        catch
                                echo "Error!"
                        endtry
                endif
        endfunction

        "-Open-Quickfix-window-automatically-----------------------------------------------
        autocmd QuickFixCmdPost grep cwindow
        autocmd! vimrc QuickfixCmdPost [^l]* nested copen | wincmd p
        autocmd! vimrc QuickfixCmdPost l* nested lopen | wincmd p
        "----------------------------------------------------------------------------------
        nnoremap <F9> :call ToggleQuickFix()<CR>
                nnoremap <Leader>b :cprev<cr>zvzz
                nnoremap <Leader>n :cnext<cr>zvzz
        "----------------------------------------------------------------------------------
                nnoremap <F12> :TagbarToggle<CR>
        "----------------------------------------------------------------------------------
        Plug 'adriaanzon/vim-textobj-matchit'
        "`am` and `im` :if-ifend , for-endfore ..
        "----------------------------------------------------------------------------------
        "#??? Plug 'tpope/vim-surround'
        Plug 'machakann/vim-sandwich'
                " sd,sr, sa{motion/textobject}{addition}(normal and visual mode)
                " let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
                " Sandwiched text could be resolved into two parts, {surrounding} and {surrounded text}.
                " sa add surroundings: mapped to the key sequence sa
                " sd Delete surroundings: mapped to the key sequence sd
                " sr Replace surroundings: mapped to the key sequence sr
                " ib Search and select a sandwiched text automatically: mapped to the key sequence ib and ab
                " is Search and select a sandwiched text with query: mapped to the key sequence is and as
                " da" will delete a quoted sympy.pprint(string.) 
                "(<b>'Sbandawitch'</b>) 
                nmap s <Nop>
                xmap s <Nop>
        "-------------------------------------------------------------
                let g:textobj_sandwich_no_default_key_mappings = 1
                omap ia <Plug>(textobj-sandwich-auto-i)
                xmap ia <Plug>(textobj-sandwich-auto-i)
                omap aa <Plug>(textobj-sandwich-auto-a)
                xmap aa <Plug>(textobj-sandwich-auto-a)
        "--------------------------------------------------------------
        "[ {(hello) ( noch ) ('Mal') ("tomos") } tormos]

        "---------------SYMPY-SANDWICH-----------------------------------------------------
                vmap sb "zdi sympy.pprint(<c-r>z)<esc>
                vmap sn "zdi print(<c-r>z)<esc> 
                "-wrap <b></b> around selected text
                "vmap sb "zdi<b><c-r>z</b><esc>
                "-wrap <?=   ?> around visually selected text
                "vmap st "zdi<?= <c-r>z ?><esc> 
       "---------NoAutoClose-YCM----------------------------------------------------------- 
        Plug 'romainl/vim-qf'
        Plug 'yssl/QFEnter'
        Plug 'sk1418/QFGrep'
        Plug 'AndrewRadev/qftools.vim'
                let g:qf_mapping_ack_style = 1
                let g:qf_window_bottom = 0
                let g:qf_auto_open_loclist = 0
                let g:qf_max_height = 8
                let g:qf_nowrap = 1
        "----------------------------------------------------------------------------------
        "---NoAutoClose-YCM----------------------------------------------------------------
        Plug 'jiangmiao/auto-pairs'
                "   <M-o> : neline with indentation
                "   <M-a> : jump to of line
                "   <M-n> : jump to next pairs
                "   <M-e> : jump to end of pairs.
                "   Ctrl-V ) : insert ) without trigger the plugin.
                let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
                let g:AutoPairsShortcutToggle = '<M-p>'
                let g:AutoPairsShortcutFastWrap = '<M-e>'
                let g:AutoPairsShortcutJump = '<M-n>'
                let g:AutoPairsShortcutBackInsert = '<M-b>'
                let g:AutoPairsShortcuts = 1
                let g:AutoPairsMapBS = 1
                let g:AutoPairsMapCR = 0 " insert a new indented line if cursor in pairs.
                " error in vimwiki <CR> Enter. but use upper inoremap can solve.
                let g:AutoPairsMapSpace = 0
                " error in abbreviations <space> auto expand.
                let g:AutoPairsCenterLine = 1
                let g:AutoPairsFlyMode = 1
                let g:AutoPairsMapCR=0
                let g:AutoPairsMapCh=1
                let g:AutoPairsDelete = '<M-5>'

        "---------------------------------------------------------------------------------
        Plug 'wellle/visual-split.vim'
                " :VSSplit, :VSSplitAbove or :VSSplitBelow to create the split
                " :VSResize to execute the VSResize ex command on the selected range
                nmap <C-W>r  <Plug>(Visual-Split-Resize)
                nmap <C-W>s <Plug>(Visual-Split-Split)
        "Plug 'gastonsimone/vim-dokumentary/'
                "??? apt-get install dictd dict-gcide dict
        "--------------------------------------------------------------------------------- 
        Plug 'nvie/vim_bridge'
        Plug 'vim-scripts/mako.vim'
                "g:mako_detect_lang_from_ext = 1
        Plug 'sophacles/vim-bundle-mako'
        Plug 'aperezdc/vim-template'
        "--------------------------------------------------------------------------------- 
        "Plug 'amiorin/vim-project'
        "--------------------------------------------------------------------------------- 
        Plug 'tpope/vim-unimpaired'  "Handy bracket mappings.
        Plug 'mtth/scratch.vim'
        "----------------------------------------------------
        Plug 'henrik/vim-qargs'
        Plug 'maxbrunsfeld/vim-yankstack'
                nmap zp <Plug>yankstack_substitute_older_paste
                nmap zn <Plug>yankstack_substitute_newer_paste
        "--------------------------------------
        "----------------------------------------------------------------------------------
                " save the buffers for each file found by GitGrep in the previous search.
                " :GitGrep foo.*bar
                " :Qdo %s/foo.*bar/baz/g | update
        "-----------------------------------------------------------
                "read !date 
                "0read !date 
                "r find -mtime -8 | xargs grep vim
        "----------------------------------------------------------------------------------
        Plug 'mileszs/ack.vim'
        Plug 'jremmen/vim-ripgrep'
        Plug 'Chun-Yang/vim-action-ag'
        Plug 'rking/ag.vim'
        Plug 'jesseleite/vim-agriculture'
        "--------------------------------------
        "Plug 'vim-scripts/ReplaceWithRegister'
        "-------------------------------------------------------------------------
        Plug 'tpope/vim-sleuth'         " indet reight ?
        "-------------------------------------------------------------------------
        "Plug 'neomake/neomake'
        "Plug 'Rykka/trans.vim'
        Plug 'ron89/thesaurus_query.vim'
        "-TODO-
        "Plug 'roxma/nvim-completion-manager'
        "--------------------------------------------------------------------------------- 
        Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
        Plug 'davidhalter/jedi-vim'
        "Plug 'Shougo/neocomplete.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'ervandew/supertab'
        "--------------------------------------------------------------------------------- 
        Plug 'honza/vim-snippets'
        Plug 'SirVer/ultisnips'
        Plug 'garbas/vim-snipmate'
        Plug 'Shougo/neosnippet.vim'
        Plug 'Shougo/neosnippet-snippets'
        "--------------------------------------------------------------------------------- 
        Plug 'haya14busa/incsearch.vim'
        Plug 'vim-scripts/SearchComplete'
        "--------------------------------------------------------------------------------- 
        "------------------------ repl --REPL--------------------------------------------- 
        Plug 'jalvesaq/vimcmdline'
                " vimcmdline mappings
                let cmdline_map_start          = '<LocalLeader>s'
                let cmdline_map_send           = '<Space>'
                let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
                let cmdline_map_source_fun     = '<LocalLeader>f'
                let cmdline_map_send_paragraph = '<LocalLeader>p'
                let cmdline_map_send_block     = '<LocalLeader>b'
                let cmdline_map_quit           = '<LocalLeader>q'
                " vimcmdline options
                let cmdline_vsplit      = 1      " Split the window vertically
                let cmdline_esc_term    = 1      " Remap <Esc> to :stopinsert in Neovim's terminal
                let cmdline_in_buffer   = 1      " Start the interpreter in a Neovim's terminal
                let cmdline_term_height = 15     " Initial height of interpreter window or pane
                let cmdline_term_width  = 80     " Initial width of interpreter window or pane
                let cmdline_tmp_dir     = '/tmp' " Temporary directory to save files
                let cmdline_outhl       = 1      " Syntax highlight the output
                let cmdline_auto_scroll = 1      " Keep the cursor at the end of terminal (nvim)
                let cmdline_app         = {}
                " let cmdline_app['python'] = 'ptipython3'
                " let cmdline_app['ruby']   = 'pry'
                " let cmdline_app['sh']     = 'bash'
                if has('gui_running') || &termguicolors
                    let cmdline_color_input    = '#9e9e9e'
                    let cmdline_color_normal   = '#00afff'
                    let cmdline_color_number   = '#00ffff'
                    let cmdline_color_integer  = '#00ffff'
                    let cmdline_color_float    = '#00ffff'
                elseif &t_Co == 256
                    let cmdline_color_input    = 247
                    let cmdline_color_normal   =  39
                    let cmdline_color_number   =  51
                    let cmdline_color_integer  =  51
                    let cmdline_color_float    =  51
                    let cmdline_color_complex  =  51
                    let cmdline_color_negnum   = 183
                    let cmdline_color_negfloat = 183
                    let cmdline_color_date     =  43
                    let cmdline_color_true     =  78
                    let cmdline_color_false    = 203
                    let cmdline_color_inf      =  39
                    let cmdline_color_constant =  75
                    let cmdline_color_string   =  79
                    let cmdline_color_stderr   =  33
                    let cmdline_color_error    =  15
                    let cmdline_color_warn     =   1
                    let cmdline_color_index    = 186
                endif
        "--------------------------------------------------------------------------------- 
        "Plug 'vim-scripts/Vim-R-plugin'
        "Plug 'jalvesaq/Nvim-R'
        "let R_path = '/path/to/my/preferred/R/version/bin'
        ""<LocalLeader>rf command because the plugin was designed to
        "nmap <LocalLeader>; :RSend
        "nmap <LocalLeader>sr <Plug>RStart
        "imap <LocalLeader>sr <Plug>RStart
        "vmap <LocalLeader>sr <Plug>RStart
        "vmap <Leader>m <Plug>RDSendSelection
        "nmap <Leader>s <Plug>RDSendLine
        ":Rhelp topic
        "--------------------------------------------------------------------------------- 
        "--------------------------------------------------------------------------------- 
        Plug 'tpope/vim-eunuch'
                " :Delete[!]            
                " :Unlink[!]            
                " :Remove[!]            
                " :Move[!] {file}       
                " :Rename[!] {file}     
                " :Chmod {mode}         
                " :Mkdir {dir}          
                " :Mkdir! {dir}         
                " :Mkdir[!]             
                " :Cfind[!] {args}      
                " :Lfind[!] {args}      
                " :Clocate[!] {args}    
                " :Llocate[!] {args}
                "-------------------------------------------------------------------------
                " :Delete: Delete a buffer and the file on disk simultaneously.
                " :Unlink: Like :Delete, but keeps the now empty buffer.
                " :Move: Rename a buffer and the file on disk simultaneously.
                " :Rename: Like :Move, but relative to the current file's containing directory.
                " :Chmod: Change the permissions of the current file.
                " :Mkdir: Create a directory, defaulting to the parent of the current file.
                " :Cfind: Run find and load the results into the quickfix list.
                " :Clocate: Run locate and load the results into the quickfix list.
                " :Lfind/:Llocate: Like above, but use the location list.
                " :Wall: Write every open window. Handy for kicking off tools like guard.
                " :SudoWrite: Write a privileged file with sudo.
                " :SudoEdit: Edit a privileged file with sudo.
        "--------------------------------------------------------------------------------- 
        Plug 'MarcWeber/vim-addon-mw-utils'
        "--------------------------------------------------------------------------------- 
        Plug 'Shougo/neomru.vim'
        "--------------------------------------
        Plug 'kien/ctrlp.vim'
        Plug 'wincent/command-t'

        "--------------------------------------
        Plug 'Shougo/unite.vim' 
        Plug 'tsukkee/unite-tag'
        Plug 'SpaceVim/unite-ctags'
        Plug 'Shougo/unite-outline/'
        Plug 'tsukkee/unite-help'
        Plug 'rstacruz/vim-fastunite'
        Plug 'kmnk/vim-unite-giti'
        "--------------------------------------
        Plug 'cskeeters/unite-fzf'
        Plug 'junegunn/fzf'
        Plug 'pbogut/fzf-mru.vim'
        Plug 'junegunn/fzf.vim'

        "------------------------------------------------------------------
        Plug 'ddrscott/vim-side-search'
        " How should we execute the search?
        " --heading and --stats are required!
        let g:side_search_prg = 'ag --word-regexp'
                                \. " --ignore='*.js.map'"
                                \. " --heading --stats -B 1 -A 4"
        "---------------------------------------------------------
        " Can use `vnew` or `new`
        let g:side_search_splitter = 'vnew'
        " I like 40% splits, change it if you don't
        let g:side_search_split_pct = 0.4
        " SideSearch current word and return to original window
        nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p
        " Create an shorter `SS` command
        command! -complete=file -nargs=+ SS execute 'SideSearch <args>'
        " or command abbreviation
        cabbrev SS SideSearch

        "----SEARCH-search--POISK-poisk-SUCHE--suche------------------------------------------------ 
        Plug 'vim-scripts/Lynx-Offline-Documentation-Browser'
        Plug 'rhysd/open-pdf.vim'
        "------------------------------------------------------------------------------------------
        Plug 'alok/notational-fzf-vim'
        "USA FIRST
        let g:nv_search_paths = ['~/git/aTest/dotFiles/', '~/git/aTest/pyLabGitPdbPythonMode27' ]
        "------------------------------------------------------------------------------------------
                " nmap <Leader>f :GFiles<CR>
                " nmap <Leader>F :Files<CR>
                " nmap <Leader>t :BTags<CR>
                " nmap <Leader>T :Tags<CR>
                " nmap <Leader>m :Methods<CR>
                " nmap <Leader>b :Buffers<CR>
                " nmap <Leader>l :BLines<CR>
                " nmap <Leader>L :Lines<CR>
                " nmap <Leader>h :History<CR>
                " nmap <Leader>H :GHistory<CR>
                " nmap <Leader>: :History:<CR>
                " nmap <Leader>M :Maps<CR>
                " nmap <Leader>C :Commands<CR>
                " nmap <Leader>' :Marks<CR>
                " nmap <Leader>s :Filetypes<CR>
                " nmap <Leader>S :Snippets<CR>
                " nmap <Leader><Leader>h :Helptags!<CR>
        "--------------------------------------------------------------------------------- 
        Plug 'Shougo/context_filetype.vim'
        "--------------------------------------
        Plug 'guns/xterm-color-table.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'godlygeek/tabular'
                " Tabularize {
                nmap <Leader>a& :Tabularize /&<CR>
                vmap <Leader>a& :Tabularize /&<CR>
                nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
                vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
                nmap <Leader>a=> :Tabularize /=><CR>
                vmap <Leader>a=> :Tabularize /=><CR>
                nmap <Leader>a: :Tabularize /:<CR>
                vmap <Leader>a: :Tabularize /:<CR>
                nmap <Leader>a:: :Tabularize /:\zs<CR>
                vmap <Leader>a:: :Tabularize /:\zs<CR>
                nmap <Leader>a, :Tabularize /,<CR>
                vmap <Leader>a, :Tabularize /,<CR>
                nmap <Leader>a,, :Tabularize /,\zs<CR>
                vmap <Leader>a,, :Tabularize /,\zs<CR>
                nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
                vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
                " }

                " abc,def,ghi , some , shrt 
                " a,b,c
        Plug 'dhruvasagar/vim-table-mode'
                let g:table_mode_corner_corner='+'
                let g:table_mode_header_fillchar='='
                " :TableModeToggle
                " +-------+---------+--------+
                " | hallo | albert  | montag |
                " +=======+=========+========+
                " | isr   | student | id     |
                " +-------+---------+--------+
        "=================================================================================

        "--------------------------------------------------------------------------------- 
        Plug 'auwsmit/vim-hydra'
        "--------------------------------------------------------------------------------- 
        Plug 'gotcha/vimpdb'
        "--------------------------------------------------------------------------------- 
        Plug 'vim-vdebug/vdebug'
                " <F5>: start/run (to next breakpoint/end of script)
                " <F2>: step over
                " <F3>: step into
                " <F4>: step out
                " <F6>: stop debugging (kills script)
                " <F7>: detach script from debugger
                " <F9>: run to cursor
                " <F10>: toggle line breakpoint
                " <F11>: show context variables (e.g. after "eval")
                " <F12>: evaluate variable under cursor
                " :Breakpoint <type> <args>: set a breakpoint of any type (see :help VdebugBreakpoints)
                " :VdebugEval <code>: evaluate some code and display the result
                " <Leader>e: evaluate the expression under visual highlight and display the result
        "--------------------------------------------------------------------------------- 
        "Plug 'ashisha/image.vim'
        "Plug 'rbgrouleff/bclose.vim'
        "-------------------------------------------------------------------------
        Plug 'scrooloose/nerdtree'
         "" NERDTree
         let NERDTreeShowBookmarks=1
         let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
         let NERDTreeChDirMode=0
         let NERDTreeQuitOnOpen=1
         let NERDTreeMouseMode=2
         let NERDTreeShowHidden=1
         let NERDTreeKeepTreeInNewTab=1

         " Defines a function which calls NERDTreeFind if we have an open
         " buffer, but NERDTreeToggle if we don't. This makes it so we can
         " always open NERDTree in the appropriate directory.
         function! NERDTreeToggleInCurDir()
           " If NERDTree is open in the current buffer
           if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
             exe ":NERDTreeClose"
           else
             if (expand("%:t") != '')
               exe ":NERDTreeFind"
             else
               exe ":NERDTreeToggle"
             endif
           endif
         endfunction

         map <leader>e :call NERDTreeToggleInCurDir()<CR>
         map <S-F2> :call NERDTreeToggleInCurDir()<CR>
         nmap <leader>nt :call NERDTreeToggleInCurDir()<CR>
         "map <F4> :call NERDTreeToggleInCurDir()<CR>

         "" NERDCommenter
         let g:NERDDefaultAlign = 'left'
         let g:NERDCommentEmptyLines = 1
         let g:NERDTrimTrailingWhitespace = 1
         

        "-------------------------------------------------------------------------
        Plug 'francoiscabrol/ranger.vim'
        "         let g:NERDTreeHijackNetrw = 0 
        "         let g:ranger_replace_netrw = 1 
        "         let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
        "         map <leader>f :Ranger<CR>
        "--------------------------------------------------------------------------------- 
        "Plug 'wsdjeg/JavaUnit.vim'
        Plug 'xolox/vim-pyref'
        Plug 'fs111/pydoc.vim'
                let g:pydoc_cmd = 'python -m pydoc'
                let g:pydoc_open_cmd = 'vsplit'
                " If you want pydoc to switch to an already open tab with pydoc page,
                let g:pydoc_use_drop=1
                " Pydoc files are open with 10 lines height, if you want to change this value
                " put this in your .vimrc:
                let g:pydoc_window_lines=15
                " let g:pydoc_window_lines=0.5
                " let g:pydoc_cmd = '/usr/bin/pydoc'
                " let g:pydoc_highlight=0
        "--------------------------------------------------------------------------------- 
        Plug 'vim-scripts/javaDoc.vim'
        Plug 'artur-shaik/vim-javacomplete2'
                imap <F3> <Plug>(JavaComplete-Imports-RemoveUnused)
                autocmd FileType java setlocal omnifunc=javacomplete#Complete
                " nmap <F4> <Plug>(JavaComplete-Imports-Add)
                " nmap <F5> <Plug>(JavaComplete-Imports-AddMissing)
                " nmap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)
        "--------------------------------------------------------------------------------- 
        " :setlocal omnifunc=javacomplete#Complete
        " :setlocal completefunc=javacomplete#CompleteParamsInfo
        " if has("autocmd")
        " autocmd Filetype java setlocal omnifunc=javacomplete#Complete
        " autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
        " endif
        Plug 'tylerhunt/vim-spark'
        "Plug 'sjl/vim-sparkup'
        Plug 'vim-scripts/Emmet.vim'
        let g:user_emmet_settings = {
                                \  'indentation' : '  ',
                                \  'perl' : {
                                \    'aliases' : {
                                \      'req' : 'require '
                                \    },
                                \    'snippets' : {
                                \      'use' : "use strict\nuse warnings\n\n",
                                \      'warn' : "warn \"|\";",
                                \    }
                                \  }
                                \}

        let g:user_emmet_expandabbr_key = '<c-\>'
        let g:use_emmet_complete_tag = 1

        " let g:user_emmet_settings = {
        "                         \  'php' : {
        "                         \    'extends' : 'html',
        "                         \    'filters' : 'c',
        "                         \  },
        "                         \  'xml' : {
        "                         \    'extends' : 'html',
        "                         \  },
        "                         \  'haml' : {
        "                         \    'extends' : 'html',
        "                         \  },
        "                         \}
        " let g:user_emmet_expandabbr_key = '<c-e>'
        " let g:use_emmet_complete_tag = 1
        "--------------------------------------------------------------------------------- 
        Plug 'gko/vim-coloresque'
        Plug 'lepture/vim-jinja'
        "Plug 'godlygeek/tabular'
        Plug 'hyiltiz/vim-plugins-profile'
        Plug 'nickstenning/honcho'
        "4Go
        Plug 'mattn/gom'
        Plug 'roxma/python-support.nvim'
                let g:python_support_python2_require = 0
                let g:python_support_python3_require = 0
        "--------------------------------------------------------------------------------- 
        function! DoRemote(arg)
                UpdateRemotePlugins
        endfunction
        "--------------------------------------------------------------------------------- 
        Plug 'zyedidia/vim-snake'
        Plug 'tpope/vim-dispatch'
        Plug 'neovim/pynvim'
        "Plug '5t111111/nvim-example-python3-plugin', { 'do': function('DoRemote') }

call plug#end()

        source ~/git/aTest/dotFiles/nVim/mix/n-badwolf.vim 
        source ~/git/aTest/dotFiles/nVim/myPlug/nHydra.vim 
        "source ~/git/aTest/dotFiles/nVim/myPlug/amake.vim
        "-------------------------------------------------------------------------------
        au! BufNewFile,BufRead *.js, *.html, *.css
                                \ set tabstop=8
                                \ set softtabstop=8
                                \ set shiftwidth=8
                                \ set colorcolumn=2,92,100,112,120
        "-------------------------------------------------------------------------------
        autocmd! filetype html  set colorcolumn=2,92,100,112,120
        autocmd! filetype html  set tabstop=8
        autocmd! filetype html hi Normal  ctermbg=22
        "autocmd! filetype html colorscheme inkpot
        "autocmd! filetype html colorscheme desert256
         autocmd! filetype html colorscheme molokayo
        ""Plug 'kellino/wordnet.nvim'
        augroup filetype_settings
                autocmd!
                autocmd FileType zsh setlocal ts=2 sw=2 sts=2 expandtab
                autocmd FileType vim setlocal ts=8 sw=8 sts=8 expandtab
                autocmd FileType php setlocal ts=4 sw=4 sts=4 expandtab commentstring=//\ %s omnifunc=phpactor#Complete
                autocmd FileType html setlocal ts=8 sw=8 sts=8 expandtab
                autocmd FileType css setlocal ts=8 sw=8 sts=8 expandtab
                autocmd FileType scss setlocal ts=4 sw=4 sts=4 expandtab
                autocmd FileType less setlocal ts=2 sw=2 sts=2 expandtab
                autocmd FileType javascript setlocal ts=4 sw=4 sts=4 expandtab
                autocmd FileType vue setlocal ts=4 sw=4 sts=4 expandtab commentstring=//\ %s
                autocmd FileType vue syntax sync fromstart
                autocmd FileType snippets setlocal ts=4 sw=4 sts=4 expandtab
        augroup END


"-nPlugEnd-nPlugStop3-}}}

"-AAA4-SyntaxColor------------------------------------------------------------------------------------------{{{
        "Show syntax highlighting groups for word under cursor
        function! <SID>SynStack()
                if !exists("*synstack")
                        return
                endif
                echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
        endfunc
        "------------------------------------------------------------------------------------------
        function! ShowFunc()
                let gf_s = &grepformat
                let gp_s = &grepprg
                let &grepformat = '%*\k%*\sfunction%*\s%l%*\s%f %*\s%m'
                let &grepprg = 'ctags -x --c-types=f --sort=no -o -'
                write
                silent! grep %
                cwindow
                let &grepformat = gf_s
                let &grepprg = gp_s
        endfunc
        nmap sf :call ShowFunc()<CR>
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
        nnoremap sm :ShowMaps<CR>            " Map keys to call the function
"-4SynColor-}}}

"-AAA5-Ulty--NeoSnippet--Ctrl-B--Expander0------------------------------------------------------------------{{{
        "-!!!-Insert completion-!!!---------
        silent! set complete& completeopt=menu infercase pumheight=10 noshowfulltag shortmess+=c
        "suppress intro message because the above makes it look bad
        set shortmess+=I
        "--------------------------------------------
        set complete=.,w,b,t,i,u,kspell
        "            | | | | | | |
        "            | | | | | | `-dict
        "            | | | | | `-unloaded buffers
        "            | | | | `-include files
        "            | | | `-tags
        "            | | `-other loaded buffers
        "            | `-windows buffers
        "            `-the current buffer
        "--------------------------------------------
        "set complete+=ispell
        "set completeopt=menuone,menu,longest,preview
        set omnifunc=syntaxcomplete#Complete
        set completeopt=menu
        "------------------------------------------------------------------------------------------
        "inoremap <silent> <C-]> <C-x><C-]>
        "inoremap <silent> <C-u> <C-x><C-u>
        "----------------------------------------------------
        let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
        let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
        let g:SuperTabContextDiscoverDiscovery =
                \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
        "----------------------------------------------------
        let g:SuperTabContextDefaultCompletionType = "<c-n>"
        let g:SuperTabDefaultCompletionType = "<c-n>"
        let g:SuperTabLongestHighlight = 1
        let g:SuperTabCrMapping = 1
        let g:SuperTabClosePreviewOnPopupClose = 1

        "------------------------------------------------------------------------------------------
        function! JumpToCSS()
                let id_pos = searchpos("id", "nb", line('.'))[1]
                let class_pos = searchpos("class", "nb", line('.'))[1]

                if class_pos > 0 || id_pos > 0
                        if class_pos < id_pos
                                execute ":vim '#".expand('<cword>')."' **/*.less"
                        elseif class_pos > id_pos
                                execute ":vim '.".expand('<cword>')."' **/*.less"
                        endif
                endif
        endfunction

        "nnoremap <leader>e :call JumpToCSS()<CR>zz
        "------------------------------------------------------------------------------------------
        imap <expr> <c-z> TabComplete()
        smap <expr> <c-z> TabComplete()
        xmap <expr> <c-z> TabComplete()

        function! TabComplete()
                if neosnippet#expandable_or_jumpable()
                        return "\<Plug>(neosnippet_expand_or_jump)"
                elseif &filetype =~ 'html\|css' && IsEmmetExpandable()
                        return "\<plug>(emmet-expand-abbr)"
                elseif pumvisible()
                        return "\<c-n>"
                else
                        return "\<tab>"
                endif
        endfunction
        "------------------------------------------------------------------
        " function! TabComplete()
        " if neosnippet#expandable_or_jumpable()
        "         return "\<Plug>(neosnippet_expand_or_jump)"
        "         elseif &filetype =~ 'html\|css' && emmet#isExpandable()
        "         return "\<plug>(emmet-expand-abbr)"
        "         elseif pumvisible()
        "         return "\<c-n>"
        " endif
        " endfunction

        "------------------------------------------------------------------------------------------
        function! IsEmmetExpandable()
                if !emmet#isExpandable() | return 0 | endif
                if &filetype =~ 'css' | return 1 | endif

                let expr = matchstr(getline('.')[:col('.')], '\(\S\+\)$')
                return expr =~ '[.#>+*]' || index(s:emmetElements, expr) >= 0
        endfunction

        let s:emmetElements = ['a', 'abbr', 'acronym', 'address', 'applet', 'area', 'article', 'aside', 'audio', 'b', 'base', 'basefont', 'bdi', 'bdo', 'big', 'blockquote', 'body', 'br', 'button', 'canvas', 'caption', 'center', 'cite', 'code', 'col', 'colgroup', 'datalist', 'dd', 'del', 'details', 'dfn', 'dialog', 'dir', 'div', 'dl', 'dt', 'em', 'embed', 'fieldset', 'figcaption', 'figure', 'font', 'footer', 'form', 'frame', 'frameset', 'h1', 'head', 'header', 'hr', 'html', 'i', 'iframe', 'img', 'input', 'ins', 'kbd', 'keygen', 'label', 'legend', 'li', 'link', 'main', 'map', 'mark', 'menu', 'menuitem', 'meta', 'meter', 'nav', 'noframes', 'noscript', 'object', 'ol', 'optgroup', 'option', 'output', 'p', 'param', 'pre', 'progress', 'q', 'rp', 'rt', 'ruby', 's', 'samp', 'script', 'section', 'select', 'small', 'source', 'span', 'strike', 'strong', 'style', 'sub', 'summary', 'sup', 'table', 'tbody', 'td', 'textarea', 'tfoot', 'th', 'thead', 'time', 'title', 'tr', 'track', 'tt', 'u', 'ul', 'var', 'video', 'wbr']
        \ + ['emb', 'btn', 'sty', 'dlg', 'fst', 'fig', 'leg', 'tarea', 'hdr', 'cmd', 'colg', 'art', 'fset', 'src', 'prog', 'bq', 'kg', 'adr' , 'cap', 'datag', 'datal', 'sect', 'str', 'obj', 'ftr', 'optg', 'ifr', 'out', 'det', 'acr', 'opt']

        "------------------------------------------------------------------------------------------
        " imap <leader><tab> <C-x><C-o>
        "==========================================================================================
        set runtimepath+=~/.config/nvim/plugged/neosnippet.vim/
        set runtimepath+=~/.config/nvim/plugged/neosnippet-snippets/
        "==========================================================================================
        set pumheight=12
        hi Pmenu  ctermfg=202 ctermbg=14
        hi PmenuSbar   ctermfg=11 ctermbg=5 cterm=NONE
        hi PmenuThumb  ctermfg=12 ctermbg=2 cterm=NONE
"-5-Complete-}}}
"-AAA6--GitGutter-------------------------------------------------------------------------------------------{{{
        let g:gitgutter_signs = 1
        let g:gitgutter_max_signs = 2000
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
"-6-}}}
"-AAA7--Abbr------------------------------------------------------------------------------------------------{{{
        "-Command mode related ???
        " cno $h e ~/
        " cno $d e ~/Desktop/
        " cno $c e <C-\>eCurrentFileDir("e")<cr>
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

        "-PYTHON-ABBR-
        iabbrev yypl print ('-------------------------------------------------------')
        abb dlin "==================================================================================
        abb alin "AAA--------------------------------------------------------------------------------
        iabbrev yyy  "---------------------------------------------------------------------------------
        iabbrev yyy2 "--------------------------------------------------------------------------------------{{{
        iabbrev yyy3 "-}}}


        iabbrev mispell misspell
        iabbrev funciton function
        iabbrev functiton function
        iabbrev fucntion function
        iabbrev funtion function
        iabbrev retunr return
        iabbrev reutrn return
        iabbrev reutn return
        iabbrev queyr query
        iabbrev htis this
        iabbrev foreahc foreach
        iabbrev forech foreach

        iabbrev #i #include
        iabbrev #d #define
        iabbrev cmnt /*<CR><CR>*/<Up>
        iabbrev @@  alf@nomail.com
        iabbrev ccopy Copyright 2013 Alf , no rights reserved.
        iabbrev xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
        iabbrev ydate <c-r>=strftime("%Y %b %d")<cr>
        " My information
        iab xname <C-R> Alf Durak
"-7Abbr-}}}

"-AAA8--Jump-----------------------------------------------------------------------------------------------{{{
        set cinoptions=N-s,g0,+2s,l-s,i2s
        "------------------------------------------------------------------------------------------
                nnoremap z1 :set foldlevel=1<cr>
                nnoremap zf :call FocusLine()<cr>
                "-Focus the current line. Basically: -1. Close all folds.
                function! FocusLine()
                        let oldscrolloff = &scrolloff
                        set scrolloff=0
                        execute "keepjumps normal! mzzMzvzt25\<c-y>\<cr>"
                        let &scrolloff = oldscrolloff
                endfunction

                "-Mappings to easily toggle fold levels
                "-Make zO recursively open whatever fold we're in, even if it's partially open.
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
        "------------------------------------------------------------------------------------------
                nnoremap <C-]> :silent! call JumpToTag()<cr>
                " nnoremap <C-s> :silent! call JumpToTagInSplit()<cr>
        "------------------------------------------------------------------------------------------
"-8Jump-}}}

"-AAA10-MiniPlugIn------------------------------------------------------------------------------------------{{{
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

        "---------------------------------------------------------------------------------

        " Use grep on filenames instead of relying on find's patterns.
        " TODO: How to hook this up with 'gf'?
        command! -nargs=1 FindFiles call FindFiles(<q-args>)
        function! FindFiles(filename)
                let error_file=tempname()
                silent exe '!find . ~
                                        \|grep -Pis "'.a:filename.'" -- -
                                        \| xargs file
                                        \| sed "s/:/:1:/" > '.error_file
                setl errorformat=%f:%l:%m
                exe "cfile ". error_file
                copen
                call delete(error_file)
        endfunction


        "------------------------------------------------------------------------------
        " Remove non visible buffers
        "------------------------------------------------------------------------------
        function! Wipeout()
                "From tabpagebuflist() help, get a list of all buffers in all tabs
                let tablist = []
                for i in range(tabpagenr('$'))
                        call extend(tablist, tabpagebuflist(i + 1))
                endfor

                let nWipeouts = 0
                for i in range(1, bufnr('$'))
                        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
                                "bufno exists AND isn't modified AND isn't in the list of buffers
                                "open in windows and tabs
                                silent exec 'bwipeout' i
                                let nWipeouts = nWipeouts + 1
                        endif
                endfor
                echomsg nWipeouts . ' buffer(s) wiped out'
        endfunction
        "nnoremap ;x :tabcl<cr>:call wipeout()<cr>

"-10Mini-}}}

"-AAA12-Diff------------------------------------------------------------------------------------------------{{{
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
                autocmd!
                " autocmd FileType diff setlocal foldmethod=expr
                autocmd FileType diff setlocal foldexpr=DiffFoldLevel()
        augroup END
        " See :help DiffOrig
        command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis \ | wincmd p | diffthis
        " diffoff used to set wrap as a side effect
        command! Diffoff        diffoff | setlocal nowrap
"-12Diff-}}}


"-AAA14-Cyan------------------------------------------------------------------------------------------------{{{
        " highlight DiffAdd         cterm=bold ctermbg=none ctermfg=119
        " highlight DiffDelete      cterm=bold ctermbg=none ctermfg=167
        " highlight DiffChange      cterm=bold ctermbg=11 ctermfg=227
        highlight DiffChange        cterm=bold ctermbg=7 
        "------------------------------------------------------------------------------------------
        "???-Highlight VCS conflict markers
        match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
        highlight ErrorMsg  guifg=red guibg=white
        " highlight conflict markers
        match ErrorMsg '\v^[<\|=|>]{7}([^=].+)?$'
        "-???-ccc-shortcut to jump to next conflict marker
        nnoremap <silent> <leader>c /\v^[<\|=>]{7}([^=].+)?$<CR>
        "easier on the eyes
        highlight Folded ctermbg=10
        highlight FoldColumn ctermbg=9 ctermfg=0 guibg=#ffffd7
        highlight DiffText ctermbg=1
                " let s:bwc.myGelb = ['ffff00', 11]
                " let s:bwc.myRed = ['800000', 1]
                " let s:bwc.myGreen = ['008000', 2]
                " let s:bwc.myBrown = ['808000', 3]
                " let s:bwc.myBlue = ['000080', 4]
                " let s:bwc.myPurple = ['008080', 6]
                if has('spell')
                         hi SpellBad     ctermfg=11    ctermbg=160
                         hi SpellCap     ctermfg=11    ctermbg=166
                         hi SpellLocal   ctermfg=11    ctermbg=9
                endif
                "--------------------------------------------------------------------------
                hi Define         ctermfg=11       ctermbg=22 
                hi MatchParen     ctermfg=11       ctermbg=39   cterm=bold
                hi Delimiter      ctermfg=51       ctermbg=56  cterm=bold
                "--------------------------------------------------------------------------
                hi NonText        ctermfg=201      ctermbg=88 
                hi Error          ctermfg=196      ctermbg=232  
                hi ErrorMsg       ctermfg=196      ctermbg=232  
                hi Exception      ctermfg=201      ctermbg=103 
                hi Keyword        ctermfg=201      ctermbg=1 
                hi Label          ctermfg=201      ctermbg=3 
                "--------------------------------------------------------------------------
                " hi Identifier     ctermfg=11      ctermbg=3 
                " hi Function       ctermfg=38       ctermbg=NONE 
                " hi ModeMsg        ctermfg=39       ctermbg=232  
                " hi MoreMsg        ctermfg=46       ctermbg=NONE 
                " hi DefinedName    ctermfg=200      ctermbg=NONE 
                "  [x{y(z(bbb) (ccc))}]
                "--------------------------------------------------------------------------
                set tabpagemax=15
                set cursorline
                set cursorcolumn
                let w:persistent_cursorline = 1
                hi Search  ctermbg=11 ctermfg=9 term= bold
                hi CursorLine                  ctermbg=8
                hi CursorColumn                ctermbg=8
                "hi ColorColumn                 ctermbg=9
                hi ColorColumn                 ctermbg=237
                set colorcolumn=8,92,100,112,120
                " GitGutter
                set signcolumn=yes
                hi signcolumn  ctermbg=7
                hi LineNr ctermfg=9 ctermbg=14 
                hi Normal  ctermbg=235
                highlight Visual cterm=bold ctermbg=2 ctermfg=NONE
                "set listchars=tab:\|\ 
                set listchars=tab:▸\
                set list

                hi Cursor ctermbg=2 term= bold
                hi Comment         ctermfg=14
                hi Number          ctermfg=11
                set nuw =5
        highlight ShowMatches ctermbg=16 
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=16
        au! Cursorhold * exe 'match ShowMatches /\v%(%#\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*%#\})/'
"-14Cyan-}}}
"-AAA15-Airline---------------------------------------------------------------------------------------------{{{
        let g:airline_theme='light'
        set showmode                "-Display the current mode
        set showcmd                 "-Show partial commands in status line 
        "-------------------------------------------------------------------------------
        let g:airline_section_c = '%{strftime("%Y %b %d %X")}'
        let g:airline#extensions#tabline#enabled = 2
        let g:airline#extensions#tabline#buffer_min_count = 1
        "-----------------------------------------------------------
        let g:airline#extensions#syntastic#enabled = 1
        let g:airline#extensions#branch#enabled = 1
        "-----------------------------------------------------------
        if !exists('g:airline_symbols')
                let g:airline_symbols = {}
        endif
        "---------------------------------------------------------------------
        hi statusline ctermbg=10 ctermfg=Black  cterm=bold
        hi StatusLineNC  ctermbg=5 ctermfg=0 cterm=NONE
        "---------------------------------------------------------------------

"-15-}}}
"-AAA16-Wildmenu--------------------------------------------------------------------------------------------{{{
        " More useful command-line completion
        au! FocusLost * :silent! wall     "Save when losing focus
        set wildmenu
        set wildmode=list:longest
        set wildmode=list:full
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
        set wildignore+=classes
        set wildignore+=lib
        "silent! set wildchar=9 nowildmenu wildmode=list:longest wildoptions= wildignorecase cedit=<C-k>
"-16-}}}
"-AAA17-CMDHeight2--Verbose--MAKE-----------------------------------------------------------------------{{{
        "Instead of setting 'verbose' in your vimrc, use autocommands, as follows (for instance)
        if &cmdheight == 1
                set cmdheight=2
        endif
        if &verbose == 0
                augroup late-verbose
                autocmd!
                        autocmd!    VimEnter    *    set verbose=0
                        autocmd!    VimLeave    *    set verbose=0
                augroup END
        endif

        "---------------------------------------------------------
        "-Compiling-C-source-In-Vim
        autocmd! FileType c,cpp
                                \ if empty(glob("[Mm]akefile")) |
                                \   setlocal makeprg=make\ %< |
                                \ endif
        "---------------------------------------------------------

        "---------------------------------------------------------
        "-The %< in our makeprg definition refers to the current file with its extension
        "stripped. We specifically only change the behaviour if no Makefile
        "exists so that we don’t interfere with the normal usage of the :make
        "command.
        "---------------------------------------------------------

"-17-}}}

"-AAA18-SyntasticCheck--------------------------------------------------------------------------------------{{{
        let g:syntastic_always_populate_loc_list = 1
        "let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        ""let g:syntastic_java_checkers = ['checkstyle']
        ""let g:syntastic_java_javac_executable = '~/.vim/plugged/syntastic/syntax_checkers/java/javac.vim'
        let g:systastic_python_checkers = ['pylint', 'python']
        let g:syntastic_mode_map = {'mode': 'active'}
        let g:syntastic_python_pylint_quiet_messages = {}
        let g:syntastic_enable_signs = 1
        "let g:syntastic_auto_jump = 1
        let g:syntastic_enable_highlighting = 1
        "let g:syntastic_echo_current_error  = 1
        let g:syntastic_javascript_checkers=['jshint']
        let g:syntastic_php_checkers=['php']
        let g:syntastic_css_checkers=['csslint']
        let g:syntastic_python_checkers = ['flake8']
        let g:syntastic_error_symbol = '⚡'
        let g:syntastic_warning_symbol = '⚠'
        "let g:syntastic_check_on_w = 1

        " let g:syntastic_python_checkers=['python', 'flake8']
        " let g:syntastic_python_flake8_post_args='--ignore=W391'
        " For forcing the use of flake8, pyflakes, or pylint set
        " let g:syntastic_python_checkers = ['pyflakes']

"-18-}}}


"-AAA19-PyStart--PythonStart----------------------------------------------------------------------------------------{{{
        function! s:UsingPython3()
                if has('python3')
                        return 1
                endif
                return 0
        endfunction

        let s:using_python3 = s:UsingPython3()
        let s:python_until_eof = s:using_python3 ? "python3 << EOF" : "python << EOF"
        let s:python_command = s:using_python3 ? "py3 " : "py "
        "----------------------------------------------------------------------------------
        "Python runners
        "Python runners
        autocmd! filetype python noremap <buffer> <F4> :w<CR>:!python %<CR>
        autocmd! filetype python inoremap <buffer> <C-F4> <Esc>:w<CR>:!python %<CR>
        autocmd! filetype python noremap <buffer> <S-F4> :w<CR>:!ipython %<CR>
        autocmd! filetype python inoremap <buffer> <S-F4> <Esc>:w<CR>:!ipython %<CR>
        noremap <buffer> <F4> :w<CR>:!python %<CR>
        noremap <buffer> <C-F4> :w<CR>:!clear;python %<CR>
        noremap <buffer> <S-F4> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
        "----------------------------------------------------------------------------------
        augroup python_files 
                " This function detects, based on Python content, whether this is a
                " Django file, which may enabling snippet completion for it
                autocmd!
                function! s:DetectPythonVariant()
                        let n = 1
                        while n < 50 && n < line("$")
                                " check for django
                                if getline(n) =~ 'import\s\+\<django\>' || getline(n) =~ 'from\s\+\<django\>\s\+import'
                                        set ft=python.django
                                        "set syntax=python
                                        return
                                endif
                                let n = n + 1
                        endwhile
                        " go with html
                        set ft=python
                endfunction 
                autocmd! BufNewFile,BufRead *.py call s:DetectPythonVariant()

                "--------------------------------------------------------------------------
                autocmd! filetype python setlocal formatoptions-=t " But disable autowrapping as it is super annoying
                "--------------------------------------------------------------------------
                " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set earlier, as it is important)
                autocmd! filetype python setlocal textwidth=149
                autocmd! filetype python match ErrorMsg '\%>120v.\+'

                "----------------------------------------------------------------------------------
                autocmd! filetype python nnoremap <C-F10> :SyntasticCheck<CR>
                autocmd! filetype python nnoremap <F10>  :LocationToggle<cr>
                "------------------------------------------------- 
                "Automatic insertion of breakpoints
                "autocmd! filetype python nnoremap <buffer> <leader>bp :normal oimport pdb; pdb.set_trace()  # TODO: BREAKPOINT  # noqa<Esc>
                "==========================================================================
                "==JediYes=Mit=C-z===-gj-===pyref-gu-==-PyDoc-macht-mUUUUU-U-U-------------

                        let g:jedi#use_splits_not_buffers = "left"
                        let g:jedi#popup_on_dot = 0
                "------------------------------------------------- 
                        let g:jedi#goto_command = "<leader>d"
                        let g:jedi#goto_assignments_command = "<leader>g"
                        let g:jedi#goto_definitions_command = ""
                        let g:jedi#documentation_command = "M"
                        let g:jedi#usages_command = "<leader>n"
                        let g:jedi#rename_command = "<leader>r"
                        let g:jedi#completions_command = "<C-z>"
                        "let g:jedi#completions_command = "<C-Space>"
                        let g:jedi#popup_on_dot = 1
                        let g:jedi#completions_enabled = 1
                        let g:jedi#popup_select_first = 1
                        let g:jedi#show_call_signatures = "1"
                        let g:jedi#goto_command = "gt"
                        let g:jedi#auto_close_doc = 0  " close preview window after completion
                        let g:jedi#documentation_command = "gj"
                        "==-USA-U-=============================================================
                        let g:pyref_mapping = 'gu'
                        let g:pyref_python = 'file:///usr/share/doc/python2.7/html/index.html'
                        "let g:pyref_python = $HOME . '/docs/python'
                        "==================================================================
                        "file:///usr/share/doc/python2.7/html/index.html
                        "file:///usr/share/doc/python/python-policy.html/index.html
                        "file:///usr/share/doc/
                        "===========================================================
                        "let g:jedi#auto_vim_configuration = 0
                        "let g:jedi#goto_assignments_command = "<localleader>g"
                        "let g:jedi#goto_definitions_command = "<localleader>d"
                        "let g:jedi#usages_command = "<localleader>u"
                        "let g:jedi#rename_command = "<localleader>r"
                        "=====================================================
                        " let g:jedi#goto_command = "<leader>d"
                        " let g:jedi#goto_assignments_command = "<leader>g"
                        " let g:jedi#goto_definitions_command = ""
                        " let g:jedi#usages_command = "<leader>n"
                        " let g:jedi#rename_command = "<leader>r"
                "==================================================================================
                autocmd! FileType python setlocal omnifunc=jedi#completions
                autocmd! FileType python setlocal completeopt-=preview
                "====================SSS===========================================================
                let g:LanguageClient_serverCommands = {
                                        \ 'python': ['pyls','--log-file', '/tmp/pyls.log'],
                                        \}
                "==================================================================================
                " let g:LanguageClient_serverCommands.python = ['pyls']
                "==================================================================================

                " Map renaming in python
                " autocmd FileType python nnoremap <buffer>
                "                         \ <leader>v :call LanguageClient_textDocument_re
                "====================SSS===========================================================
                "----------------------------------------------------------------------------------
                autocmd! FileType python :hi IndentGuidesOdd   ctermbg=16
        augroup END
"-19py-}}}

        "-Fix window position of help------------------------------------------------------
        au! FileType vim,help nnoremap M :exec "help" expand("<cword>")<CR>
        "----------------------------------------------------------------------------------

"-aaa20-PrePLAY0-remap---------------------------------------------------------------------------------------{{{
        inoremap jk <esc>
        "-Unfuck--my--screen------------------------------------
        nnoremap fu :syntax sync fromstart<cr>:redraw!<cr>
        "------------------------------------------------------------------------------------------
        nnoremap zu :<c-u>update<cr>
        "------------------------------------------------------------------------------------------
        nnoremap ;e :ls<cr>:b<space>
        nnoremap ;v <c-w>v<c-w>l
        "------------------------------------------------------------------------------------------
        nnoremap ;f :set tw=70<cr>v<s-}>gq<end>
        nnoremap W gwip
        "------------------------------------------------------------------------------------------
        "Number 7: Align Current Paragraph 
        noremap <LocalLeader>a =ip
        "------------------------------------------------------------------------------------------
        imap            ;;              <ESC>
        "-open a file with same basename but different extension        
        map <expr>      ,R              ":e ".expand("%:r")."."
        "------------------------------------------------------------------------------------------
        nnoremap ( <c-x>:y x\|@x<cr>
        nnoremap ) <c-a>:y x\|@x<cr>
        "------------------------------------------------------------------------------------------
        "???makes macros even easier to remember: hit qq to record, q to stop recording, and Q to apply.
        nnoremap Q @q
        vnoremap Q :norm @q<cr>
        "------------------------------------------------------------------------------------------
        nmap q <nop>
        nnoremap q q
        nnoremap ss :wa<cr>
        nnoremap qq :wa<cr> :bd<cr>
        nnoremap qs :wa<cr> :qa<cr>
        nnoremap qa :qa!<cr>
        nnoremap ge :w<cr>:e #<cr>
        nnoremap qw <C-w>q<CR>
        nnoremap qo <C-w>o<CR>
        "------------------------------------------------------------------------------------------
        nnoremap ZZ  <Nop> 
        nnoremap ZZ mzzt3<c-u>`z
        nnoremap zs mzzt3<c-u>`z
        nnoremap zx mzzt35<c-u>`z
        nnoremap zh mzzt10<c-u>`z
        nnoremap EE :source $MYVIMRC<CR>
        nnoremap BB ggVG
        "------------------------------------------------------------------------------------------
        nnoremap <BS> X
        "-it's-2018--------------------------------------------------------------------------------
        noremap j gj
        noremap k gk
        noremap gj j
        noremap gk k
        "-Bash-like-keys-for-the-command-line
        cnoremap <C-A> <Home>
        cnoremap <C-E> <End>
        cnoremap <C-d> <Del>
        "Same when jumping around
        nnoremap <c-o> <c-o>zz
        nnoremap <c-i> <c-i>zz
        "Yank to end of line
        nnoremap Y y$
        "-HHJ- Keep the cursor in place while joining lines
        nnoremap H mzJ`z
        "Split?? The normal use of S is covered by cc, so don't worry about shadowing it.
        nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
        "-Reselect-last-pasted text----------------------------------------------------------------
        nnoremap gv `[v`]
        "------------------------------------------------------------------------------------------
        noremap \\ #*
        "------------------------------------------------------------------------------------------
        " make it so that if I acidentally pres ^W or ^U in insert mode,
        " then <ESC>u wil undo just the ^W/^U, and not the whole insert
        " This is docmented in :help ins-special-special, a few pages down
        inoremap <C-W> <C-G>u<C-W>
        inoremap <C-U> <C-G>u<C-U>
        "------------------------------------------------------------------------------------------
        vmap     dg  :dffget<CR>
        vmap     dp  :diffput<CR>
        nnoremap do  :diffoff!<cr>
        "------------------------------------------------------------------------------------------
        inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a
"-20Remap-}}}

"-AAA21--PLAY--Start--Ag--CtrlP--Unite--CommandT--BigList-400-------------------------------------------------------{{{

        "===SetPLAY1================================================================================
        if executable('ag')
                let g:ag_working_path_mode="r"
                set grepprg=ag\ --nogroup\ --nocolor
                let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
                let g:ctrlp_use_caching = 0
                let g:ackprg = 'ag --vimgrep --smart-case'
                let g:unite_source_grep_command = 'ag'
                let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
                let g:unite_source_grep_recursive_opt = ''
        endif
        "===SetPLAY2===============================================================================
        " In Neovim, you can set up fzf window using a Vim command
        let g:fzf_layout = { 'window': 'enew' }
        let g:fzf_layout = { 'window': '-tabnew' }
        let g:fzf_layout = { 'window': '10split enew' }

        "let g:fzf_history_dir = '~/.local/share/fzf-history'


        let g:fzf_colors =
                                \ { 'fg':      ['fg', 'Comment'],
                                \ 'bg':      ['bg', 'Normal'],
                                \ 'hl':      ['fg', 'Comment'],
                                \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                                \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn', 'Normal'],
                                \ 'hl+':     ['fg', 'Statement'],
                                \ 'info':    ['fg', 'PreProc'],
                                \ 'border':  ['fg', 'Ignore'],
                                \ 'prompt':  ['fg', 'Conditional'],
                                \ 'pointer': ['fg', 'Exception'],
                                \ 'marker':  ['fg', 'Keyword'],
                                \ 'spinner': ['fg', 'Comment'],
                                \ 'header':  ['fg', 'Comment'] }

        "==========================================================================================
        function! s:fzf_statusline()
                highlight fzf1 ctermfg=161 ctermbg=2
                highlight fzf2 ctermfg=23 ctermbg=9
                highlight fzf3 ctermfg=237 ctermbg=13
                setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
        endfunction
        autocmd! User FzfStatusLine call <SID>fzf_statusline()
        "---------------------Ctrl-x--Lynx---------------------------------------------------------
        let g:fzf_command_prefix = 'Fzf'
        let g:fzf_action = {
                                \ 'ctrl-t': 'tab split',
                                \ 'ctrl-x': ':Lynx',
                                \ 'ctrl-v': 'vsplit' }
        "------------------------------------------------------------------------------------------
        " Mapping selecting mappings
        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)

        imap <expr><C-j> fzf#vim#complete#word({'left': '15%'})
        imap <C-l> <plug>(fzf-complete-line)
        "********NiceNice*****************************************************************
        command! FZFTag if !empty(tagfiles()) | call fzf#run({
        \ 'source': "cat " . join(tagfiles()) . ' | grep -P "' . expand('%:t') . '"',
        \ 'sink': function('<sid>tag_handler'),
        \ 'options': '+m --with-nth=1',
        \ 'down': '50%'
        \ }) | else | echo 'No tags' | endif

        function! s:tag_handler(tag)
            if !empty(a:tag)
                let token = split(split(a:tag, '\t')[2],';"')[0]
                let m = &magic
                setlocal nomagic
                execute token
                if m
                    setlocal magic
                endif
            endif
        endfunction
        nnoremap <silent> <Leader>t :FZFTagA<cr>
        "**********************************************************************************
        "-[Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1
        "-[[B]Commits] Customize the options used by 'git log':
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
        "-[Tags] Command to generate tags file
        let g:fzf_tags_command = 'ctags -R'
        "-[Commands] --expect expression for directly executing the command
        let g:fzf_commands_expect = 'alt-enter,ctrl-x'
        "---???------------------------------------------------------------------------------------
        let generate_tags=1

        "===SetPLAY3===============================================================================
        call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
                                \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))

        "------------------------------------------------------------------------------------------
        call unite#filters#sorter_default#use(['sorter_rank'])
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        call unite#filters#matcher_default#use(['matcher_fzf'])

        "===SetPLAY4===============================================================================
        "   - :Unite [{options}] {source's'}
        "      - parameters of source
        "          - e.g. file:foo:bar -- here ['foo', 'bar'] is parameters
        "          - e.g. file:foo\:bar -- use \ to escape
        "          - e.g. file:foo::bar -- ['foo', '', 'bar']
        "   - press 'I' to search after prompt '>'
        "       - *word,
        "       - **/foo (directory recursively)
        "       - foo bar (AND)
        "       - foo|bar (OR)
        "       - foo !bar (negative)
        "   - :UniteResume, :UniteBookmarkAdd,
        let g:unite_source_history_yank_save_clipboard = 1
        let g:unite_source_mark_marks = "abcdefghijklmnopqrstuvwxyz"
                \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""
        "------------------------------------------------------------------------------------------
        " let g:unite_no_default_keymappings = 1 " don't map default key mappings
        let g:unite_candidate_icon = '∘'
        let g:unite_source_history_yank_enable = 1
        let g:unite_enable_start_insert = 0
        let g:unite_enable_short_source_mes = 0
        let g:unite_force_overwrite_statusline = 1
        let g:unite_prompt = '::: '
        let g:unite_marked_icon = '✓'
        let g:unite_winheight = 15
        let g:unite_winwidth = 50
        let g:unite_update_time = 200
        let g:unite_split_rule = 'botright'
        let g:unite_split_rule = "topleft"
        let g:unite_data_directory ='~/.config/nvim/tmp/unite'
        let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
        let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
        let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
        "===SetPLAY5===============================================================================
        let g:ctrlp_cmd = 'CtrlPMRU'
        let g:ctrlp_extensions = ['tag']
        let g:ctrlp_match_window_bottom = 0
        let g:ctrlp_match_window_reversed = 0
        let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
        let g:ctrlp_dotfiles = 0
        let g:ctrlp_switch_buffer = 0
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_map = '<leader>p'
        let g:ctrlp_open_new_file = 'R'
        "let g:ctrlp_working_path_mode = 'ar'
        "===SetPLAY6===============================================================================
        let g:CommandTMaxFiles = 10000 " maximum number of files scan.
        let g:CommandTMaxDepth = 15
        let g:CommandTMaxCacheDirectories = 1 " 0: no limit.
        let g:CommandTMaxHeight = 15 " 0: as much as available space.
        let g:CommandTMinHeight = 0 " 0: single line.
        let g:CommandTAlwaysShowDotFiles = 0 " only if entered string contains a dot
        let g:CommandTNeverShowDotFiles = 0
        let g:CommandTScanDotDirectories = 0
        let g:CommandTMatchWindowAtTop = 0 " match window appear at bottom.
        let g:CommandTMatchWindowReverse = 1 " let the best match at bottom.
        let g:CommandTTageIncludeFilenames = 1 " include filenames when matches
        "===SetPLAY7===============================================================================
        let g:ycm_filetype_blacklist = {
                                \ 'tagbar': 1,
                                \ 'qf': 1,
                                \ 'notes': 1,
                                \ 'markdown': 1,
                                \ 'unite': 1,
                                \ 'text': 1,
                                \ 'vimwiki': 1,
                                \ 'pandoc': 1,
                                \ 'infolog': 1,
                                \ 'mail': 1
                                \}

        "let g:ycm_complete_in_comments=1
        "" load ycm conf by default
        let g:ycm_confirm_extra_conf=0
        "" turn on tag completion
        let g:ycm_collect_identifiers_from_tags_files=1
        "" start completion from the first character
        let g:ycm_min_num_of_chars_for_completion=3
        "" don't cache completion items
        let g:ycm_cache_omnifunc=0
        "" complete syntax keywords
        let g:ycm_seed_identifiers_with_syntax=1
        "------------------------------------------------------------------------------------------
        "noYet- let g:ycm_show_diagnostics_ui = 1
        "let g:ycm_enable_diagnostic_highlighting = 1
        "------------------------------------------------------------------------------------------
        "map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_error_symbol = 'x>'
        let g:ycm_warning_symbol = 'w>'
        let g:ycm_enable_diagnostic_signs = 1
        let g:ycm_add_preview_to_completeopt = 1
        let g:ycm_use_ultisnips_completer = 1
        let g:ycm_autoclose_preview_window_after_insertion = 1
        let g:ycm_key_detailed_diagnostics = '<leader>d'
        let g:ycm_key_invoke_completion = '<C-Space>'
        let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
        let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
        let g:ycm_key_list_stop_completion = ['<C-3>']
        "used <C-Y>
        map <C-;> :YcmCompleter GoToImprecise<CR>
        " let g:ycm_autoclose_preview_window_after_insertion = 0
        " let g:ycm_autoclose_preview_window_after_completion = 0
        "===SetPLAY7===============================================================================
        "===SetPLAY8===============================================================================
        " let g:ycm_semantic_triggers =  {
        "                         \   'c': ['->', '.'],
        "                         \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
        "                         \            're!\[.*\]\s'],
        "                         \   'ocaml': ['.', '#'],
        "                         \   'cpp,cuda,objcpp': ['->', '.', '::'],
        "                         \   'perl': ['->'],
        "                         \   'php': ['->', '::'],
        "                         \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
        "                         \   'ruby,rust': ['.', '::'],
        "                         \   'lua': ['.', ':'],
        "                         \   'erlang': [':'],
        "                         \ }
        "------------------------------------------------------------------------------------------
        " automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        "------------------------------Ulti-Expander-Unite----------------------------------
        function! UltiSnipsCallUnite()
                Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
                return ''
        endfunction
        "===PLAY1==BliZZ==F3+(C-q)=================================================================
                inoremap <F3> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
                let g:UltiSnipsExpandTrigger="<tab>"
                let g:UltiSnipsJumpForwardTrigger="<C-q>"
                let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
        "==========================================================================================
        "------------------------------------------------------------------
        "Tell Neosnippet about the other snippets
        " let g:neosnippet#snippets_directory = '~/.vim/snippets'    
        "-???-let g:neosnippet#enable_snipmate_compatibility = 1
        let g:neosnippet#snippets_directory = "~/.config/nvim/plugged/neosnippet-snippets/neosnippets/"
        "===PLAY2==BLiZZ==(C-s)+(C-b)==============================================================
                imap <C-s>    <Plug>(neosnippet_start_unite_snippet)
                imap <C-b>    <Plug>(neosnippet_expand_or_jump)
                smap <C-b>    <Plug>(neosnippet_expand_or_jump)
                xmap <C-b>    <Plug>(neosnippet_expand_target)
                nnoremap <Leader>y :<C-u>Unite -buffer-name=neosnippet neosnippet<CR>
        "==========================================================================================

        "===PLAY3==================================================================================
                nnoremap <Leader>u :Unite help file_mru file buffer file_rec bookmark <CR>
                nnoremap <Leader>\ :Unite -silent -vertical -winwidth=40  -direction=botright -toggle outline<CR>
                nnoremap <Leader>h :UniteWithCursorWord -silent help<CR>
                nnoremap <Leader>r :<C-u>Unite -buffer-name=register register<CR>
                nnoremap <Leader>c :<C-u>Unite -buffer-name=change change<CR>
                nnoremap <Leader>j :<C-u>Unite -buffer-name=jump jump<CR>
                nnoremap <Leader>' :Unite bookmark <CR>
        "==========================================================================================

        "===PLAY4===SUCHE========************======================================================
                nnoremap <Leader>l :lgrep -R <cword> .<cr>
                nnoremap <Leader>g :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
                nnoremap <Leader>a :Ack <cword> .<cr>
                nnoremap ? :Ack
                nmap <Leader>6 :Rg <cword> .<cr>
                nmap <Leader>7 :Ag <cword> .<cr>
                nmap <Leader>8 <Plug>AgRawSearch <cword> .<cr>
                nmap <Leader>/ <Plug>AgRawSearch
                "-----------------------------------------------------------------"
                "  s - open entry in a new horizontal window                      "
                "  v - open entry in a new vertical window                        "
                "  t - open entry in a new tab                                    "
                "  o - open entry and come back                                   "
                "  O - open entry and close the location/quickfix window          "
                "  p - open entry in a preview window                             "
                "-----------------------------------------------------------------"
                " :Keep                                                           "
                " :Reject                                                         "
                " :Restore                                                        "
                " :Doline s/^/--                                                  "
                " :SaveList                                                       "
                " :SaveList curlist                                               "
                " :SaveListAdd curlist                                            "
                " :LoadList curlist                                               "
                " :ListLists                                                      "
                "-----------------------------------------------------------------"
        "===PLAY5=================================================================================
                nnoremap ;p :CtrlP<cr>
                nnoremap ;m :CtrlPMRU<cr>
        "===PLAY6==================================================================================
                nnoremap ;h :CommandTHelp<cr>
                nnoremap ;b :CommandTBuffer<cr>
                let g:CommandTCancelMap=['<C-x>', '<C-c>']
                "------------------------------------------------------------------------------
                " <Leader>t provide fast, intuitive mechanism for opening files and buffers
                " <BS> <Del> -- delete
                " <Left> <C-h> -- move left.
                " <Right> <C-l> -- move right
                " <C-a> -- move to the start.
                " <C-e> -- move to the end.
                " <C-u> -- clear the contents of the prompt.
                " <Tab> -- switch focus between the file listing and prompt.
                "----------------------------------------------------------------------
                " <C-CR> <C-s> -- split open
                " <C-v> -- vsplit
                " <C-t> -- tab
                " <C-j> <C-n> <Down> -- select next file in file listing.
                " <C-k> <C-p> <Up> -- select previous file in file listing.
                " <Esc> <C-c> -- cancel (dismisses file listing)

        "====Voide=================================================================================
        "====Voide=================================================================================


        "===PLAY8=========(C-o)====================================================================
        inoremap <silent> <C-o> <C-x><C-o>
        "inoremap <silent> <C-k> <C-x><C-k>
        inoremap <silent> <C-d> <C-x><C-d>
        "inoremap <silent> <C-f> <C-x><C-f>
        inoremap <silent> <C-l> <C-x><C-l>

        "===PLAY15=================================================================================
        nnoremap ;d mayiw`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
        "==========================================================================================
        let g:tq_language=['en', 'ru', 'de', 'cn']
        "-Presidenti, group, Hotel-
        "==Losh====================================================================================
        nnoremap <leader>1 yypVr=
        "I work with HTML often, so I have ,ft mapped to a “fold tag” function:
        nnoremap <leader>ft Vatzf

        "I also work with Nick Sergeant and he likes his CSS properties sorted, so here
        nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

"-AAA21--PLAY--STOP--BigList800-}}}


        ":::::::::::::::::::::::::::-=NAVI2=-::::::::::::::::::::::::::::::::::::::::::::::
        " Split previously opened file ('#') in a split window
        nnoremap ;l :execute "leftabove vsplit" bufname('#')<cr>
        nnoremap ;r :execute "rightbelow vsplit" bufname('#')<cr>
        "----------------------------------------------------------------------------------
        nnoremap <C-j> :bn<cr>
        nnoremap <C-k> :bp<cr>
        "--------------------------------------------------
        nnoremap <m-right> :vertical resize +3<cr>
        nnoremap <m-left> :vertical resize -3<cr>
        nnoremap <m-up> :resize +3<cr>
        nnoremap <m-down> :resize -3<cr>
        "--------------------------------------------------
        " inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
        " inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>
        "--------------------------------------------------
        noremap <S-j> :PreviewScroll -1<cr>
        noremap <S-l> :PreviewScroll +1<cr>
        "------------------------------------------------------------------------------------------ 
        fun! ScrollOtherWindow(dir)
                if a:dir == "down"
                        let move = "\<C-E>"
                elseif a:dir == "up"
                        let move = "\<C-Y>"
                endif
                exec "normal \<C-W>p" . move . "\<C-W>p"
        endfun
        nmap <silent> <C-M-Down> :call ScrollOtherWindow("down")<CR>
        nmap <silent> <C-M-Up> :call ScrollOtherWindow("up")<CR>
        "===AG=====================================================================================
        let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'

        "===============================================================================================================
        " highlight TechWordsToAvoid ctermbg=red ctermfg=white
        " match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        " autocmd! BufWinEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        " autocmd! InsertEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        " autocmd! InsertLeave * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        " autocmd! BufWinLeave * call clearmatches()
        "===============================================================================================================
        "python print_pyhel()
        function! InsertCountry()
                python print("Hello from Python source code!")
                python print_pyhel()
        endfunction
        command! -nargs=0 InsertCountry call InsertCountry()


        " I have found it helpful to print all Vim activity to a file by starting Vim with the -V option:
        " vim -V12log
        " This provides the maximum verbosity (level 12) and outputs it to the file log.
        " You can then perform some Vim actions which you know to be slow, and then see
        " which functions/mappings are being called internally.


        " function! SomeExample()
        "         python << endPython

        "                 def example():
        "                         print("Python stuff")

        "                 example()

        "         endPython
        " endfunction


"===============================================================================================================
"===============================================================================================================
"===============================================================================================================
" Vim comments start with a double quote.
" Function definition is VimL. We can mix VimL and Python in
" function definition.
" We start the python code like the next line.
function! Reddit()

python << EOF
# the vim module contains everything we need to interface with vim from
# python. We need urllib2 for the web service consumer.
import vim, urllib2
import json

TIMEOUT = 20
URL = "http://reddit.com/.json"

try:
    # Get the posts and parse the json response
    response = urllib2.urlopen(URL, None, TIMEOUT).read()
    json_response = json.loads(response)

    posts = json_response.get("data", "").get("children", "")

    # vim.current.buffer is the current buffer. It's list-like object.
    # each line is an item in the list. We can loop through them delete
    # them, alter them etc.
    # Here we delete all lines in the current buffer
    del vim.current.buffer[:]

    # Here we append some lines above. Aesthetics.
    vim.current.buffer[0] = 80*"-"

    for post in posts:
        # In the next few lines, we get the post details
        post_data = post.get("data", {})
        up = post_data.get("ups", 0)
        down = post_data.get("downs", 0)
        title = post_data.get("title", "NO TITLE").encode("utf-8")
        score = post_data.get("score", 0)
        permalink = post_data.get("permalink").encode("utf-8")
        url = post_data.get("url").encode("utf-8")
        comments = post_data.get("num_comments")

        # And here we append line by line to the buffer.
        # First the upvotes
        vim.current.buffer.append("↑ %s"%up)
        # Then the title and the url
        vim.current.buffer.append("    %s [%s]"%(title, url,))
        # Then the downvotes and number of comments
        vim.current.buffer.append("↓ %s    | comments: %s [%s]"%(down, comments, permalink,))
        # And last we append some "-" for visual appeal.
        vim.current.buffer.append(80*"-")

except Exception, e:
    print e

EOF
" Here the python code is closed. We can continue writing VimL or python again.
endfunction
command! -nargs=0 Reddit call Reddit()
"===============================================================================================================
"===============================================================================================================
"===============================================================================================================
