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

        setlocal foldmarker={{{,}}}
        setlocal foldmethod=marker
        setlocal foldminlines=7

        ""My stuff --------------------------------------------------------------------------
        let wordUnderCursor = expand("<cword>")
        let currentLine   = getline(".")

        ""My stuff --------------------------------------------------------------------------

        "[ syntax & highlight ] {{{
                syntax enable
                syntax on
        " }}}


        " F1~12 {{{
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
        ":ShowFuncKeys
        " }}}


        set sessionoptions+=blank
        set sessionoptions+=buffers
        set sessionoptions+=curdir
        set sessionoptions+=folds
        set sessionoptions-=help
        set sessionoptions+=options
        set sessionoptions+=tabpages
        set sessionoptions+=resize
        set sessionoptions+=winsize
        set sessionoptions+=winpos

    "au BufReadPost *
                "\if line("'\"") > 1 && line("'\"") <= line("$")
                "\| exe "normal! g`\""
                "\| endif
    "set viminfo='10,\"100,:20,%,n~/.viminfo " help :viminfo , notice permission is wrong on viminfo
    " }}}

        " Tab completion for vim-lsp inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
        ""inoremap <tab> <c-n>
        ""inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
        ""inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"
        ""set completeopt=menu,longest,preview
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
        " Appearance  # matchtime=1
        silent! set number background=dark display=lastline,uhex wrap wrapmargin=0 guioptions=ce key=
        silent! set noshowmatch  noshowmode shortmess+=I cmdheight=1 cmdwinheight=10 showbreak=
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

        set whichwrap=b,s,h,l,<,>,[,]         " Backspace and cursor keys wrap too

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
        "silent! set wildchar=9 nowildmenu wildmode=list:longest wildoptions= wildignorecase cedit=<C-k>
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

        " smart Enter
        inoremap <silent><expr> <CR> (pumvisible() && bufname('%') !=# '[Command Line]' ? "\<C-e>\<CR>" : "\<C-g>u\<CR>")

        " diff
        nnoremap <silent> <expr> ,d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"

        " Clear hlsearch and set nopaste
        nnoremap <silent> <Esc><Esc> :<C-u>set nopaste<CR>:nohlsearch<CR>

        " Go to the first non-blank character of the line after paragraph motions
        noremap } }^
        noremap ; :

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

        " open ctag in tab/vertical split
        map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

        "------------------------------------------------------------------------------------------
        map <F2> "zyiw:exe "vertical h ".@z.""<CR>
        map <F3> :Scratch<CR>
        map <S-F3> :ScratchPreview<CR>
        ":vNEW
        "map <Fx> "zyiw:exe "vs ".@z.""<CR>
        map <F4> "zyiw<C-w>wo<Esc>"zp<C-w>W
        map <S-F4> "zY<C-w>wo<Esc>"zp<C-w>W

        "------------------------------------------------------------------------------------------
        sign define fixme text=!! linehl=Todo
        function! SignFixme()
            execute(":sign place ".line(".")." line=".line(".")." name=fixme file=".expand("%:p"))
        endfunction
        map <F5> :call SignFixme()<CR>

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
        map <F6> :call OnlineDoc8()<CR>

        map <S-F6> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
        "------------------------------------------------------------------------------------------
        nnoremap <C-down> :m .+1<CR>==
        nnoremap <C-up> :m .-2<CR>==

        "------------------------------------------------------------------------------------------
        " Super useful! From an idea by Michael Naumann
        vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
        vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

        "------------------------------------------------------------------------------------------
        nnoremap <leader>g :grep -R <cword> .<cr>
        nnoremap <leader>l :lgrep -R <cword> .<cr>
        nnoremap <leader><leader> :Ag <cword> .<cr>
        nmap <Leader>m [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
        "nnoremap K *N:grep! "\b<c-r><c-w>\b"<cr>:cw<cr>

        " bind \ (backward slash) to grep shortcut
        nnoremap \ :Ag<SPACE>

" }}}


        " Map  Samaritans of (, ", ', [

"---AAA3---------------------------------------------------------------------------------------------------------- {{{
        "inoremap <M-i> <Tab>
        " Map auto complete of (, ", ', [
        inoremap <C-q> ()<esc>i
        inoremap <C-t> []<esc>i
        inoremap <C-e> {}<esc>i
        inoremap <C-r> {<esc>o}<esc>O
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
        " inoremap <c-k><c-k> <esc>:help digraph-table<cr>

        " Enter, I never use the default behavior of <cr> and this saves me a keystroke...
        "
        inoremap <C-m>  <cr>
        nnoremap <C-m>  <cr>
        nnoremap <cr> o<esc>

        " Yank to end of line
        nnoremap Y y$

        " Reselect last-pasted text
        nnoremap gv `[v`]
        " select last paste in visual mode
        nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

        " Reselect last-pasted text


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
        " my screen
        nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

        " Bash like keys for the command line
        cnoremap <C-A> <Home>
        cnoremap <C-E> <End>
        "cnoremap <C-K> <C-U>
        cnoremap <C-P> <Up>
        cnoremap <C-N> <Down>

        "-X-Insert Mode Completion-X---------------
        inoremap <silent> <C-]> <C-x><C-]>
        inoremap <silent> <C-o> <C-x><C-o>
        "inoremap <silent> <C-k> <C-x><C-k>
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
        "set matchpairs+=<:> " Match, to used with %
        "set mat=2            " How many tenths of a second to blink when matching brackets
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

        highlight NonText             ctermfg=gray guifg=gray term=standout
        highlight SpecialKey          ctermfg=gray guifg=gray term=standout
        "highlight MatchParen         gui=bold guibg=NONE guifg=lightblue cterm=bold ctermbg=255
        highlight SpellBad            cterm=underline ctermfg=red ctermbg=NONE
        highlight SpellCap            cterm=underline ctermfg=blue ctermbg=NONE

        highlight StatusLine          ctermfg=white ctermbg=black cterm=bold
        highlight StatusLineNC        ctermfg=white ctermbg=black cterm=NONE
        highlight VertSplit           ctermfg=white ctermbg=black cterm=NONE
        "My stuff ---------------------------------
        hi CustomPink ctermbg=205 guibg=hotpink guifg=black ctermfg=magenta
        call matchadd('CustomPink', '\<System\>')
" }}}

"---AAA8---------------------------------------------------------------------------------------------------------- {{{
        "Airline
        let g:ctags_statusline=1
        let generate_tags=1
        set noshowmode
        set showcmd      " Show partial commands in status line and
        "----------------------------------------
        let g:airline#extensions#tabline#enabled = 2
        let g:airline#extensions#tabline#fnamemod = ':t'
        let g:airline#extensions#tabline#buffer_min_count = 1
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
        let g:gitgutter_max_signs = 1000

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

        " [ completion ] {{{ auto popup menu: Tab, C-x + C-?, C-y, C-e
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

        " [ popup menu ]
        set pumheight=20 " popup menu height. 0: long

        " [ preview ] window
        set previewheight=15

        " set file path completion.
        set path+=.,/usr/include,/usr/local/include

        set report=0 " always report changed lines
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
    ""set gfn=Lucida_Sans_Typewriter:h14:cANSI
    ""set guifont=Monospace\ Bold\ 18
    ""5amenu First.first :echo 'first'<cr>
    """ Disable scrollbars (real hackers don't use scrollbars for navigation!)
    ""set guioptions-=r
    ""set guioptions-=R
    ""set guioptions-=l
    ""set guioptions-=L
    ""hi Pmenu ctermbg=208 gui=bold
    ""hi Pmenu guibg=brown gui=bold
    ""set guioptions+=T
    """set guioptions-=mTrlb
    ""set nolinebreak
    """amenu Help.usr_08.txt
    """nmap Q gqap
    """amenu Help.-SEP- :
    """set grepprg=ack
    """set grepformat=%f:%l:%m
    """set keywordprg=man, ri, perldoc, <== K, 7K ??
" }}}

"---AAA14---------------------------------------------------------------------------------------------------------- {{{
        set splitbelow splitright
" }}}

"---AAA15---------------------------------------------------------------------------------------------------------- {{{
        set nospell
        nnoremap zz z=
        nnoremap z= :echo "use zz you idiot"<cr>

" }}}


"---AAA14---------------------------------------------------------------------------------------------------------- {{{
        "Quote words under cursor
        nnoremap <leader>' viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l
        nnoremap <leader>" viW<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l

        "Quote current selection TODO: This only works for selections that are created "forwardly"
        vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>ll
        vnoremap <leader>' <esc>a'<esc>gvo<esc>i'<esc>gvo<esc>ll

        nnoremap <F12> :TagbarToggle<CR>
        highlight TagListTagName    ctermfg=250
        highlight TagListTagScope   ctermfg=045
        highlight TagListTitle      ctermfg=226
        highlight TagListComment    ctermfg=235
        highlight TagListFileName   ctermfg=255 ctermbg=232

        " cyan
        highlight TagbarHighlight       ctermfg=051 ctermbg=none cterm=bold
        " gray
        highlight TagbarComment         ctermfg=238 ctermbg=none cterm=none
        " green
        highlight TagbarKind            ctermfg=154 ctermbg=none cterm=bold
        " dark green
        highlight TagbarNestedKind      ctermfg=070 ctermbg=none cterm=none
        " blue
        highlight TagbarScope           ctermfg=039 ctermbg=none cterm=none
        " yellow
        highlight TagbarType            ctermfg=190 ctermbg=none cterm=none
        " orange
        highlight TagbarSignature       ctermfg=202 ctermbg=none cterm=none
        " pink
        highlight TagbarPseudoID        ctermfg=205 ctermbg=none cterm=bold
        " red
        highlight TagbarFoldIcon        ctermfg=197 ctermbg=none cterm=none
        " dark green
        highlight TagbarAccessPublic    ctermfg=022 ctermbg=none cterm=none
        " dark red
        highlight TagbarAccessProtected ctermfg=088 ctermbg=none cterm=bold
        " red
        highlight TagbarPrivate         ctermfg=196 ctermbg=none cterm=italic

        " Learn Vim Script the Hard Way Exercises
        " noremap _ ddkP
        " noremap - ddp

        " Define operator-pending mappings to quickly apply commands to function names
        " and/or parameter lists in the current line
        onoremap inf :<c-u>normal! 0f(hviw<cr>
        onoremap anf :<c-u>normal! 0f(hvaw<cr>
        onoremap in( :<c-u>normal! 0f(vi(<cr>
        onoremap an( :<c-u>normal! 0f(va(<cr>

        " "Next" tag
        onoremap int :<c-u>normal! 0f<vit<cr>
        onoremap ant :<c-u>normal! 0f<vat<cr>

        " Function argument selection (change "around argument", change "inside argument")
        onoremap ia :<c-u>execute "normal! ?[,(]\rwv/[),]\rh"<cr>
        vnoremap ia :<c-u>execute "normal! ?[,(]\rwv/[),]\rh"<cr>

        " Bind <F1> to show the keyword under cursor general help can still be entered manually, with :h
        autocmd filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
        autocmd filetype vim noremap! <buffer> <F1> <Esc>:help <C-r><C-w><CR>

" }}}



" Extra vi-compatibility {{{
        set switchbuf=useopen    " reveal already opened files from the
        "set cpoptions+=$         " when changing a line, don't redisplay, but put a '$' at the end during the change
        set formatoptions-=o     " don't start new lines w/ comment leader on pressing 'o'
        au filetype vim set formatoptions-=o
" }}}


" Conflict markers {{{
        " vim-flake8 default configuration
        let g:flake8_show_in_gutter=1
        " highlight conflict markers
        match ErrorMsg '\v^[<\|=|>]{7}([^=].+)?$'
        " shortcut to jump to next conflict marker
        nnoremap <silent> <leader>c /\v^[<\|=>]{7}([^=].+)?$<CR>
" }}}

        " column, so swap them
        nnoremap ' `
        nnoremap ` '

        " YankRing stuff
        let g:yankring_history_dir = '$HOME/.vim/tmp'
        nnoremap <leader>r :YRShow<CR>

        " Pull word under cursor into LHS of a substitute (for quick search and replace)
        nnoremap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#



        " Get rid of italics (they look ugly)
        highlight htmlItalic            gui=NONE guifg=orange
        highlight htmlUnderlineItalic   gui=underline guifg=orange

        " Make error messages more readable
        highlight ErrorMsg              guifg=red guibg=white

        " for custom :match commands
        highlight Red                   guibg=red ctermbg=red
        highlight Green                 guibg=green ctermbg=green

        " for less intrusive signs
        highlight SignColumn ctermbg=255 guibg=#ffffd7
        if exists("*gitgutter#highlight#define_highlights")
                " let vim-gitgutter know we changed the SignColumn colors!
                call gitgutter#highlight#define_highlights()
        endif

        " gutter on the right of the text
        highlight ColorColumn ctermbg=2 guibg=#ffffd7

        " gutter below the text
        highlight NonText ctermbg=3 guibg=#ffffd7

        " suppress intro message because the above makes it look bad
        set shortmess+=I

        " fold column aka gutter on the left
        highlight FoldColumn ctermbg=4 guibg=#ffffd7

        " number column aka gutter on the left
        highlight LineNr ctermbg=5 guibg=#ffffd7

        " cursor column
        highlight CursorColumn ctermbg=7 guibg=#ffffd7

        " avoid invisible color combination (red on red)
        highlight DiffText ctermbg=1

        " easier on the eyes
        highlight Folded ctermbg=229 guibg=#ffffaf

        " Alt+b,f move word backwards/forwards
        cnoremap        <Esc>b          <S-Left>
        cnoremap        <Esc>f          <S-Right>

        " Alt-Backspace deletes word backwards
        cnoremap        <A-BS>          <C-W>
        cnoremap        <C-BS>          <C-W>

        " Do not lose "complete all" (gvim-only)
        cnoremap        <C-S-A>         <C-A>

        "XXX ToDo Insert line under cursor (builtin in vim 8.0.1787)
        cnoremap        <C-R><C-L>      <C-R>=getline(".")<CR>

        " <S-F8> = turn off location list
        map             <S-F8>          :lclose<CR>
        imap            <S-F8>          <C-O><S-F8>
        " <S-F8> = turn off location list
        map             <C-F8>          :lopen<CR>
        imap            <C-F8>          <C-O><C-F8>

        " <C-F9> = turn off quickfix
        map             <S-F9>          :cclose<CR>
        imap            <S-F9>          <C-O><S-F7>
        " <C-F9> = turn off quickfix
        map             <C-F9>          :copen<CR>
        imap            <C-F9>          <C-O><C-F9>

        " Diffget/diffput in visual mode
        vmap            \do             :diffget<CR>
        vmap            \dp             :diffput<CR>

        if has("digraphs")
                digraph -- 8212               " em dash
                digraph `` 8220               " left double quotation mark
                digraph '' 8221               " right double quotation mark
                digraph ,, 8222               " double low-9 quotation mark
        endif

        " diffoff used to set wrap as a side effect
        command! Diffoff                        diffoff | setlocal nowrap
        " See :help DiffOrig
        command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis \ | wincmd p | diffthis

        if has("eval")
                " don't override ^J/^K -- I don't mind ^J, but ^K is digraphs
                let g:UltiSnipsJumpForwardTrigger="<tab>"
                let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
                let g:UltiSnipsListSnippets="<C-R><tab>"
        endif

        " Sometimes pytest prepends an 'E' marker at the beginning of a traceback line
        " set errorformat+= \E\ %#File\ \"%f\"\\,\ line\ %l%.%#

        " fugitive {{{ Intuitive and Simple Git wrapper for Vim.
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
            autocmd QuickFixCmdPost grep cwindow
        " }}}

        let g:commentChar = {
                \ 'vim': '"',
                \ 'c': '//',
                \ 'cpp': '//',
                \ 'sh': '#',
                \ 'python': '#'
                \ }


        " :Errors, :SyntasticToggleMode, :SyntasticCheck,
        " Syntastic {{{ :w saving to check. or daemon automatic check.
            let g:syntastic_always_populate_loc_list = 1
            let g:syntastic_quiet_messages = {'level': 'warnings'}
            let g:syntastic_check_on_open = 0 " check when buffers first loaded/save
            let g:syntastic_echo_current_error = 1 " error associated with lines
            let g:syntastic_enable_signs = 1 " :sign interface to mark syntax errors
            let g:syntastic_error_symbol = '✗'
            let g:syntastic_style_error_symbol = 'S✗'
            let g:syntastic_warning_symbol = '⚠'
            let g:syntastic_style_warning_symbol = 'S⚠'
            let g:syntastic_enable_balloons = 1     " mouse hover, need '+balloon_eval'
            let g:syntastic_enable_highlighting = 1 " syntax highlighting to mark errors
            let g:syntastic_auto_jump = 0           " jump to first detected error
            let g:syntastic_auto_loc_list = 2       " 0/1/2: auto open/close error window
            let g:syntastic_loc_list_height = 10
            let g:syntastic_c_checker = "gcc"
            let g:syntastic_c_compiler = "gcc"      " gcc/clang
            let g:syntastic_c_check_header = 1      " check header files
            let g:syntastic_c_no_include_search = 0
            let g:syntastic_c_include_dirs = [ 'includes', 'headers', ]
            let g:syntastic_c_auto_refresh_includes = 1
            let g:syntastic_c_remove_include_errors = 1
            let g:syntastic_c_compiler_options = ' -ansi'
            let g:syntastic_cpp_compiler = 'g++'    " clang++, g++
            let g:syntastic_cpp_check_header = 1    " check header files
            let g:syntastic_cp_no_include_search = 0
            let g:syntastic_cpp_include_dirs = [ 'includes', 'headers', ]
            let g:syntastic_cpp_auto_refresh_includes = 1
            let g:syntastic_cpp_remove_include_errors = 1
            " alternately, set buffer local variable.
            let g:syntastic_cpp_compiler_options = ' -std=c++0x'
            " let b:syntastic_cpp_cflags = ' -I/usr/include/libsoup-2.4'
            " add additional compiler options.
            " let g:syntastic_cpp_config_file = '.config'
            " default: '.syntastic_cpp_config'
            " let g:syntastic_cpp_errorformat = ''
            " use this variable to override the default error format.
            " let g:syntastic_javascript_checker = "jslint"
            " let g:syntastic_csslint_options = "--warning=none" " disable warning
        " }}}

        " [ completion ] {{{
                " unite.vim {{{ Ultimate interface to unite all sources
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
                " let g:unite_no_default_keymappings = 1 " don't map default key mappings
        " }}}


        " clang_complete {{{ use of clang to complete in C/C++.
            " :h clang_complete.txt
            let g:clang_auto_select = 0 " 0/1/2 auto select first entry in popup menu
            " disable with 0 to solve neocomplcache problem
            let g:clang_complete_auto = 1 " auto complete after -> . ::
            let g:clang_complete_copen = 1 " 1: open quickfix window on error
            let g:clang_hl_errors = 1 " highlight warnings and errors
            let g:clang_periodic_quickfix = 0 " periodically update quickfix
            " you can use g:ClangUpdateQuickFix() with a mapping to do this
            let g:clang_snippets = 1
            " clang_complete, snipmate, ultisnips
            let g:clang_snippets_engine = "ultisnips"
            let g:clang_conceal_snippets = 1
            let g:clang_trailing_placeholder = 0 " for clang_complete snippet engine
            let g:clang_close_preview = 0 " auto close preview window after completion
            let g:clang_exec = "clang" " name or path of clang executable.
            let g:clang_user_options =
                        \ '-std=gnu99' .
                        \ '-stdlib=libc' .
                        \ '-I /usr/include'
            " let g:clang_user_options = '-std=gnu++0x -include malloc.h -fms-extensions -fgnu-runtime'
            " let g:clang_user_options = '-std=c++11 -stdlib=libc++'
            let g:clang_auto_user_options = "path, .clang_complete, clang"
            let g:clang_use_library = 1
            let g:clang_library_path = "/usr/lib/"
            let g:clang_sort_algo = "priority"
            let g:clang_complete_macros = 1
            let g:clang_complete_patterns = 1
        " }}}


        " neocomplcache-clang {{{ clang_complete for neocomplcache.
            "clang.so, clang.dll, libclang.dylib
            let g:neocomplcache_clang_use_library = 1 " use clang library
            let g:neocomplcache_clang_library_path = '/usr/lib/'
            let g:neocomplcache_clang_executable_path = '/usr/bin/clang'
            let g:neocomplcache_clang_macros = 1 " -code-completion-macros option
            let g:neocomplcache_clang_patterns = 1 " -code-completion-patterns option
            let g:neocomplcache_clang_auto_options = "path, .clang_complete, clang"
            let g:neocomplcache_clang_user_options = '-std=gnu99 -stdlib=libc'
            let g:neocomplcache_clang_debug = 0 " enable debug message.
            " let g:neocomplcache_clang_user_options = '-std=c++11 -stdlib=libc++'
        " }}}

        " Go {{{
        let g:tagbar_type_go = {
                \ 'ctagstype': 'go',
                \ 'kinds' : [
                        \'p:package',
                        \'f:function',
                        \'v:variables',
                        \'t:type',
                        \'c:const'
                        \ ]
                \ }
        " }}}

        " Markdown {{{
        let g:tagbar_type_markdown = {
                \ 'ctagstype' : 'markdown',
                \ 'kinds' : [
                \ 'h:Heading_L1',
                \ 'i:Heading_L2',
                \ 'k:Heading_L3'
                \ ]
                \ }
        " }}}

        " Xquery {{{
        let g:tagbar_type_xquery = {
                \ 'ctagstype' : 'xquery',
                \ 'kinds'     : [
                        \ 'f:function',
                        \ 'v:variable',
                        \ 'm:module',
                        \ ]
                \ }
        " }}}



""" <F12> = show the Unicode name of the character under cursor
""" I used to have my own :UnicodeName for this, but tpope/vim-characterize is
""" better
""map             <F12>           <Plug>(characterize)
""" <S-F12> = show highlight group under cursor
""map             <S-F12>         :ShowHighlightGroup<CR>
""" <C-F12> = show syntax stack under cursor
""map             <C-F12>         :ShowSyntaxStack<CR>
