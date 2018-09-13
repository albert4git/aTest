    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END
    "set backup
    "set backupdir=~/.vim/backup
    let wordUnderCursor = expand("<cword>")
    let currentLine   = getline(".")

"-preXXX AAA---------------------------------------------------------- {{{
   "set backspace=indent,eol,start    " Backspace for dummies
    set backspace=indent,eol,start
    set lazyredraw   " Don't redraw while exec macros (good performance config)
    set showmatch    " Show match brackets when text indicator is over them
    set mat=2        " tenths of a second to blink when matching brackets
    set nobackup
    set nowb
    set noswapfile
    set expandtab
    set smarttab
    set shiftwidth=4
    set tabstop=4
    set lbr
    set tw=500         " Linebreak on 500 characters
    set ai             "Auto indent
    set si             "Smart indent
    set whichwrap=b,s,h,l,<,>,[,]
    set scrolloff=2
    set wmh=0
    set smartcase
    set smartindent
    set ignorecase
    set hlsearch
    set magic

" }}}

"PreSet AAA----------------------------------------------------------- {{{
    syntax on
    set so=5
    nnoremap n nzz
    set cf                         " Enable error files & error jumping.
    set autowrite                  " Writes on make/shell commands
    "----------------------------------------------------------------------
    if has("clipboard")
        set clipboard=unnamed " copy to the system clipboard
        if has("unnamedplus") " X11 support
            set clipboard+=unnamedplus
        endif
    endif
    "----------------------------------------------------------------------
    "set spell
    "----------------------------------------------------------------------
    au BufRead * normal zR
    set nobackup
    set nowritebackup
    "----------------------------------------------------------------------
    set wildignore=*.swp,*.swo,*.bak,*.pyc,*.class
    set noswapfile
    "----------------------------------------------------------------------
    set nu
    set title
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=80
    set smarttab
    set expandtab
    set mouse=a
    "----------------------------------------------------------------------
    set cmdheight=2
    "set t_Co=256
    set showcmd
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
    "----------------------------------------------------------------------
    """"set wildmode=list:longest,full    " Command <Tab> completion, list matches
    """"set showmatch                     " Show matching brackets/parenthesis
    set linespace=0                       " No extra spaces between rows
    set incsearch                         " Find as you type search
    set winminheight=0                    " Windows can be 0 line high
    set ignorecase                        " Case insensitive search
    set smartcase                         " Case sensitive when uc present
    set wildmenu                          " Show list instead of just completing
    set whichwrap=b,s,h,l,<,>,[,]         " Backspace and cursor keys wrap too
    set scrolloff=2                       " 3 lines to keep above and below cursor
    set foldenable                        " Auto fold code
    "----------------------------------------------------------------------
    set visualbell
    set laststatus=2
    "----------------------------------------------------------------------
    set nowrap                           " Do not wrap long lines
    set cindent                          " cindent
    set nojoinspaces                     " Prevents inserting two spaces punctuation
    set splitright                       " Puts new vsplit windows to the right
    set splitbelow                       " Puts new split windows to the bottom
    "--------------------------------------------------------------------------
    set timeoutlen=250             " Time to wait after ESC (default annoying)
    set history=2024
    set noruler
    set cinoptions=N-s,g0,+2s,l-s,i2s
    set hidden
    "--------------------------------------------------------------------------
    if has('persistent_undo')
        set undofile                " So is persistent undo ...
        set undolevels=1000         " Maximum number of changes that can be undo
        set undoreload=10000        " Maximum number lines to save for undo on
    endif
    "--------------------------------------------------------------------------
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMapWindowNavArrows = 1
    let g:miniBufExplMapCTabSwitchBufs = 1
    let g:miniBufExplModSelTarget = 1
" }}}


"-CENTRE AAA------------------------------------------------------------- {{{
    "-------------------------------------------------------------------
    " Typing: ci', ci", or ci)
    "-------------------------------------------------------------------
    imap <C-b> <Plug>(neosnippet_expand_or_jump)
    smap <C-b> <Plug>(neosnippet_expand_or_jump)
    xmap <C-b> <Plug>(neosnippet_expand_target)

    "------------------------------------------------------------------
    " let mapleader=' '
    " let maplocalleader= ','
    " imap <c-s> <plug>(fzf-complete-line)
    " imap <c-s> <plug>(fzf-complete-line)
    " change to directory of current file automatically
    "------------------------------------------------------------------
    autocmd BufEnter * lcd %:p:h
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h
    "------------------------------------------
    "?" match Todo / TST /
    "?" 2match Error / ERR /
    "?" 3match Title / Albert /
    "?" syn match DoubleSpace " "
    "?" set matchpairs+=<:>                             " Match, to be used with %
    "------------------------------------------
    vmap sb "zdi"<C-R>z"<ESC>
    vmap st "zdi( <C-R>z )<ESC>

    "------------------------------------------
    " Bash like keys for the command line
    cnoremap <C-A> <Home>
    cnoremap <C-E> <End>
    cnoremap <C-K> <C-U>
    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

    "------------------------------------------
    command! Wq :wq
    command! W :w

    "--------------------------------------------------
    "### ExPanSion ###
    "--------------------------------------------------
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ neocomplete#start_manual_complete()
    inoremap <S-TAB> <C-p>

    "--------------------------------------------------
    inoremap <silent> <C-]> <C-x><C-]>
    inoremap <silent> <C-o> <C-x><C-o>
    inoremap <silent> <C-k> <C-x><C-k>
    inoremap <silent> <C-d> <C-x><C-d>
    inoremap <silent> <C-u> <C-x><C-u>
    inoremap <silent> <C-f> <C-x><C-f>
    inoremap <silent> <C-l> <C-x><C-l>

    "------------------------------------------
    iabbr str start
    iabbr supe superuser
    iabbr que question
    iabbrev #i #include
    iabbrev #d #define
    iab cmnt /*<CR><CR>*/<Up>
    iabbrev @@  alf@nomail.com
    iabbrev ccopy Copyright 2013 Alf , no rights reserved.

    "------------------------------------------
    map 0 ^
    set autowrite
    set tags=./tags;/
    sign define fixme text=!? linehl=Todo

    "------------------------------------------
    set colorcolumn=81
    hi clear SignColumn
    hi SignColumn ctermbg = Red

    "------------------------------------------
    noremap Q !!$SHELL<CR>

    "------------------------------------------
    nnoremap <leader>g :grep -R <cword> .<cr>
    nnoremap <leader>l :lgrep -R <cword> .<cr>
    nnoremap <leader><leader> :Ag <cword> .<cr>
    nmap <Leader>m [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    "------------------------------------------
    " circular windows navigation
    nnoremap <Tab>   <c-W>w
    nnoremap <S-Tab> <c-W>W

    "------------------------------------------
    "### F1, F2, F3
    "------------------------------------------
    map <F1> "zyiw:exe "vertical h ".@z.""<CR>
    map <F2> "zyiw:exe "vs ".@z.""<CR>
    map <F3> "zyiw<C-w>wo<Esc>"zp<C-w>w
    map <F4> "zY<C-w>wo<Esc>"zp<C-w>W
    map <F5> :Scratch<CR>

    "-------------------------------------------------------------------
    function! SignFixme()
        execute(":sign place ".line(".")." line=".line(".")." name=fixme file=".expand("%:p"))
    endfunction
    map <F6> :call SignFixme()<CR>

    "-------------------------------------------------------------------
    function! SignLines() range
        let n = a:firstline
        execute(":sign define fixme text=!! texthl=Todo")
        while n <= a:lastline
            if getline(n) =~ '\(TODO\|FIXME\)'
                execute(":sign place ".n." line=".n." name=fixme file=".expand("%:p"))
            endif
            let n = n + 1
        endwhile
    endfunction
    map <F7> :call SignLines()<CR>

    "-------------------------------------------------------------------
    set wmh=0
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-H> <C-W>h<C-W>|
    map <C-L> <C-W>l<C-W>|
    map <C-=> <C-W>=

    "-------------------------------------------------------------------
    nnoremap <C-down> :m .+1<CR>==
    nnoremap <C-up> :m .-2<CR>==
" XXX BBB Down vvv
    "-------------------------------------------------------------------
    " Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
    vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

    "-------------------------------------------------------------------
    " Pressing ,ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=

    "-------------------------------------------------------------------
    " Map auto complete of (, ", ', [
    inoremap1 ()<esc>i
    inoremap2 []<esc>i
    inoremap3 {}<esc>i
    inoremap4 {<esc>o}<esc>O
    "inoremapq ''<esc>i
    "inoremape ""<esc>i
    "-------------------------------------------------------------------
    iab xdate <C-t>=strftime("%d/%m/%y %H:%M:%S")<cr>
    nnoremap gF <C-W>gf

    "" open ctag in tab/vertical split
    map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" }}}

"-------------------------------------------------------------------
"-------------------------------------------------------------------
"-------------------------------------------------------------------
"-------------------------------------------------------------------
" Smart mappings on the command line
"-------------------------------------------------------------------
"cnoh e ~/
"cnod e ~/Desktop/
"cnoj e ./
"cnoc e <C-\>eCurrentFileDir("e")<cr>
"-------------------------------------------------------------------
" nnoremap <M-]> :call PreviewTag2(1)<CR>
" inoremap <M-]> <Esc>:call PreviewTag2(1)<CR>
"-------------------------------------------------------------------
"-------------------------------------------------------------------
"-------------------------------------------------------------------

"-subMashine ------------------------------------------------------- {{{
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Delete trailing white space on save, useful for some filetypes ;)
    fun! CleanExtraSpaces()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        silent! %s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
    endfun

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    if has("autocmd")
        autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
    endif
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    hi def DoubleSpace ctermbg=Gray
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "I never use a white terminal
    if !has('gui_running')
        set background=dark
    endif

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Turn persistent undo on
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    try
        set undodir=~/.vim_runtime/temp_dirs/undodir
        set undofile
    catch
    endtry
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    function! s:vimscript()
        setlocal tabstop=2 " number of space for tab
        setlocal shiftwidth=2 " width of auto indent
        setlocal expandtab
    endfunction
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    augroup vimrc-vimscript
        autocmd!
        autocmd FileType vim call s:vimscript()
    augroup END
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " utomatically delete whitespace, trailing dos returns
    autocmd BufRead * silent! %s/[\r \t]\+\$//
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Return to last edit position when opening files---------------
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}
"=##### OPTIC ###
"===### OPTIC ###
"=##### OPTIC ###
"### AAA ###
"-postXXX -------------------------------------------------------- {{{
" }}}
