        "-------------------------------------------------------------------------------------------
        "                 __   _(_)_ __ ___  _ __ ___
        "                 \ \ / / | '_ ` _ \| '__/ __|
        "                  \ V /| | | | | | | | | (__
        "                   \_/ |_|_| |_| |_|_|  \___|
        "-------------------------------------------------------------------------------------------
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
        "-------------------------------------------------------------------------------------------

        set runtimepath+=~/.vim/plugged/vimproc/
        set nocompatible
        set encoding=utf-8
        set fileencodings=utf-8,sjis
        set shell=/bin/bash
        set nospell
        "----------------------------------------
        filetype on
        filetype plugin on
        filetype indent on

        "----------------------------------------
        let maplocalleader= ','
        let mapleader=' '
        set vb t_vb=         " disable beep sound
        set foldcolumn=1     " Add a bit extra margin to the left

        "--magic-------------------------------------------------------------------
        silent! set wrapscan ignorecase smartcase incsearch hlsearch magic

        source ~/git/aTest/dotFiles/inkVim/vim-inkPlug.vim
        source ~/git/aTest/dotFiles/inkVim/vim-inkEnv.vim
        source ~/git/aTest/dotFiles/inkVim/vim-inkItchyMashine.vim
                "colorscheme Benokai
                "colorscheme vividchalk
                "colorscheme inkpot
                colorscheme ego
                        "source ~/git/aTest/dotFiles/inkVim/vim-inkOptic.vim
                        "source ~/git/aTest/dotFiles/inkVim/vim-inkFileType.vim
                        source ~/git/aTest/dotFiles/inkVim/vim-inkAutoGroupAutoCommand.vim
                        source ~/git/aTest/dotFiles/inkVim/vim-inkGUI.vim
                "colorscheme redstring
                "colorscheme anderson
                source ~/git/aTest/dotFiles/inkVim/vim-mopOptic.vim
                colorscheme mopkai
        highlight CursorLine ctermbg=240 term=bold cterm=bold
        "My stuff-----------------------------------------------------------
        "hi CustomPink ctermbg=205 guibg=hotpink guifg=black ctermfg=magenta
        hi CustomPink ctermbg=190
        call matchadd('CustomPink', '\< System\>')
        call matchadd('CustomPink', '\<map\>')
        call matchadd('CustomPink', '\<nnoremap\>')
        call matchadd('CustomPink', '\<<C-\>')
        call matchadd('CustomPink', '\<c-\>')
        call matchadd('CustomPink', '\<Leader\>')
        "-------------------------------------------------------------------
        " cyan
        highlight TagbarHighlight   ctermfg=051 ctermbg=none cterm=bold
        highlight TagListTagName    ctermfg=250
        "My stuff------------------------------------------------------------

        highlight LineNr ctermfg=1 ctermbg=200 "pink
        highlight LineNr ctermfg=1 ctermbg=220 "yello
        highlight LineNr ctermfg=1 ctermbg=230 "white
        highlight LineNr ctermfg=1 ctermbg=240 "DarkGray
        highlight LineNr ctermfg=1 ctermbg=250 "lightGray
        highlight LineNr ctermfg=1 ctermbg=190 "yellowBright
        highlight LineNr ctermfg=1 ctermbg=180 "rosaCream
        highlight LineNr ctermfg=1 ctermbg=170 "pinkPlume
        highlight LineNr ctermfg=1 ctermbg=160 "RedOrange
        highlight LineNr ctermfg=1 ctermbg=150 "lightGreen
        highlight LineNr ctermfg=1 ctermbg=140 "lightPurple
        highlight LineNr ctermfg=1 ctermbg=130 "darkOrange
        highlight LineNr ctermfg=1 ctermbg=120 "mintBright
        highlight LineNr ctermfg=1 ctermbg=110 "lightBlue
        highlight LineNr ctermfg=1 ctermbg=100 "DarkYellow
        highlight LineNr ctermfg=1 ctermbg=90  "Purple
        highlight LineNr ctermfg=1 ctermbg=80  "brightLightBlue
        highlight LineNr ctermfg=1 ctermbg=70  "lightGreen
        highlight LineNr ctermfg=1 ctermbg=50  "lightGreenBlue
        highlight LineNr ctermfg=1 ctermbg=30  "DarkCyan
        highlight LineNr ctermfg=1 ctermbg=20  "Blue
        highlight LineNr ctermfg=1 ctermbg=10  "NiceGreen
        highlight LineNr ctermfg=1 ctermbg=9   "NiceReds
        highlight LineNr ctermfg=1 ctermbg=8   "DarkGray
        highlight LineNr ctermfg=1 ctermbg=7   "LightGray
        highlight LineNr ctermfg=1 ctermbg=120 "mintBright

        "-------------------------------------------------------------------------------
        set nowrap
        set wmh=0
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-H> <C-W>h<C-W>|
        map <C-L> <C-W>l<C-W>|
        map <C-=> <C-W>=

        "-------------------------------------------------------------------------------
        nnoremap <S-j> :bn<cr>
        nnoremap <S-k> :bp<cr>
        nnoremap <m-j> :bn<cr>
        nnoremap <m-k> :bp<cr>
        "-------------------------------------------------------------------------------
        set nosm
        let g:bling_time = 100
        let g:bling_color_fg = 'green'
        let g:bling_color_cterm = 'reverse'


        if has("autocmd")
                " Kill visual bell! kill!
                augroup GUI
                        au!
                        au GUIEnter * set t_vb=
                augroup END

                augroup LastPositionJump
                        au!
                        au BufReadPost *
                                                \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                                                \ |   exe "normal! g`\""
                                                \ | endif
                augroup END
        endif
        "-------------------------------------------------------------------------------
