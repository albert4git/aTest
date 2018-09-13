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
Plug 'itchyny/landscape.vim'
call plug#end()

""My /Insert ------------------------------------------------------------------------
" Plug 'itchyny/lightline.vim'
" Plug 'mtth/scratch.vim'
" Plug 'thinca/vim-quickrun'
""----------------------------------------------------------------
nnoremap TT :TlistToggle<CR>
"----------------------------


if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=50 columns=80
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif


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
2018 Aug 17

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
colorscheme desert
colorscheme ron
colorscheme darkblue
colorscheme delek

"set cursorline
"highlight CursorLine guibg=White ctermbg=White
""My stuff --------------------------------------------------------------------------
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
hi statusline guibg=Orange guifg=Black
""My stuff --------------------------------------------------------------------------
""My stuff --------------------------------------------------------------------------
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set matchpairs+=<:>             " Match, to be used with %
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
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
"set tabstop=2 shiftwidth=2 expandtab
"set tabstop=2 shiftwidth=2 expandtab


""My stuff --------------------------------------------------------------------------
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
     automd BufEnter *.sh setlocal tabstop=2
     autocd BufEnter *.sh setlocal shiftwidth=2
     autocd BufEnter *.sh setlocal softtabstop=2
 augroup ED

""My stuff --------------------------------------------------------------------------
let mapleader=","
" omnicompletion : words
inoremap <leader>, <C-x><C-o>
" omnicompletion : filenames
inoremap <leader>: <C-x><C-f>
" omnicompletion : lines
inormap <leader>= <C-x><C-l>
"My stuff --------------------------------------------------------------------------
nnoemap TT :TlistToggle<CR>
ap <F4> :TlistToggle<CR>


