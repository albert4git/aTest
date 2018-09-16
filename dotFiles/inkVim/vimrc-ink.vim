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
        "!!!" IndentGuidesDisable "!!!"
        "!!!" IndentGuidesToggle  "!!!"
        "--???-----------------------------------------------------------------------------
        let g:indent_guides_auto_colors = 0
        "let g:indent_guides_auto_colors = 1
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray26 ctermbg=238
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray33 ctermbg=247
        "--???-----------------------------------------------------------------------------
        let g:qfenter_keymap = {}
        let g:qfenter_keymap = {}
        let g:qfenter_keymap.open = ['<Leader><CR>', '<2-LeftMouse>']
        let g:qfenter_keymap.vopen = ['']
        let g:qfenter_keymap.hopen = ['<Leader>s']
        let g:qfenter_keymap = {}
        "let g:qfenter_keymap.cnext_keep = ['<Leader>m', '<C-m>', '<LocalLeader>m']
        " highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NON 
        "-TOP-------------------------------------------------------------------------------------
        " [daf] to Delete A Function, and
        " [vif] to Visually select the code Inside a Function.
        """""""
        """""""
        " or use [iF] to target just a function like [ip] For example,
        """""""
        """""""
        " [yaF] to Yank A Function with leading or trailing blank lines, and
        " [viF] to visually select a function without leading or trailing blank lines.
        """""""
        " The default mapping `ih`for an inner hunk. 
        """""""
        "ap selects the next path not including the asename and
        "ip selects the next path including the basename.
        "aP selects the previous path not including the basename and
        "iP selects the previous path including the basename.
        " /home/red/wimrc-3000.vim
        """""""
        ":quit  window's position is stored in a stack. Pressing `<c-w>u`
        "(or executing the `:Undoquit` command) 
        "Scratch: `gs` in visual mode Scratch: `gS` clear Scratch: before

        " Action-Ag Normal Mode
        " - `gagiw` to search the word
        " - `gagi'` to search the words inside single quotes.
        " - Visual Mode
        " - `gag` to search the selected text

        "-TOPModel-Qute:cq-dq-yq--il/al--Date:id/it---Indent:io----------------------------------
        "-TOPModel-Qute:cq-dq-yq--il/al--Date:id/it---Indent:io----------------------------------
        "-QUTES?-"
        xmap q iq
        omap q iq
        """""""""
        "-SUPER-"
        "'-viq-'"
        "'-cq-'"
        "'-dq-'"
        "'-yq-'"
        "???????"
        "RePaste
        "notWork
        """""""""
        """"""???
        """"""???
        "-The default mapping [ih] for an inner hunk--???------------------------------------------
        " - `vgb` Select last pasted text.
        " - `=gb` Re-indent last pasted text.
        " - `dgb` Delete last pasted text.
        " - `gcgb` Comment last pasted text
        "   (requires [vim-commentary](https://github.com/tpope/vim-commentary) plugin.)
        "-TEXT-OBJECT-USER-def-simple--------------------------------------------------------------
        " Define `ad`/`id` to select a date such as `2013-03-16`, and
        " define `at`/`it` to select a time such as `22:04:21`:
        "------------------------------------------------------------------------------------------
        "-TOPModel-Qute:cq-dq-yq--il/al--Date:id/it---Indent:io----------------------------------
        "-TOPModel-Qute:cq-dq-yq--il/al--Date:id/it---Indent:io----------------------------------
        call textobj#user#plugin('datetime', {
                                \   'date': {
                                \     'pattern': '\<\d\d\d\d-\d\d-\d\d\>',
                                \     'select': ['ad', 'id'],
                                \   },
                                \   'time': {
                                \     'pattern': '\<\d\d:\d\d:\d\d\>',
                                \     'select': ['at', 'it'],
                                \   },
                                \ })

        "-TOP--------------------------------------------------------------------------------------
        call textobj#user#plugin('line', {
                                \   '-': {
                                \     'select-a-function': 'CurrentLineA',
                                \     'select-a': 'al',
                                \     'select-i-function': 'CurrentLineI',
                                \     'select-i': 'il',
                                \   },
                                \ })

        "-TOP--------------------------------------------------------------------------------------
        " Define `aP` to select a PHP code with `<?php` and `?>`, and
        " define `iP` to select a PHP code without `<?php` and `?>`:
        call textobj#user#plugin('php', {
        \   'code': {
        \     'pattern': ['<?php\>', '?>'],
        \     'select-a': 'aP',
        \     'select-i': 'iP',
        \   },
        \ })

        "-TOP--------------------------------------------------------------------------------------
        " Define `al` to select the current line, and
        " define `il` to select the current line without indentation:
        "------------------------------------------------------------------------------------------
        function! CurrentLineA()
                normal! 0
                let head_pos = getpos('.')
                normal! $
                let tail_pos = getpos('.')
                return ['v', head_pos, tail_pos]
        endfunction
        "-TOP--------------------------------------------------------------------------------------
        "-TOP--------------------------------------------------------------------------------------
        "-TOP--------------------------------------------------------------------------------------
        function! CurrentLineI()
                normal! ^
                let head_pos = getpos('.')
                normal! g_
                let tail_pos = getpos('.')
                let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
                return
                                        \ non_blank_char_exists_p \ ? ['v', head_pos, tail_pos] \ : 0
        endfunction
"-TOP-------------------------------------------------------------------------------------------------------------------
" 14/09/18 14:13:00 
"Define ad/id to select a date such as 2013-03-16, and define at/it to select a time such as 22:04:21:
"Define ad/id to select a date such as 2013-03-16, and define at/it to select a time such as 22:04:21:
"-TOP-------------------------------------------------------------------------------------------------------------------
        highlight BookmarkSign ctermbg=9 ctermfg=1
        highlight BookmarkLine ctermbg=11 ctermfg=1
        highlight BookmarkAnnotationLine ctermbg=11 ctermfg=1
        highlight BookmarkAnnotationSign ctermbg=9 ctermfg=1

"-TOP-------------------------------------------------------------------------------------------------------------------
        " let g:pastedtext_select_key = 'p'
        " let g:pastedtext_select_key = 'p'
        "let g:pastedtext_select_key = 'p'
"-TOP-------------------------------------------------------------------------------------------------------------------
