"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-NeoVimMix65FZF-NV-Unite"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"
" File: minit.vim
" Author: red
" Last Modified: 19 Feb 2019
"===================================================================================================
        set path+=.,/home/red/git/aTest/pyLabGitPdbPythonMode27
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
        "------------------------------------------------------------------------------------------
        augroup vimrc
                autocmd!
        augroup END
        "------------------------------------------------------------------------------------------
        "###Pymode???
        let g:pymode_python = 'python3'
        "------------------------------------------------------------------------------------------
        set background=dark
        syntax on
        syntax enable
        ":::::::::::::::::::::::::::-=NAVI2=-::::::::::::::::::::::::::::::::::::::::::::::::::::::
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

"-AAA4-undo-------------------------------------------------------------------------------------------------{{{
        set noswapfile
        set backup                               " enable backups
        set undodir=~/.config/nvim/undoDir/      " undo files
        set backupdir=~/.config/nvim/backUpDir/  " backups
        set directory=~/.config/nvim/swapDir/    " swap files
        "----------------------------------------------------------------------------------
        if !isdirectory(expand(&undodir))
                call mkdir(expand(&undodir), "p")
        endif
        if !isdirectory(expand(&backupdir))
                call mkdir(expand(&backupdir), "p")
        endif
        if !isdirectory(expand(&directory))
                call mkdir(expand(&directory), "p")
        endif
        "----------------------------------------------------------------------------------
        set undofile
        set undoreload=10000
"-4undo-}}}

"-AAA5--PreSetUp-Appearance--Edit--Clipboard--Bell--ExpandTab-Hist--SmartEnter------------------------------{{{
        "-magic--------    
        silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
        " \v: 'very magic', make every character except a-zA-Z0-9 and '_' have special meaning
        " use \v and \V to switch 'very magic' on or off.
        " \m, \M: 'magic' mode.
        " use \m and \M to switch 'magic' on or off.
        "-Appearance--- 
        silent! display=lastline,uhex nowrap wrapmargin=0 guioptions=ce key=
        silent! set noshowmatch  noshowmode cmdheight=1 cmdwinheight=10 
        silent! set noshowcmd ruler rulerformat= laststatus=2 statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c
        silent! set title titlelen=100 titleold= titlestring=%f noicon norightleft showtabline=1
        silent! set cursorline nocursorcolumn colorcolumn= concealcursor=nvc conceallevel=0 norelativenumber
        silent! set list listchars=tab:>\ ,nbsp:_ synmaxcol=800 ambiwidth=double breakindent breakindentopt=
        silent! set nosplitbelow nosplitleft startofline linespace=0 whichwrap=b,s scrolloff=1 sidescroll=0
        silent! set equalalways nowinfixwidth nowinfixheight winminwidth=3 winminheight=3 nowarn noconfirm
        silent! set fillchars=vert:\|,fold:\  eventignore= helplang=en viewoptions=options,cursor virtualedit=
        set nowrap
        "set whichwrap=b,s,h,l,<,>,[,]
        set splitbelow splitright
        set viminfo='20,\"80
        " read/write a .viminfo file, don't store more
        " means that the current buffer can be put
        " to background without being written; and
        " that marks and undo history are preserved
        "-Editing----------------------------------------------------------------------------------
        silent! set iminsert=0 imsearch=0 nopaste pastetoggle= nogdefault comments& commentstring=#\ %s
        silent! set smartindent autoindent shiftround shiftwidth=8 expandtab tabstop=4 smarttab softtabstop=8
        silent! set foldclose=all foldcolumn=1 nofoldenable foldlevel=0 foldmarker={{{,}}} foldmethod=marker foldminlines=6
        silent! set textwidth=0 backspace=indent,eol,start nrformats=hex formatoptions=cmMj nojoinspaces
        silent! set nohidden autoread noautowrite noautowriteall nolinebreak mouse=a modeline& modelines&
        silent! set noautochdir write nowriteany writedelay=0 verbose=0 verbosefile= notildeop noinsertmode
        set modelines=0

        "-AAA2.1-Extra vi-compatibility---------------------------------------------------------{{{
                set switchbuf=useopen    " reveal already opened files from the
                " do not auto insert comment chars on newline
                autocmd! FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
                " Global
                set hidden               " Hide buffer instead of abandoning when unloading
        "-2.1-}}}

        "------------------------------------------------------------------------------------------
        silent! set clipboard=unnamed
        silent! set clipboard+=unnamedplus
        "------------------------------------------------------------------------------------------
        "-Performance
        silent! set updatetime=300 timeout timeoutlen=300 ttimeout ttimeoutlen=50 ttyfast lazyredraw
        silent! set noerrorbells visualbell t_vb=
        "------------------------------------------------------------------------------------------

        "-Always open read-only when a swap file is found
        autocmd! vimrc SwapExists * let v:swapchoice = 'o'
        "-Setting lazyredraw causes a problem on startup
        autocmd! vimrc VimEnter * redraw
        "-Enter-I-never-use the default behavior of <cr> and this saves me a keystroke...
        nnoremap <cr> o<esc>
        "-Smart Enter 
        inoremap <silent><expr> <CR> (pumvisible() && bufname('%') !=# '[Command Line]' ? "\<C-e>\<CR>" : "\<C-g>u\<CR>")
        "-Go to the first non-blank character of the line after paragraph motions
        noremap } }^
        set history=7024
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
        set report=0 " always report changed lines
        "------------------------------------------------------------------------------------------
"-5SetUp-}}}

"-AAA2------------------------------------------------------------------------------------------------------{{{
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
        set diffopt+=vertical 
        "???2019
        set iskeyword+=.
        "------------------------------------------------------------------------------------------
        "char = can be removed from the list of valid filename char. JAVA_HOME=/opt/java/jdk1.4
        set isfname-==
        "- go to last edit position when opening files -
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
        set autowrite  " Writes on make/shell commands
        set cf         " Enable error files & error jumping.
        set nu
        "---------------------------------------------------------------------------------- 
        inoremap <F1> <ESC>
        nnoremap <F1> <ESC>
        vnoremap <F1> <ESC>
        "---------------------------------------------------------------------------------- 
"-2Remap-}}}

        source ~/git/aTest/dotFiles/nVim/DEO3.vim
        "source ~/git/aTest/dotFiles/nVim/DEO2.vim
        "source ~/git/aTest/dotFiles/nVim/nProtoFzfDeoLsJediSnip.vim
        ":::::::::::::::::::::::::::-=2=-::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        "source ~/git/aTest/dotFiles/nVim/logo1.vim
        source ~/git/aTest/dotFiles/nVim/mix/n-badwolf.vim 
        hi ColorColumn     ctermbg=22
        set colorcolumn=92,100,112,120
        "source ~/git/aTest/dotFiles/nVim/mix/n-mopkai.vim
        "source ~/git/aTest/dotFiles/nVim/1startNinit19.vim
        "source ~/git/aTest/dotFiles/nVim/nMinimumRC.vim
        "source ~/git/aTest/dotFiles/nVim/nMinimumNeo.vim
        "source ~/git/aTest/dotFiles/nVim/nMinimumYcmJedi.vim
        "source ~/git/aTest/dotFiles/nVim/nMinimumLangServ.vim
        "source ~/git/aTest/dotFiles/nVim/nMinimumNull.vim
        "source ~/git/aTest/dotFiles/nVim/nMinimumDeoJedi.vim "LanguageClientStart
        "source ~/git/aTest/dotFiles/nVim/nMinimumDeoJediOne.vim
        "source ~/git/aTest/dotFiles/nVim/nMinimumDeoJediRC.vim
        "source ~/git/aTest/dotFiles/nVim/nProtoDeoLSJediSnip.vim
        "01-source ~/git/aTest/dotFiles/nVim/nProtoFzfDeoLsJediSnip.vim
        "source ~/git/aTest/dotFiles/nVim/logoCyan.vim
        "------------------------------------------------------------------------------------------- 
        "source ~/git/aTest/dotFiles/nVim/myPlug/nHydra.vim 
        "let g:nnv_search_paths = ['~/git/aTest/pyLabGitPdbPythonMode27']
        "let g:nnv_search_paths = ['~/git/aTest/dotFiles/', '~/git/aTest/pyLabGitPdbPythonMode27' ]
        "------------------------------------------------------------------------------------------- 
        "source ~/git/aTest/dotFiles/nVim/myPlug/NNV.vim
        ":::::::::::::::::::::::::::-=3=-::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

"-aaa20-PrePLAY0-remap--------------------------------------------------------------------------------------{{{
        "Ex: :Ex Pull word under cursor into :Ex LHS of a subs ztitute (replace)
        "1y$  //yank current row to register 1
        "<C-r>a to paste from register a
        nnoremap <LocalLeader>w :<C-r>=expand("<cword>")<CR>
        nnoremap <LocaLeader>z :<C-r>=getline(".")<CR>
        "------------------------------------------------------------------------------------------
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
        nnoremap qa :bd<cr>
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
        vmap     dg  :diffget<CR>
        vmap     dp  :diffput<CR>
        nnoremap do  :diffoff!<cr>
        "------------------------------------------------------------------------------------------
        "??? inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a
        "-------------------------------------------------------------------------
        "Clear hlsearch and set nopaste
        nnoremap <silent> <Esc><Esc> :<C-u>set nopaste<CR>:nohlsearch<CR>
        "-------------------------------------------------------------------------
        nmap <silent> n nzz
        nmap <silent> N Nzz
        nmap <silent> g* g*zz
        nmap <silent> g# g#zz
        "--Super-useful! From an idea by Michael Naumann--
        vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
        vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
        "----------------------------------------------------------------------------------
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
"-20Remap-}}}

"-AAA16-Wildmenu--------------------------------------------------------------------------------------------{{{
        " More useful command-line completion
        au! FocusLost * :silent! wall     "Save when losing focus
        set wildmenu
        "black-List
        set wildmode=list:longest
        "blackGreen-List
        set wildmode=list:full
        "------------------------------------------------------------------------------------------
        "set wildchar=9 nowildmenu wildmode=list:longest wildoptions= wildignorecase cedit=<C-k>
        "------------------------------------------------------------------------------------------
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
"-16-}}}
