" ln -s /usr/etc/vim_settings/vimrc /home/user/.vimrc
" ln -s /usr/etc/vim_settings/vim /home/user/.vim
"------------------------------------------------
" export VIMINIT="source ~/.vim/vimrc"
" echo ($VIMRUNTIME)
" echo ($MYVIMRC)
"------------------------------------------------
" set viminfo+=n~/.vim/viminfo
" set runtimepath=/home/b/.vim,$VIMRUNTIME
" letVIMHOME =HOME."/.vim"
"------------------------------------------------
"    system vimrc file: "$VIM/vimrc"
"      user vimrc file: "$HOME/.vimrc"
"  2nd user vimrc file: "~/.vim/vimrc"
"       user exrc file: "$HOME/.exrc"
"   system gvimrc file: "$VIM/gvimrc"
"     user gvimrc file: "$HOME/.gvimrc"
" 2nd user gvimrc file: "~/.vim/gvimrc"
"        defaults file: "$VIMRUNTIME/defaults.vim"
"     system menu file: "$VIMRUNTIME/menu.vim"
"   fall-back forVIM: "/usr/share/vim"
"-------------------------------------------------------------------------------
set nocompatible     " Must be first line
set vb t_vb=         " disable beep sound
set encoding=utf-8
set fileencodings=utf-8,sjis
set shell=/bin/bash
set spelllang=en,de

"--------------------------------
filetype on
filetype plugin on
filetype indent on

"--------------------------------
let maplocalleader= ','
let mapleader=' '
set mat=2            " How many tenths of a second to blink when matching brackets
set foldcolumn=1     " Add a bit extra margin to the left
set runtimepath+=~/.vim/plugged/vimproc/

"--For regular expr turn magic---------------------------------------------
silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
"--------------------------------------------------------------------------
    source ~/vim-plug.vim
    colorscheme dracula
    colorscheme Benokai
    colorscheme vividchalk
    colorscheme inkpot
    source ~/vim-itchyMashine.vim
"--------------------------------
    "source ~/vim-preSet.vim
    "source ~/vim-deopleteA.vim
    "source ~/vim-neo-omni.vim
    "source ~/vim-2syntastic.vim
    "source ~/vim-make.vim
    "source ~/vim-autocmd.vim
    "source ~/vim-maps.vim
    "source ~/vim-2optic.vim
    "source ~/vim-searchA.vim
    "source ~/vim-abbr.vim
    "source ~/vim-postSet.vim
    "source ~/vim-mashine.vim
"--------------------------------------------------------------------------
"--------------------------------------------------------------------------
hi StatusLineNC       ctermfg=6     ctermbg=3     cterm=NONE
hi statusline ctermfg=White
hi statuslineNC guifg=White
hi StatusLine cterm=bold
hi Search ctermbg=yellow
"hi Search ctermfg=Red
"----------------------------------------
let g:ctags_statusline=1
let generate_tags=1
"----------------------------------------
set cursorline
hi Cursor ctermbg=Cyan
hi CursorLine guibg=White ctermbg=Black
"highlight CursorLine term=underline cterm=underline ctermbg=None ctermfg=11
"----------------------------------------
imap jj <Esc>
noremap jj :w<cr>
noremap qq :q<cr>
inoremap <M-i> <Tab>
nnoremap <C-,> i
imap <C-,> <Esc>

"----------------------------------------
set wmh=0
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>|
map <C-L> <C-W>l<C-W>|
map <C-=> <C-W>=

"--Circular windows navigation-------------
nnoremap <Tab>   <c-W>w
nnoremap <S-Tab> <c-W>W

"------------------------------------------
set colorcolumn=120
highlight clear ColorColumn
highlight ColorColumn term=reverse ctermbg=Cyan guibg=Cyan
"------------------------------------------
hi clear SignColumn
hi SignColumn ctermbg =Cyan

"------------------------------------------
hi statusline ctermbg=Cyan ctermfg=Black
"------------------------------------------
" Airline
set noshowmode
set showmode

" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#buffer_min_count = 1


""My stuff --------------------------------------------------------------------------
""My stuff --------------------------------------------------------------------------
"highlight Comment ctermbg=DarkGray
"highlight Special ctermbg=Black
highlight Constant ctermbg=Blue
highlight NonText ctermbg=Gray
"highlight Normal ctermbg=Black
"highlight Cursor ctermbg=Green
"highlight Comment ctermbg=Blue ctermfg=White
"highlight Comment cterm=bold ctermbg=gray ctermfg=White
"highlight Comment ctermbg=gray ctermfg=White

""My stuff --------------------------------------------------------------------------
let g:quickrun_known_file_types = {
        \"cpp": ["!g++ %", "./a.out"],
        \"c": ["!gcc %", "./a.out"],
        \"php": ["!php %"],
        \"vim": ["source %"],
        \"py": ["!python %"],
    \}


"- set list
"- set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
"- set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
"------------------------------------------
"- " omnicompletion : words
"- inoremap <leader>, <C-x><C-o>
"- " omnicompletion : filenames
"- inoremap <leader>: <C-x><C-f>
"- " omnicompletion : lines
"- inoremap <leader>= <C-x><C-l>
"------------------------------------------
" echo (leader)
" echo (localleader)
"-------------------------------------------------------------------------------
