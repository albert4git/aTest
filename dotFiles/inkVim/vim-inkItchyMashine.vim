"           (_)            __   _(_)_ __ ___             (_)
"           / |            \ \ / / | '_ ` _ \            / |
"           | |             \ V /| | | | | | |           | |
"           |_|            (_)_/ |_|_| |_| |__|          |_|
"----------------------------------------------------------------------------------------------------------------------
        " It's 2013.
        noremap j gj
        noremap k gk
        noremap gj j
        noremap gk k

        set whichwrap=b,s,h,l,<,>,[,]         " Backspace and cursor keys wrap too
        ""My stuff --------------------------------------------------------------------------
        let wordUnderCursor = expand("<cword>")
        let currentLine   = getline(".")

        ""My stuff --------------------------------------------------------------------------
        " Insert completion
        silent! set complete& completeopt=menu infercase pumheight=10 noshowfulltag shortmess+=c
        let g:tq_mthesaur_file="~/git/aTest/redVim/dikt/mthesaur.txt"
        set dictionary+=~/git/aTest/redVim/dikt/english-words.txt
        set complete=.,w,b,u,t,k

        "------------------------------------------
        " nnoremap <left>  :cprev<cr>zvzz
        " nnoremap <right> :cnext<cr>zvzz
        " nnoremap <up>    :lprev<cr>zvzz
        " nnoremap <down>  :lnext<cr>zvzz
        "------------------------------------------
        " set list
        " chars to show for list
        " set listchars=tab:▸\ ,eol:¬,trail:⋅
        " set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
        " set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

"---AAA1---------------------------------------------------------------------------------------------------------- {{{
        if &compatible | set nocompatible | endif

        " Appearance
        silent! set number background=dark display=lastline,uhex wrap wrapmargin=0 guioptions=ce key=
        silent! set noshowmatch matchtime=1 noshowmode shortmess+=I cmdheight=1 cmdwinheight=10 showbreak=
        silent! set noshowcmd noruler rulerformat= laststatus=2 statusline=%t\ %=\ %m%r%y%w\ %3l:%-2c
        silent! set title titlelen=100 titleold= titlestring=%f noicon norightleft showtabline=1
        silent! set cursorline nocursorcolumn colorcolumn= concealcursor=nvc conceallevel=0 norelativenumber
        silent! set list listchars=tab:>\ ,nbsp:_ synmaxcol=3000 ambiwidth=double breakindent breakindentopt=
        silent! set nosplitbelow nosplitleft startofline linespace=0 whichwrap=b,s scrolloff=0 sidescroll=0
        silent! set equalalways nowinfixwidth nowinfixheight winminwidth=3 winminheight=3 nowarn noconfirm
        silent! set fillchars=vert:\|,fold:\  eventignore= helplang=en viewoptions=options,cursor virtualedit=
        if has('gui_running') | set lines=999 columns=999 | else | set t_Co=256 | endif

        " Editing
        silent! set iminsert=0 imsearch=0 nopaste pastetoggle= nogdefault comments& commentstring=#\ %s
        silent! set smartindent autoindent shiftround shiftwidth=4 expandtab tabstop=4 smarttab softtabstop=4
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

        " Command line history
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

        set wrapscan
        set nowrap
        set mouse=a
" }}}




"---AAA2---------------------------------------------------------------------------------------------------------- {{{
        nnoremap gF <C-W>gf

        " open ctag in tab/vertical split
        map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

        "-------------------------------------------------------------------
        map <F2> "zyiw:exe "vertical h ".@z.""<CR>
        map <F3> :Scratch<CR>
        map <S-F3> :ScratchPreview<CR>
        ":vNEW
        "map <Fx> "zyiw:exe "vs ".@z.""<CR>
        map <F4> "zyiw<C-w>wo<Esc>"zp<C-w>W
        map <S-F4> "zY<C-w>wo<Esc>"zp<C-w>W

        "-----------------------------------------------------------------------------------------------
        sign define fixme text=!! linehl=Todo
        function! SignFixme()
            execute(":sign place ".line(".")." line=".line(".")." name=fixme file=".expand("%:p"))
        endfunction
        map <F5> :call SignFixme()<CR>

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
        map <F6> :call OnlineDoc8()<CR>
        "Albert F9???"
        map <S-F6> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
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


"---AAA3---------------------------------------------------------------------------------------------------------- {{{
        nnoremap zz z=
        nnoremap z= :echo "use zz you idiot"<cr>

        "inoremap <M-i> <Tab>
        " Map auto complete of (, ", ', [
        inoremap<M-1> ()<esc>i
        inoremap<M-2> []<esc>i
        inoremap<M-3> {}<esc>i
        inoremap<M-4> {<esc>o}<esc>O
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
            autocmd BufWritePre *.vim,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
        endif
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        hi def DoubleSpace ctermbg=Gray
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        if !has('gui_running')
            set background=dark
        endif

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " => Turn persistent undo on
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "set noruler
        set hidden
        set history=4024
        set cinoptions=N-s,g0,+2s,l-s,i2s
        set scrolloff=2                       " 3 lines to keep above and below cursor
        set timeoutlen=250                    " Time to wait after ESC (default annoying)
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " => Turn persistent undo on
        "    means that you can undo even when you close a buffer/VIM
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        set nobackup
        set nowb
        set noswapfile
        set nowritebackup

        try
            set undodir=~/.vim/undoDir/
            set undofile
        catch
        endtry
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=2000         " Maximum number of changes that can be undo
            set undoreload=20000        " Maximum number lines to save for undo on
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
        "#- go to last edit position when opening files -#
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}

"---AAA4---------------------------------------------------------------------------------------------------------- {{{
        nmap <silent> n nzz
        nmap <silent> N Nzz
        nmap <silent> * *zz
        nmap <silent> # #zz
        nmap <silent> g* g*zz
        nmap <silent> g# g#zz

        " switch to the directory of the open buffer
        map <leader>cd :cd %:p:h<cr>
" }}}


"---AAA5---------------------------------------------------------------------------------------------------------- {{{
        " Man
        nnoremap M K

        " Kill window
        nnoremap K :q<cr>

        " My garbage brain can't ever remember digraph codes
        inoremap <c-k><c-k> <esc>:help digraph-table<cr>

        " I never use the default behavior of <cr> and this saves me a keystroke...
        nnoremap <cr> o<esc>

        " Yank to end of line
        nnoremap Y y$

        " Reselect last-pasted text
        nnoremap gv `[v`]

        " Diffoff
        nnoremap <leader>D :diffoff!<cr>

        " Formatting, TextMate-style
        vnoremap W gq
        nnoremap W gqip

        " Keep the cursor in place while joining lines
        nnoremap J mzJ`z

        " The normal use of S is covered by cc, so don't worry about shadowing it.
        nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

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
        cnoremap <C-A> <Home>
        cnoremap <C-E> <End>
        cnoremap <C-K> <C-U>
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

        "#NEW#"
        vnoremap <F7>  i(
        vnoremap <S-F7>  a(

        vnoremap <F8> i{
        vnoremap <S-F8> a{

        vnoremap <F9> i[
        vnoremap <S-F9> a[

        vnoremap <F10> i<
        vnoremap <S-F10> a<
        "#NEW#"

        imap jj <Esc>
        noremap jj :w<cr>
        noremap qq :q<cr>
" }}}

"---AAA6---------------------------------------------------------------------------------------------------------- {{{
        hi StatusLineNC  ctermbg=3 ctermfg=6 cterm=NONE
        hi statuslineNC guifg=White
        hi statusline ctermbg=Cyan ctermfg=Black
        hi statusline ctermfg=White
        hi StatusLine cterm=bold
        "--------------------------------------------------------------
        hi clear SignColumn
        hi SignColumn ctermbg =4
        "Curr line number row, same bg color in rel mode
        highlight clear LineNr
        highlight LineNr ctermfg=Black ctermbg=2
        highlight LineNr ctermfg=White ctermbg=5
        "--------------------------------------------------------------
        set colorcolumn=8,100,120
        highlight clear ColorColumn
        highlight ColorColumn term=reverse ctermbg=1 guibg=DarkGray
        "--------------------------------------------------------------
        set cursorline
        hi Cursor ctermbg=Cyan
        hi CursorLine guibg=White ctermbg=1 term=bold cterm=bold
" }}}

"---AAA7---------------------------------------------------------------------------------------------------------- {{{
        match Todo / TST /
        2match Error / ERR /
        3match Title / Albert /
        syn match DoubleSpace " "
        set matchpairs+=<:> " Match, to used with %
        "------------------------------------------

        highlight Comment ctermbg=6 ctermfg=White cterm=bold
        highlight Constant ctermbg=Blue
        highlight NonText ctermbg=DarkBlue
        hi VariableType ctermbg=Yellow
        hi VariableType ctermfg=brown
        hi VarName ctermfg=darkblue
        highlight Special ctermbg=0
        "highlight Normal ctermbg=DarkBlue
        "highlight Cursor ctermbg=Green

        syn keyword VariableType real void String int nextgroup=VarName skipwhite
        syn match VarName '\i\+' contained
        hi VariableType ctermbg=LightYellow
        hi VariableType ctermfg=brown
        hi VarName ctermfg=darkblue

        "My stuff ---------------------------------
        hi CustomPink ctermbg=205 guibg=hotpink guifg=black ctermfg=black
        call matchadd('CustomPink', '\<System\>')
" }}}

"---AAA8---------------------------------------------------------------------------------------------------------- {{{
        "Airline
        let g:ctags_statusline=1
        let generate_tags=1
        set noshowmode
        set showcmd      " Show partial commands in status line and
        "----------------------------------------
        " let g:airline#extensions#tabline#enabled = 2
        " let g:airline#extensions#tabline#fnamemod = ':t'
        " let g:airline#extensions#tabline#buffer_min_count = 1
        "------------------------------------------

        function! LightlineFilename()
                let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
                let modified = &modified ? ' +M' : ''
                return filename . modified
        endfunction
" }}}

"---AAA9---------------------------------------------------------------------------------------------------------- {{{
        "let g:gitgutter_highlight_lines = 1
        let g:gitgutter_signs = 1

        nmap ]c <Plug>GitGutterNextHunk
        nmap [c <Plug>GitGutterPrevHunk
        nmap <Leader>hs <Plug>GitGutterStageHunk
        nmap <Leader>hu <Plug>GitGutterUndoHunk

        highlight GitGutterAdd ctermfg=green
        highlight GitGutterChange ctermfg=yellow
        highlight GitGutterDelete ctermfg=red
        highlight GitGutterChangeDelete ctermfg=yellow
" }}}


"---AAA10---------------------------------------------------------------------------------------------------------- {{{
        set thesaurus=mthesaur.txt
        set dictionary+="~/git/aTest/redVim/dikt/english-words.txt"
        let s:thesaurus_pat = "~/git/aTest/redVim/dikt/.txt"

        imap <C-b>     <Plug>(neosnippet_expand_or_jump)
        smap <C-b>     <Plug>(neosnippet_expand_or_jump)
        xmap <C-b>     <Plug>(neosnippet_expand_target)
        set omnifunc=syntaxcomplete#Complete
        set complete=.,w,b,u,t,k

        if !exists('g:neocomplete#sources#omni#input_patterns')
            let g:neocomplete#sources#omni#input_patterns = {}
        endif

        if !exists('g:neocomplete#force_omni_input_patterns')
            let g:neocomplete#force_omni_input_patterns = {}
        endif

        imap <c-s> <plug>(fzf-complete-line)

        command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
            \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))
" }}}


"---AAA11---------------------------------------------------------------------------------------------------------- {{{
        let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-6.0/lib/libclang.so.1"
        let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
        let g:deoplete#sources#clang#sort_algo = 'priority' " alphabetical
        " JAVA -------------------------------------------------------------------------
        "https://github.com/Shougo/deoplete.nvim/issues/277
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
" }}}

"---AAA12---------------------------------------------------------------------------------------------------------- {{{
        autocmd FileType c set makeprg=gcc\ -O2\ -g\ -Wall\ -Wextra\ -o'%<'\ '%'\ -lm
        "------------------------------------------------------------------------------------------
        autocmd filetype c nnoremap <C-c> :w <bar> !gcc -std=c99 -lm % -o %:p:h/%:t:r.out && ./%:r.out<CR>
        autocmd filetype java nnoremap <C-c> :w <bar> !javac % && java -enableassertions %:p <CR>
        autocmd filetype python nnoremap <C-c> :w <bar> !python % <CR>
        autocmd filetype perl nnoremap <C-c> :w <bar> !perl % <CR>
        autocmd filetype go nnoremap <C-c> :w <bar> !go build % && ./%:p <CR>
        "------------------------------------------------------------------------------------------
        let g:quickrun_known_file_types = {
                \"cpp": ["!g++ %", "./a.out"],
                \"c": ["!gcc %", "./a.out"],
                \"php": ["!php %"],
                \"vim": ["source %"],
                \"py": ["!python %"],
                \}
        "------------------------------------------------------------------------------------------
        "compiler javac
        "set makeprg =javac\ hello2W.java
        "------------------------------------------------------------------------------------------
" }}}

"---AAA13---------------------------------------------------------------------------------------------------------- {{{
        set gfn=Lucida_Sans_Typewriter:h14:cANSI
        set guifont=Monospace\ Bold\ 18
" }}}

"---AAA14---------------------------------------------------------------------------------------------------------- {{{
" }}}

"---AAA15---------------------------------------------------------------------------------------------------------- {{{
        set nospell
" }}}
