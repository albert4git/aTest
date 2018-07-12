"------------------------------------------------------------------------
"------------------------------------------------------------------------
"""""""""""""""""""""" nVIM Neo VIM """""""""""""""""""""""""""""""""""""
"------------------------------------------------------------------------

call plug#begin()
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'brooth/far.vim'
Plug 'neomake/neomake'

Plug 'thinca/vim-quickrun'
Plug 'mtth/scratch.vim'
call plug#end()


"My stuff ---------------------------
""-- " When writing a buffer (no delay).
""-- call neomake#configure#automake('w')
""-- " When writing a buffer (no delay), and on normal mode changes (after 750ms).
""-- call neomake#configure#automake('nw', 750)
""-- " When reading a buffer (after 1s), and when writing (no delay).
""-- call neomake#configure#automake('rw', 1000)
""-- " Full config: when writing or reading a buffer, and on changes in insert and
""-- " normal mode (after 1s; no delay when writing).
""-- call neomake#configure#automake('nrwi', 500)
""-- "------------------------------------
""-- let g:neomake_open_list = 2
"------------------------------------

"My stuff ---------------------------
nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>


let mapleader = ','
let maplocalleader = '_'
let leader = '\'

"My stuff ---------------------------
let g:quickrun_known_file_types = {
        \"cpp": ["!g++ %", "./a.out"],
        \"c": ["!gcc %", "./a.out"],
        \"php": ["!php %"],
        \"vim": ["source %"],
        \"py": ["!python %"],
    \}

"My stuff ---------------------------
set wmh=0
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>|
map <C-L> <C-W>l<C-W>|
map <C-=> <C-W>=
"My stuff ---------------------------

set guifont=Monospace\ 20
set guifont=Monospace\ 14
"set guifont = Monaco:h20
"set guifont=Monospace\ 16
"set guifont=Fixed\Bold 11
set guifont=Monospace\ Bold\ 16

"My stuff ---------------------------
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
"My stuff ---------------------------

"My stuff ---------------------------
syntax enable
set nocompatible  " We don't want vi compatibility.
" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" alt+n or alt+p to navigate between entries in QuickFix 
" Visual
" set list
set mat=5  " Bracket blinking.
set visualbell
set laststatus=2  " Always show status line.
set mouse=a  " Mouse in all modes
set backup  
"My stuff ---------------------------
syntax on
colorscheme blue
colorscheme delek
colorscheme desert
colorscheme ron
colorscheme darkblue

" highlight last inserted text
nnoremap gV `[v`]
" Ich muss das noch anpassen !!
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
"My stuff ---------------------------

"My stuff ---------------------------

"My stuff ---------------------------
"set background=dark
hi Comment ctermfg=DarkGrey guifg=Grey
hi statusline guibg=Orange guifg=#0000AA
hi Search guibg=Orange
hi statusline guibg=green
"My stuff ---------------------------

"My stuff ---------------------------
set cursorline
highlight CursorLine guibg=#7fffd4 ctermbg=234
highlight CursorLine guibg=black ctermbg=234
"My stuff ---------------------------
"My stuff ---------------------------
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=magenta
  elseif a:mode == 'r'
    hi statusline guibg=pink
  else
    hi statusline guibg=red
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=green
"My stuff ---------------------------
"My stuff ---------------------------
"set background=dark

function! ToggleHiddenAll()                                                                                                                       
    if s:hidden_all  == 0                                                                                                                         
        let s:hidden_all = 1                                                                                                                      
        set noshowmode                                                                                                                        
        set noruler                                                                                                                           
        set laststatus=0                                                                                                                      
        set noshowcmd                                                                                                                         
        set showtabline=0                                                                                                                     
    else                                                                                                                                          
        let s:hidden_all = 0                                                                                                                      
        set showmode                                                                                                                          
        set ruler                                                                                                                             
        set laststatus=2                                                                                                                      
        set showcmd                                                                                                                           
        set showtabline=1                                                                                                                     
    endif                                                                                                                                         
endfunction

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
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
"set tabstop=2 shiftwidth=2 expandtab
set cindent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)



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
 
"My stuff ---------------------------
nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>
