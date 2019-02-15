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
        Plug 'davidhalter/jedi-vim'
        Plug 'xolox/vim-pyref'
                let g:pyref_mapping = 'H'
                let g:pyref_python = '/usr/share/doc/python3/html/'
                "let g:pyref_python = '/usr/share/doc/python/'
                "let g:pyref_python = 'file:///usr/share/doc/python2.7/html/index.html'
                "let g:pyref_python = $HOME . '/docs/python'
                "let g:pyref_python = '/usr/bin/pydoc'
        "--------------------------------------------------------------------------------- 
        " NeoBundle 'fs111/pydoc.vim', {'external_commands': ['pydoc']}
        Plug 'fs111/pydoc.vim', {'external_commands': ['pydoc']}
                let g:ref_pydoc_cmd = 'pydoc'
                let g:ref_pydoc_complete_head = 1
                " let g:pydoc_cmd = 'python -m pydoc'
                " let g:pydoc_open_cmd = 'vsplit'
                " " If you want pydoc to switch to an already open tab with pydoc page,
                " let g:pydoc_use_drop=1
                " " Pydoc files are open with 10 lines height, if you want to change this value
                " " put this in your .vimrc:
                " let g:pydoc_window_lines=15
                " " let g:pydoc_window_lines=0.5
                " let g:pydoc_cmd = '/usr/bin/pydoc'
                " " let g:pydoc_highlight=0
        "--------------------------------------------------------------------------------- 
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
        Plug 'tpope/vim-tbone'
        Plug 'tmux-plugins/vim-tmux'
        Plug 'xolox/vim-misc'
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-repeat'
        Plug 'ivyl/vim-bling'
                let g:bling_time = 62
                let g:bling_color_fg = 'green'
                let g:bling_color_cterm = 'reverse'
        Plug 'tpope/vim-unimpaired'
        Plug 'tpope/vim-eunuch'
                "-------------------------------------------------------------------------
                " :Delete: Delete a buffer and the file on disk simultaneously.
                " :Unlink: Like :Delete, but keeps the now empty buffer.
                " :Move: Rename a buffer and the file on disk simultaneously.
                " :Rename: Like :Move, but relative to the current file's containing directory.
                " :Chmod: Change the permissions of the current file.
                " :Mkdir: Create a directory, defaulting to the parent of the current file.
                " :Cfind: Run find and load the results into the quickfix list.
                " :Clocate: Run locate and load the results into the quickfix list.
                " :Lfind/:Llocate: Like above, but use the location list.
                " :Wall: Write every open window. Handy for kicking off tools like guard.
                " :SudoWrite: Write a privileged file with sudo.
                " :SudoEdit: Edit a privileged file with sudo.
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
        Plug 'mileszs/ack.vim'
        Plug 'jremmen/vim-ripgrep'
        "--------------------------------------
        Plug 'Shougo/unite.vim' 
        Plug 'tsukkee/unite-tag'
        Plug 'SpaceVim/unite-ctags'
        Plug 'Shougo/unite-outline/'
        Plug 'tsukkee/unite-help'
        Plug 'rstacruz/vim-fastunite'
        Plug 'kmnk/vim-unite-giti'
        "===SetPLAY4===================================================================================================
                let g:unite_source_history_yank_save_clipboard = 1
                let g:unite_source_mark_marks = "abcdefghijklmnopqrstuvwxyz"
                        \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""
        "------------------------------------------------------------------------------------------------------
                " let g:unite_no_default_keymappings = 1 " don't map default key mappings
                let g:unite_candidate_icon = '∘'
                let g:unite_source_history_yank_enable = 1
                let g:unite_enable_start_insert = 0
                let g:unite_enable_short_source_mes = 0
                let g:unite_force_overwrite_statusline = 1
                let g:unite_prompt = '::: '
                let g:unite_marked_icon = '✓'
                let g:unite_winheight = 15
                let g:unite_winwidth = 50
                let g:unite_update_time = 200
                let g:unite_split_rule = 'botright'
                let g:unite_split_rule = "topleft"
                let g:unite_data_directory ='~/.config/nvim/tmp/unite'
                let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
                let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
                let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
        "===PLAY3======================================================================================================
                nnoremap <Leader>u :Unite help file_mru file buffer file_rec bookmark <CR>
                nnoremap <Leader>\ :Unite -silent -vertical -winwidth=40  -direction=botright -toggle outline<CR>
                nnoremap <Leader>h :UniteWithCursorWord -silent help<CR>
                nnoremap <Leader>r :<C-u>Unite -buffer-name=register register<CR>
                nnoremap <Leader>c :<C-u>Unite -buffer-name=change change<CR>
                nnoremap <Leader>j :<C-u>Unite -buffer-name=jump jump<CR>
                nnoremap <Leader>' :Unite bookmark <CR>
        "------------------------------------------------------------------------------------------------------
        Plug 'cskeeters/unite-fzf'
        Plug 'junegunn/fzf'
        Plug 'pbogut/fzf-mru.vim'
        Plug 'junegunn/fzf.vim'
        "------------------------------------------------------------------------------------------------------
        Plug 'alok/notational-fzf-vim'
                "USA FIRST"
                let g:nv_search_paths = ['~/git/aTest/dotFiles/']

        "------------------------------------------------------------------
        Plug 'ddrscott/vim-side-search'
        " How should we execute the search?
        " --heading and --stats are required!
        let g:side_search_prg = 'ag --word-regexp'
                                \. " --ignore='*.js.map'"
                                \. " --heading --stats -B 1 -A 4"
        "---------------------------------------------------------
                " Can use `vnew` or `new`
                let g:side_search_splitter = 'vnew'
                " I like 40% splits, change it if you don't
                let g:side_search_split_pct = 0.4
                " SideSearch current word and return to original window
                nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p
                " Create an shorter `SS` command
                command! -complete=file -nargs=+ SS execute 'SideSearch <args>'
                " or command abbreviation
                cabbrev SS SideSearch
        "-------------------------------------------------------------------------
        Plug 'exvim/ex-matchit'
        "-------------------------------------------------------------------------
        Plug 'AndrewRadev/undoquit.vim'
                let g:undoquit_mapping = ';q' 
                "---c-w+u------ 
        "------------------------------------------------------------------------------------------
        Plug 'majutsushi/tagbar'
                highlight TagbarHighlight   ctermfg=051 ctermbg=9 cterm=bold
                highlight TagListTagName    ctermfg=250
                highlight TagbarFoldIcon    ctermfg=051 ctermbg=9 
                highlight TagbarHelp        ctermfg=051 ctermbg=9
                nnoremap <F9> :TagbarToggle<CR>
        Plug 'vim-scripts/tagselect'
        Plug 'ludovicchabant/vim-gutentags'
        Plug 'vim-scripts/genutils'
        "------------------------------------------------------------------------------------------
        Plug 'w0rp/ale'
                "Linting
                let g:ale_sign_column_always = 1
                let g:ale_sign_error = '>>'
                let g:ale_sign_warning = '--'
                let g:ale_linters = {
                                        \   'javascript': ['eslint'],
                                        \   'jsx': ['eslint'],
                                        \   'python': ['flake8'],
                                        \}
        "------------------------------------------------------------------------------------------
        Plug 'haya14busa/incsearch.vim'
        Plug 'vim-scripts/SearchComplete'
        "--------------------------------------------------------------------------------- 
        Plug 'gko/vim-coloresque'
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


"-AAA15-PlugAStart------------------------------------------------------------------------------------------{{{
        set complete=.,w,b,t,i,u,kspell
        "            | | | | | | |
        "            | | | | | | `-dict
        "            | | | | | `-unloaded buffers
        "            | | | | `-include files
        "            | | | `-tags
        "            | | `-other loaded buffers
        "            | `-windows buffers
        "            `-the current buffer
        "--------------------------------------------
        "set complete+=ispell
        "set completeopt=menuone,menu,longest,preview
        set omnifunc=syntaxcomplete#Complete
        set completeopt=menu
        "===PLAY8=========(C-o)====================================================================
        inoremap <silent> <C-o> <C-x><C-o>
        "inoremap <silent> <C-k> <C-x><C-k>
        inoremap <silent> <C-d> <C-x><C-d>
        inoremap <silent> <C-f> <C-x><C-f>
        inoremap <silent> <C-l> <C-x><C-l>
        "===PLAY15=================================================================================
        nnoremap ;d mayiw`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>


        "===PLAY15=================================================================================
        let g:jedi#use_splits_not_buffers = "left"
        let g:jedi#popup_on_dot = 0
        let g:jedi#goto_command = "<leader>d"
        let g:jedi#goto_assignments_command = "<leader>g"
        let g:jedi#goto_definitions_command = ""
        "let g:jedi#documentation_command = "gj"
        let g:jedi#documentation_command = "M"
        let g:jedi#usages_command = "<leader>n"
        let g:jedi#rename_command = "<leader>r"
        let g:jedi#completions_command = "<C-z>"
        "let g:jedi#completions_command = "<C-Space>"
        let g:jedi#popup_on_dot = 1
        let g:jedi#completions_enabled = 1
        let g:jedi#popup_select_first = 1
        let g:jedi#show_call_signatures = "1"
        let g:jedi#goto_command = "gt"
        let g:jedi#auto_close_doc = 0  " close preview window after completion
        "===PLUS===========================================================================
        autocmd! FileType python setlocal omnifunc+=jedi#completions
        autocmd! FileType python setlocal completeopt-=preview
        "====================SSS===========================================================
        " let g:LanguageClient_serverCommands = {
        "                         \ 'python': ['pyls','--log-file', '/tmp/pyls.log'],
        "                         \}
        "==================================================================================
        " let g:LanguageClient_serverCommands.python = ['pyls']
        "==================================================================================
        " Map renaming in python
        " autocmd FileType python nnoremap <buffer>
        "                         \ <leader>v :call LanguageClient_textDocument_re
        "====================SSS===========================================================

        noremap <F4> :w<CR>:!python %<CR>

        augroup python_files 
        augroup END

"-5plugAStop-}}}



"-aaa20-PrePLAY0-remap---------------------------------------------------------------------------------------{{{
        "Ex: :Ex Pull word under cursor into :Ex LHS of a subs ztitute (replace)
        "1y$  //yank current row to register 1
        "<C-r>a to paste from register a
        nnoremap <LocalLeader>w :<C-r>=expand("<cword>")<CR>
        nnoremap <LocaLeader>z :<C-r>=getline(".")<CR>
        "------------------------------------------------------------------------------------------
        inoremap jk <esc>
        "-Unfuck--my--screen------------------------------------
        nnoremap fu :syntax sync fromstart<cr>:redraw!<cr>
        "------------------------------------------------------------------------------------------
        nnoremap zu :<c-u>update<cr>
        "------------------------------------------------------------------------------------------
        nnoremap ;e :ls<cr>:b<space>
        nnoremap ;v <c-w>v<c-w>l
        "------------------------------------------------------------------------------------------
        nnoremap ;f :set tw=70<cr>v<s-}>gq<end>
        nnoremap W gwip
        "------------------------------------------------------------------------------------------
        "Number 7: Align Current Paragraph 
        noremap <LocalLeader>a =ip
        "------------------------------------------------------------------------------------------
        imap            ;;              <ESC>
        "-open a file with same basename but different extension        
        map <expr>      ,R              ":e ".expand("%:r")."."
        "------------------------------------------------------------------------------------------
        nnoremap ( <c-x>:y x\|@x<cr>
        nnoremap ) <c-a>:y x\|@x<cr>
        "------------------------------------------------------------------------------------------
        "???makes macros even easier to remember: hit qq to record, q to stop recording, and Q to apply.
        nnoremap Q @q
        vnoremap Q :norm @q<cr>
        "------------------------------------------------------------------------------------------
        nmap q <nop>
        nnoremap q q
        nnoremap ss :wa<cr>
        nnoremap qq :wa<cr> :bd<cr>
        nnoremap qs :wa<cr> :qa<cr>
        nnoremap qa :qa!<cr>
        nnoremap ge :w<cr>:e #<cr>
        nnoremap qw <C-w>q<CR>
        nnoremap qo <C-w>o<CR>
        "------------------------------------------------------------------------------------------
        nnoremap ZZ  <Nop> 
        nnoremap ZZ mzzt3<c-u>`z
        nnoremap zs mzzt3<c-u>`z
        nnoremap zx mzzt35<c-u>`z
        nnoremap zh mzzt10<c-u>`z
        nnoremap EE :source $MYVIMRC<CR>
        nnoremap BB ggVG
        "------------------------------------------------------------------------------------------
        nnoremap <BS> X
        "-it's-2018--------------------------------------------------------------------------------
        noremap j gj
        noremap k gk
        noremap gj j
        noremap gk k
        "-Bash-like-keys-for-the-command-line
        cnoremap <C-A> <Home>
        cnoremap <C-E> <End>
        cnoremap <C-d> <Del>
        "Same when jumping around
        nnoremap <c-o> <c-o>zz
        nnoremap <c-i> <c-i>zz
        "Yank to end of line
        nnoremap Y y$
        "-HHJ- Keep the cursor in place while joining lines
        nnoremap H mzJ`z
        "Split?? The normal use of S is covered by cc, so don't worry about shadowing it.
        nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
        "-Reselect-last-pasted text----------------------------------------------------------------
        nnoremap gv `[v`]
        "------------------------------------------------------------------------------------------
        noremap \\ #*
        "------------------------------------------------------------------------------------------
        " make it so that if I acidentally pres ^W or ^U in insert mode,
        " then <ESC>u wil undo just the ^W/^U, and not the whole insert
        " This is docmented in :help ins-special-special, a few pages down
        inoremap <C-W> <C-G>u<C-W>
        inoremap <C-U> <C-G>u<C-U>
        "------------------------------------------------------------------------------------------
        vmap     dg  :dffget<CR>
        vmap     dp  :diffput<CR>
        nnoremap do  :diffoff!<cr>
        "------------------------------------------------------------------------------------------
        inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a
"-20Remap-}}}


