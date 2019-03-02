"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-DEO-FZF-NV-Unite"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"
" File: minit.vim
" Author: red
" Last Modified: 19 Feb 2019
"===============================================================================================================
        set path+=.,/home/red/git/aTest/pyLabGitPdbPythonMode27
        "------------------------------------------------------------------------------------
        set runtimepath+=~/vim-amake
        "------------------------------------------------------------------------------------
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
        set tags+=.tags;
        set tags+=tags;
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
        "------------------------------------------------------------------------------------
        nnoremap <C-j> :bn<cr>
        nnoremap <C-k> :bp<cr>
        "---------------------------------------------------
        nnoremap <m-right> :vertical resize +3<cr>
        nnoremap <m-left> :vertical resize -3<cr>
        nnoremap <m-up> :resize +3<cr>
        nnoremap <m-down> :resize -3<cr>
"===============================================================================================================
"===============================================================================================================

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
        "---Editing---------------------------------------------------------------------------------
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
        source ~/git/aTest/dotFiles/nVim/mix/n-badwolf.vim 
        "colorscheme dracula

        hi Normal         ctermbg=235
        hi ColorColumn    ctermbg=22
        hi MatchParen     ctermbg=39 ctermfg=11  cterm=bold
        set signcolumn=yes
        hi signcolumn     ctermbg=10
        hi LineNr         ctermbg=199 ctermfg=16 
        set cursorcolumn
        hi CursorLine     ctermbg=8
        set colorcolumn=92,100,112,120
        set pumheight=12
        hi Pmenu          ctermfg=1 ctermbg=255
        hi PmenuSbar      ctermfg=11 ctermbg=5 cterm=NONE
        hi PmenuThumb     ctermfg=12 ctermbg=2 cterm=NONE
        "------------------------------------------------
        hi customPink     ctermbg=245 ctermfg=White
        hi lightGray      ctermbg=12
        hi darkGray       ctermbg=8
        "------------------------------------------------
        highlight Visual cterm=bold ctermbg=2 ctermfg=NONE
        set list
        set listchars=tab:▸\
        "------------------------------------------------
        call matchadd('customPink', 'aaa')
        call matchadd('customPink', 'AAA')
        call matchadd('customPink', '===')
        call matchadd('customPink', '###')
        call matchadd('customPink', ':::')
        call matchadd('customPink', '---')
        "------------------------------------------------
        "hi Comment        ctermbg=14
        "------------------------------------------------------------------------------------------- 
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
        "let g:nnv_search_paths = ['/media/red/F1E8-C819/hTML-Zp-Link/2019CollectZip/']
        "------------------------------------------------------------------------------------------- 
        let g:nnv_search_paths = ['~/git/aTest/dotFiles/']
        source ~/git/aTest/dotFiles/nVim/myPlug/NNV.vim
        let g:nnv_search_paths = ['~/git/aTest/dotFiles/']
        ":::::::::::::::::::::::::::-=3=-::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

        autocmd! User Oblique       normal! zz
        autocmd! User ObliqueStar   normal! zz
        autocmd! User ObliqueRepeat normal! zz

        hi! def link ObliqueCurrentMatch Keyword
        hi! def link ObliquePrompt       Structure
        hi! def link ObliqueLine         String
        let g:oblique#clear_highlight =0

"-AAA16-Wildmenu---------------------------------------------------------------------------------------------{{{
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
"===============================================================================================================
"===============================================================================================================
"===============================================================================================================

function! KinoMax()
python3 << endPython

import vim

def find_max(nums):
    max = nums[0]
    for x in nums:
        if x > max:
            max = x
    print(max)

find_max([2, 4, 9, 7, 19, 94, 5])
endPython
endfunction

command! KKinoMax call KinoMax()

"===============================================================================================================
function! LuaMain()
lua << EOF

a = "Hello "
b = "World"
print("Concatenation of string a with b is ", a..b )
print("Length of b is ",#b )
print("Length of b is ",#"Test" )

a = 20
b = 10
c = 15
d = 5
e = (a + b) * c / d;-- ( 30 * 15 ) / 5
print("Value of (a + b) * c / d is :",e )
e = a + (b * c) / d; -- 20 + (150/5)
print("Value of a + (b * c) / d is :",e )

EOF
endfunction

command! LLuaMain call LuaMain()

"=============================================PPXX==============================================================
"set statusline+=%{zoom#statusline()}
"===============================================================================================================

" Update revision info of current file
function! UpdateRevisionInfo()
  let b:revision_info = ""
  let b:repos_type = ""

  if expand("%") == ""
    " No existing file is loaded.
    return
  endif

  " lookup path, starts from directory of current file
  " searching up upward, until file system root.
  let l:cur_dir_and_up = expand("%:p:h") . ';'
  let l:repos_info_cmd = ""

  " Is this inside a mercurial repository?
  let l:root = finddir('.hg', l:cur_dir_and_up)
  if l:root != ""
    " this is an hg repos.
    let b:repos_type = "Mercurial"
    if !exists("g:hg_id_flag")
      let g:hg_id_flag = '-Bbint'
    endif
    let l:repos_info_cmd = "hg id " . g:hg_id_flag
  else
    let l:root = finddir('.git', l:cur_dir_and_up)
    if l:root != ""
      "  git repository
      let b:repos_type = "Git"
      let l:repos_info_cmd = "git branch"
    endif
  endif
  " inside repository
  if l:repos_info_cmd != ""
    " root of repository
    let l:repos_root = fnamemodify(l:root, ":p:h")
    " try to get revision info
    let l:info = system("cd " . l:repos_root . " && " . l:repos_info_cmd)
    if v:shell_error == 0
      " with return code 0, assuming nothing went wrong
      if b:repos_type ==# "Git"
        " git does not provide enough customization for output so we need to
        " remove first 2 chars manually, e.g, the '* ' part of '* master'
        let l:info = strpart(l:info, 2)
      endif
      let b:revision_info = substitute(l:info, '\n.*', '', 'g')
    endif
  endif
endfunction

command! UUpdateRevisionInfo call UpdateRevisionInfo()
