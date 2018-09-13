"--------------------------------------------------------------------------------
"---------------------------GVIM-------------------------------------------------
"--------------------------------------------------------------------------------
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"--------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
    " Make Ag searches of selected text
    Plug 'Chun-Yang/vim-action-ag'
    Plug 'mbbill/undotree'
    Plug 'bkad/CamelCaseMotion'
    " Make Ag searches of selected text
    Plug 'ron89/thesaurus_query.vim'
    Plug 'Rykka/trans.vim'
    Plug 'tpope/vim-sensible'     "?
    Plug 'junegunn/seoul256.vim'  "?
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
    Plug 'thinca/vim-quickrun'
    Plug 'mtth/scratch.vim'
    " for ag in 'ctrlp'----------------------------------------------------------
    Plug 'rking/ag.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'Shougo/neocomplete.vim'
    Plug 'majutsushi/tagbar'
call plug#end()
"--------------------------------------------------------------------------------


" yank to clipboard -------------------------------------------------------------
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif
""My /Insert ---------------------------------------------------------------------
" Plug 'mtth/scratch.vim'
" Plug 'thinca/vim-quickrun'
""My /Insert ---------------------------------------------------------------------
nnoremap TT :TlistToggle<CR>

""My stuff --------------------------------------------------------------------------
let mapleader = ','
let maplocalleader = '_'
let leader = '\'

""My stuff --------------------------------------------------------------------------
let g:quickrun_known_file_types = {
        \"cpp": ["!g++ %", "./a.out"],
        \"c": ["!gcc %", "./a.out"],
        \"php": ["!php %"],
        \"vim": ["source %"],
        \"py": ["!python %"],
    \}

""My stuff --------------------------------------------------------------------------
set wmh=0
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>|
map <C-L> <C-W>l<C-W>|
map <C-=> <C-W>=
""My stuff --------------------------------------------------------------------------
"set guifont = Monaco:h20
"set guifont=Fixed\Bold 11
set guifont=Monospace\ Bold\ 14
set guifont=Monospace\ 15

""My stuff --------------------------------------------------------------------------
set cf  " Enable error files & error jumping.
set clipboard+=unnamed
set history=2024
set autowrite  " Writes on make/shell commands
set ruler
set nu
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
set cinwords=if,else,while,do,for,switch,case
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab
set smartindent
""My stuff --------------------------------------------------------------------------
""My stuff --------------------------------------------------------------------------
syntax enable
set nocompatible
" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" alt+n or alt+p to navigate between entries in QuickFix
" set list
""My stuff --------------------------------------------------------------------------
set mat=5  " Bracket blinking.
set visualbell
set laststatus=2
set mouse=a
" set backup
""My stuff --------------------------------------------------------------------------
syntax on
colorscheme delek
colorscheme blue
colorscheme darkblue
colorscheme desert
colorscheme peachpuff

" highlight last inserted text
nnoremap gV `[v`]
""My stuff --------------------------------------------------------------------------
""My stuff --------------------------------------------------------------------------
""My stuff --------------------------------------------------------------------------
""My stuff --------------------------------------------------------------------------
"highlight Comment ctermbg=DarkGray
"highlight Constant ctermbg=Blue
"highlight Normal ctermbg=Black
"highlight NonText ctermbg=Black
"highlight Special ctermbg=Magenta
"highlight Cursor ctermbg=Green
"highlight Comment ctermbg=Blue ctermfg=White
"highlight Comment cterm=bold ctermbg=gray ctermfg=White
highlight Comment ctermbg=Magenta ctermfg=White
highlight Comment ctermbg=Magenta ctermfg=White
hi Search guibg=LightBlue
hi Search ctermbg=LightBlue
""My stuff --------------------------------------------------------------------------
""My stuff --------------------------------------------------------------------------
set cursorline
highlight CursorLine guibg=White ctermbg=Cyan
""My stuff --------------------------------------------------------------------------
""My stuff --------------------------------------------------------------------------
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
hi statusline guibg=White guifg=Blue
hi statusline ctermbg=White ctermfg=Blue
""My stuff --------------------------------------------------------------------------
""My stuff --------------------------------------------------------------------------
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
""My stuff --------------------------------------------------------------------------
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set cindent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
"set tabstop=2 shiftwidth=2 expandtab


"My stuff --------------------------------------------------------------------------
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_auto_select = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#auto_completion_start_length = 2
    let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB
    let g:neocomplete#enable_fuzzy_completion = 1
    if !exists('g:neocomplete#same_filetypes')
      let g:neocomplete#same_filetypes = {}
    endif
    let g:neocomplete#same_filetypes._ = '_'
    "My stuff --------------------------------------------
    "https://github.com/Shougo/neocomplete.vim/issues/332
    call neocomplete#custom#source('tags', 'converters',
    \ ['converter_remove_overlap', 'converter_remove_last_paren',
    \  'converter_disable_abbr', 'converter_abbr'])
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " disable for Python
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "     \'')
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
     call neocomplete#util#set_default_dictionary(
           \'g:neocomplete#sources#omni#input_patterns',
           \'python',
           \'[^. \t]->\h\w*\|\h\w*::\w*')
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " from neocomplete.txt:
    " Plugin key-mappings.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    inoremap <expr> <C-g> neocomplete#undo_completion()
    inoremap <expr> <C-l> neocomplete#complete_common_string()
    " <CR>: cancel popup and insert newline.
    inoremap <silent> <CR> <C-r>=neocomplete#smart_close_popup()<CR><CR>
    " <TAB>: completion.
    inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
    inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr> <C-e> neocomplete#cancel_popup()
    " <C-h>, <BS>: close popup and delete backword char.
  endif
"My stuff --------------------------------------------------------------------------
"
" preview window... to get it to open vert right, or horiz as desired
function PreviewTag2(top)
  "by MW
  set previewheight=25
  exe "silent! pclose"
  if &previewwindow " don't do this in the preview window
    return
  endif
  let w = expand("<cword>") " get the word under cursor
  exe "ptjump " . w
  " if any non False arg, open in simple horiz window so simply return
  if a:top
    return
  endif
  " otherwise, make it vertical
  exe "silent! wincmd P"
  if &previewwindow " if we really get there...
    if has("folding")
      silent! .foldopen " don't want a closed fold
    endif
    wincmd L " move preview window to the left
    wincmd p " back to caller
    if !&previewwindow " got back
      wincmd _
      " make caller full size (I use minibufexplorer and for some reason
      " the window is altered by the preview window split and manipulation
      " so wincmd _ sets it back... your mileage may vary
    endif
  endif
endfunction

" right hand window full height preview window
inoremap <C-]> <Esc>:call PreviewTa2(0)<CR>
nnoremap <C-]> :call PreviewTag2(0)<CR>
" simple "above the caller" preview window,
nnoremap <M-]> :call PreviewTag2(1)<CR>
inoremap <M-]> <Esc>:call PreviewTag2(1)<CR>
" close preview
noremap <M-[> <Esc>:pc<CR>


nnoremap gf <C-W>f
vnoremap gf <C-W>f

" open ctag in tab/vertical split
" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"My stuff --------------------------------------------------------------------------
"set complete+=k~/.vim/keywords.txt
"au FileType * execute 'setlocal dict+=~/.vim/words/'.&filetype.'.txt'
set dictionary+=~/git/aTest/dotFiles/el-king18/misc/english-words.txt
set complete=.,w,b,u,t
set complete+=k
"My stuff --------------------------------------------------------------------------
iabbr str start
iabbr supe superuser
iabbr que question
iabbrev #i #include (typing "#i" and space will be expanded to "#include")
iabbrev #d #define  (typing "#d" and space will be expanded to "#define")
iab cmnt /*<CR><CR>*/<Up>
iabbrev @@    alf@nomail.com
iabbrev ccopy Copyright 2013 Alf , no rights reserved.
"My stuff --------------------------------------------------------------------------
syn keyword VariableType real real1D real2D real3D int nextgroup=VarName skipwhite
syn match VarName '\i\+' contained
hi VariableType ctermfg=brown
hi VarName ctermfg=darkblue
"My stuff ------------------------------
hi CustomPink ctermbg=205 guibg=hotpink guifg=black ctermfg=black
call matchadd('CustomPink', '\<System\>')
"My stuff ------------------------------
match Todo /word1/
2match Error /word2/
3match Title /word3/
"My stuff ------------------------------
autocmd filetype cpp nnoremap <F6> :!g++ % -ggdb -o %:r <CR>
autocmd filetype cpp nnoremap<F7> :!g++ % -ggdb -o %:r && ./%:r <CR>
autocmd filetype cpp nnoremap<F8> :!g++ % -ggdb -o %:r && gdb -tui %:r <CR>
"My stuff ------------------------------
"-- cmap handles command-line mappings.
"-- imap handles insert-only mappings.
"-- map maps keys in normal, visual, and operator-pending mode.
"-- map! maps keys in Vim's command and insert modes.
"-- nmap maps keys in normal mode only.
"-- omap maps keys in operator-pending mode only.
"-- vmap maps keys in visual mode only.
"My stuff ------------------------------
vmap <C-c> "*y     " Yank current selection into system clipboard
nmap <C-c> "*Y     " Yank current line into system clipboard (if nothing is selected)
nmap <C-v> "*p     " Paste from system clipboard
"My stuff ------------------------------
cnoreabbrev H vert h
cnoreabbrev HR vert bo h

"My stuff ------------------------------
map <F2> "zyiw:exe "vs ".@z.""<CR>
map <F3> "zyiw<C-w>wo<Esc>"zp<C-w>w
map <F4> "zY<C-w>wo<Esc>"zp<C-w>w
map <F9> "zyiw:exe "vertical h ".@z.""<CR>

set nowrapscan
set wrapscan
"line('^')
"My stuff --------------------------------------------------------------------------
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
"My stuff --------------------------------------------------------------------------
"" let line=getline('.')
"" call setline('.', line)
"My stuff --------------------------------------------------------------------------
"My stuff --------------------------------------------------------------------------
let wordUnderCursor = expand("<cword>")
let currentLine   = getline(".")
"My stuff --------------------------------------------------------------------------
nnoremap TT :TlistToggle<CR>
"My stuff --------------------------------------------------------------------------
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
"My stuff --------------------------------------------------------------------------
noremap <C-y> :Ag "<cword>"<cr>

""My stuff --------------------------------------------------------------------------
 augroup configgroup
     autocmd!
     autocmd VimEnter * highlight clear SignColumn
     autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
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
 augroup END
