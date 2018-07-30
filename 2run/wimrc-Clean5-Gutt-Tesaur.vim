"--------------------------------------------------------------------------------
"---------------------------GVIM-------------------------------------------------
"--------------------------------------------------------------------------------
"    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \                    ------
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim   ------
"--------------------------------------------------------------------------------
" Make Ag searches of selected text----------------------------------------------
" for ag in 'ctrlp'--------------------------------------------------------------
"--------------------------------------------------------------------------------
    call plug#begin('~/.vim/plugged')
        Plug 'Shougo/vimproc.vim', {'do' : 'make'}
        Plug 'ron89/thesaurus_query.vim'
        Plug 'Chun-Yang/vim-action-ag'
        Plug 'mbbill/undotree'
        Plug 'bkad/CamelCaseMotion'
        Plug 'ron89/thesaurus_query.vim'
        Plug 'Rykka/trans.vim'
        Plug 'tpope/vim-sensible'     "?
        Plug 'junegunn/seoul256.vim'  "?
        Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
        Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
        Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
        Plug 'airblade/vim-gitgutter'
        Plug 'tpope/vim-surround'
        Plug 'thinca/vim-quickrun'
        Plug 'tpope/vim-eunuch'
        Plug 'mtth/scratch.vim'
        Plug 'rking/ag.vim'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-surround'
        Plug 'Shougo/neocomplete.vim'
        Plug 'majutsushi/tagbar'
        Plug 'Shougo/vimshell.vim'
        Plug 'scrooloose/syntastic'
        Plug 'tpope/vim-dispatch'
        Plug 'dhruvasagar/vim-zoom'
        Plug 'dbakker/vim-lint'
        Plug 'jalvesaq/Nvim-R'
        Plug 'vim-scripts/undofile.vim'
        Plug 'luochen1990/rainbow'
        Plug 'ludovicchabant/vim-gutentags'
        Plug 'Shougo/vimfiler.vim'
        Plug 'vim-scripts/SearchComplete'
        Plug 'vim-scripts/themes.vim'
    call plug#end()

    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator
    highlight clear SignColumn          " SignColumn should match background
    let g:gitgutter_signs = 1
    let g:gitgutter_highlight_lines = 1

    highlight SignColumn guibg=darkgrey

    highlight GitGutterAdd ctermfg=green
    highlight GitGutterChange ctermfg=yellow
    highlight GitGutterDelete ctermfg=red
    highlight GitGutterChangeDelete ctermfg=yellow

    nmap ]c <Plug>GitGutterNextHunk
    nmap [c <Plug>GitGutterPrevHunk
    nmap <Leader>hs <Plug>GitGutterStageHunk
    nmap <Leader>hu <Plug>GitGutterUndoHunk


"------------------------------------------------------------------------------
""--    let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
""--    let s:minfontsize = 6
""--    let s:maxfontsize = 16
""--    function! AdjustFontSize(amount)
""--        if has("gui_gtk2") && has("gui_running")
""--            let fontname = substitute(&guifont, s:pattern, '\1', '')
""--            let cursize = substitute(&guifont, s:pattern, '\2', '')
""--            let newsize = cursize + a:amount
""--            if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
""--                let newfont = fontname . newsize
""--                let &guifont = newfont
""--            endif
""--        else
""--            echoerr "You need to run the GTK2 version of Vim to use this function."
""--        endif
""--    endfunction
""--
""--    function! LargerFont()
""--        call AdjustFontSize(1)
""--    endfunction
""--    command! LargerFont call LargerFont()
""--
""--    function! SmallerFont()
""--        call AdjustFontSize(-1)
""--    endfunction
""--    command! SmallerFont call SmallerFont()
"------------------------------------------------------------------------------
"Simply use the provided mapping <C-W>m to toggle zoom in and out for the cu
"------------------------------------------------------------------------------
    function! ToggleBG()
        let s:tbg = &background
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction
    noremap <leader>bg :call ToggleBG()<CR>
"-------------------------------------------------------------------------------
    set spell          " Spell checking on......................................
    set backup         " Backups are nice ......................................
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
    if has('persistent_undo')
        set undofile                " So is persistent undo ...
        set undolevels=1000         " Maximum number of changes that can be undo
        set undoreload=10000        " Maximum number lines to save for undo on
    endif
"--------------------------------------------------------------------------------
"--------------------------------------------------------------------------------
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif
        if exists('g:spf13_consolidated_directory')
            let common_dir = g:spf13_consolidated_directory . prefix
        else
            let common_dir = parent . '/.' . prefix
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
"--------------------------------------------------------------------------------
" vimviews, vimundo, and vimswap files/directories, add the following to
"              eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
"--------------------------------------------------------------------------------
"--------------------------------------------------------------------------------
"" --     if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
"" --         nnoremap <silent> <leader>gs :Gstatus<CR>
"" --         nnoremap <silent> <leader>gd :Gdiff<CR>
"" --         nnoremap <silent> <leader>gc :Gcommit<CR>
"" --         nnoremap <silent> <leader>gb :Gblame<CR>
"" --         nnoremap <silent> <leader>gl :Glog<CR>
"" --         nnoremap <silent> <leader>gp :Git push<CR>
"" --         nnoremap <silent> <leader>gr :Gread<CR>
"" --         nnoremap <silent> <leader>gw :Gwrite<CR>
"" --         nnoremap <silent> <leader>ge :Gedit<CR>
"" --         " Mnemonic _i_nteractive
"" --         nnoremap <silent> <leader>gi :Git add -p %<CR>
"" --         nnoremap <silent> <leader>gg :SignifyToggle<CR>
"" --     endif
"--------------------------------------------------------------------------------

    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
"--------------------------------------------------------------------------------
"--------------------------------------------------------------------------------
    set showcmd
    let mapleader=","
    let maplocalleader = '_'
    let leader = '\'
    set runtimepath+=~/.vim/plugged/vimproc/
    noremap <silent><leader>lc :lcl<CR>
    noremap <silent><leader>lo :lw<CR>
    set  t_Co=256
    syntax on
"--------------------------------------------------------------------------------
"map <F10> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
"--------------------------------------------------------------------------------
"--------------------------------------------------------------------------------
    if has("clipboard")
      set clipboard=unnamed " copy to the system clipboard
      if has("unnamedplus") " X11 support
        set clipboard+=unnamedplus
      endif
    endif
""My /Insert ------------------------------------------------------------------------
""My /Insert ------------------------------------------------------------------------
    let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
""My stuff --------------------------------------------------------------------------
    let g:quickrun_known_file_types = {
            \"cpp": ["!g++ %", "./a.out"],
            \"c": ["!gcc %", "./a.out"],
            \"php": ["!php %"],
            \"vim": ["source %"],
            \"py": ["!python %"],
        \}
""My stuff ---------------------------------------------------------------------------
""My stuff ---------------------------------------------------------------------------
    set wmh=0
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-H> <C-W>h<C-W>|
    map <C-L> <C-W>l<C-W>|
    map <C-=> <C-W>=
""My stuff ---------------------------------------------------------------------------
""My stuff ---------------------------------------------------------------------------
    "set guifont = Monaco:h20
    "set guifont=Fixed\Bold 11
    set guifont=Monospace\ Bold\ 14
    set guifont=Monospace\ Bold\ 16
    set guifont=Monospace\ 16

""My stuff --------------------------------------------------------------------------
""My stuff --------------------------------------------------------------------------
    set timeoutlen=250                " Time to wait after ESC (default annoying)
    set cf                            " Enable error files & error jumping.
    set autowrite                     " Writes on make/shell commands
    set clipboard+=unnamed
    set history=2024
    set ruler
    set nu
    set cinwords=if,else,while,do,for,switch,case
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=80
    set smarttab
    set expandtab
    set smartindent
""My stuff ---------------------------------------------------------------------------
""My stuff ---------------------------------------------------------------------------
    syntax enable
    set nocompatible
""Minibuffer Explorer  Settings-------------------------------------------------------
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMapWindowNavArrows = 1
    let g:miniBufExplMapCTabSwitchBufs = 1
    let g:miniBufExplModSelTarget = 1
    " set list
    " set mat=5  " Bracket blinking.
    " alt+n or alt+p to navigate between entries in QuickFix
""My stuff ---------------------------------------------------------------------------
""My stuff ---------------------------------------------------------------------------
    set visualbell
    set laststatus=2
    set mouse=a
""My stuff ---------------------------------------------------------------------------
""My stuff ---------------------------------------------------------------------------
    colorscheme delek
    colorscheme blue
    colorscheme darkblue
    colorscheme peachpuff
    colorscheme desert
""My stuff ---------------------------------------------------------------------------
""My stuff ---------------------------------------------------------------------------
    "highlight Comment ctermbg=DarkGray
    "highlight Constant ctermbg=Blue
    "highlight Normal ctermbg=Black
    "highlight NonText ctermbg=Black
    "highlight Special ctermbg=Magenta
 highlight Cursor ctermbg=Green
 highlight Cursor ctermfg=Red
 highlight Cursor guibg=Green
 highlight Cursor guifg=Red
    "highlight Comment ctermbg=Blue ctermfg=White
    "highlight Comment cterm=bold ctermbg=gray ctermfg=White
""My stuff ---------------------------------------------------------------------------
""My stuff ---------------------------------------------------------------------------
    highlight LineNr ctermfg=White ctermbg=Black
""My stuff ---------------------------------------------------------------------------
    highlight Comment ctermbg=DarkCyan ctermfg=White
    highlight Comment ctermbg=Magenta ctermfg=White
    highlight Comment ctermbg=Gray ctermfg=White
""My stuff ---------------------------------------------------------------------------
    hi Search guibg=Black
    hi Search guifg=Cyan
    hi Search ctermbg=Cyan
    hi Search ctermfg=Red
""My stuff ---------------------------------------------------------------------------
""My stuff ---------------------------------------------------------------------------
    set cursorline
    highlight CursorLine cterm=bold term=bold guibg=Black ctermbg=Black
    set cursorline
""My stuff ---------------------------------------------------------------------------
""My stuff ---------------------------------------------------------------------------
    set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
    hi statusline guibg=White guifg=DarkBlue
    hi statusline ctermbg=White ctermfg=DarkBlue
    hi StatusLine                  ctermfg=5     ctermbg=4     cterm=NONE
    hi StatusLineNC                ctermfg=6     ctermbg=3     cterm=NONE
    hi statusline ctermfg=White
    hi StatusLine cterm=bold
    hi statuslineNC ctermfg=White
""------------------------------------------------
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
""set statusline+=%{gutentags#statusline()}
""let g:gutentags_project_root = ['Makefile']
""My stuff ---------------------------------------------------------------------------
""My stuff ---------------------------------------------------------------------------
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.  " Highlight problematic whitespace
    set backspace=indent,eol,start                  " Backspace for dummies
    set linespace=0                                 " No extra spaces between rows
    set number                                      " Line numbers on
""""set showmatch                                   " Show matching brackets/parenthesis
    set incsearch                                   " Find as you type search
    set hlsearch                                    " Highlight search terms
    set winminheight=0                              " Windows can be 0 line high
    set ignorecase                                  " Case insensitive search
    set smartcase                                   " Case sensitive when uc present
    set wildmenu                                    " Show list instead of just completing
""""set wildmode=list:longest,full                  " Command <Tab> completion, list matches
    set whichwrap=b,s,h,l,<,>,[,]                   " Backspace and cursor keys wrap too
    set scrolloff=3                                 " Minimum lines to keep above and below cursor
    set foldenable                                  " Auto fold code
    set list                                        "list?
""My stuff ---------------------------------------------------------------------------
    set nowrap                                      " Do not wrap long lines
    set autoindent                                  " Indent at the same level of the previous line
    set shiftwidth=4                                " Use indents of 4 spaces
    set expandtab                                   " Tabs are spaces, not tabs
    set tabstop=4                                   " An indentation every four columns
    set softtabstop=4                               " Let backspace delete indent
    set cindent                                     " cindent
    set nojoinspaces                                " Prevents inserting two spaces punctuation
    set splitright                                  " Puts new vsplit windows to the right
    set splitbelow                                  " Puts new split windows to the bottom
    ""set matchpairs+=<:>                           " Match, to be used with %
    ""set pastetoggle=<F12>                         " pastetoggle (sane indentation on pastes)
"My stuff --------------------------------------------------------------------------------
"set tabstop=2 shiftwidth=2 expandtab ----------------------------------------------------
"https://github.com/Shougo/neocomplete.vim/issues/332
"My stuff --------------------------------------------------------------------------------

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_auto_select = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#auto_completion_start_length = 2
    let g:neocomplete#sources#tags#cache_limit_size = 16777216
    let g:neocomplete#enable_fuzzy_completion = 1
    if !exists('g:neocomplete#same_filetypes')
      let g:neocomplete#same_filetypes = {}
    endif
    let g:neocomplete#same_filetypes._ = '_'
    inoremap <expr> <C-g> neocomplete#undo_completion()
    inoremap <expr> <C-l> neocomplete#complete_common_string()
    inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr> <C-e> neocomplete#cancel_popup()
  endif

"My stuff --------------------------------------------------------------------------------
" ==================== UltiSnips ====================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" Or take a look at Greg Hurrell's dotfiles for a solution. (vim-screencast Episode 10ish)
" For some bindings check Leader Map below
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsListSnippets="<leader><S-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"
"-------nnoremap TT :TlistToggle<CR>--------------------------
" instruction
" outcome
" expect
" expect
" expect
" expand
" expansion
"-------nnoremap TT :TlistToggle<CR>--------------------------
    inoremap <silent> <C-]> <C-x><C-]>
    inoremap <silent> <C-o> <C-x><C-o>
    inoremap <silent> <C-k> <C-x><C-k>
    inoremap <silent> <C-d> <C-x><C-d>
    inoremap <silent> <C-u> <C-x><C-u>
    inoremap <silent> <C-n> <C-x><C-f>
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>
    " <C-x><C-l> for line completion - rarely used
    " <C-x><C-v> for command-line completion - never used...interesting though
    " <C-x><C-t> for thesaurus completion - never used
"My stuff --------------------------------------------------------------------------------
    let g:tq_mthesaur_file="~/git/aTest/redVim/dikt/mthesaur.txt"
"My stuff --------------------------------------------------------------------------------
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ neocomplete#start_manual_complete()

"My stuff --------------------------------------------------------------------------------
    "au FileType * execute 'setlocal dict+=~/.vim/words/'.&filetype.'.txt'
    "set dictionary+=~/git/aTest/dotFiles/el-king18/misc/english-words.txt
"My stuff --------------------------------------------------------------------------------
    set dictionary+=~/git/aTest/redVim/dikt/english-words.txt
    set complete=.,w,b,u,t,k
    let g:neocomplete#sources#dictionary#dictionaries = {
          \ 'default' : '',
          \ 'vimshell' : $CACHE.'/vimshell/command-history',
          \ 'java' : '~/.vim/dict/java.dict,~/.vim/dict/ruby.dict',
          \ 'ruby' : '~/.vim/dict/ruby.dict',
          \ 'scala' : '~/.vim/dict/scala.dict',
          \ }
"My stuff --------------------------------------------------------------------------------
    iabbr str start
    iabbr supe superuser
    iabbr que question
    iabbrev #i #include
    iabbrev #d #define
    iab cmnt /*<CR><CR>*/<Up>
    iabbrev @@  alf@nomail.com
    iabbrev ccopy Copyright 2013 Alf , no rights reserved.
"My stuff --------------------------------------------------------------------------------
    "syn match VarName '\i\+' contained
    syn keyword VariableType real void String int nextgroup=VarName skipwhite
    hi VariableType ctermbg=Yellow
    hi VariableType ctermfg=brown
    hi VarName ctermfg=darkblue
"My stuff --------------------------------------------------------------------------------
    ""--hi CustomPink ctermbg=205 guibg=hotpink guifg=black ctermfg=black
    ""--call matchadd('CustomPink', '\<System\>')
    ""--match Todo / TST /
    ""--2match Error / ERR /
    ""--3match Title / Albert /
"My stuff --------------------------------------------------------------------------------
    "-- cmap handles command-line mappings.
    "-- imap handles insert-only mappings.
    "-- map maps keys in normal, visual, and operator-pending mode.
    "-- map! maps keys in Vim's command and insert modes.
    "-- nmap maps keys in normal mode only.
    "-- omap maps keys in operator-pending mode only.
    "-- vmap maps keys in visual mode only.
    "My stuff ------------------------------
    vmap <C-c> "*y
    nmap <C-c> "*Y
    nmap <C-p> "*p
    "My stuff ------------------------------
    cnoreabbrev H vert h
    cnoreabbrev HR vert bo h
    "My stuff ------------------------------
    map <F2> "zyiw:exe "vs ".@z.""<CR>
    map <F3> "zyiw<C-w>wo<Esc>"zp<C-w>w
    map <F4> "zY<C-w>wo<Esc>"zp<C-w>w
    map <F9> "zyiw:exe "vertical h ".@z.""<CR>
    "My stuff ------------------------------
    set nowrapscan
    set wrapscan
"My stuff --------------------------------------------------------------------------------
"My stuff --------------------------------------------------------------------------------
    nnoremap <C-down> :m .+1<CR>==
    nnoremap <C-up> :m .-2<CR>==
"My stuff --------------------------------------------------------------------------------
    "" line('^')
    "" let line=getline('.')
    "" call setline('.', line)
"My stuff --------------------------------------------------------------------------------
    let wordUnderCursor = expand("<cword>")
    let currentLine   = getline(".")
"My stuff --------------------------------------------------------------------------------
    function! OnlineDoc3()
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
    map <F5> :call OnlineDoc3()<CR>
"My stuff --------------------------------------------------------------------------------
    noremap <C-y> :Ag "<cword>"<cr>
"My stuff --------------------------------------------------------------------------------
    function! PreviewTag2(top)
        set previewheight=25
        exe "silent! pclose"
        if &previewwindow " don't do this in the preview window
            return
        endif
        let w = expand("<cword>") " get the word under cursor
        exe "ptjump " . w
        if a:top
            return
        endif " otherwise, make it vertical
        exe "silent! wincmd P"
        if &previewwindow " if we really get there...
            if has("folding")
                silent! .foldopen " don't want a closed fold
            endif
            wincmd L " move preview window to the left
            wincmd p " back to caller
            if !&previewwindow " got back
                wincmd _
            endif
        endif
    endfunction
    ""----------------------------------------------------------------------------------
    " make caller full size (I use minibufexplorer and for some reason
    " the window is altered by the preview window split and manipulation
    " so wincmd _ sets it back... your mileage may vary
    ""----------------------------------------------------------------------------------
    inoremap <C-]> <Esc>:call PreviewTa2(0)<CR>
    nnoremap <C-]> :call PreviewTag2(0)<CR>
    " simple above the caller preview window,
    nnoremap <M-]> :call PreviewTag2(1)<CR>
    inoremap <M-]> <Esc>:call PreviewTag2(1)<CR>
    noremap <M-[> <Esc>:pc<CR>
    " close preview--------------------------
    nnoremap gf <C-W>f
    vnoremap gf <C-W>f
    "" open ctag in tab/vertical split
    map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" Commands to make autoindent work
    filetype on
    filetype plugin on
    filetype indent on
    set cinoptions=N-s,g0,+2s,l-s,i2s
"My stuff --------------------------------------------------------------------------------
     augroup configgroup
         autocmd!
         autocmd VimEnter * highlight clear SignColumn
         autocmd BufWritePre *.php, *.py, *.js, *.txt, *.hs, *.java, *.md
                     \:call <SID>StripTrailingWhitespaces()
         autocmd FileType java setlocal noexpandtab
         autocmd FileType java setlocal list
         autocmd FileType java setlocal listchars=tab:+\ ,eol:-
         autocmd FileType java setlocal formatprg=par\ -w80\ -T4
         autocmd FileType php setlocal expandtab
         autocmd FileType php setlocal list
         autocmd FileType php setlocal listchars=tab:+\ ,eol:-
         autocmd FileType php setlocal formatprg=par\ -w80\ -T4
         autocmd FileType ruby setlocal tabstop=2
         autocmd FileType ruby setlocal shiftwidth=2
         autocmd FileType ruby setlocal softtabstop=2
         autocmd FileType ruby setlocal commentstring=#\ %s
         autocmd FileType python setlocal commentstring=#\ %s
         autocmd BufEnter *.cls setlocal filetype=java
         autocmd BufEnter *.zsh-theme setlocal filetype=zsh
         autocmd BufEnter Makefile setlocal noexpandtab
         autocmd BufEnter *.sh setlocal tabstop=2
         autocmd BufEnter *.sh setlocal shiftwidth=2
         autocmd BufEnter *.sh setlocal softtabstop=2
         autocmd filetype cpp nnoremap <F6> :!g++ % -ggdb -o %:r <CR>
         autocmd filetype cpp nnoremap<F7> :!g++ % -ggdb -o %:r && ./%:r <CR>
         autocmd filetype cpp nnoremap<F8> :!g++ % -ggdb -o %:r && gdb -tui %:r <CR>
         autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer>
         "autocmd FileType go autocmd BufWritePre <buffer> Fmt
         autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
         autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
     augroup END
"My stuff --------------------------------------------------------------------------------
compiler javac
set makeprg =javac\ hello2W.java
"My stuff --------------------------------------------------------------------------------


" Highlights some formatting errors
highlight clear LongLine
highlight link LongLine Error
highlight clear SpaceAtEnd
highlight link SpacesAtEnd Error
augroup vimrc_autocmds
  autocmd BufEnter * match LongLine /\%>100v.$/
  autocmd BufEnter * 2match SpacesAtEnd /\s\+$/
augroup END

" Highlight 81-st column
highlight clear ColorColumn
highlight ColorColumn term=reverse ctermbg=0* guibg=LightGray
set colorcolumn=101


highlight clear SyntasticError
highlight link SyntasticError Error

"set makeprg='$HOME/.vim/cmake_makeprg.sh'
let g:raibow_conf = {
\  'separately': {
\    'cmake': 0,
\  }
\}
nnoremap <silent> <leader>tt :TagbarToggle<CR>
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle



"--------------------------------------------------------------------------------
    noremap <F10> :SyntasticCheck<CR>
"   echo syntastic#util#system('echo "$PATH"')
"--------------------------------------------------------------------------------
"let g:syntastic_java_checkers = ['checkstyle']
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_java_javac_executable = '~/.vim/plugged/syntastic/syntax_checkers/java/javac.vim'
    let g:systastic_python_checkers = ['pylint', 'python']
    let g:syntastic_mode_map = {'mode': 'active'}
    let g:syntastic_python_pylint_quiet_messages = {}
    let g:syntastic_auto_jump = 1
    let g:syntastic_echo_current_error  = 1
    let g:syntastic_javascript_checkers=['jshint']
    let g:syntastic_php_checkers=['php']
    let g:syntastic_css_checkers=['csslint']
    let g:syntastic_check_on_w = 1
    let g:syntastic_python_checkers = ['pylint']
    let g:syntastic_always_populate_loc_list = 1
    "let g:syntastic_quiet_messages = { "type": "style" }
    let g:syntastic_enable_highlighting=0
    let g:syntastic_enable_signs=1
    highlight SyntasticErrorLine guibg=#550000
    highlight SyntasticWarningLine guibg=#331d1e
"--------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

