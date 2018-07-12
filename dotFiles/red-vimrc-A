"--------------------------------------------------------------------------------
"---------------------------GVIM-------------------------------------------------
"--------------------------------------------------------------------------------
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"--------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'     "? 
Plug 'junegunn/seoul256.vim'  "? 
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
Plug 'thinca/vim-quickrun'
Plug 'mtth/scratch.vim'

call plug#end()

""My /Insert ------------------------------------------------------------------------
" Plug 'mtth/scratch.vim'
" Plug 'thinca/vim-quickrun'
""My /Insert ------------------------------------------------------------------------
nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>

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

set guifont=Monospace\ 20
set guifont=Monospace\ 14
"set guifont = Monaco:h20
"set guifont=Monospace\ 16
"set guifont=Fixed\Bold 11
set guifont=Monospace\ Bold\ 14
set guifont=Monospace\ 14

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
set nocompatible  " We don't want vi compatibility.
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
set laststatus=2  " Always show status line.
set mouse=a  " Mouse in all modes
" set backup  
""My stuff --------------------------------------------------------------------------
syntax on
colorscheme delek
colorscheme desert
colorscheme ron
colorscheme darkblue
colorscheme blue

" highlight last inserted text
nnoremap gV `[v`]
" Ich muss das noch anpassen !!
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
highlight Comment ctermbg=gray ctermfg=White
""My stuff --------------------------------------------------------------------------
set cursorline
highlight CursorLine guibg=DarkGray ctermbg=Black
""My stuff --------------------------------------------------------------------------
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
hi statusline guibg=Orange guifg=Black
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

""My stuff --------------------------------------------------------------------------
""-- nmap <leader>f0 :set foldlevel=0<CR>
""-- nmap <leader>f1 :set foldlevel=1<CR>
""-- nmap <leader>f2 :set foldlevel=2<CR>
""-- nmap <leader>f3 :set foldlevel=3<CR>
""-- nmap <leader>f4 :set foldlevel=4<CR>
""-- nmap <leader>f5 :set foldlevel=5<CR>
""-- nmap <leader>f6 :set foldlevel=6<CR>
""-- nmap <leader>f7 :set foldlevel=7<CR>
""-- nmap <leader>f8 :set foldlevel=8<CR>
""-- nmap <leader>f9 :set foldlevel=9<CR>
""-- " http://vimcasts.org/e/14
""-- cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
""-- map <leader>ew :e %%
""-- map <leader>es :sp %%
""-- map <leader>ev :vsp %%
""-- map <leader>et :tabe %%
""My stuff --------------------------------------------------------------------------
let mapleader=","
" omnicompletion : words
inoremap <leader>, <C-x><C-o>
" omnicompletion : filenames
inoremap <leader>: <C-x><C-f>
" omnicompletion : lines
inoremap <leader>= <C-x><C-l>
"My stuff --------------------------------------------------------------------------
"My stuff --------------------------------------------------------------------------
nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>
