"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"
"----------------------------------------------------------------------------------------------------------------------
" It's 2013.
noremap j gj
noremap k gk
noremap gj j
noremap gk k
"-----------------------------------
"!"-nnoremap <left>  :cprev<cr>zvzz
"!"-nnoremap <right> :cnext<cr>zvzz
"!"-nnoremap <up>    :lprev<cr>zvzz
"!"-nnoremap <down>  :lnext<cr>zvzz
"-----------------------------------
hi VariableType ctermbg=Yellow
hi VariableType ctermfg=brown
hi VarName ctermfg=darkblue

"---AAA1---------------------------------------------------------------------------------------------------------- {{{
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

        "chars to show for list
        "set listchars=tab:▸\ ,eol:¬,trail:⋅
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
        "
        "
        " Rebuild Ctags (mnemonic RC -> CR -> <cr>)
        " nnoremap <leader><cr> :silent !myctags >/dev/null 2>&1 &<cr>:redraw!<cr>
        "
        "?"" create doxygen comment
        "?"map <F6> :Dox<CR>
        "?"" build using makeprg with <F7>
        "?"map <F7> :make<CR>
        "?"" build using makeprg with <S-F7>
        "?"map <S-F7> :make clean all<CR>
        "?"" goto definition with F12
        "?"map <F12> <C-]>
        "
        "
        " Highlight Group(s)
        " nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                                \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                                \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

        "--++-+-----------------------------------------------------------------------------
        "?" nnoremap <C-c> :!g++ -std=c++11 % -Wall -g -o %.out && ./%.out<CR>
        "?" map <F7> :w <CR> :!gcc % -o %< && ./%< <CR>
        "?" map <F8> :!./%<<CR>
        "?" autocmd filetype cpp nnoremap <F6> :!g++ % -ggdb -o %:r <CR>
        "?" autocmd filetype cpp nnoremap <F7> :!g++ % -ggdb -o %:r && ./%:r <CR>
        "?" autocmd filetype cpp nnoremap <F8> :!g++ % -ggdb -o %:r && gdb -tui %:r <CR>
        "?" map <F7> msHmtgg/Last [cC]hange:\s*/e+1<CR>"_D"=strftime("%Y %b %d")<CR>p'tzt`s
        "--++-+-----------------------------------------------------------------------------
" }}}


"---AAA3---------------------------------------------------------------------------------------------------------- {{{
        nnoremap gF <C-W>gf
        "-------------------------------------------------------------------
        " open ctag in tab/vertical split
        " map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

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

        map <F8> :call OnlineDoc8()<CR>

        "-----------------------------------------------------------------------------------------------
        nnoremap <C-down> :m .+1<CR>==
        nnoremap <C-up> :m .-2<CR>==

        "-----------------------------------------------------------------------------------------------
        " Super useful! From an idea by Michael Naumann
        vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
        vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

        "-----------------------------------------------------------------------------------------------
        nnoremap <leader>g :grep -R <cword> .<cr>
        nnoremap <leader>l :lgrep -R <cword> .<cr>
        nnoremap <leader><leader> :Ag <cword> .<cr>
        nmap <Leader>m [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" }}}


"---AAA4---------------------------------------------------------------------------------------------------------- {{{
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Pressing ,ss will toggle and untoggle spell checking
        map <leader>ss :setlocal spell!<cr>
        map <leader>sn ]s
        map <leader>sp [s
        map <leader>sa zg
        map <leader>s? z=

        " Fix from spellcheck
        " I can never remember if it's zg or z=, and the wrong one adds the word to
        " the DB (lol), so fuck it, just add an easier mapping.
        nnoremap zz z=
        nnoremap z= :echo "use zz you idiot"<cr>

        " Map auto complete of (, ", ', [
        inoremap <C>1 ()<esc>i
        inoremap <C>2 []<esc>i
        inoremap <C>3 {}<esc>i
        inoremap <C>4 {<esc>o}<esc>O
        hi def DoubleSpace ctermbg=Gray
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Map auto complete of (, ", ', [
        "inoremap1 ()<esc>i
        "inoremap2 []<esc>i
        "inoremap3 {}<esc>i
        "inoremap4 {<esc>o}<esc>O
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
        " => Turn persistent undo on 
        "    means that you can undo even when you close a buffer/VIM
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        set nobackup
        set nowb
        set noswapfile

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
        " Files, backups and undo
        " Turn backup off, since most stuff are in git anyway...
        " enable persistent undo
        " if has('persistent_undo')
        "     set undodir=$HOME/.vim/.undofile
        "     set undofile
        "     set undolevels=1000            " maximum number of changes that can be undone
        "     set undoreload=10000           " maximum number lines to save for undo on a buffer reload
        "     if ! isdirectory(&undodir)
        "         call mkdir(&undodir, 'p')
        "     endif
        " endif
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
        "#-to last edit position when opening files-#
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}

"---AAA5---------------------------------------------------------------------------------------------------------- {{{

        " Keep search pattern at the center of the screen
        nmap <silent> n nzz
        nmap <silent> N Nzz
        nmap <silent> * *zz
        nmap <silent> # #zz
        nmap <silent> g* g*zz
        nmap <silent> g# g#zz

        " switch to the directory of the open buffer
        map <leader>cd :cd %:p:h<cr>

        " Underline the current line with '-'
        nmap <silent> <leader>ul :t.<CR>Vr-
        nmap <silent> ll :t.<CR>Vr-
" }}}

"---AAA6---------------------------------------------------------------------------------------------------------- {{{
" }}}

"---AAA7---------------------------------------------------------------------------------------------------------- {{{
" }}}


" Fuck you, help key.
noremap  <F1> :checktime<cr>
inoremap <F1> <esc>:checktime<cr>

" Stop it, hash key.

inoremap # X<BS>#
" Man
nnoremap M K

" Kill window
nnoremap K :q<cr>

" My garbage brain can't ever remember digraph codes
inoremap <c-k><c-k> <esc>:help digraph-table<cr>

" Inserting blank lines
" I never use the default behavior of <cr> and this saves me a keystroke...
nnoremap <cr> o<esc>

" Yank to end of line
nnoremap Y y$

" Reselect last-pasted text
nnoremap gv `[v`]

" Send visual selection to paste.stevelosh.com
vnoremap <leader>p :w !pb && open `pbpaste`<cr>

" Diffoff
nnoremap <leader>D :diffoff!<cr>

" Formatting, TextMate-style
nnoremap W gqip
vnoremap W gq

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" HTML tag closing
inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a

" Marks and Quotes
noremap ' `

" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
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

" Pushing
nnoremap <leader>Go :Start! git push origin<cr>
nnoremap <leader>Gu :Start! git push upstream<cr>

" Reverse Strig 
" nnoremap ll :let @z=@"<cr>x$p:let @"=@z<cr>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"------------------------------------------
"X-Insert Mode Completion-X 
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
match Todo / TST /
2match Error / ERR /
3match Title / Albert /
syn match DoubleSpace " "
set matchpairs+=<:>        " Match, to be used with %
"------------------------------------------
vmap sb "zdi"<C-R>z"<ESC>
vmap st "zdi( <C-R>z )<ESC>

"--------------------------------------------------
"### ExPanSion ###
"--------------------------------------------------
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ neocomplete#start_manual_complete()
inoremap <S-TAB> <C-p>

"--------------------------------------------------

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

noremap <leader>a =ip
noremap cp yap<S-}>p

"?"- onoremap if :<c-u>normal! [zv]z<cr>
"?"- onoremap af :<c-u>normal! [zV]z<cr>
"?"- vnoremap if :<c-u>normal! ]zv[z<cr>
"?"- vnoremap af :<c-u>normal! ]zV[z<cr>
"?"- 
"?"- onoremap ir i[
"?"- onoremap ar a[
"?"- vnoremap ir i[
"?"- vnoremap ar a[
"?"- 
"?"- 
"?"- " Better x
"?"- nnoremap x "_x
"?"- 
"?"- " a>, i], etc...
"?"- " <angle>
"?"- onoremap aa  a>
"?"- xnoremap aa  a>
"?"- onoremap ia  i>
"?"- xnoremap ia  i>
"?"- 
"?"- " [rectangle]
"?"- onoremap ar  a]
"?"- xnoremap ar  a]
"?"- onoremap ir  i]
"?"- xnoremap ir  i]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"?"- """"""""""""""""""""""""""""""
"?"- " => Vim grep
"?"- """"""""""""""""""""""""""""""
"?"- let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
"?"- set grepprg=/bin/grep\ -nH
"?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"?"- " => surround.vim config
"?"- " Annotate strings with gettext 
"?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"?"- vmap Si S(i_<esc>f)
"?"- au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>
"?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"?"- " => Git gutter (Git diff)
"?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"?"- let g:gitgutter_enabled=0
"?"- nnoremap <silent> <leader>d :GitGutterToggle<cr>
"?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"?"- " => Vim-go
"?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"?"- let g:go_fmt_command = "goimports"
"?"- 
"?"- 
"?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"?"- " => Syntastic (syntax checker)
"?"- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"?"- let g:ale_linters = {
"?"- \   'javascript': ['jshint'],
"?"- \   'python': ['flake8'],
"?"- \   'go': ['go', 'golint', 'errcheck']
"?"- \}
"?"- 
"?"- nmap <silent> <leader>a <Plug>(ale_next_wrap)
"?"- 
"?"- " Disabling highlighting
"?"- let g:ale_set_highlights = 0
"?"- 
"?"- " Only run linting when saving the file
"?"- let g:ale_lint_on_text_changed = 'never'
"?"- let g:ale_lint_on_enter = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map alt-v in command-line mode to replace the commandline
" with the Ex command-line beneath the cursor in the buffer
"cnoremap <Esc>v <C-\>esubstitute(getline('.'), '^\s*\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\)*\s*:*' , '', '')<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
