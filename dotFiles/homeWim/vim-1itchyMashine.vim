"---AAA1----------------------------------------------------------------------------------------------------------------- {{{
        if &compatible | set nocompatible | endif

        " Appearance
        silent! set number background=dark display=lastline,uhex wrap wrapmargin=0 guioptions=ce key=
        silent! set noshowmatch matchtime=1 noshowmode shortmess+=I cmdheight=1 cmdwinheight=10 showbreak=
        silent! set noshowcmd noruler rulerformat= laststatus=2 statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c
        silent! set title titlelen=100 titleold= titlestring=%f noicon norightleft showtabline=1
        silent! set cursorline nocursorcolumn colorcolumn= concealcursor=nvc conceallevel=0 norelativenumber
        silent! set list listchars=tab:>\ ,nbsp:_ synmaxcol=3000 ambiwidth=double breakindent breakindentopt=
        silent! set nosplitbelow nosplitright startofline linespace=0 whichwrap=b,s scrolloff=0 sidescroll=0
        silent! set equalalways nowinfixwidth nowinfixheight winminwidth=3 winminheight=3 nowarn noconfirm
        silent! set fillchars=vert:\|,fold:\  eventignore= helplang=en viewoptions=options,cursor virtualedit=
        if has('gui_running') | set lines=999 columns=999 | else | set t_Co=256 | endif

        " Editing
        silent! set iminsert=0 imsearch=0 nopaste pastetoggle= nogdefault comments& commentstring=#\ %s
        silent! set smartindent autoindent shiftround shiftwidth=2 expandtab tabstop=2 smarttab softtabstop=2
        silent! set foldclose=all foldcolumn=0 nofoldenable foldlevel=0 foldmarker& foldmethod=indent
        silent! set textwidth=0 backspace=indent,eol,start nrformats=hex formatoptions=cmMj nojoinspaces
        silent! set nohidden autoread noautowrite noautowriteall nolinebreak mouse= modeline& modelines&
        silent! set noautochdir write nowriteany writedelay=0 verbose=0 verbosefile= notildeop noinsertmode
        silent! set tags=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
        silent! set tags+=../../../../../../tags,../../../../../../../tags,~/Documents/scala/tags,~/Documents/*/tags tagstack

        " Clipboard
        silent! set clipboard=unnamed
        silent! set clipboard+=unnamedplus

        " Auto commands
        augroup vimrc
        autocmd!
        augroup END

        " Search
        silent! set wrapscan ignorecase smartcase incsearch hlsearch magic

        " Insert completion
        silent! set complete& completeopt=menu infercase pumheight=10 noshowfulltag shortmess+=c

        " Command line
        silent! set wildchar=9 nowildmenu wildmode=list:longest wildoptions= wildignorecase cedit=<C-k>
        silent! set wildignore=*.~,*.?~,*.o,*.sw?,*.bak,*.hi,*.pyc,*.out,*.lock suffixes=*.pdf

        " Performance
        silent! set updatetime=300 timeout timeoutlen=500 ttimeout ttimeoutlen=50 ttyfast lazyredraw

        " Bell
        silent! set noerrorbells visualbell t_vb=

        " Move to the directory each buffer
        autocmd vimrc BufEnter * silent! lcd %:p:h

        " Open Quickfix window automatically
        autocmd vimrc QuickfixCmdPost [^l]* nested copen | wincmd p
        autocmd vimrc QuickfixCmdPost l* nested lopen | wincmd p

        " Fix window position of help
        autocmd vimrc FileType help if &l:buftype ==# 'help' | wincmd K | endif

        " Always open read-only when a swap file is found
        autocmd vimrc SwapExists * let v:swapchoice = 'o'

        " Automatically set expandtab
        autocmd vimrc FileType * execute 'setlocal ' . (search('^\t.*\n\t.*\n\t', 'n') ? 'no' : '') . 'expandtab'

        autocmd vimrc BufWinEnter * if &buftype == 'terminal' | setlocal nonumber | endif

        " Setting lazyredraw causes a problem on startup
        autocmd vimrc VimEnter * redraw

        " remove spaces at the end of lines
        nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

        " smart Enter
        inoremap <silent><expr> <CR> (pumvisible() && bufname('%') !=# '[Command Line]' ? "\<C-e>\<CR>" : "\<C-g>u\<CR>")

        " diff
        nnoremap <silent> <expr> ,d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"

        " Clear hlsearch and set nopaste
        nnoremap <silent> <Esc><Esc> :<C-u>set nopaste<CR>:nohlsearch<CR>

        " Go to the first non-blank character of the line after paragraph motions
        noremap } }^

        " select last paste
        nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

        " navigation in command line
        cnoremap <C-a> <Home>
        cnoremap <C-b> <Left>
        cnoremap <C-f> <Right>

        " Command line history
        cnoremap <C-p> <Up>
        cnoremap <C-n> <Down>
        cnoremap <Up> <C-p>
        cnoremap <Down> <C-n>

        set wrapscan
        set nowrap      " Do not wrap long lines
        set mouse=a
" }}}


"---AAA2---------------------------------------------------------------------------------------------------------- {{{
        "?"in normal mode F2 will save the file
        "?"nmap <F2> :w<CR>
        "?"" in insert mode F2 will exit insert, save, enters insert again
        "?"imap <F2> <ESC>:w<CR>i
        "?"" switch between header/source with F4
        "?"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
        "?"" recreate tags file with F5
        "?"map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
        "?"" create doxygen comment
        "?"map <F6> :Dox<CR>
        "?"" build using makeprg with <F7>
        "?"map <F7> :make<CR>
        "?"" build using makeprg with <S-F7>
        "?"map <S-F7> :make clean all<CR>
        "?"" goto definition with F12
        "?"map <F12> <C-]>
" }}}


"---AAA3---------------------------------------------------------------------------------------------------------- {{{
    nnoremap gF <C-W>gf

    "-------------------------------------------------------------------
    " open ctag in tab/vertical split
    map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

    "-------------------------------------------------------------------
    map <F1> "zyiw:exe "vertical h ".@z.""<CR>
    map <F2> "zyiw:exe "vs ".@z.""<CR>
    map <F3> "zyiw<C-w>wo<Esc>"zp<C-w>W
    map <F4> "zY<C-w>wo<Esc>"zp<C-w>W
    map <F5> :Scratch<CR>

    "-----------------------------------------------------------------------------------------------
    sign define fixme text=!! linehl=Todo
    function! SignFixme()
        execute(":sign place ".line(".")." line=".line(".")." name=fixme file=".expand("%:p"))
    endfunction
    map <F6> :call SignFixme()<CR>

    "-----------------------------------------------------------------------------------------------
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
    "map <FF> :call SignLines()<CR>

    "-----------------------------------------------------------------------------------------------
    nnoremap <C-down> :m .+1<CR>==
    nnoremap <C-up> :m .-2<CR>==

    "-----------------------------------------------------------------------------------------------
    " Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
    vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" }}}


"---AAA4---------------------------------------------------------------------------------------------------------- {{{
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Pressing ,ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=
    " Map auto complete of (, ", ', [
    inoremap <C-1> ()<esc>i
    inoremap <C-2> []<esc>i
    inoremap <C-3> {}<esc>i
    inoremap <C-4> {<esc>o}<esc>O
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Map auto complete of (, ", ', [
    inoremap1 ()<esc>i
    inoremap2 []<esc>i
    inoremap3 {}<esc>i
    inoremap4 {<esc>o}<esc>O
    hi def DoubleSpace ctermbg=Gray
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
        autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
    endif
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    hi def DoubleSpace ctermbg=Gray
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    if !has('gui_running')
        set background=dark
    endif

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Turn persistent undo on
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set history=2024
    set noruler
    set cinoptions=N-s,g0,+2s,l-s,i2s
    set hidden
    set whichwrap=b,s,h,l,<,>,[,]         " Backspace and cursor keys wrap too
    set scrolloff=2                       " 3 lines to keep above and below cursor
    set timeoutlen=250                    " Time to wait after ESC (default annoying)
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    try
        set undodir=~/.vim_runtime/temp_dirs/undodir
        set undofile
    catch
    endtry
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    if has('persistent_undo')
        set undofile                " So is persistent undo ...
        set undolevels=1000         " Maximum number of changes that can be undo
        set undoreload=10000        " Maximum number lines to save for undo on
    endif
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMapWindowNavArrows = 1
    let g:miniBufExplMapCTabSwitchBufs = 1
    let g:miniBufExplModSelTarget = 1
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    function! s:vimscript()
        setlocal tabstop=4 " number of space for tab
        setlocal shiftwidth=4 " width of auto indent
        setlocal expandtab
    endfunction
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    augroup vimrc-vimscript
        autocmd!
        autocmd FileType vim call s:vimscript()
    augroup END
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " utomatically delete whitespace, trailing dos returns
    autocmd BufRead * silent! %s/[\r \t]\+\$//
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "#-GO to last edit position when opening files-#
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}


"---AAA5---------------------------------------------------------------------------------------------------------- {{{
" }}}
