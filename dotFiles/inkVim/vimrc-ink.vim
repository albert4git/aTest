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
                        "source ~/git/aTest/dotFiles/inkVim/vim-inkFileType.vim
                        "source ~/git/aTest/dotFiles/inkVim/vim-inkAutoGroupAutoCommand.vim
                        source ~/git/aTest/dotFiles/inkVim/ex-2mashine.vim
                        source ~/git/aTest/dotFiles/inkVim/vim-inkGUI.vim
                        colorscheme mopkai
                        source ~/git/aTest/dotFiles/inkVim/vim-mopOptic.vim
                "colorscheme anderson
        source ~/git/aTest/dotFiles/inkVim/vim-post.vim
"-TOP-------------------------------------------------------------------------------------------------------------------
        "!!!" IndentGuidesDisable "!!!"
        "!!!" IndentGuidesToggle  "!!!"
        let g:indent_guides_auto_colors = 0
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray26 ctermbg=238
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray33 ctermbg=247

"-TOP-------------------------------------------------------------------------------------------------------------------
        highlight BookmarkSign ctermbg=9 ctermfg=1
        highlight BookmarkLine ctermbg=9 ctermfg=1
        highlight BookmarkAnnotationLine ctermbg=9 ctermfg=1
        highlight BookmarkAnnotationSign ctermbg=9 ctermfg=1

"-TOP-------------------------------------------------------------------------------------------------------------------
        set tabpagemax=15               " Only show 15 tabs
        set ruler                       " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids

        set cursorline
        set cursorcolumn
        let w:persistent_cursorline = 1
        "hi Search                      ctermbg=10
        hi CursorColumn                ctermbg=16
        hi CursorLine                  ctermbg=16
        hi ColorColumn                 ctermbg=23
        set colorcolumn=1,8,16,24,100,120
        hi LineNr ctermfg=1 ctermbg=123 
        hi Normal  ctermbg=236
        let g:indentLine_color_term = 133
        set nuw =5
        "highlight Cursor ctermbg=1 term= bold
"-TOP-------------------------------------------------------------------------------------------------------------------
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
        highlight Visual cterm=bold ctermbg=0 ctermfg=NONE
"-TOP-------------------------------------------------------------------------------------------------------------------
        "Airline
        let g:ctags_statusline=1
        let generate_tags=1
        set noshowmode
        set showmode                    " Display the current mode
        set showcmd      " Show partial commands in status line and
        "----------------------------------------
        let g:airline#extensions#tabline#enabled = 2
        let g:airline#extensions#tabline#fnamemod = ':t'
        let g:airline#extensions#tabline#buffer_min_count = 1
        let g:airline_section_c = '%{strftime("%D - %H:%M")}'
        "let g:airline_theme='powerlineish'
        "let g:airline_theme='solarized'
        let g:airline_theme='light'
        let g:airline_powerline_fonts=1
        let g:airline#extensions#branch#enabled=1
        let g:airline#extensions#whitespace#enabled = 1
        let g:airline#extensions#hunks#non_zero_only = 1
        "-----------------------------------------------------------
        hi statusline ctermbg=Cyan ctermfg=Black  cterm=bold
        hi StatusLineNC  ctermbg=5 ctermfg=0 cterm=NONE
"-TOP-------------------------------------------------------------------------------------------------------------------

"-AAA---------------------------------------------------------------------------------------------------------------{{{
        "suppress intro message because the above makes it look bad
        set shortmess+=I
        highlight ErrorMsg  guifg=red guibg=white
        "easier on the eyes
        highlight Folded ctermbg=10
        "fold column aka gutter on the left
        highlight FoldColumn ctermbg=9 ctermfg=0 guibg=#ffffd7
        "avoid invisible color combination (red on red)
        highlight DiffText ctermbg=1
"-}}}

"-AAA---------------------------------------------------------------------------------------------------------------{{{
        nnoremap <leader>j :call g:CursorHistForward()<CR>
        nnoremap <leader>k :call g:CursorHistBack()<CR>
"-TOP-------------------------------------------------------------------------------------------------------------------
        "nmap <Leader>/ <Plug>(easymotion-w)
        nmap <LocalLeader><LocalLeader> <Plug>(easymotion-w)
        "map  <Leader>w <Plug>(easymotion-bd-w)
        nmap <Leader>w <Plug>(easymotion-overwin-w)
        nmap s <Plug>(easymotion-s)
"-TOP-------------------------------------------------------------------------------------------------------------------
        omap <Leader>l  <Plug>(easyoperator-line-select)
        xmap <Leader>l  <Plug>(easyoperator-line-select)
"-TOP-------------------------------------------------------------------------------------------------------------------
        "test
        " Trigger a highlight in the appropriate direction when pressing these keys:
        " let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
        " let g:qs_highlight_on_keys = ['b']
        "test
"-}}}

"-TOP-------------------------------------------------------------------------------------------------------------------
    inoremap <expr>  <C-K>   BDG_GetDigraph()   ##

"------------------------------------------------------------------------ 
         if ! exists('g:TagHighlightSettings')
                 let g:TagHighlightSettings = {}
         endif
         let g:TagHighlightSettings['TagFileName'] = 'tags'
  
        let g:TagHighlightSettings = {'TagFileName': 'tags', 'CtagsExecutable': 'etags.exe'}
  
  
"   let &runtimepath='/path/to/vimdir'
" let $VIMHOME='/path/to/vimdir'
" let $MYVIMRC='/path/to/vimdir/vimrc'
