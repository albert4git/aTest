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
        "let $VIMHOME='~/13-ErrShift-Vim'
        "let &runtimepath='~/13-ErrShift-Vim'
        "let $MYVIMRC='/path/to/vimdir/vimrc'
        "let MYVIMRC ='~/.vimrc'
        "set dictionary=/usr/share/
        "cnoremap <Up> <Nope>
        "cnoremap <Down> <Nope>
        "cnoremap <Left> <Nope>
        "cnoremap <Right> <Nope>
        "-------------------------------------------------------------------------------------------
        "-------------------------------------------------------------------------------------------
        " let $VIMHOME='~/13-ErrShift-Vim'
        " let s:VIMROOT = $HOME."/13RVim"
        " let &runtimepath=s:VIMROOT
        " let &runtimepath=s:VIMROOT."," . &runtimepath
        " let &runtimepath=s:VIMROOT."/plugged," . &runtimepath
        "-------------------------------------------------------------------------------------------
        "====[ I hate modelines ]===================
        set modelines=0
        "-------------------------------------------------------------------------------------------

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
        "source ~/git/aTest/dotFiles/inkVim/vim-post.vim
        "=====[ Comments are important ]==================
        highlight Comment term=bold ctermfg=230
"-TOP-------------------------------------------------------------------------------------------------------------------
        "!!!" IndentGuidesDisable "!!!"
        "!!!" IndentGuidesToggle  "!!!"
        let g:indent_guides_auto_colors = 0
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=238
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=247
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=200
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=120

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
                hi Pmenue                      ctermbg=16
                hi Pmenue                      ctermfg=11
                hi CursorLine                  ctermbg=16
                hi CursorColumn                ctermbg=16
                hi ColorColumn                 ctermbg=25
                hi ColorColumn                 ctermbg=126
                hi ColorColumn                 ctermbg=133
        set colorcolumn=1,8,92,100,112,120
                                hi LineNr ctermfg=1 ctermbg=123 
                                hi Normal  ctermbg=235
                                let g:indentLine_color_term = 133
                                set nuw =5
        "highlight Cursor ctermbg=1 term= bold
"-TOP-------------------------------------------------------------------------------------------------------------------
        "brackets show match
        set nosm
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

"-TOP-------------------------------------------------------------------------------------------------------------------
        "inoremap <expr>  <C-K>   BDG_GetDigraph()   ##
"-TOP-------------------------------------------------------------------------------------------------------------------
        if ! exists('g:TagHighlightSettings')
                let g:TagHighlightSettings = {}
        endif
        let g:TagHighlightSettings['TagFileName'] = 'tags'
        let g:TagHighlightSettings = {'TagFileName': 'tags', 'CtagsExecutable': 'etags.exe'}

"-TOP-------------------------------------------------------------------------------------------------------------------
" highlight signcolumn  ctermfg=17
"-TOP-------------------------------------------------------------------------------------------------------------------
" highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
" highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
" highlight DiffChange        cterm=bold ctermbg=11 ctermfg=227

        highlight DiffChange        cterm=bold ctermbg=10 "greenBright
        highlight DiffChange        cterm=bold ctermbg=9 "red
        highlight DiffChange        cterm=bold ctermbg=8 "gray
        highlight DiffChange        cterm=bold ctermbg=7 "red

        set laststatus=2


"-TOP-------------------------------------------------------------------------------------------------------------------
"  ---------------------------------+------------------------------------------
"  Mapping                          | Description                              
"  ---------------------------------+------------------------------------------
"  <plug>(fzf-maps-n)               | Normal mode mappings
"  <plug>(fzf-maps-i)               | Insert mode mappings
"  <plug>(fzf-maps-x)               | Visual mode mappings
"  <plug>(fzf-maps-o)               | Operator-pending mappings
"  <plug>(fzf-complete-word)        |  `cat /usr/share/dict/words`
"  <plug>(fzf-complete-path)        | Path completion using  `find`  (file + dir)
"  <plug>(fzf-complete-file)        | File completion using  `find`
"  <plug>(fzf-complete-file-ag)     | File completion using  `ag`
"  <plug>(fzf-complete-line)        | Line completion (all open buffers)
"  <plug>(fzf-complete-buffer-line) | Line completion (current buffer only)
"------------------------------------------------------------------------------------------
"  nnoremap <leader>gs :Gstatus<CR>
"  nnoremap <leader>gc :Gcommit -v -q<CR>
"  nnoremap <leader>ga :Gcommit --amend<CR>
"  nnoremap <leader>gt :Gcommit -v -q %<CR>
"  nnoremap <leader>gd :Gdiff<CR>
"  nnoremap <leader>ge :Gedit<CR>
"  nnoremap <leader>gr :Gread<CR>
"  nnoremap <leader>gw :Gwrite<CR><CR>
"  nnoremap <leader>gl :silent! Glog<CR>
"  nnoremap <leader>gp :Ggrep<Space>
"  nnoremap <leader>gm :Gmove<Space>
"  nnoremap <leader>gb :Git branch<Space>
"  nnoremap <leader>go :Git checkout<Space>
"  nnoremap <leader>gps :Dispatch! git push<CR>
"  nnoremap <leader>gpl :Dispatch! git pull<CR>
"------------------------------------------------------------------------------------------
" <leader>gl to view history
" ]q and [q to move between versions (unimpaired.vim)
" <leader>gd to open diff
" :q to end diff
" <leader>ge to return to my working copy.
"------------------------------------------------------------------------------------------
"  nnoremap <c-p> :Files<CR>
"  nnoremap <c-l> :Lines<CR>
"  nnoremap <c-c> :Commits<CR>
"  nnoremap <c-k> :Commands<CR>
"------------------------------------------------------------------------------------------
"       *[q*     |:cprevious|
"       *]q*     |:cnext|
"       *[Q*     |:cfirst|
"       *]Q*     |:clast|
"       nnoremap <Leader>b :cprev<cr>zvzz
"       nnoremap <Leader>n :cnext<cr>zvzz
"       *[l*     |:lprevious|
"       *]l*     |:lnext|
"       *[L*     |:lfirst|
"       *]L*     |:llast|
"       *[<C-L>* |:lpfile|
"       *]<C-L>* |:lnfile|
"------------------------------------------------------------------------------------------
" :map   :noremap  :unmap     Normal, Visual, Select, Operator-pending
" :nmap  :nnoremap :nunmap    Normal
" :vmap  :vnoremap :vunmap    Visual and Select
" :smap  :snoremap :sunmap    Select
" :xmap  :xnoremap :xunmap    Visual
" :omap  :onoremap :ounmap    Operator-pending
" :map!  :noremap! :unmap!    Insert and Command-line
" :imap  :inoremap :iunmap    Insert
" :lmap  :lnoremap :lunmap    Insert, Command-line, Lang-Arg
" :cmap  :cnoremap :cunmap    Command-line
" :tmap  :tnoremap :tunmap    Terminal-Job
"------------------------------------------------------------------------------------------

" set makeprg=tidy -quiet -e %
" At this point you can use make to clean up the full file or you can use = to clean up sections.
" :help =
" :help equalprg
" :help makeprg
" In my .vimrc, I have taught vim my common typos:
" command! Q  quit
" command! W  write
" command! Wq wq
