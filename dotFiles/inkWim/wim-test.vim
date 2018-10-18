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


set nocompatible
"***************************** NeoBundleSetup ***********************
"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/arpit/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/arpit/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:

NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'amix/vim-zenroom2'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-notes'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'honza/vim-snippets'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'matze/vim-move'
NeoBundle 'powerline/powerline'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ryanoasis/vim-webdevicons'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'ryanoasis/vim-webdevicons'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'will133/vim-dirdiff'
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }
" Add or remove arguments to install.sh as necessary.
" Additional steps might be necessary for Windows, as always. ;)
let g:neobundle#install_process_timeout = 1500

NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }
"NeoBundle 'Shougo/neocomplete.vim' <-- For this pluging I followed the github
"instructions and extracted(copy-passted) autoload,doc and plugin folder in
"~/.vim directory.



" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"


" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

"---------------------------- End NeoBundle Scripts -------------------------

"*********************** NeoBundleFinish ****************************
"
"
"
"
"=====[ Show help files in a new tab, plus add a shortcut for helpg]==============

let g:help_in_tabs = 1

nmap <silent> H  :let g:help_in_tabs = !g:help_in_tabs<CR>

"Only apply to .txt files...
augroup HelpInTabs
    autocmd!
        autocmd BufEnter  *.txt   call HelpInNewTab()
        augroup END

"Only apply to help files...
        function! HelpInNewTab ()
            if &buftype == 'help' && g:help_in_tabs
                    "Convert the help window to a tab...
                            execute "normal \<C-W>T"
                                endif
                                endfunction
"
"
"
"Settings for syntastic plugin from its README file
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"

"Go to Normal mode quickly
imap jk <Esc>



"
"Set the Leader key as space
let mapleader = "\<Space>"
"Open Vimrc in new file. Use :edit for opening it in current tab.
nmap <leader>v :tabedit $MYVIMRC<CR>

"NERDTree Settings
nmap <leader>nt :NERDTreeToggle<CR>

"Set autoindent
set autoindent
"Set line numbers and relative line numbers -  at this point I think they are
"awesome
set number
set relativenumber

"syntax on
syntax on


"set the syntax on
syntax enable

"highlighting the searches
set hlsearch " CTRL-L / CTRL-R W
set incsearch"

" Turn on the mouse, since it doesn't play well with tmux anyway. This way I can
" scroll in the terminal
set mouse=a


" Set to auto read when a file is changed from the outside
set autoread

" Display unprintable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=3

" Case insensitive search
set ignorecase
set smartcase

" Don't show matching brackets
set noshowmatch

" Tab settings
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab



" Text display settings
set linebreak
set textwidth=80
set autoindent
set nowrap
set whichwrap+=h,l,<,>,[,]


"from https://github.com/Valloric/dotfiles/blob/master/vim/vimrc.vim
" with this, we can now type ",." to exit out of insert mode
" if we really wanted to type ",.", then just type one char, wait half a sec,
" type another
inoremap ,. <Esc>
vnoremap ,. <Esc>



"from https://github.com/Valloric/dotfiles/blob/master/vim/vimrc.vim
"let g:airline_powerline_fonts = 1

"from https://github.com/Valloric/dotfiles/blob/master/vim/vimrc.vim
" key bindings for quickly moving between windows
" h left, l right, k up, j down
noremap <leader>h <c-w>h
noremap <leader>l <c-w>l
noremap <leader>k <c-w>k
noremap <leader>j <c-w>j









"Type <Space>w to save file (a lot faster than :w<Enter>):
noremap <Leader>w :w<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
