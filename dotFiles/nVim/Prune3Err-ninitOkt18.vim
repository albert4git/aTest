"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-NeoVimMix10-"-""-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"
" File: ninitOkt18.vim
" Author: yourname
" Description: 
" Last Modified: November 12, 2018
"-This-can-be-fixed-by-running-
":filetype detect
"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-

        set path+=.,/usr/include,/usr/local/include
        "set runtimepath+=~/.vim/plugged/vimproc/
        "let $PATH=substitute("~/bin:~/local/bin:~/.rbenv/shims:~/.svm/current/rt/bin:", "\\~", $HOME, "g").$PATH
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
        "------------------------------------------------------------------------------------------
        augroup vimrc
                autocmd!
        augroup END
        "------------------------------------------------------------------------------------------
        "Ex: Pull word under cursor into LHS of a subs ztitute (replace)
        ">> 1y$  //yank current row to register 1
        ">> CTRL-R 1  //CTRL-R followed by register id pastes register to command line
                nnoremap <LocalLeader>w :%s#\<<C-r>=expand("<cword>")<CR>\>#
                nnoremap <LocalLeader>z :%s#\<<C-r>=getline(".")<CR>\>#


        " cmap <C-R>'           <C-R>=shellescape(getline('.'))<CR>
        " cmap <C-R><C-R>' <C-R><C-R>=shellescape(getline('.'))<CR>
        " :!/usr/bin/todo ^R'
        "<C-r>" to paste from the default register or <C-r>a to paste from register a
        " :read !date /t
        " :0read !date /t
        " current directory (under 8 days) those files are searched for the text "vim"
        " and all matching lines are listed in a new window:
        " :R find -mtime -8 | xargs grep vim
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
        if has("autocmd")
                augroup SourceVimrc
                        au!
                        autocmd bufwritepost .vimrc source $MYVIMRC
                augroup END
        endif
        "------------------------------------------------------------------------------------------
        set background=dark
        syntax on
        syntax enable
        let g:pymode = 1
        set diffopt+=vertical    " split diffs vertically
        "------------------------------------------------------------------------------
        setlocal spell
        set nospell
        set spelllang=en_us
        set spellsuggest=best    " default and fast list.
        " set spelllang=de,tech_speak spell
        " set spellfile=~/.vim/spell/techspeak.utf-8.add
        " set spellfile=~/.vim/spell/en.utf-8.add " 'zg': add, 'zw': remove.
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
        "-While we're Vera, disable the zg (add to dzitionary) shortcut
        nnoremap zg z=

        "------------------------------------------------------------------------------------------
        " error: zg, zG, zw, zW, zug, zuG, zuw,
        " zuW, z=, u
        " :spellrepall).
        "------------------------------------------------------------------------------------------
        " I use two languages: Lithuanian and English. But I also want to add
        " a special pseudo-language to contain identifiers extracted from tags
        " file (this will eliminate false hits like printf).
        " set spelllang=lt,en,fromtags
        " https://rtfb.lt/projects/vim-dox-spell/index.html
        "------------------------------------------------------------------------------------------
        "nnoremap vv ^vg_
        "nnoremap <silent> vv <C-w>v
        "------------------------------------------------------------------------------------------
        "char = can be removed from the list of valid filename char. JAVA_HOME=/opt/java/jdk1.4
        set isfname-==
        "-Go to last edit position when opening files----------------------------------------------
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
        "------------------------------------------------------------------------------------------

"-AAA1-Tags-BackUp------------------------------------------------------------------------------------------{{{
        set tags=./tags;/,~/.vimtags
        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        "------------------------------------------------------------------------------------------
        if gitroot != ''
                let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
        "------------------------------------------------------------------------------------------
        set backup 
        set noswapfile
        set undodir=~/.config/nvim/undoDir/      " undo files
        set backupdir=~/.config/nvim/backUpDir/  " backups
        set directory=~/.config/nvim/swapDir/    " swap files
        "-----------------------------------------------------
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
        set guifont=Monospace\ 14
        set cinwords=if,else,while,do,for,switch,case
        set matchpairs=(:),{:},[:],<:>
"-1Tags-}}}
"-AAA2--SetUp-Appearance--Edit--Clipboard--Bell--ExpandTab-Hist--SmartEnter---------------------------------{{{
        let g:bling_time = 42
        let g:bling_color_fg = 'green'
        let g:bling_color_cterm = 'reverse'
        "-magic------------------------------------------------------------------------------------
        silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
            " \v: 'very magic', make every character except a-zA-Z0-9 and '_' have special meaning
            " use \v and \V to switch 'very magic' on or off.
            " \m, \M: 'magic' mode.
            " use \m and \M to switch 'magic' on or off.
        "-Appearance------------------------------------------------------------------------------------------- 
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
        set noruler
        set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                        "    means that the current buffer can be put
                                        "    to background without being written; and
                                        "    that marks and undo history are preserved
        "-Editing----------------------------------------------------------------------------------------------
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
                autocmd filetype python setlocal formatoptions-=t " But disable autowrapping
                " do not auto insert comment chars on newline
                autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
                " Global
                set hidden               " Hide buffer instead of abandoning when unloading
                set ruler                " ???
        "-2.1-}}}
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
        "-Performance------------------------------------
        silent! set updatetime=300 timeout timeoutlen=300 ttimeout ttimeoutlen=50 ttyfast lazyredraw
        "-Bell-Bell-Bell---------------------------------
        silent! set noerrorbells visualbell t_vb=
        "-Always open read-only when a swap file is found
        autocmd! vimrc SwapExists * let v:swapchoice = 'o'
        "-Setting lazyredraw causes a problem on startup
        autocmd! vimrc VimEnter * redraw
        "-Enter, I never use the default behavior of <cr> and this saves me a keystroke...
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

"-AAA3-nPlugStart-------------------------------------------------------------------------------------------{{{
call plug#begin()
        Plug 'c9s/helper.vim'
        Plug 'c9s/treemenu.vim'
        "------------------------------------------------------------------------- 
        Plug 'tyru/capture.vim'
                ":Capture mes
                ":Capture map | map! | lmap
                ":Capture scriptnames
                ":Capture digraphs
        "-------------------------------------------------------------------------
        Plug 'exvim/ex-matchit'
        Plug 'AndrewRadev/undoquit.vim'
                let g:undoquit_mapping = ';q'  "c-w u 
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
                map <m-c> :cscope find c <C-R>=@m<CR><CR>
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
                autocmd! BufEnter * :call BookmarkMapKeys()
                        highlight BookmarkSign ctermbg=9 ctermfg=1
                        highlight BookmarkLine ctermbg=9 ctermfg=1
                        highlight BookmarkAnnotationLine ctermbg=9 ctermfg=1
                        highlight BookmarkAnnotationSign ctermbg=9 ctermfg=1
                let g:bookmark_auto_close = 1
                let g:bookmark_highlight_lines = 1          
                let g:bookmark_show_warning = 0           
                let g:bookmark_show_toggle_warning = 0      
                let g:bookmark_sign = '♥'
                let g:bookmark_highlight_lines = 1
                let g:bookmark_save_per_working_dir = 1
                let g:bookmark_auto_save = 1
                let g:bookmark_save_per_working_dir = 1  
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
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-repeat'         " Intelligent repeat with '.'
        Plug 'thinca/vim-quickrun'
        Plug 'ivyl/vim-bling'
        Plug 'brooth/far.vim'
        Plug 'xolox/vim-misc'
        Plug 'xolox/vim-easytags'
                "let g:easytags_file = '~/.vim/tags'
                let g:easytags_auto_highlight = 1
                let g:easytags_syntax_keyword = 'always'
                let g:easytags_events = ['BufWritePost']
        Plug 'vim-scripts/tagselect'
        Plug 'ludovicchabant/vim-gutentags'
        Plug 'unblevable/quick-scope'
                "let g:qs_enable=0
                augroup qs_colors
                        autocmd!
                        autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=10 cterm=underline
                        autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=50 cterm=underline
                augroup END
        "------------------------------------------------------------------------------------------
        Plug 'majutsushi/tagbar'
                highlight TagbarHighlight   ctermfg=051 ctermbg=none cterm=bold
                highlight TagListTagName    ctermfg=250
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
                let g:indentLine_color_term = 10
                "let g:indentLine_setConceal = 0
                "let g:indentLine_bgcolor_term = 202
        "-------------------------------------------------------------------------
        Plug 'Shougo/vimfiler.vim'
                map fv :VimFiler<CR>
                map fd :VimFilerCurrentDir<CR>
        "------------------------------------------------------------------------------------------
        Plug 'scrooloose/syntastic'
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
        Plug 'godlygeek/tabular'
                " abc,def,ghi , some , shrt 
                " a,b,c
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
        Plug 'vim-scripts/tinykeymap'
"--------------------------------------------------------------------------------- 
        Plug 'skywind3000/vim-preview'
                "???
"--------------------------------------------------------------------------------- 
        Plug 'kshenoy/vim-signature'
                " :SignatureListMarkers         : List all markers
                " :SignatureListMarkers 1       : List only the '!' marker
                " :SignatureListMarkers @       : List only the '@' marker
                " :SignatureListMarkers 0, 2    : List only ) marker with 2 lines of context
                " :SignatureListMarkers '', 2   : List all markers with 2 lines of context
                " :SignatureListMarkers '!@', 2 : List only the '!' and '@' markers and show
        Plug 'krisajenkins/vim-pipe'
                autocmd BufNewFile,BufReadPost *.json setlocal filetype=javascript.json
                let b:vimpipe_command="lynx -dump -stdin"
                let b:vimpipe_command='jslint <(cat)'
                let b:vimpipe_command="python -m json.tool"
                let b:vimpipe_command="multimarkdown"
                "let b:vimpipe_filetype="html"
                " g:vimpipe_invoke_map    <LocalLeader>r
                " g:vimpipe_close_map     <LocalLeader>p
"--------------------------------------------------------------------------------- 
        Plug 'junegunn/gv.vim'
                " o or <cr> on a commit to display the content of it
                " o or <cr> on commits to display the diff in the range
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
                " let g:brightest#highlight = { "group" : "DiffText" }
                " let g:brightest#highlight = { "group" : "CtrlPNoEntries" }
                " let g:brightest#highlight = { "group" : "Exception" }
                let g:brightest#highlight = { "group" : "Define" }
"--------------------------------------------------------------------------------- 
        Plug 'airblade/vim-gitgutter'
        Plug 'tpope/vim-fugitive'
        "------------------------------------------------------------------------------------------
        " fugitive  Intuitive and Simple Git wrapper for Vim.
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
        Plug 'int3/vim-extradite'
                " :Extradite | :Extradite! -- vertical.
                " nnoremap <F9> :Extradite<cr>
                let g:extradite_width = 60
                let g:extradite_showhash = 1 "show abbre commit hashes.
"--------------------------------------------------------------------------------- 
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
"------------------------------------------------------------------------------------------
        Plug 'michaeljsmith/vim-indent-object'
                let g:indent_object_except_first_level = 0
                " <count>ai      (A)n (I)ndentation level and line above.
                " <count>ii      (I)nner (I)ndentation level (no line above).
"------------------------------------------------------------------------------------------
        " Plug 'killphi/vim-textobj-signify-hunk'
        Plug 'kana/vim-textobj-user'
        Plug 'gilligan/textobj-gitgutter'
                vmap ih <Plug>(textobj-gitgutter-i)
        Plug 'kana/vim-textobj-diff'
        Plug 'reedes/vim-textobj-sentence'
        Plug 'kana/vim-textobj-function'
        Plug 'Julian/vim-textobj-brace'
        Plug 'glts/vim-textobj-indblock'
        Plug 'beloglazov/vim-textobj-quotes'
        "------------------------------------------------------
                nmap ]c <Plug>gitgutternexthunk
                nmap [c <Plug>gitgutterprevhunk
        "------------------------------------------------------
        Plug 'terryma/vim-expand-region'
                 "-Default-settings. 
                 let g:expand_region_text_objects = {
                                         \ 'iw'  :0,
                                         \ 'iW'  :0,
                                         \ 'i"'  :1,
                                         \ 'i''' :1,
                                         \ 'i]'  :1,
                                         \ 'i}'  :1,
                                         \ 'ib'  :1,
                                         \ 'iB'  :1, 
                                         \ 'if'  :1,
                                         \ 'io'  :1,
                                         \ 'ip'  :1,
                                         \ 'ih'  :1
                                         \ }
        "----------------------------------------------------------------------------------
        " function! XxYx()
        "         {(hello) 
        "                 {
        "                         if(){
        "                                 echo ('pyramida')
        "                                                 ('hallo "noch" ')
        "                                                 ( noch )
        "                                 echo ('pyramida')
        "                                 }
        "                         ( noch )
        "                 }
        "         (mal) tomos
        "         }
        " endfunction
        "----------------------------------------------------------------------------------
                nmap <m-1> <esc>viq<left> 
                        nmap <m-q> <esc>vaq<left> 
                                nmap <m-b> <esc>vab<left> 
                                        nmap <m-3> <esc>viB 
                                                nmap <m-o> <esc>vio 
                                                nmap <m-9> <esc>vaf 
                                nmap <m-8> <esc>vif 
                        nmap <m-7> <esc>vip 
                nmap <m-6> <esc>vih 
        "------------------------------------------------------------------------------------------
        Plug 'adriaanzon/vim-textobj-matchit'
                "`am` and `im` :if-ifend for-forend etc.
        "------------------------------------------------------------------------------------------
        Plug 'tpope/vim-surround'
                " +-----------------------+----------+----------------------------+
                " | 'Hello *world!'       |  ds'     |  Hello world!              |
                " | [123+4*56]/2          |  cs])    |  (123+456)/2               |
                " | 'Look ma, I'm *HTML!' |  cs'<q>  |  <q>Look ma, I'm HTML!</q> |
                " +-----------------------+----------+----------------------------+
        "------------------------------------------------------------------------------------------
        Plug 'machakann/vim-sandwich'
                "sd,sr, sa{motion/textobject}{addition}	(normal and visual mode)
                "let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
                " Sandwiched text could be resolved into two parts, {surrounding} and {surrounded text}.
                " sa add surroundings: mapped to the key sequence sa
                " sd Delete surroundings: mapped to the key sequence sd
                " sr Replace surroundings: mapped to the key sequence sr
                " ib Search and select a sandwiched text automatically: mapped to the key sequence ib and ab
                " is Search and select a sandwiched text with query: mapped to the key sequence is and as
                " da" will delete a quoted string.
                "(Sandwitch) 
                nmap s <Nop>
                xmap s <Nop>
        "--------------------------------------------------------------
                let g:textobj_sandwich_no_default_key_mappings = 1
                omap ia <Plug>(textobj-sandwich-auto-i)
                xmap ia <Plug>(textobj-sandwich-auto-i)
                omap aa <Plug>(textobj-sandwich-auto-a)
                xmap aa <Plug>(textobj-sandwich-auto-a)
        "------------------------------------------------------------------------------------------
        "-wrap <b></b> around selected text
                vmap sb "zdi<b><c-r>z</b><esc>
        "-wrap <?=   ?> around visually selected text
                vmap st "zdi<?= <c-r>z ?><esc> 
        "-------------------------------------------
        "------------------------------------------------------------------------------------------ 
        nnoremap <buffer> <F2> <Esc>:help <C-r><C-w><CR>
        nnoremap <buffer> <C-F2> <Esc>:helpgrep <C-r><C-w><CR>
        "--K-help----------------------------------------------
        autocmd! vimrc FileType help if &l:buftype ==# 'help' | wincmd K | endif
        "------------------------------------------------------------------------------------------
        "---F3-------------------------------------------------------------------------------------
        "---F4-------------------------------------------------------------------------------------
        "------------------------------------------------------------------------------------------
        autocmd filetype python noremap <buffer> <F5> :w<CR>:!python %<CR>
        autocmd filetype python inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
        autocmd filetype python noremap <buffer> <S-F5> :w<CR>:!ipython %<CR>
        autocmd filetype python inoremap <buffer> <S-F5> <Esc>:w<CR>:!ipython %<CR>
        "------------------------------------------------------------------------------------------
        "---F6-------------------------------------------------------------------------------------
        "------------------------------------------------------------------------------------------
        " Maybe these mappings should be moved into FT_C() ?
        " Toggle between .c (.cc, .cpp) and .h                          
        " ToggleHeader defined inHOME/.vim/plugin/cpph.vim
        map       ,h          :call ToggleHeader()<CR>
        map       <C-F6>      ,h
        imap      <C-F6>      <C-O><C-F6>
        "------------------------------------------------------------------------------------------
        nnoremap <F7> :ScratchPreview<CR>
        "------------------------------------------------------------------------------------------
        " There's no way to close the quickfix window without jumping to it and :q or
        "------------------------------------------------------------------------------------------
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
        "------------------------------------------------------------------------------------------
        "-Open-Quickfix-window-automatically-------------------------------------------------------
        autocmd QuickFixCmdPost grep cwindow
        autocmd! vimrc QuickfixCmdPost [^l]* nested copen | wincmd p
        autocmd! vimrc QuickfixCmdPost l* nested lopen | wincmd p
        "------------------------------------------------------------------------------------------
        nnoremap <F9> :call ToggleQuickFix()<CR>
                nnoremap <Leader>b :cprev<cr>zvzz
                nnoremap <Leader>n :cnext<cr>zvzz
        "------------------------------------------------------------------------------------------
        nnoremap <F10> :SyntasticCheck<CR>
        "------------------------------------------------------------------------------------------
        "---F11------------------------------------------------------------------------------------
        "------------------------------------------------------------------------------------------
        nnoremap <F12> :TagbarToggle<CR>
        "----------------------------------------------------------------------------------
        Plug 'romainl/vim-qf'
        Plug 'yssl/QFEnter'
        Plug 'sk1418/QFGrep'
        Plug 'AndrewRadev/qftools.vim'
        "----------------------------------------------------------------------------------
        "----------------------------------------------------------------------------------
        Plug 'wellle/visual-split.vim'
                " :VSSplit, :VSSplitAbove or :VSSplitBelow to create the split
                " :VSResize to execute the VSResize ex command on the selected range
                nmap <C-W>r  <Plug>(Visual-Split-Resize)
                nmap <C-W>s <Plug>(Visual-Split-Split)
        Plug 'gastonsimone/vim-dokumentary/'
                "??? apt-get install dictd dict-gcide dict
        "---------------------------------------------------------------------------------- 
        Plug 'vim-scripts/mako.vim'
                "g:mako_detect_lang_from_ext = 1
        Plug 'sophacles/vim-bundle-mako'
        Plug 'aperezdc/vim-template'
        "---------------------------------------------------------------------------------- 
        Plug 'amiorin/vim-project'
        "---------------------------------------------------------------------------------- 
        Plug 'wavded/vim-stylus'                " stylus
        Plug 'octol/vim-cpp-enhanced-highlight' " C++
        Plug 'pboettch/vim-cmake-syntax'        " CMake
        "---------------------------------------------------------------------------------- 
        Plug 'kien/ctrlp.vim'
        Plug 'tpope/vim-unimpaired'  " Handy bracket mappings.
        Plug 'mtth/scratch.vim'
        "----------------------------------------------------
        Plug 'henrik/vim-qargs'
        Plug 'mileszs/ack.vim'
        Plug 'vim-scripts/YankRing.vim'
                ":YRShow
                "let g:yankring_n_keys = 'Y D x X'
                "let g:yankring_window_use_right = 1
                let g:yankring_window_use_bottom = 1
                let g:yankring_window_use_horiz = 1  " Use vertical split 0
                let g:yankring_window_height = 12
                let g:yankring_record_insert = 1
                let g:yankring_window_auto_close = 1
                let g:yankring_window_use_separate = 1
                let g:yankring_persist = 1
                let g:yankring_max_history = 100
                "let g:yankring_replace_n_pkey = '<m-p>'
                let g:yankring_replace_n_nkey = 'zb'
        Plug 'maxbrunsfeld/vim-yankstack'
                nmap zp <Plug>yankstack_substitute_older_paste
                nmap zn <Plug>yankstack_substitute_newer_paste
        "--------------------------------------
        Plug 'jremmen/vim-ripgrep'
        Plug 'Chun-Yang/vim-action-ag'
        Plug 'rking/ag.vim'
        Plug 'jesseleite/vim-agriculture'
        "--------------------------------------
        Plug 'vim-scripts/ReplaceWithRegister'
        "----------------------------------------------------------------------------------
        Plug 'tpope/vim-sleuth'         " indet reight ?
        "----------------------------------------------------------------------------------
        Plug 'neomake/neomake'
        "Plug 'Rykka/trans.vim'
        Plug 'ron89/thesaurus_query.vim'
        Plug 'Shougo/vimshell.vim'
        Plug 'tpope/vim-dispatch'
        Plug 'nixprime/cpsm'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
        "---------------------------------------------------------------------------------- 
        "Plug 'roxma/nvim-completion-manager'
        "---------------------------------------------------------------------------------- 
        Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
        Plug 'Valloric/YouCompleteMe'
        Plug 'davidhalter/jedi-vim'
        Plug 'Shougo/neocomplete.vim'
        "---------------------------------------------------------------------------------- 
        Plug 'ervandew/supertab'
        "---------------------------------------------------------------------------------- 
        Plug 'honza/vim-snippets'
        Plug 'SirVer/ultisnips'
        Plug 'garbas/vim-snipmate'
        Plug 'Shougo/neosnippet.vim'
        Plug 'Shougo/neosnippet-snippets'
        "--------------------------------------------------------------------------------- 
        Plug 'haya14busa/incsearch.vim'
        Plug 'vim-scripts/SearchComplete'
        "--------------------------------------------------------------------------------- 
        Plug 'jalvesaq/vimcmdline'
        "--------------------------------------------------------------------------------- 
        Plug 'jalvesaq/Nvim-R'
        Plug 'tpope/vim-eunuch'
        "--------------------------------------------------------------------------------- 
        Plug 'tomtom/tlib_vim'       
        Plug 'MarcWeber/vim-addon-mw-utils'
        "--------------------------------------------------------------------------------- 
        Plug 'Shougo/neomru.vim'
        Plug 'wincent/command-t'
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
        "----------------------------------------------------------------------------------
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
        Plug 'auwsmit/vim-hydra'
        Plug 'dhruvasagar/vim-table-mode'
                let g:table_mode_corner_corner='+'
                let g:table_mode_header_fillchar='='
                " :TableModeToggle
        "--------------------------------------------------------------------------------- 
                " | hallo | albert  | montag |
                " +=======+=========+========+
                " | isr   | student | id     |
                " +-------+---------+--------+
call plug#end()
        source ~/git/aTest/dotFiles/nVim/mix/n-badwolf.vim 
        source ~/git/aTest/dotFiles/nVim/myPlug/nHydra.vim 
"-nPlugEnd-3-}}}

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
        " turn off that preview window that shows the issue body
        " only show completion as a list instead of a sub-window
        " see: https://github.com/tpope/vim-rhubarb
        "set completeopt-=preview
        "set completeopt=preview,menuone
        set completeopt=longest,menuone
        "---???------------------------------------------------------------------------------------
        set omnifunc=syntaxcomplete#Complete
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
        "------------------------------------
        " imap <leader><tab> <C-x><C-o>
        "==========================================================================================
        set runtimepath+=~/.config/nvim/plugged/neosnippet.vim/
        set runtimepath+=~/.config/nvim/plugged/neosnippet-snippets/
        "------------------------------------------------------------------
        " let g:neosnippet#snippets_directory = '~/.vim/snippets'     "Tell Neosnippet about the other snippets
        "------------------------------------------------------------------
        let g:neosnippet#enable_snipmate_compatibility = 1
        "==========================================================================================
        set pumheight=12
        hi Pmenu  ctermfg=202 ctermbg=14
        hi PmenuSbar   ctermfg=11 ctermbg=5 cterm=NONE
        hi PmenuThumb  ctermfg=12 ctermbg=2 cterm=NONE
"-5-Complete-}}}
"-AAA6--GitGutter-------------------------------------------------------------------------------------------{{{
        "------------------------------------------------------------------------------------------
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
        " This will replace text and save the buffers for each file found by GitGrep in the previous search.
        " :GitGrep foo.*bar
        " :Qdo %s/foo.*bar/baz/g | update
"-6-}}}
"-AAA7--Abbr------------------------------------------------------------------------------------------------{{{
        "-Unfuck--my--screen-
        nnoremap U :syntax sync fromstart<cr>:redraw!<cr>
        "-Command mode related ???
        cno $h e ~/
        cno $d e ~/Desktop/
        cno $j e ./
        cno $c e <C-\>eCurrentFileDir("e")<cr>
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
        "??? Map auto complete of (, ", ', [
        inoremap $q ''<esc>i
        inoremap $e ""<esc>i
        "Spelling corrects. Just for example. Add yours below.
        iab teh the
        iab Teh The

        abb dlin "==================================================================================
        abb alin "AAA--------------------------------------------------------------------------------
        iabbrev yyy "---------------------------------------------------------------------------------
        iabbrev yyy1 "---------------------------------------------------------------------------------------------
        iabbrev yyy2 "--------------------------------------------------------------------------------------{{{
        iabbrev yyy3 "-}}}

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
        " My information
        iab xname <C-R> William Durand
        iab xsigp <C-R> William Durand <will+git@drnd.me>
"-7Abbr-}}}
"-AAA8--Jump-----------------------------------------------------------------------------------------------{{{
        set cinoptions=N-s,g0,+2s,l-s,i2s
        "------------------------------------------------------------------------------------------
                nnoremap zO zczO
                "-Focus the current line.  Basically:
                "-1. Close all folds.
                function! FocusLine()
                        let oldscrolloff = &scrolloff
                        set scrolloff=0
                        execute "keepjumps normal! mzzMzvzt25\<c-y>\<cr>"
                        let &scrolloff = oldscrolloff
                endfunction
                nnoremap zf :call FocusLine()<cr>
                "-Mappings to easily toggle fold levels
                nnoremap z1 :set foldlevel=1<cr>
                nnoremap z2 :set foldlevel=2<cr>
                nnoremap z3 :set foldlevel=3<cr>
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
"-AAA9--BookMarks------------------------------------------------------------------------------------------{{{

        "----------------------------------------------------------------------------------
        " dmx          Remove mark 'x' where x is a-zA-Z
        " m,           Place the next available mark
        " m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
        " m-           Delete all marks from the current line
        " m<Space>     Delete all marks from the current buffer
        " ]`           Jump to next mark
        " [`           Jump to prev mark
        " ]'           Jump to start of next line containing a mark
        " ['           Jump to start of prev line containing a mark
        " `]           Jump by alphabetical order to next mark
        " `[           Jump by alphabetical order to prev mark
        " ']           Jump by alphabetical order to start of next line having a mark
        " '[           Jump by alphabetical order to start of prev line having a mark
        " m/           Open location list and display marks from current buffer
        "----------------------------------------------------------------------------------
        " m[0-9]       Toggle the corresponding marker !@#$%^&*()
        " m<S-[0-9]>   Remove all markers of the same type
        " ]-           Jump to next line having a marker of the same type
        " [-           Jump to prev line having a marker of the same type
        " ]=           Jump to next line having a marker of any type
        " [=           Jump to prev line having a marker of any type
        " m?           Open location list and display markers from current buffer
        " m<BS>        Remove all markers
        "----------------------------------------------------------------------------------
"-9BookMarks-}}}

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
        "----------
        "----------

        "-------------------------------------------------------------------------
        "Clear hlsearch and set nopaste
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
        nnoremap ;x :tabcl<cr>:call wipeout()<cr>


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
                au!
                " autocmd FileType diff setlocal foldmethod=expr
                autocmd FileType diff setlocal foldexpr=DiffFoldLevel()
        augroup END
        " See :help DiffOrig
        command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis \ | wincmd p | diffthis
        " diffoff used to set wrap as a side effect
        command! Diffoff        diffoff | setlocal nowrap
"-12Diff-}}}
"-AAA13-SyntasticCheck--------------------------------------------------------------------------------------{{{
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

        "-fun-with-unicode-
        let g:syntastic_error_symbol = '⚡'
        let g:syntastic_warning_symbol = '⚠'
        " let g:syntastic_python_checkers=['python', 'flake8']
        " let g:syntastic_python_flake8_post_args='--ignore=W391'
        " For forcing the use of flake8, pyflakes, or pylint set
        " let g:syntastic_python_checkers = ['pyflakes']
        let g:syntastic_python_checkers = ['flake8']

"-13-}}}
"-AAA14-Doc8------------------------------------------------------------------------------------------------{{{
        let wordUnderCursor = expand("<cword>")
        let currentLine   = getline(".")
"-14--}}}

"-AAA15-Cyan------------------------------------------------------------------------------------------------{{{
        " highlight DiffAdd         cterm=bold ctermbg=none ctermfg=119
        " highlight DiffDelete      cterm=bold ctermbg=none ctermfg=167
        " highlight DiffChange      cterm=bold ctermbg=11 ctermfg=227
        highlight DiffChange        cterm=bold ctermbg=7 
        "------------------------------------------------------------------------------------------
        "suppress intro message because the above makes it look bad
        set shortmess+=I
        "???-Highlight VCS conflict markers
        match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
        highlight ErrorMsg  guifg=red guibg=white
        " highlight conflict markers
        match ErrorMsg '\v^[<\|=|>]{7}([^=].+)?$'
        "-???-ccc-shortcut to jump to next conflict marker
        nnoremap <silent> <leader>c /\v^[<\|=>]{7}([^=].+)?$<CR>
        "easier on the eyes
        highlight Folded ctermbg=10
        "fold column aka gutter on the left
        highlight FoldColumn ctermbg=9 ctermfg=0 guibg=#ffffd7
        "avoid invisible color combination (red on red)
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
                hi Define         ctermfg=10       ctermbg=16 
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
                hi ColorColumn                 ctermbg=9
                set colorcolumn=8,92,100,112,120
                "hi Visual guifg=NONE guibg=NONE
                " GitGutter
                set signcolumn=yes
                hi signcolumn  ctermbg=7
                hi LineNr ctermfg=9 ctermbg=14 
                hi Normal  ctermbg=236
                "hi Normal  ctermbg=53
                highlight Visual cterm=bold ctermbg=2 ctermfg=NONE
                 set listchars=tab:▸\
                 set listchars=tab:\|\ 
                 set list

                hi Cursor ctermbg=2 term= bold
                hi Comment         ctermfg=14
                hi Number          ctermfg=11
                set nuw =5
        highlight ShowMatches ctermbg=16 
        "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=16
        au! Cursorhold * exe 'match ShowMatches /\v%(%#\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*%#\})/'
"-15Cyan-}}}
"-AAA16-Airline---------------------------------------------------------------------------------------------{{{
        let g:airline_theme='light'
        let generate_tags=1
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

"-16-}}}
"-AAA17-Wildmenu--------------------------------------------------------------------------------------------{{{
        " More useful command-line completion
        au FocusLost * :silent! wall     "Save when losing focus
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
        " Clojure/Leiningen
        set wildignore+=classes
        set wildignore+=lib
        " Command line
        "silent! set wildchar=9 nowildmenu wildmode=list:longest wildoptions= wildignorecase cedit=<C-k>
"-17-}}}
"-AAA18-TEST2-----------------------------------------------------------------------------------------------{{{

        "Instead of setting 'verbose' in your vimrc, use autocommands, as follows (for instance)
        if &cmdheight == 1
                set cmdheight=2
        endif
        if &verbose == 0
                augroup late-verbose
                        autocmd!    VimEnter    *    set verbose=1
                        autocmd!    VimLeave    *    set verbose=0
                augroup END
        endif

        "------------------------------------------------------------------------------------------ 
        "This adds :G <pattern> command which runs "git grep <pattern>".
        fun! Git2GREP(...)
                let save = &grepprg
                set grepprg=git\ grep\ -n\ $*
                let s = 'grep'
                for i in a:000
                        let s = s . ' ' . i
                endfor
                exe s
                let &grepprg = save
        endfun
        command! -nargs=? GGR call Git2GREP(<f-args>)
        "------------------------------------------------------------------------------------------ 
        fun! ScrollOtherWindow(dir)
                if a:dir == "down"
                        let move = "\<C-E>"
                elseif a:dir == "up"
                        let move = "\<C-Y>"
                endif
                exec "normal \<C-W>p" . move . "\<C-W>p"
        endfun

       "---------NoAutoClose-YCM------------------------------------------------------------------- 
        "-Shortcut for closing tags, default is '>'
        " let g:closetag_shortcut = '>'
        " let g:closetag_filenames = '*.vim,*.html,*.xhtml,*.phtml'
        " let g:AutoClosePairs = "() {} \""
        " " add <angular brackets> and |pipes|
        " let g:AutoClosePairs_add = "<> |"
        " " don't close apostrophes
        " let g:AutoClosePairs_del = "'"
        " let g:AutoCloseProtectedRegions = ["Comment", "String", "Character"]
        "---------------------------------------------------------

        let g:qf_mapping_ack_style = 1
        let g:qf_window_bottom = 0
        let g:qf_auto_open_loclist = 0
        let g:qf_max_height = 8
        let g:qf_nowrap = 1

        "---------------------------------------------------------
        "---This plugin map `gag` to do Ag search.
        " - `gagiw` to search the word
        " - `gagi'` to search the words inside single quotes.
        " - `gag` to search the selected text
        let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'

        "---------------------------------------------------------
        "-Compiling-C-source-In-Vim
        autocmd FileType c,cpp
                                \ if empty(glob("[Mm]akefile")) |
                                \   setlocal makeprg=make\ %< |
                                \ endif
        "---------------------------------------------------------

        "---------------------------------------------------------
        "-The %< in
        "our makeprg definition refers to the current file with its extension
        "stripped. We specifically only change the behaviour if no Makefile
        "exists so that we don’t interfere with the normal usage of the :make
        "command.
        "---------------------------------------------------------

"-18-}}}

"-AAA19-Py--------------------------------------------------------------------------------------------------{{{
        augroup python_files 
                au!

                " This function detects, based on Python content, whether this is a
                " Django file, which may enabling snippet completion for it
                fun! s:DetectPythonVariant()
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
                endfun
                autocmd BufNewFile,BufRead *.py call s:DetectPythonVariant()

                " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set
                " earlier, as it is important)
                autocmd filetype python setlocal textwidth=78
                autocmd filetype python match ErrorMsg '\%>120v.\+'


                " Folding for Python (uses syntax/python.vim for fold definitions)
                "autocmd filetype python,rst setlocal nofoldenable
                "autocmd filetype python setlocal foldmethod=expr


                " Automatic insertion of breakpoints
                autocmd filetype python nnoremap <buffer> <leader>bp :normal oimport pdb; pdb.set_trace()  # TODO: BREAKPOINT  # noqa<Esc>

                " Toggling True/False
                autocmd filetype python nnoremap <silent> <C-t> mmviw:s/True\\|False/\={'True':'False','False':'True'}[submatch(0)]/<CR>`m:nohlsearch<CR>

                " Run a quick static syntax check every time we save a Python file
                autocmd BufWritePost *.py call Flake8()

                " defer to isort for sorting python imports (instead of using unix sort)
                autocmd filetype python nnoremap <leader>s mx:%!isort -<cr>`x:redraw!<cr>
        augroup end 
"-19py-}}}


"-aaa20-remap-qq--------------------------------------------------------------------------------------------{{{
        inoremap jk <esc>
        nnoremap zu :<c-u>update<cr>
        "underline the current line with '-'
        nmap z- :t.<cr>vr-
        "------------------------------------------------------------------------------------------
        nnoremap ;a :e#<cr>
        nnoremap ;e :ls<cr>:b<space>
        nnoremap ;s :let @/=expand("<cword>") <bar> split <bar> execute 'normal n'<cr>
        nnoremap ;v <c-w>v<c-w>l
        nnoremap ;f :set tw=70<cr>v<s-}>gq<end>
        nnoremap w gwip
        "------------------------------------------------------------------------------------------
        nnoremap ( <c-x>:y x\|@x<cr>
        nnoremap ) <c-a>:y x\|@x<cr>
        "------------------------------------------------------------------------------------------
        nmap q <nop>
        nnoremap q q
        "------------------------------------------------------------------------------------------
        nnoremap ss :wa<cr>
        nnoremap qq :wa<cr> :bd<cr>
        nnoremap sq :wa<cr> :qa<cr>
        nnoremap qa :qa!<cr>
        "------------------------------------------------------------------------------------------
        nnoremap ge :w<cr>:e #<cr>
        "------------------------------------------------------------------------------------------
        map EE :source $MYVIMRC<CR>
        "------------------------------------------------------------------------------------------
        nnoremap ZZ  <Nop> "-Disable-ZZ-
        nnoremap ZZ mzzt1<c-u>`z
        nnoremap zh mzzt10<c-u>`z
        nnoremap zx mzzt35<c-u>`z
        "------------------------------------------------------------------------------------------
        "map EE :e $MYVIMRC<CR>
        "------------------------------------------------------------------------------------------
        nnoremap ga ggvg "sel all 
        "-it's-2018--------------------------------------------------------------------------------
        noremap j gj
        noremap k gk
        noremap gj j
        noremap gk k
        "-Bash-like-keys-for-the-command-line------------------------------------------------------
        cnoremap <C-A> <Home>
        cnoremap <C-E> <End>
        cnoremap <C-d> <Del>
        "Same when jumping around------------------------------------------------------------------
        nnoremap <c-o> <c-o>zz
        nnoremap <c-i> <c-i>zz
        "-HHJ- Keep the cursor in place while joining lines----------------------------------------
        nnoremap H mzJ`z
        "-Reselect-last-pasted text----------------------------------------------------------------
        nnoremap gv `[v`]
        "------------------------------------------------------------------------------------------
        noremap \\ #*
"-20Remap-}}}
"-AAA21-BigStart-Ag--CtrlP--Unite--BigList-400--------------------------------------------------------------{{{
        "g:fzf_command_prefix = 'Fzf'
        let g:fzf_action = {
                                \ 'ctrl-t': 'tab split',
                                \ 'ctrl-x': 'split',
                                \ 'ctrl-v': 'vsplit' }
        let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'
        "------------------------------------------------------------------------------------------
        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)
        "------------------------------------------------------------------------------------------
        function! s:fzf_statusline()
                highlight fzf1 ctermfg=161 ctermbg=0
                highlight fzf2 ctermfg=23 ctermbg=0
                highlight fzf3 ctermfg=237 ctermbg=0
                setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
        endfunction
        autocmd! User FzfStatusLine call <SID>fzf_statusline()
        "------------------------------------------------------------------------------------------
        "-[Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1
        "-[[B]Commits] Customize the options used by 'git log':
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
        "-[Tags] Command to generate tags file
        let g:fzf_tags_command = 'ctags -R'
        "-[Commands] --expect expression for directly executing the command
        let g:fzf_commands_expect = 'alt-enter,ctrl-x'
        "------------------------------------------------------------------------------------------
        "-fzf#vim#grep(command, with_column, [options], [fullscreen])
        command! -bang -nargs=* GGrep
                                \ call fzf#vim#grep(
                                \   'git grep --line-number '.shellescape(<q-args>), 0,
                                \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

        "-Override Colors command. You can safely do this in your .vimrc as fzf.vim
        command! -bang Colors
                                \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

        "------------------------------------------------------------------------------------------
        " Augmenting Ag command using fzf#vim#with_preview function
        "  :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
        "  :Ag! - Start fzf in fullscreen and display the preview window above
        "------------------------------------------------------------------------------------------
        command! -bang -nargs=* Ag
                                \ call fzf#vim#ag(<q-args>,
                                \                 <bang>0 ? fzf#vim#with_preview('up:60%')
                                \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
                                \                 <bang>0)
        "------------------------------------------------------------------------------------------
        "-Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
        command! -bang -nargs=* Rg
                                \ call fzf#vim#grep(
                                \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
                                \   <bang>0 ? fzf#vim#with_preview('up:60%')
                                \           : fzf#vim#with_preview('right:50%:hidden', '?'),
                                \   <bang>0)
        "-Files command with preview window
        "------------------------------------------------------------------------------------------
        command! -bang -nargs=? -complete=dir Files
                                \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
        "------------------------------------------------------------------------------------------
        call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
                                \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))
        "------------------------------------------------------------------------------------------
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        call unite#filters#matcher_default#use(['matcher_fzf'])
        call unite#filters#sorter_default#use(['sorter_rank'])
        "------------------------------------------------------------------------------------------
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
        "------------------------------------------------------------------------------------------
        "   - :Unite [{options}] {source's'}
        "    - parameters of source
        "        - e.g. file:foo:bar -- here ['foo', 'bar'] is parameters
        "        - e.g. file:foo\:bar -- use \ to escape
        "        - e.g. file:foo::bar -- ['foo', '', 'bar']
        "   - press 'I' to search after prompt '>'
        "       - *word,
        "       - **/foo (directory recursively)
        "       - foo bar (AND)
        "       - foo|bar (OR)
        "       - foo !bar (negative)
        "   - :UniteResume, :UniteBookmarkAdd,
        "------------------------------------------------------------------------------------------
        let g:unite_source_history_yank_save_clipboard = 1
        let g:unite_source_mark_marks = "abcdefghijklmnopqrstuvwxyz"
                                \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""
        "------------------------------------------------------------------------------------------
        "let g:unite_no_default_keymappings = 1 " don't map default key mappings
        "------------------------------------------------------------------------------------------
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
        "------------------------------------------------------------------------------------------
        let g:ctrlp_cmd = 'CtrlPMRU'
        let g:ctrlp_extensions = ['tag']
        let g:ctrlp_match_window_bottom = 0
        let g:ctrlp_match_window_reversed = 0
        let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
        let g:ctrlp_dotfiles = 0
        let g:ctrlp_switch_buffer = 0
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_map = '<leader>e'
        let g:ctrlp_open_new_file = 'R'
        "------------------------------------------------------------------------------------------
        "let g:ctrlp_working_path_mode = 'ar'
        "----CommandT------------------------------------------------------------------------------
        " <Leader>t provide fast, intuitive mechanism for opening files and buffers
        " <BS> <Del> -- delete
        " <Left> <C-h> -- move left.
        " <Right> <C-l> -- move right
        " <C-a> -- move to the start.
        " <C-e> -- move to the end.
        " <C-u> -- clear the contents of the prompt.
        " <Tab> -- switch focus between the file listing and prompt.
        "----------------------------------------------------------------------------------
        " <C-CR> <C-s> -- split open
        " <C-v> -- vsplit
        " <C-t> -- tab
        " <C-j> <C-n> <Down> -- select next file in file listing.
        " <C-k> <C-p> <Up> -- select previous file in file listing.
        " <Esc> <C-c> -- cancel (dismisses file listing)
        "------------------------------------------------------------------------------------------
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
        "------------------------------------------------------------------------------------------
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
        "------------------------------------------------------------------------------------------
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
        "---------------------tests----------------------------------------------------------------
        "let g:neosnippet#enable_snipmate_compatibility = 1
        "------------------------------------------------------------------------------------------
        "-???- let g:EclimCompletionMethod = 'omnifunc'
        "------------------------------------------------------------------------------------------
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_error_symbol = 'x>'
        let g:ycm_warning_symbol = 'w>'
        let g:ycm_enable_diagnostic_signs = 1
        let g:ycm_add_preview_to_completeopt = 1
        let g:ycm_use_ultisnips_completer = 1
        let g:ycm_autoclose_preview_window_after_insertion = 0
        let g:ycm_key_detailed_diagnostics = '<leader>d'
        let g:ycm_key_invoke_completion = '<C-Space>'
        let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
        let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
        let g:ycm_key_list_stop_completion = ['<C-y>']
        map <C-;> :YcmCompleter GoToImprecise<CR>
        "******************************************************************************************
        autocmd FileType python setlocal omnifunc=jedi#completions
        "------------------------------------------------------------------------------------------
        let g:jedi#completions_enabled = 0
        let g:jedi#auto_vim_configuration = 0
        let g:jedi#popup_on_dot = 0
        let g:jedi#goto_assignments_command = "<localleader>g"
        let g:jedi#goto_definitions_command = "<localleader>d"
        let g:jedi#documentation_command = "K"
        let g:jedi#usages_command = "<localleader>u"
        "let g:jedi#rename_command = "<localleader>r"
        let g:jedi#show_call_signatures = "0"
        let g:jedi#completions_command = "<C-q>"
        "------------------------------------------------------------------------------------------
        let g:ycm_semantic_triggers =  {
                                \   'c': ['->', '.'],
                                \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
                                \            're!\[.*\]\s'],
                                \   'ocaml': ['.', '#'],
                                \   'cpp,cuda,objcpp': ['->', '.', '::'],
                                \   'perl': ['->'],
                                \   'php': ['->', '::'],
                                \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
                                \   'ruby,rust': ['.', '::'],
                                \   'lua': ['.', ':'],
                                \   'erlang': [':'],
                                \ }
        "---BigList-600-BliZZ----------------------------------------------------------------------
        " automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        "--------------Ulti-Expander-Unite-------------------------------------------------
        function! UltiSnipsCallUnite()
                Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
                return ''
        endfunction
        "------------------------------------------------------------------------------------------
        inoremap <silent> <F10> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
                let g:UltiSnipsListSnippets="<C-z>"
                let g:UltiSnipsExpandTrigger="<tab>"
                let g:UltiSnipsJumpForwardTrigger="<tab>"
                let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
        "------------------------------------------------------------------------------------------
            let g:neosnippet#snippets_directory = "~/.config/nvim/plugged/neosnippet-snippets/neosnippets/"
        "------------------------------------------------------------------------------------------
                imap <C-s>    <Plug>(neosnippet_start_unite_snippet)
                imap <C-b>    <Plug>(neosnippet_expand_or_jump)
                smap <C-b>    <Plug>(neosnippet_expand_or_jump)
                xmap <C-b>    <Plug>(neosnippet_expand_target)
        "------------------------------------------------------------------------------------------
            nnoremap ;n
                \ :exec ':NeoSnippetEdit -split -direction=topleft -horizontal'<CR>
                \ . &filetype<CR>
        "------------------------------------------------------------------------------------------
                "nnoremap <Leader>p :Unite grep<CR>
                nmap <C-u> :Unite buffer file_mru file <CR>
                nnoremap <Leader>\ :Unite -silent -vertical -winwidth=40  -direction=topleft -toggle outline<CR>
                nnoremap <Leader>u :Unite help file_mru file buffer file_rec bookmark <CR>
                nnoremap <Leader>' :Unite bookmark <CR>
                nnoremap <Leader>f :<C-u>UniteWithBufferDir -buffer-name=files file bookmark file/new<CR>
                nnoremap <Leader>r :<C-u>Unite -buffer-name=register register<CR>
        "------------------------------------------------------------------------------------------
                nnoremap <Leader>h :UniteWithCursorWord -silent help<CR>
                nnoremap <Leader>v :UniteWithCursorWord -silent -no-split -auto-preview line<CR>
        "------------------------------------------------------------------------------------------
                "nnoremap <Leader>y :<C-u>Unite -buffer-name=yanks<CR>
                nnoremap <Leader>y :<C-u>Unite -buffer-name=yanks history/yank<CR>
                nnoremap <Leader>i :<C-u>Unite -buffer-name=ultisnips ultisnips<CR>
                nnoremap <Leader>e :<C-u>Unite -buffer-name=neosnippet neosnippet<CR>
                nnoremap <Leader>m :<C-u>Unite -buffer-name=mapping mapping<CR>
                nnoremap <Leader>c :<C-u>Unite -buffer-name=change change<CR>
                nnoremap <Leader>j :<C-u>Unite -buffer-name=jump jump<CR>
                nnoremap <Leader>o :<C-u>Unite -buffer-name=command command<CR>
        "---BigList-700----------------------------------------------------------------------------
                nnoremap <Leader>l :lgrep -R <cword> .<cr>
                nnoremap <Leader>g :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
                nnoremap <Leader>a :Ack <cword> .<cr>
                map ? :Ack
        "-Plugin: agriculture----------------------------------------
                nmap <Leader>/ <Plug>AgRawSearch
                vmap <Leader>/ <Plug>AgRawVisualSelection
                nmap <Leader>* <Plug>AgRawWordUnderCursor
        "------------------------------------------------------------------------------------------
                "let g:CommandTCancelMap='<C-x>'
                "let g:CommandTCancelMap=['<C-x>', '<C-c>'] " multiple alternative mapping.
                nnoremap ;p :CtrlP<cr>
                nnoremap ;m :CtrlPMRU<cr>
                nnoremap ;t <Plug>(CommandTJump)
                nnoremap ;b <Plug>(CommandTBuffer)
                nnoremap ;h <Plug>(CommandTHelp)
        "---------------------FZF---------------------------------------------------------------------
                nnoremap ft :Files<Cr>
                nnoremap fg :GFiles<Cr>
                nnoremap fc :Commands<Cr>
                nnoremap fm :BCommits<Cr>
                nnoremap fh :Helptags<Cr>
                nnoremap fh :<C-u>History<cr>
                nnoremap fb :<C-u>Buffers<cr>
        "------------------------------------------------------------------------------------------
                inoremap <silent> <C-o> <C-x><C-o>
                inoremap <silent> <C-k> <C-x><C-k>
                inoremap <silent> <C-d> <C-x><C-d>
                inoremap <silent> <C-f> <C-x><C-f>
                inoremap <silent> <C-l> <C-x><C-l>
        "----------------------------------------------------
                imap <c-\> fzf#vim#complete#word({'left': '15%'})
                imap <C-l> <plug>(fzf-complete-line)
                imap <expr> <c-j> fzf#vim#complete(fzf#wrap({
                                        \ 'prefix': '^.*$',
                                        \ 'source': 'rg -n ^ --color always',
                                        \ 'options': '--ansi --delimiter : --nth 3..',
                                        \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

        "-------???---------------------------------------------------------------------------- 
                nmap <silent> <C-M-Down> :call ScrollOtherWindow("down")<CR>
                nmap <silent> <C-M-Up> :call ScrollOtherWindow("up")<CR>
        "---BigList-800----------------------------------------------------------------------------
                au FileType vim,help nnoremap K :exec "help" expand("<cword>")<CR>
                " toggle helpBuffer ?
        "------------------------------------------------------------------------------------------
                "g:SignatureForceRemoveGlobal
                "-  m,           Place the next available mark
                "-  m.           If no mark on line, place the next available mark. Otherwise
                "-  m-           Delete all marks from the current line
                "-  m<Space>     Delete all marks from the current buffer
                "-  ]`           Jump to next mark
                "-  [`           Jump to prev mark
                "-  ]'           Jump to start of next line containing a mark
                "-  ['           Jump to start of prev line containing a mark
                "-  `]           Jump by alphabetical order to next mark
                "-  `[           Jump by alphabetical order to prev mark
                "-  ']           Jump by alphabetical order to start of next line having a mark
                "-  '[           Jump by alphabetical order to start of prev line having a mark
                "-  m/           Open location list and display marks from current buffer
        "------------------------------------------------------------------------------------------
                "nnoremap <silent> <expr> <leader>d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"
                "nnoremap <leader>d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"
                vmap  dg  :dffget<CR>
                vmap  dp  :diffput<CR>
                nnoremap do :diffoff!<cr>
        "------------------------------------------------------------------------------------------
        nnoremap ;d mayiw`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
        inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a
        "------------------------------------------------------------------------------------------
        " President group Hotel
        "------------------------------------------------------------------------------------------
        let g:tq_language=['en', 'ru', 'de', 'cn']
        "------------------------------------------------------------------------------------------
        "! setlocal completefunc=thesaurus_query#auto_complete_integrate
        "! vnoremap  <Leader>c "ky:ThesaurusQueryReplace <C-r>k<CR>
        "! nnoremap  <Leader>c :ThesaurusQueryReplaceCurrentWord<CR>
        "! nnoremap <LocalLeader>c :ThesaurusQueryReplaceCurrentWord<CR>
        "! vnoremap <LocalLeader>c "ky:ThesaurusQueryReplace <C-r>k<CR>
        "------------------------------------------------------------------------------------------
        " If the cursor is on foo_bar_baz , then switching would produce "fooBarBaz"
        " and vice-versa. The logic is as follows:
        " inoremap <silent> <leader>t <ESC>:Trans<CR>
        " nnoremap <silent> <leader>t :Trans<CR>
        " vnoremap <silent> <leader>t :Trans<CR>
        " nnoremap <silent> <leader>td :TransSelectDirection<CR>
        " vnoremap <silent> <leader>td :TransSelectDirection<CR>
        "! sudo apt install translate-shell
        " set keywordprg=trans\ :en
        " Use <Shift-k> to view the translation of the word under the cursor.
        "---BigList-900----------------------------------------------------------------------------
        "" Open current line on GitHub
        noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>
        "------------------------------------------------------------------------------------------
        " double comma for limited virtual keyboards                    
        imap            ,,              <ESC>
        " open a file in the same dir as the current one               
        map <expr>      ,E              ":e ".curdir#get()."/"
        " open a file with same basename but different extension        
        map <expr>      ,R              ":e ".expand("%:r")."."
        "------------------------------------------------------------------------------------------
        " Undo in INSERT mode                                           
        " make it so that if I acidentally pres ^W or ^U in insert mode,
        " then <ESC>u wil undo just the ^W/^U, and not the whole insert
        " This is docmented in :help ins-special-special, a few pages down
        inoremap <C-W> <C-G>u<C-W>
        inoremap <C-U> <C-G>u<C-U>
        "------------------------------------------------------------------------------------------
        " Split previously opened file ('#') in a split window
        nnoremap <leader>sh :execute "leftabove vsplit" bufname('#')<cr>
        nnoremap <leader>sl :execute "rightbelow vsplit" bufname('#')<cr>
        "------------------------------------------------------------------------------------------
                nnoremap <C-j> :bn<cr>
                nnoremap <C-k> :bp<cr>
        "--------------------------------------------------
                nnoremap <m-right> :vertical resize +3<cr>
                nnoremap <m-left> :vertical resize -3<cr>
                nnoremap <m-up> :resize +3<cr>
                nnoremap <m-down> :resize -3<cr>
        "--------------------------------------------------
                noremap <S-j> :PreviewScroll -1<cr>
                noremap <S-l> :PreviewScroll +1<cr>
        "--------------------------------------------------
        " inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
        " inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>
"-AAA21-BigList1000-}}}

        "==========================================================================================
        ":w^M:!ispell %^M:e!^M^M
        "==========================================================================================
        " Highlight words to avoid in tech writing
        "==========================================================================================
        " http://css-tricks.com/words-avoid-educational-writing/
        highlight TechWordsToAvoid ctermbg=red ctermfg=white
        match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        autocmd BufWinEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        autocmd InsertEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        autocmd InsertLeave * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        autocmd BufWinLeave * call clearmatches()
