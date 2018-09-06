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
        "-???-- path + 
        set path+=.,/usr/include,/usr/local/include
        set thesaurus=mthesaur.txt
        "set dictionary+="~/git/aTest/redVim/dikt/english-words.txt"
        "set dictionary+="~/git/aTest/redVim/dikt/english-words.txt"
        "set dictionary=/usr/share/
        set dictionary+="~/git/aTest/redVim/dikt/words.txt"
        set dictionary+="~/git/aTest/redVim/dikt/100w.txt"
        set dictionary+="~/git/aTest/redVim/dikt/english-words.txt"
        set dictionary="~/git/aTest/redVim/dikt/english-words.txt"
        set dictionary="/home/red/git/aTest/dotFiles/DICT/"
        set dictionary=/home/red/git/aTest/dotFiles/DICT/english-words.txt
        "-???-- path + 
        set tags=""
        "-???-- path + 
        let s:thesaurus_pat = "~/git/aTest/redVim/dikt/mthesaur.txt"
        set runtimepath+=~/.vim/plugged/vimproc/
        set nocompatible
        set encoding=utf-8
        set fileencodings=utf-8,sjis
        set shell=/bin/bash
        set spell
        "----------------------------------------
        filetype on
        filetype plugin on
        filetype indent on
        "----------------------------------------
        let maplocalleader= ','
        let mapleader=' '
        set vb t_vb=         " disable beep sound
        "--magic-------------------------------------------------------------------
        silent! set wrapscan ignorecase smartcase incsearch hlsearch magic
        "--------------------------------------------------------------------------

        source ~/git/aTest/dotFiles/inkVim/vim-inkPlug.vim
        source ~/git/aTest/dotFiles/inkVim/vim-inkEnv.vim
        source ~/git/aTest/dotFiles/inkVim/vim-inkItchyMashine.vim
                "colorscheme Benokai
                "colorscheme inkpot
                "colorscheme ego
                        "source ~/git/aTest/dotFiles/inkVim/vim-inkOptic.vim
                        "source ~/git/aTest/dotFiles/inkVim/vim-inkFileType.vim
                        source ~/git/aTest/dotFiles/inkVim/vim-inkAutoGroupAutoCommand.vim
                        source ~/git/aTest/dotFiles/inkVim/vim-inkGUI.vim
                        source ~/git/aTest/dotFiles/inkVim/vim-mopOptic.vim
                "colorscheme redstring
                "colorscheme anderson
                colorscheme mopkai
        "-------------------------------------------------------------------------------
        "hi customPink ctermbg=205 guibg=hotpink guifg=black ctermfg=magenta
        set nowrap
        set wmh=0
        "-------------------------------------------------------------------------------
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
        "brackets show match
        set nosm
        "-------------------------------------------------------------------------------
        "-------------------------------------------------------------------------------
                " Insert completion
                silent! set complete& completeopt=menu infercase pumheight=10 noshowfulltag shortmess+=c

                "-[completion]-auto popup menu: Tab, C-x + C-?, C-y, C-e
                set complete=.,w,b,t,i,u,k       " completion buffers
                "            | | | | | | |
                "            | | | | | | `-dict
                "            | | | | | `-unloaded buffers
                "            | | | | `-include files
                "            | | | `-tags
                "            | | `-other loaded buffers
                "            | `-windows buffers
                "            `-the current buffer
                "set completeopt-=preview " dont show preview window
                set completeopt=menu
                set completeopt=menuone " menu,menuone,longest,preview
                set completeopt=longest,menuone
        "-------------------------------------------------------------------------------
        highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE
        "-------------------------------------------------------------------------------
        "=====[ Comments are important ]==================
        "highlight Comment term=bold ctermfg=white
        "-------------------------------------------------------------------------------
        set cursorline
        set cursorcolumn
        "-------------------------------------------------------------------------------
        highlight LineNr ctermfg=1 ctermbg=120
        highlight cursorcolumn ctermbg=0
        highlight CursorLine ctermbg=0 term=bold cterm=bold
        highlight Cursor ctermbg=1 term= bold
        "-------------------------------------------------------------------------------
        "-------------------------------------------------------------------------------
        if &term =~ "xterm\\|rxvt"
                "use an orange cursor in insert mode
                let &t_SI = "\<Esc>]12;orange\x7"
                "use a red cursor otherwise
                let &t_EI = "\<Esc>]12;green\x7"
                silent !echo -ne "\033]12;green\007"
                "reset cursor when vim exits
                autocmd VimLeave * silent !echo -ne "\033]112\007"
                "use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
        endif
        "-------------------------------------------------------------------------------
        "autocmd InsertEnter * set cul
        "autocmd InsertLeave * set nocul
        "hi Cursor ctermbg=red
        hi Normal ctermbg=234
        "-------------------------------------------------------------------------------
        map <C-F2> :Scratch<CR>
        map <S-F2> :ScratchPreview<CR>

        set tags=~/git/aTest/dotFiles/inkVim/tags
