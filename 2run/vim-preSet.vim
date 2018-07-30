
set so=5
nnoremap n nzz
set nowrapscan
set wrapscan
"-------------------------------AAA---------------------------------------------
au BufRead * normal zR
"-------------------------------------------------------------------------------
set cmdheight=2
"-------------------------------------------------------------------------------
set  t_Co=256
set showcmd
let leader = '\'
let mapleader=","
let maplocalleader = '_'
set runtimepath+=~/.vim/plugged/vimproc/
noremap <silent><leader>lc :lcl<CR>
noremap <silent><leader>lo :lw<CR>
"-------------------------------------------------------------------------------
filetype on
filetype plugin on
filetype indent on
syntax on
"set backup
"set backupdir=~/.vim/backup
set nobackup
set nowritebackup
"-------------------------------------------------------------------------------
set wildignore=*.swp,*.swo,*.bak,*.pyc,*.class
set noswapfile
"set nobackup
"set nowritebackup
"set wrapscan
"set spell
"-------------------------------BBB---------------------------------------------
set nu
set title
colorscheme blue
colorscheme darkblue
colorscheme desert
colorscheme delek
colorscheme peachpuff
colorscheme Benokai
set nowrapscan
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab
set mouse=a
"-------------------------------------------------------------------------------
set nocompatible
"-------------------------------------------------------------------------------
""""set backspace=indent,eol,start              " Backspace for dummies
""""set wildmode=list:longest,full              " Command <Tab> completion, list matches
""""set showmatch                               " Show matching brackets/parenthesis
set linespace=0                                 " No extra spaces between rows
set incsearch                                   " Find as you type search
set winminheight=0                              " Windows can be 0 line high
set ignorecase                                  " Case insensitive search
set smartcase                                   " Case sensitive when uc present
set wildmenu                                    " Show list instead of just completing
set whichwrap=b,s,h,l,<,>,[,]                   " Backspace and cursor keys wrap too
set scrolloff=3                                 " Minimum lines to keep above and below cursor
set foldenable                                  " Auto fold code
set list                                        "list?
set matchpairs+=<:>                             " Match, to be used with %
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.  " Highlight problematic whitespace
"-------------------------------CCC---------------------------------------------
set visualbell
set laststatus=2
"-------------------------------------------------------------------------------
set nowrap                           " Do not wrap long lines
set cindent                          " cindent
set nojoinspaces                     " Prevents inserting two spaces punctuation
set splitright                       " Puts new vsplit windows to the right
set splitbelow                       " Puts new split windows to the bottom
"-------------------------------------------------------------------------------
set gfn=Lucida_Sans_Typewriter:h14:cANSI
set guifont=Monospace\ Bold\ 18
"-------------------------------------------------------------------------------
if has("clipboard")
    set clipboard=unnamed " copy to the system clipboard
    if has("unnamedplus") " X11 support
        set clipboard+=unnamedplus
    endif
endif
"-------------------------------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"-------------------------------------------------------------------------------
set timeoutlen=250             " Time to wait after ESC (default annoying)
set cf                         " Enable error files & error jumping.
set autowrite                  " Writes on make/shell commands
set clipboard+=unnamed
set history=2024
set noruler
set smartindent
set autoindent
set cinoptions=N-s,g0,+2s,l-s,i2s
set hidden
set hlsearch
hi Search ctermbg=yellow
hi Search ctermfg=Red
"--------------------------------DDD--------------------------------------------
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undo
    set undoreload=10000        " Maximum number lines to save for undo on
endif
"-------------------------------------------------------------------------------
hi StatusLine         ctermfg=5     ctermbg=4     cterm=NONE
hi StatusLineNC       ctermfg=6     ctermbg=3     cterm=NONE
hi statusline ctermfg=White
hi statuslineNC guifg=White
hi StatusLine cterm=bold
"-------------------------------------------------------------------------------
let wordUnderCursor = expand("<cword>")
let currentLine   = getline(".")
"-------------------------------------------------------------------------------
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %P%*
"set statusline+=%{gutentags#statusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"-------------------------------------------------------------------------------
highlight Pmenu ctermbg=208 gui=bold
highlight Pmenu guibg=brown gui=bold
