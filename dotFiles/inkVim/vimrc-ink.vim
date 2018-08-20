"----------------------------------------------------------------------------------------------------------------------
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                         \_/ |_|_| |_| |_|_|  \___|
"----------------------------------------------------------------------------------------------------------------------
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
        set runtimepath+=~/.vim/plugged/vimproc/
        set nocompatible
        set encoding=utf-8
        set fileencodings=utf-8,sjis
        set shell=/bin/bash
        set nospell
        set spelllang=en
        "set spelllang=en,de
        "----------------------------------------
        filetype on
        filetype plugin on
        filetype indent on

        "----------------------------------------
        let maplocalleader= ','
        let mapleader=' '
        set vb t_vb=         " disable beep sound
        set mat=2            " How many tenths of a second to blink when matching brackets
        set foldcolumn=1     " Add a bit extra margin to the left

        "--magic-------------------------------------------------------------------
        silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
        hi Search ctermbg=yellow

"--------------------------------------------------------------------------
"--------------------------------------------------------------------------
        source ~/git/aTest/dotFiles/inkVim/vim-inkPlug.vim
        colorscheme dracula
        colorscheme Benokai
        colorscheme vividchalk
        colorscheme inkpot
        source ~/git/aTest/dotFiles/inkVim/vim-inkItchyMashine.vim
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
        set wmh=0
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-H> <C-W>h<C-W>|
        map <C-L> <C-W>l<C-W>|
        map <C-=> <C-W>=

        "--Circular windows navigation-------------
        nnoremap <Tab>   <c-W>w
        nnoremap <S-Tab> <c-W>W

"My stuff --------------------------------------------------------------------------
" echo (leader)
" echo (localleader)
"-------------------------------------------------------------------------------


augroup NrHighlight
  autocmd!
  autocmd WinEnter * hi LineNr ctermfg=247 guifg=#9e9e9e ctermbg=233 guibg=#121212
  autocmd WinLeave * hi LineNr ctermfg=274 guifg=#e9e9e9 ctermbg=133 guibg=#212121
augroup END
