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
                "colorscheme dracula
                "colorscheme Benokai
                "colorscheme vividchalk
                "colorscheme inkpot
                colorscheme ego
                        source ~/git/aTest/dotFiles/inkVim/vim-inkOptic.vim
                        "source ~/git/aTest/dotFiles/inkVim/vim-inkFileType.vim
                        source ~/git/aTest/dotFiles/inkVim/vim-inkAutoCommand.vim
                        source ~/git/aTest/dotFiles/inkVim/vim-inkGUI.vim
                colorscheme ego
        "--------------------------------
        "--------------------------------
        " source ~/vim-deopleteA.vim
        " source ~/vim-neo-omni.vim
        " source ~/vim-make.vim
        " source ~/vim-autocmd.vim
        "--------------------------------
        "--------------------------------

        " cyan
        highlight TagbarHighlight       ctermfg=051 ctermbg=none cterm=bold
        "--------------------------------
        "highlight Comment ctermbg=6 ctermfg=White cterm=bold
        "highlight Comment ctermbg=3 ctermfg=White cterm=bold
        "highlight Comment ctermbg=6 ctermfg=White
        "--------------------------------

        set nowrap
        set wmh=0
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-H> <C-W>h<C-W>|
        map <C-L> <C-W>l<C-W>|
        map <C-=> <C-W>=

        nnoremap <S-j> :bn<cr>
        nnoremap <S-k> :bp<cr>

        "--Circular windows navigation-------------
        "-nnoremap <Tab>   <c-W>w
        "-nnoremap <S-Tab> <c-W>W
        "------------------------------------------

        set nosm
        hi Search ctermbg=yellow

        "let g:airline_section_b = '%{strftime("%D - %H:%M")}'
        let g:airline_section_c = '%{strftime("%D - %H:%M")}'
        "let g:airline_section_d = '%{strftime("%D - %H:%M")}'

        if !get(g:, 'loaded_gutentags', 0)
                finish
        endif

        function! airline#extensions#gutentags#status()
                let msg = gutentags#statusline()
                return empty(msg) ? '' :  'Gen. ' . msg
        endfunction

        function! airline#extensions#gutentags#init(ext)
                call airline#parts#define_function('gutentags', 'airline#extensions#gutentags#status')
        endfunction


        set cursorline
        hi StatusLineNC  ctermbg=3 ctermfg=6 cterm=NONE
        hi statuslineNC guifg=White
        hi statusline ctermbg=Cyan ctermfg=Black  cterm=bold

        "syntax on
        "set t_Co=256
        "colorscheme onehalfdark
        "let g:airline_theme='onehalfdark'
        "" lightline
        "" let g:lightline.colorscheme='onehalfdark'
        "My stuff --------------------------------------------------------------------------
        " echo (leader)
        " echo (localleader)
        "-------------------------------------------------------------------------------
