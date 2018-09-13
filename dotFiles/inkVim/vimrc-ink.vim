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
        "     set thesaurus+=~/Documents/thesaurus "Add thesaurus file for ^X^T
        "     set dictionary+=~/Documents/dictionary "Add dictionary file for ^X^K
        "-------------------------------------------------------------------------------------------
        "let MYVIMRC ='~/.vimrc'
        "set dictionary=/usr/share/
        set path+=.,/usr/include,/usr/local/include
        set thesaurus=mthesaur.txt
        set thesaurus=~/git/aTest/dotFiles/DICT/mthesaur.txt
        let s:thesaurus_pat = "~/git/aTest/dotFiles/DICT/mthesaur.txt"
        set dictionary=/home/red/git/aTest/dotFiles/DICT/english-words.txt
        set tags=""
        set tags=~/git/aTest/dotFiles/inkVim/tags
        set runtimepath+=~/.vim/plugged/vimproc/
        set nocompatible
        set encoding=utf-8
        set fileencodings=utf-8,sjis
        set shell=/bin/bash
        set spell
        set nospell
        "-------------------------------------------------------------------------------------------
        filetype on
        filetype plugin on
        filetype indent on
        "-------------------------------------------------------------------------------------------
        let maplocalleader= ','
        let mapleader=' '
        set vb t_vb=         " disable beep sound
        "--magic------------------------------------------------------------------------------------
        silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
        "-------------------------------------------------------------------------------------------
        source ~/git/aTest/dotFiles/inkVim/vim-inkPlug.vim
        source ~/git/aTest/dotFiles/inkVim/vim-inkEnv.vim
        source ~/git/aTest/dotFiles/inkVim/vim-inkItchyMashine.vim
                "colorscheme inkpot
                "colorscheme ego
                        "source ~/git/aTest/dotFiles/inkVim/vim-inkOptic.vim
                        "source ~/git/aTest/dotFiles/inkVim/vim-inkFileType.vim
                        source ~/git/aTest/dotFiles/inkVim/vim-inkAutoGroupAutoCommand.vim
                        source ~/git/aTest/dotFiles/inkVim/vim-inkGUI.vim
                        source ~/git/aTest/dotFiles/inkVim/vim-mopOptic.vim
                "colorscheme anderson
                colorscheme mopkai
        source ~/git/aTest/dotFiles/inkVim/vim-post.vim
        "--???-----------------------------------------------------------------------------
        let w:persistent_cursorline = 1
        " highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NON 
        " highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
        "IndentGuidesDisable
        "IndentGuidesToggle
        "set IndentGuidesEnable
        let g:indent_guides_auto_colors = 0
        "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=147
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=238
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=247

