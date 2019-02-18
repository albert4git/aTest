"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-NeoVimMix65FZF-NV-Unite"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"
" File: start1ninit19.vim
" Author: red
" Last Modified: 11 Feb 2019
"======================================================================================================================

        "--------------------------------------------------------------------------
        autocmd! filetype python setlocal formatoptions-=t " But disable autowrapping as it is super annoying
        "--------------------------------------------------------------------------
        " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set earlier, as it is important)
        autocmd! filetype python setlocal textwidth=149
        autocmd! filetype python match ErrorMsg '\%>120v.\+'

        " function! s:UsingPython3()
        "         if has('python3')
        "                 return 1
        "         endif
        "         return 0
        " endfunction

        " let s:using_python3 = s:UsingPython3()
        " let s:python_until_eof = s:using_python3 ? "python3 << EOF" : "python << EOF"
        " let s:python_command = s:using_python3 ? "py3 " : "py "

"-AAA15-Plug2Start---------------------------------------------------------------------------------------------{{{
call plug#begin('~/.config/nvim/plugged/')
        Plug 'tyru/capture.vim'
        Plug 'thinca/vim-quickrun'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
                let g:airline_theme='light'
                set showmode                "-Display the current mode
                set showcmd                 "-Show partial commands in status line 
                "--------------------------------------------------------------------------
                let g:airline_section_c = '%{strftime("%Y %b %d %X")}'
                let g:airline#extensions#tabline#enabled = 2
                let g:airline#extensions#tabline#buffer_min_count = 1
                "-----------------------------------------------------------
                let g:airline#extensions#syntastic#enabled = 1
                let g:airline#extensions#branch#enabled = 1
                "-----------------------------------------------------------
                if !exists('g:airline_symbols')
                        let g:airline_symbols = {}
                endif
                "--------------------------------------------------------------------------
                hi statusline ctermbg=10 ctermfg=Black  cterm=bold
                hi StatusLineNC  ctermbg=5 ctermfg=0 cterm=NONE

        Plug 'Yggdroot/indentLine'
                let g:indentLine_enabled = 1
                let g:indentLine_noConcealCursor='nc'
                let g:indentLine_color_term = 10
                "let g:indentLine_setConceal = 0
                "let g:indentLine_bgcolor_term = 202

        Plug 'nathanaelkane/vim-indent-guides'
                let g:indentLine_enabled = 1
                let g:indent_guides_auto_colors = 1
                hi IndentGuidesOdd   ctermbg=235
                hi IndentGuidesEven  ctermbg=242
        "----------------------------------------------------------------------------------- 
        "----------------------------------------------------------------------------------
        Plug 'tpope/vim-sleuth'         " indet reight ?
        "----------------------------------------------------------------------------------
        Plug 'junegunn/gv.vim'
                " o or <cr> on a commit to display the content of it
                " o or <cr> on commits to display the diff in the range
                " O opens a new tab instead
                " gb for :Gbrowse
                " ]] and [[ to move between commits
                " . to start command-line with :Git [CURSOR] SHA à la fugitive
                " q to close
        "--------------------------------------------------------------------------------- 
        Plug 'airblade/vim-gitgutter'
                nmap ]c <Plug>GitGutterNextHunk
                nmap [c <Plug>GitGutterPrevHunk
        "------------------------------------------------------
                nmap hp <Plug>GitGutterPreviewHunk
                nmap hs <Plug>GitGutterStageHunk
                nmap hu <Plug>GitGutterUndoHunk
        "---------------------------------------------------------------------------------- 
        Plug 'int3/vim-extradite'
                ":Extradite | :Extradite! -- vertical.
                let g:extradite_width = 60
                let g:extradite_showhash = 1 "show abbre commit hashes.
        Plug 'tpope/vim-fugitive'
                """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                " vnoremap <leader>H :Gbrowse<cr>
                " nnoremap <leader>H V:Gbrowse<cr>
                " vnoremap <leader>u :Gbrowse @upstream<cr>
                " nnoremap <leader>u V:Gbrowse @upstream<cr>
                " auto open quickfix window for :Ggrep.
                " nnoremap <leader>gs :Gstatus<CR>
                " nnoremap <leader>gc :Gcommit -v -q<CR>
                " nnoremap <leader>ga :Gcommit --amend<CR>
                " nnoremap <leader>gt :Gcommit -v -q %<CR>
                " nnoremap <leader>gd :Gdiff<CR>
                " nnoremap <leader>ge :Gedit<CR>
                " nnoremap <leader>gr :Gread<CR>
                " nnoremap <leader>gw :Gwrite<CR><CR>
                " nnoremap <leader>gl :silent! Glog<CR>
                " nnoremap <leader>gp :Ggrep<Space>
                " nnoremap <leader>gm :Gmove<Space>
                " nnoremap <leader>gb :Git branch<Space>
                " nnoremap <leader>go :Git checkout<Space>
                " nnoremap <leader>gps :Dispatch! git push<CR>
                " nnoremap <leader>gpl :Dispatch! git pull<CR>
                " With that configuration, my workflow is:
                " <leader>gl to view history
                " ]q and [q to move between versions (unimpaired.vim)
                " <leader>gd to open diff
                " :q to end diff
                """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "------------------------------------------------------------------------------------------
        Plug 'haya14busa/incsearch.vim'
        Plug 'vim-scripts/SearchComplete'
        "--------------------------------------------------------------------------------- 
        Plug 'guns/xterm-color-table.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'mtth/scratch.vim'
                nnoremap <F7> :Scratch<CR>
                nnoremap <F6> :ScratchPreview<CR>
        "----------------------------------------------------
        Plug 'henrik/vim-qargs'
        "----------------------------------------------------
        Plug 'maxbrunsfeld/vim-yankstack'
                nmap zp <Plug>yankstack_substitute_older_paste
                nmap zn <Plug>yankstack_substitute_newer_paste
        "--------------------------------------
        "-------------------------------------------------------------------------
        Plug 'AndrewRadev/undoquit.vim'
                let g:undoquit_mapping = ';q' 
                "---c-w+u------ 
        "------------------------------------------------------------------------------------------ 
        Plug 'scrooloose/nerdtree'
                "" NERDTree
                let NERDTreeShowBookmarks=1
                let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
                let NERDTreeChDirMode=0
                let NERDTreeQuitOnOpen=1
                let NERDTreeMouseMode=2
                let NERDTreeShowHidden=1
                let NERDTreeKeepTreeInNewTab=1
                " always open NERDTree in the appropriate directory.
                function! NERDTreeToggleInCurDir()
                        if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
                                exe ":NERDTreeClose"
                        else
                                if (expand("%:t") != '')
                                        exe ":NERDTreeFind"
                                else
                                        exe ":NERDTreeToggle"
                                endif
                        endif
                endfunction

                map <F3> :call NERDTreeToggleInCurDir()<CR>
                "" NERDCommenter
                let g:NERDDefaultAlign = 'left'
                let g:NERDCommentEmptyLines = 1
                let g:NERDTrimTrailingWhitespace = 1
        "----------------------------------------------------------------------------------
        "# Plug 'tpope/vim-surround'
        Plug 'machakann/vim-sandwich'
                " sd,sr, sa{motion/textobject}{addition}(normal and visual mode)
                " let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
                " Sandwiched text could be resolved into two parts, {surrounding} and {surrounded text}.
                " sa add surroundings: mapped to the key sequence sa
                " sd Delete surroundings: mapped to the key sequence sd
                " sr Replace surroundings: mapped to the key sequence sr
                " ib Search and select a sandwiched text automatically: mapped to the key sequence ib and ab
                " is Search and select a sandwiched text with query: mapped to the key sequence is and as
                " da" will delete a quoted sympy.pprint(string.) 
                "(<b>'Sbandawitch'</b>) 
                nmap s <Nop>
                xmap s <Nop>
        "-------------------------------------------------------------
                let g:textobj_sandwich_no_default_key_mappings = 1
                omap ia <Plug>(textobj-sandwich-auto-i)
                xmap ia <Plug>(textobj-sandwich-auto-i)
                omap aa <Plug>(textobj-sandwich-auto-a)
                xmap aa <Plug>(textobj-sandwich-auto-a)
        "--------------------------------------------------------------
        "[ {(hello) ( noch ) ('Mal') ("tomos") } tormos]
        "---------------SYMPY-SANDWICH---------------------------------
                vmap sb "zdi sympy.pprint(<c-r>z)<esc>
                vmap sn "zdi print(<c-r>z)<esc> 
                "-wrap <b></b> around selected text
                "vmap sb "zdi<b><c-r>z</b><esc>
                "-wrap <?=   ?> around visually selected text
                "vmap st "zdi<?= <c-r>z ?><esc> 
        "---NoAutoClose-YCM----------------------------------------------------------------
        Plug 'jiangmiao/auto-pairs'
                "   <M-o> : neline with indentation
                "   <M-a> : jump to of line
                "   <M-n> : jump to next pairs
                "   <M-e> : jump to end of pairs.
                "   Ctrl-V ) : insert ) without trigger the plugin.
                let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
                let g:AutoPairsShortcutToggle = '<M-p>'
                let g:AutoPairsShortcutFastWrap = '<M-e>'
                let g:AutoPairsShortcutJump = '<M-n>'
                let g:AutoPairsShortcutBackInsert = '<M-b>'
                let g:AutoPairsShortcuts = 1
                let g:AutoPairsMapBS = 1
                let g:AutoPairsMapCR = 0 " insert a new indented line if cursor in pairs.
                " error in vimwiki <CR> Enter. but use upper inoremap can solve.
                let g:AutoPairsMapSpace = 0
                " error in abbreviations <space> auto expand.
                let g:AutoPairsCenterLine = 1
                let g:AutoPairsFlyMode = 1
                let g:AutoPairsMapCR=0
                let g:AutoPairsMapCh=1
                let g:AutoPairsDelete = '<M-5>'
        "---------------------------------------------------------------------------------
        Plug 'wellle/visual-split.vim'
                " :VSSplit, :VSSplitAbove or :VSSplitBelow to create the split
                " :VSResize to execute the VSResize ex command on the selected range
                nmap <C-W>r  <Plug>(Visual-Split-Resize)
                nmap <C-W>s <Plug>(Visual-Split-Split)
        "source ~/git/aTest/dotFiles/nVim/logoHtml.vim
call plug#end()
"-5plug2Stop-}}}

"-AAA3-Tag8------------------------------------------------------------------------------------------------{{{
        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
                let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
        set tags+=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,~/.nvimtags


"-AAA3-Spell------------------------------------------------------------------------------------------------{{{
        setlocal spell
        set nospell
        set spelllang=en_us
        set spellsuggest=best
        " set spelllang=de,tech_speak spell
        " set spellfile=~/.vim/spell/techspeak.utf-8.add
        " set spellfile=~/.vim/spell/en.utf-8.add           " 'zg': add, 'zw': remove.
        "------------------------------------------------------------------------------
        function! FixVimSpellcheck()
                if &spell
                        normal! 1z=
                else
                        set spell
                        normal! 1z=
                        set nospell
                endif
        endfunction
        nnoremap z= :call FixVimSpellcheck()<cr>
        "???, disable the zg (add to dictionary) shortcut
        nnoremap zg z=
        "------------------------------------------------------------------------------------------
        " error: zg, zG, zw, zW, zug, zuG, zuw,
        " zuW, z=, u
        " For z=, all identical misspellings in the buffer are
        " replaced with the chosen suggestion (via :spellrepall).
        "------------------------------------------------------------------------------------------
        " I use two languages: Lithuanian and English. But I also want to add
        " a special pseudo-language to contain identifiers extracted from tags
        " file (this will eliminate false hits like printf).
        " set spelllang=lt,en,fromtags
        " https://rtfb.lt/projects/vim-dox-spell/index.html
        "------------------------------------------------------------------------------------------
"-3--}}}





"-AAA3-Tag8------------------------------------------------------------------------------------------------{{{
        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
                let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
        set tags+=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,~/.nvimtags

        "------------------------------------------------------------------------------
        "------------------------------------------------------------------------------
        function! FixVimSpellcheck()
                if &spell
                        normal! 1z=
                else
                        set spell
                        normal! 1z=
                        set nospell
                endif
        endfunction
        nnoremap z= :call FixVimSpellcheck()<cr>
        "???, disable the zg (add to dictionary) shortcut
        nnoremap zg z=
        "------------------------------------------------------------------------------------------
        " error: zg, zG, zw, zW, zug, zuG, zuw,
        " zuW, z=, u
        " For z=, all identical misspellings in the buffer are
        " replaced with the chosen suggestion (via :spellrepall).
        "------------------------------------------------------------------------------------------
        " I use two languages: Lithuanian and English. But I also want to add
        " a special pseudo-language to contain identifiers extracted from tags
        " file (this will eliminate false hits like printf).
        " set spelllang=lt,en,fromtags
        " https://rtfb.lt/projects/vim-dox-spell/index.html
        "------------------------------------------------------------------------------------------
"-3--}}}







