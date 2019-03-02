
"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-=DEO2=--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"
" File: DEO2.vim
" Author: red
" Last Modified: 19 Feb 2019
"===================================================================================================
" This plugin sets virtualenv for neovim by default. If you want to use current
" environment's python2 and python3, for example, the jedi library won't
" complete for non-venv project if the plugin is running on venv. options disable feature:
" let g:python_support_python2_venv = 0
" let g:python_support_python3_venv = 0
"===================================================================================================

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
"let g:deoplete#sources#jedi#extra_path = $PYTHONPATH

"-AAA3-UnPlug-nPlugStart------------------------------------------------------------------------------------{{{
call plug#begin('~/.config/nvim/plugged/')
        Plug 'c9s/helper.vim'
        Plug 'c9s/treemenu.vim'
        Plug 'nixprime/cpsm'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
        Plug 'tomtom/tlib_vim'       

        "-AAA---------------------------------------------------------------------------{{{
        Plug 'MattesGroeger/vim-bookmarks'
                let g:bookmark_no_default_key_mappings = 1
                function! BookmarkMapKeys()
                        nmap mm :BookmarkToggle<CR>
                        nmap mi :BookmarkAnnotate<CR>
                        nmap mn :BookmarkNext<CR>
                        nmap mp :BookmarkPrev<CR>
                        nmap ma :BookmarkShowAll<CR>
                        nmap mc :BookmarkClear<CR>
                        nmap mx :BookmarkClearAll<CR>
                        nmap mkk :BookmarkMoveUp
                        nmap mjj :BookmarkMoveDown
                endfunction
                "------------------------------------------------------
                autocmd! BufEnter * :call BookmarkMapKeys()
                highlight BookmarkSign ctermbg=9 ctermfg=1
                highlight BookmarkLine ctermbg=9 ctermfg=1
                highlight BookmarkAnnotationLine ctermbg=9 ctermfg=1
                highlight BookmarkAnnotationSign ctermbg=9 ctermfg=1
                "------------------------------------------------------
                let g:bookmark_auto_close = 1
                let g:bookmark_highlight_lines = 1          
                let g:bookmark_show_warning = 0           
                let g:bookmark_show_toggle_warning = 0      
                let g:bookmark_sign = '♥'
                let g:bookmark_highlight_lines = 1
                let g:bookmark_save_per_working_dir = 1
                let g:bookmark_auto_save = 1
                let g:bookmark_save_per_working_dir = 1  
                "------------------------------------------------------
                "let g:bookmark_manage_per_buffer = 1`        
                "let g:bookmark_auto_save_file = '/bookmarks'`
                " |------------------------------------------|-------------|------------------------------|
                " | Add/remove bookmark at current line      | `mm`        | `:BookmarkToggle`            |
                " | Add/edit/remove annotation at current li | `mi`        | `:BookmarkAnnotate <TEXT>`   |
                " | Jump to next bookmark in buffer          | `mn`        | `:BookmarkNext`              |
                " | Jump to previous bookmark in buffer      | `mp`        | `:BookmarkPrev`              |
                " | Show all bookmarks (toggle)              | `ma`        | `:BookmarkShowAll`           |
                " | Clear bookmarks in current buffer only   | `mc`        | `:BookmarkClear`             |
                " | Clear bookmarks in all buffers           | `mx`        | `:BookmarkClearAll`          |
                " | Move up bookmark at current line         | `[count]mkk`| `:BookmarkMoveUp [<COUNT>]`  |
                " | Move down bookmark at current line       | `[count]mjj`| `:BookmarkMoveDown [<COUNT>]`|
                " | Move bookmark at current line to another | `[count]mg` | `:BookmarkMoveToLine <LINE>` |
                " | Save all bookmarks to a file             |             | `:BookmarkSave <FILE_PATH>`  |
                " | Load bookmarks from a file               |             | `:BookmarkLoad <FILE_PATH>`  |
                " |------------------------------------------|-------------|------------------------------|
        "-AAE------------------}}}

        "-AAA6--GitGutter-----------------------------------------------------------------------{{{
                Plug 'airblade/vim-gitgutter'
                        nmap ]c <Plug>GitGutterNextHunk
                        nmap [c <Plug>GitGutterPrevHunk
                "------------------------------------------------------
                        nmap hp <Plug>GitGutterPreviewHunk
                        nmap hs <Plug>GitGutterStageHunk
                        nmap hu <Plug>GitGutterUndoHunk
                "------------------------------------------------------
                        let g:gitgutter_signs = 1
                        let g:gitgutter_max_signs = 2000
                "--------------------------------------------------------------------------
                        highlight GitGutterAdd ctermfg=green
                        highlight GitGutterChange ctermfg=yellow
                        highlight GitGutterDelete ctermfg=red
                        highlight GitGutterChangeDelete ctermfg=yellow
                "--------------------------------------------------------------------------
                        if exists("*gitgutter#highlight#define_highlights")
                                " let vim-gitgutter know we changed the SignColumn colors!
                                call gitgutter#highlight#define_highlights()
                        endif
                "-------------------------------------------------------------------------- 
                Plug 'aghareza/vim-gitgrep'
                "-------------------------------------------------------------------------- 
                Plug 'tpope/vim-fugitive'
                "--------------------------------------------------------------------------
                Plug 'junegunn/gv.vim'
                        " o or <cr> on a commit to display the content of it
                        " o or <cr> on commits to display the diff in the range
                        " O opens a new tab instead
                        " gb for :Gbrowse
                        " ]] and [[ to move between commits
                        " . to start command-line with :Git [CURSOR] SHA à la fugitive
                        " q to close
                "-------------------------------------------------------------------------- 
                Plug 'int3/vim-extradite'
                        ":Extradite | :Extradite! -- vertical.
                        let g:extradite_width = 60
                        let g:extradite_showhash = 1 "show abbre commit hashes.
        "-6-}}}

        "------TESTING------------------------------------------------------------------ 
        " Plug 'WolfgangMehner/bash-support'
        " Plug 'vim-scripts/foo.vim'
        Plug 'eparreno/vim-l9'
        Plug 'vim-scripts/CRefVim'
        Plug 'vim-scripts/FuzzyFinder'
        Plug 'alvan/vim-closetag'
        Plug 'vim-scripts/c.vim'
        Plug 'octol/vim-cpp-enhanced-highlight' " C++
        Plug 'pboettch/vim-cmake-syntax'        " CMake
        Plug 'itchyny/calendar.vim'
        Plug 'vim-scripts/spell.vim'
        Plug 'dhruvasagar/vim-zoom'
        Plug 'KnoP-01/tortus'
        "---------------------------------------------------------------------------------- 
        Plug 'brooth/far.vim'
        "---------------------------------------------------------------------------------- 
        Plug 'osyo-manga/vim-brightest'
                let g:brightest#highlight = { "group" : "Define" }
        "---------------------------------------------------------------------------------- 
        Plug 'vim-scripts/TagHighlight'
        " TagHighlight highlight names of class, variable, types in code.
        " Usage: :UpdateTypesFile
                if !exists('g:TagHighlightSettings')
                        let g:TagHighlightSettings = {}
                endif
                let g:TagHighlightSettings['TagFileName'] = 'tags'
                let g:TagHighlightSettings['CtagsExecutable'] = 'ctags'
                let g:TagHighlightSettings['CtagsVariant'] = 'exuberant'
                let g:TagHighlightSettings['CtagsArguments'] = []
                let g:TagHighlightSettings['CtagsExtraArguments'] = []
                let g:TagHighlightSettings['ForcePythonVariant'] = 'if_pyth3'
                let g:TagHighlightSettings['PythonVariantPriority'] = [
                                        \ "if_pyth3", "if_pyth", "python", "compiled",
                                        \ ]
        "---------------------------------------------------------------------------------- 
        Plug 'Shougo/echodoc.vim'
                set cmdheight=2
                let g:echodoc_enable_at_startup = 1
        Plug 'roxma/python-support.nvim'
                let g:python_support_python2_require = 0
                let g:python_support_python3_require = 0
        "--------------------------------------------------------------------------------- 
        Plug 'gastonsimone/vim-dokumentary/'
                "-=KKK=-
                "??? apt-get install dictd dict-gcide dict
                "let g:dokumentary_docprgs = {'c': 'cdoc {0}', 'python': ''}
                let g:dokumentary_docprgs = {'c': 'cdoc {0}'}
        "--------------------------------------------------------------------------------- 
        ""-=TTT=-
        "Plug 'xolox/vim-pyref'
        "        let g:pyref_mapping = 'T'
        "        let g:pyref_python = '/usr/share/doc/python3/html/'
        "----------------------------------------------------------- 
                "let g:pyref_python = '/usr/share/doc/python/'
                "let g:pyref_python = 'file:///usr/share/doc/python2.7/html/index.html'
                "let g:pyref_python = $HOME . '/docs/python'
                "let g:pyref_python = '/usr/bin/pydoc'
        "---------------------------------------------------------------------------------- 
        Plug 'fs111/pydoc.vim', {'external_commands': ['pydoc']}
                let g:ref_pydoc_cmd = 'pydoc'
                let g:ref_pydoc_complete_head = 1

        "-Python-$-pydoc -TTT-
        au FileType python nnoremap T :exec "!pydoc" expand("<cword>")<CR>

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
        "---------------------------------------------------------------------------------- 
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

        "---------------------------------------------------------------------------------- 
        Plug 'skywind3000/vim-preview'
                "VSSplit
        "---------------------------------------------------------------------------------- 
        Plug 'rafi/awesome-vim-colorschemes'
        "---------------------------------------------------------------------------------- 
        Plug 'kshenoy/vim-signature'
                " :SignatureListMarkers         : List all markers
                " :SignatureListMarkers 1       : List only the '!' marker
                " :SignatureListMarkers @       : List only the '@' marker
                " :SignatureListMarkers 0, 2    : List only ) marker with 2 lines of context
                " :SignatureListMarkers '', 2   : List all markers with 2 lines of context
                " :SignatureListMarkers '!@', 2 : List only the '!' and '@' markers and show
        "---------------------------------------------------------------------------------- 
        Plug 'machakann/vim-highlightedyank'
                let g:highlightedyank_highlight_duration = -1
        "---------------------------------------------------------------------------------- 
        Plug 'Yggdroot/indentLine'
                let g:indentLine_enabled = 1
                let g:indentLine_noConcealCursor='nc'
                let g:indentLine_color_term = 10
                "let g:indentLine_setConceal = 0
                "let g:indentLine_bgcolor_term = 202
                    let g:indentLine_faster = 1
                    let g:indentLine_char = '.'
                    let g:indentLine_char = '|'
                    let g:indentLine_first_char='.'
                    let g:indentLine_first_char='|'
                    let g:indentLine_showFirstIndentLevel=1
                        let g:indentLine_fileTypeExclude = ['thumbnail', 'json', 'markdown']
        "---------------------------------------------------------------------------------- 
                    " let g:indentLine_faster = 1
                    " let g:indentLine_char = '.'
                    " let g:indentLine_char = '|'
                    " let g:indentLine_char = '¦'
                    " let g:indentLine_char = '┊'
                    " let g:indentLine_first_char='¦'
        "---------------------------------------------------------------------------------- 
        " Plug 'nathanaelkane/vim-indent-guides'
        "         let g:indent_guides_indent_levels = 30
        "         let g:indent_guides_auto_colors = 1
        "         let g:indent_guides_color_change_percent = 10
        "         let g:indent_guides_start_level = 1
        "         let g:indent_guides_tab_guides = 1
        "         hi IndentGuidesOdd   ctermbg=22
        "         hi IndentGuidesEven  ctermbg=239
        "---------------------------------------------------------------------------------- 
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'davidhalter/jedi-vim'
        Plug 'zchee/deoplete-jedi'
        "--------------------------------------------------------- 
        Plug 'balta2ar/deoplete-matcherkey'
        Plug 'zchee/deoplete-zsh'
        "---------------------------------------------------------------------------------- 
        Plug 'autozimu/LanguageClient-neovim', {
                                \ 'branch': 'next',
                                \ 'do': 'bash install.sh',
                                \ }
        "---------------------------------------------------------------------------------- 
        Plug 'vim-scripts/Lynx-Offline-Documentation-Browser'
        "---------------------------------------------------------------------------------- 
        Plug 'jesseleite/vim-agriculture'
        Plug 'mileszs/ack.vim'
        Plug 'jremmen/vim-ripgrep'
        "----------------------------------------------------------------------------------
        Plug 'Chun-Yang/vim-action-ag'
        Plug 'rking/ag.vim'
        "----------------------------------------------------------------------------------
        " - Python 3.5 or higher, for the preview window and filepath shortening.
        Plug 'cskeeters/unite-fzf'
        Plug 'junegunn/fzf'
        Plug 'junegunn/fzf.vim'
        Plug 'pbogut/fzf-mru.vim'
                " nmap <Leader>f :GFiles<CR>
                " nmap <Leader>F :Files<CR>
                " nmap <Leader>t :BTags<CR>
                " nmap <Leader>T :Tags<CR>
                " nmap <Leader>m :Methods<CR>
                " nmap <Leader>b :Buffers<CR>
                " nmap <Leader>l :BLines<CR>
                " nmap <Leader>L :Lines<CR>
                " nmap <Leader>h :History<CR>
                " nmap <Leader>H :GHistory<CR>
                " nmap <Leader>: :History:<CR>
                " nmap <Leader>M :Maps<CR>
                " nmap <Leader>C :Commands<CR>
                " nmap <Leader>' :Marks<CR>
                " nmap <Leader>s :Filetypes<CR>
                " nmap <Leader>S :Snippets<CR>
                " nmap <Leader><Leader>h :Helptags!<CR>
        "------------------------------------------------------------------------------------------
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
        "------------------------------------------------------------------------------------------
        "USA FIRST
        Plug 'alok/notational-fzf-vim'
                let g:nv_search_paths = ['~/git/aTest/dotFiles/', '~/git/aTest/pyLabGitPdbPythonMode27' ]
        "----------------------------------------------------------------------
        " -   `c-x`: Use search string as filename and open in vertical split.
        " -   `c-v`: Open in vertical split
        " -   `c-s`: Open in horizontal split
        " -   `c-t`: Open in new tab
        " -   `c-y`: Yank the selected filenames
        " -   `<Enter>`: Open highlighted search result in current buffer
        "------------------------------------------------------------------------------------------
        Plug 'Shougo/neomru.vim'
        "--------------------------------------
        Plug 'kien/ctrlp.vim'
        Plug 'wincent/command-t'
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
                nnoremap <C-q> :Unite help buffer file_mru file file_rec bookmark <CR>
                nnoremap <Leader>u :Unite help file_mru file buffer file_rec bookmark <CR>
                nnoremap <Leader>\ :Unite -silent -vertical -winwidth=40  -direction=botright -toggle outline<CR>
                nnoremap <Leader>h :UniteWithCursorWord -silent help<CR>
                nnoremap <Leader>r :<C-u>Unite -buffer-name=register register<CR>
                nnoremap <Leader>c :<C-u>Unite -buffer-name=change change<CR>
                nnoremap <Leader>j :<C-u>Unite -buffer-name=jump jump<CR>
                nnoremap <Leader>' :Unite bookmark <CR>
        "==================================================================================
        Plug 'ddrscott/vim-side-search'
        " How should we execute the search?
        " --heading and --stats are required!
        let g:side_search_prg = 'ag --word-regexp'
                                \. " --ignore='*.js.map'"
                                \. " --heading --stats -B 1 -A 4"
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
        "----------------------------------------------------------------------------------
        Plug 'exvim/ex-matchit'
        "----------------------------------------------------------------------------------
        Plug 'ervandew/supertab'
        "---------------------------------------------------------------------------------- 
        Plug 'MarcWeber/vim-addon-mw-utils'
        Plug 'garbas/vim-snipmate'
        Plug 'honza/vim-snippets'
        Plug 'SirVer/ultisnips'
        "===PLAY1==BliZZ===+=(C-q)=================================================================
                function! UltiSnipsCallUnite()
                        Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
                        return ''
                endfunction
        "------------------------------Ulti-Expander-Unite-----------------------------------------
                inoremap <F3> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
                let g:UltiSnipsExpandTrigger="<tab>"
                let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
                let g:UltiSnipsJumpForwardTrigger="<C-q>"
        Plug 'Shougo/neosnippet.vim'
        Plug 'Shougo/neosnippet-snippets'
        "===PLAY2==BLiZZ==(C-s)+(C-b)==============================================================
                imap <C-s>    <Plug>(neosnippet_start_unite_snippet)
                imap <C-b>    <Plug>(neosnippet_expand_or_jump)
                smap <C-b>    <Plug>(neosnippet_expand_or_jump)
                xmap <C-b>    <Plug>(neosnippet_expand_target)
                nnoremap <Leader>y :<C-u>Unite -buffer-name=neosnippet neosnippet<CR>
        "------------------------------------------------------------------------------------------ 
        "------------------------------------------------------------------------------------------ 
        Plug 'tpope/vim-tbone'
        Plug 'tmux-plugins/vim-tmux'
        Plug 'xolox/vim-misc'
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-repeat'
        Plug 'ivyl/vim-bling'
                let g:bling_time = 42
                let g:bling_color_fg = 'green'
                let g:bling_color_cterm = 'reverse'
        Plug 'tpope/vim-unimpaired'
        Plug 'tpope/vim-eunuch'
        "----------------------------------------------------------------------------------
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
        "------------------------------------------------------------------------------------------
        Plug 'majutsushi/tagbar'
                highlight TagbarHighlight   ctermfg=051 ctermbg=9 cterm=bold
                highlight TagListTagName    ctermfg=250
                highlight TagbarFoldIcon    ctermfg=051 ctermbg=9 
                highlight TagbarHelp        ctermfg=051 ctermbg=9
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
        "----------------------------------------------------------------------------------
        "Plug 'guns/xterm-color-table.vim'
        "Plug 'gko/vim-coloresque'
        "----------------------------------------------------------------------------------
        Plug 'haya14busa/incsearch.vim'
        Plug 'vim-scripts/SearchComplete'
        "---------------------------------------------------------------------------------- 


        "-AAA3----------------------------------------------------------------------------------------------{{{
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
                 "" NERDCommenter
                 let g:NERDDefaultAlign = 'left'
                 let g:NERDCommentEmptyLines = 1
                 let g:NERDTrimTrailingWhitespace = 1
                 "" NERD
        "----------------------------------------------------------------------------------
        "---Fix-window-position-of-help----------------------------------------------------
                nnoremap <F2> <Esc>:help <C-r><C-w><CR>
        "----------------------------------------------------------------------------------
                nnoremap <C-F2> <Esc>:helpgrep <C-r><C-w><CR>
        "----------------------------------------------------------------------------------
                "au! FileType vim,help nnoremap M :exec "help" expand("<cword>")<CR>
        "----------------------------------------------------------------------------------
                nnoremap <F3> :call NERDTreeToggleInCurDir()<CR>
         "--------------------------------------------------------------------------------- 
                nnoremap <F4> :w<CR>:!python %<CR>
         "--------------------------------------------------------------------------------- 
                nnoremap <F5> :TagbarToggle<CR>
         "--------------------------------------------------------------------------------- 
         Plug 'mtth/scratch.vim'
                nnoremap <F7> :Scratch<CR>
                nnoremap <F6> :ScratchPreview<CR>
        "----------------------------------------------------------------------------------
                nnoremap <F9> :call ToggleQuickFix()<CR>
                nnoremap <Leader>b :cprev<cr>zvzz
                nnoremap <Leader>n :cnext<cr>zvzz
         "-----------------------------------------------------------
                nnoremap <F8> :LocationToggle<cr>
                nnoremap <LocalLeader>n :lnext<cr>zvzz
                nnoremap <LocalLeader>b :lprev<cr>zvzz
        "---------------------------------------------------------------------------------- 
        Plug 'francoiscabrol/ranger.vim'
        "        let g:NERDTreeHijackNetrw = 0 
        "        let g:ranger_replace_netrw = 1 
        "        let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
                        noremap <localleader>r :Ranger<CR>
        "----------------------------------------------------------------------------------
         Plug 'henrik/vim-qargs'
         "-----------------------------------------------------------
         Plug 'AndrewRadev/undoquit.vim'
                 let g:undoquit_mapping = ';q' 
                 "---c-w+u------ 
         Plug 'maxbrunsfeld/vim-yankstack'
                 nmap zp <Plug>yankstack_substitute_older_paste
                 nmap zn <Plug>yankstack_substitute_newer_paste
        "----------------------------------------------------------------------------------
        Plug 'easymotion/vim-easymotion'
                let g:EasyMotion_smartcase = 1
                let g:EasyMotion_do_mapping = 0 "-Disable default mappings
                nmap <LocalLeader><LocalLeader> <Plug>(easymotion-overwin-w)
        Plug 'wellle/visual-split.vim'
                " :VSSplit, :VSSplitAbove or :VSSplitBelow to create the split
                " :VSResize to execute the VSResize ex command on the selected range
                nmap <C-W>r  <Plug>(Visual-Split-Resize)
                nmap <C-W>s <Plug>(Visual-Split-Split)
        "---AAA-nnn-----------------------------------------------------}}}

        "==================================================================================
        Plug 'nvie/vim-flake8'
        "---------------------------------------------------------------------------------- 
        Plug 'google/vim-maktaba'
        "-Strongly recommended: easy configuration of maktaba plugins.
        Plug 'google/vim-glaive'
                let g:myplugin_enablefeature = 1
                let g:myplugin_defaultdir = $HOME
                let g:myplugin_weirdmode = 'm'

        Plug 'google/vim-syncopate'
        "----------------------------------------------------------------------------------
        Plug 'google/vim-codefmt'
                augroup autoformat_settings
                        autocmd FileType bzl AutoFormatBuffer buildifier
                        autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
                        autocmd FileType dart AutoFormatBuffer dartfmt
                        autocmd FileType go AutoFormatBuffer gofmt
                        autocmd FileType gn AutoFormatBuffer gn
                        autocmd FileType html,css,json AutoFormatBuffer js-beautify
                        autocmd FileType java AutoFormatBuffer google-java-format
                        autocmd FileType python AutoFormatBuffer yapf
                        " Alternative: autocmd FileType python AutoFormatBuffer autopep8
                augroup END
        "---------------------------------------------------------------------------------- 
        "================================================================================== 
        Plug 'godlygeek/tabular'
                " Tabularize {
                nmap <Leader>a& :Tabularize /&<CR>
                vmap <Leader>a& :Tabularize /&<CR>
                nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
                vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
                nmap <Leader>a=> :Tabularize /=><CR>
                vmap <Leader>a=> :Tabularize /=><CR>
                nmap <Leader>a: :Tabularize /:<CR>
                vmap <Leader>a: :Tabularize /:<CR>
                nmap <Leader>a:: :Tabularize /:\zs<CR>
                vmap <Leader>a:: :Tabularize /:\zs<CR>
                nmap <Leader>a, :Tabularize /,<CR>
                vmap <Leader>a, :Tabularize /,<CR>
                nmap <Leader>a,, :Tabularize /,\zs<CR>
                vmap <Leader>a,, :Tabularize /,\zs<CR>
                nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
                vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
                " }
        "--------------------------------------------------------------------------------- 
                " abc,def,ghi , some , shrt 
                " a,b,c
        "--------------------------------------------------------------------------------- 
        Plug 'dhruvasagar/vim-table-mode'
                let g:table_mode_corner_corner='+'
                let g:table_mode_header_fillchar='='
                " :TableModeToggle
                " +-------+---------+--------+
                " | hallo | albert  | montag |
                " +=======+=========+========+
                " | isr   | student | id     |
                " +-------+---------+--------+
        "==================================================================================
        source ~/git/aTest/dotFiles/nVim/logoTextObjct.vim
        "source ~/git/aTest/dotFiles/nVim/logoHtml.vim
        "source ~/git/aTest/dotFiles/nVim/logoGit.vim
        "source ~/git/aTest/dotFiles/nVim/logoMako.vim
        "source ~/git/aTest/dotFiles/nVim/logoQF.vim
        "source ~/git/aTest/dotFiles/nVim/logoAsyncPy.vim
        "==================================================================================
        Plug 'lambdalisue/gina.vim'
        "==================================================================================
        Plug 'rkulla/pydiction'
        Plug 'lambdalisue/lista.nvim'
                nnoremap # :<C-u>Lista<CR>
                nnoremap g# :<C-u>ListaCursorWord<CR>
        "======================================================
                let g:lista#custom_mappings = [
                                        \ ['<C-f>', '<Left>'],
                                        \ ['<C-b>', '<Right>'],
                                        \ ['<C-a>', '<Home>'],
                                        \ ['<C-e>', '<End>'],
                                        \ ['<C-d>', '<Del>'],
                                        \ ['<C-P>', '<lista:select_previous_candidate>', 'noremap'],
                                        \ ['<C-N>', '<lista:select_next_candidate>', 'noremap'],
                                        \ [';', 'pinkyless#stickyshift#enter(";")', 'expr noremap'],
                                        \]
        "==================================================================================
        "Plug 'Valloric/ListToggle'
        "let g:lt_height = 10
        "Plug 'baabelfish/nvim-nim'

        "==================================================================================
         " Plug 'dahu/vim-zebra'
         "     let g:zebra = 1
         "     let zebra_gap = 2
         "     hi Zebra ctermbg=23 

" call plug#end()
"---nPlugEnd-nPlugStop3}----------------}}}

        "----------------------------------------------------------------------------------
        "==================================================================================
        "----------------------------------------------------------------------------------
        let g:jedi#use_splits_not_buffers = "left"
        let g:jedi#popup_on_dot = 0
        "----------------------------------------------------------------------- 
        let g:jedi#goto_command = "<leader>d"
        let g:jedi#goto_assignments_command = "<leader>g"
        let g:jedi#goto_definitions_command = ""
        "--------------MMM--------------------------
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
        "::::::::::::::::::::::-=<1>=-:::::::::::::::::::::::::::::::::::::::::::::::::::::
        let g:deoplete#enable_at_startup = 1
        " CUST-ERR
        "call deoplete#custom#option('refresh_always', v:true)
        "call deoplete#custom#source('_', 'min_pattern_length', 3)
        "err call deoplete#custom#source('jedi', 'is_debug_enabled', 1)
        "call deoplete#enable_logging('DEBUG', 'deoplete.log')
        "-------------------------------------------------------------------------------- 
        let g:deoplete#enable_ignore_case = 1
        let g:deoplete#enable_smart_case = 1
        let g:deoplete#enable_camel_case = 1
        let g:deoplete#enable_refresh_always = 1
        let g:deoplete#max_abbr_width = 0
        let g:deoplete#max_menu_width = 0
        "--------------------------------------------------------------------------------
        let g:deoplete#sources#ternjs#timeout = 3
        let g:deoplete#sources#ternjs#types = 1
        let g:deoplete#sources#ternjs#docs = 1
        "--------------------------------------------------------------------------------
        let g:deoplete#skip_chars = ['(', ')', '<', '>']
        let g:deoplete#tag#cache_limit_size = 800000
        let g:deoplete#file#enable_buffer_path = 1
        "-------------------------------------------------------------------------------- 
        let g:LanguageClient_serverCommands = {
                                \ 'python': ['/usr/local/bin/pyls'],
                                \ }

        "-------------------------------------------------------------------------------- 
        let g:deoplete#sources#jedi#statement_length = 30
        let g:deoplete#sources#jedi#show_docstring = 1
        let g:deoplete#sources#jedi#short_types = 1
        "-------------------------------------------------------------------------------- 
        " Plugin key-mappings.
        inoremap <expr><C-g>     deoplete#undo_completion()
        inoremap <expr><C-l>     deoplete#refresh()
        inoremap <expr><C-h>     deoplete#smart_close_popup()."\<C-h>"
        "-------------------------------------------------------------------------------- 
        autocmd! FileType python setlocal completeopt-=preview
        "--------------------------------------------------------------------------------
        silent! set complete& completeopt=menu infercase noshowfulltag
        "set shortmess+=c
        "suppress intro message because the above makes it look bad
        set shortmess+=I
        "--------------------------------------------------------------------------------
        " automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set pumheight=12
        hi Pmenu  ctermfg=1 ctermbg=255
        hi PmenuSbar   ctermfg=11 ctermbg=5 cterm=NONE
        hi PmenuThumb  ctermfg=12 ctermbg=2 cterm=NONE
        "--------------------------------------------------------------------------------
        autocmd! FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd! FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd! FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd! FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd! FileType python setlocal omnifunc=jedi#completions
        autocmd! FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd! FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd! FileType haskell setlocal omnifunc=necoghc#omnifunc
        "--------------------------------------------------------------------------------
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
        inoremap <silent> <C-]> <C-x><C-]>
        "inoremap <silent> <C-u> <C-x><C-u>
        "===PLAY15=================================================================================
        nnoremap ;d mayiw`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
        "--------------------------------------------------------------------------------
        "call deoplete#custom#source('neosnippet',    'rank', 690)
        "call deoplete#custom#source('ultisnips',     'rank', 680)
        "call deoplete#custom#source('padawan',       'rank', 660)
        "call deoplete#custom#source('go',            'rank', 650)
        "call deoplete#custom#source('vim',           'rank', 640)
        "call deoplete#custom#source('flow',          'rank', 630)
        "call deoplete#custom#source('TernJS',        'rank', 620)
        "call deoplete#custom#source('LanguageClient','rank', 610)
        "call deoplete#custom#source('jedi',          'rank', 600)
        "call deoplete#custom#source('tag',           'rank', 550)
        "call deoplete#custom#source('omni',          'rank', 500)
        "call deoplete#custom#source('member',        'rank', 500)
        "call deoplete#custom#source('file_include',  'rank', 420)
        "call deoplete#custom#source('file',          'rank', 410)
        "call deoplete#custom#source('around',        'rank', 330)
        "call deoplete#custom#source('buffer',        'rank', 320)
        "call deoplete#custom#source('dictionary',    'rank', 310)
        "call deoplete#custom#source('tmux-complete', 'rank', 300)
        "call deoplete#custom#source('syntax',        'rank', 200)
        ""--------------------------------------------------------------------------------
        "call deoplete#custom#source('LanguageClient','mark', 'ℰ')
        "call deoplete#custom#source('omni',          'mark', '⌾')
        "call deoplete#custom#source('flow',          'mark', '⌁')
        "call deoplete#custom#source('TernJS',        'mark', '⌁')
        "call deoplete#custom#source('go',            'mark', '⌁')
        "call deoplete#custom#source('jedi',          'mark', '⌁')
        "call deoplete#custom#source('vim',           'mark', '⌁')
        "call deoplete#custom#source('neosnippet',    'mark', '⌘')
        "call deoplete#custom#source('around',        'mark', '↻')
        "call deoplete#custom#source('buffer',        'mark', 'ℬ')
        "call deoplete#custom#source('tmux-complete', 'mark', '⊶')
        "call deoplete#custom#source('syntax',        'mark', '♯')
        "call deoplete#custom#source('member',        'mark', '.')

        "==========================================================================================
        "===SetPLAY2===============================================================================
        " In Neovim, you can set up fzf window using a Vim command
        let g:fzf_layout = { 'window': 'enew' }
        let g:fzf_layout = { 'window': '-tabnew' }
        let g:fzf_layout = { 'window': '10split enew' }
        "let g:fzf_history_dir = '~/.local/share/fzf-history'
        "----------------------------------------------------------------------------------
        let g:fzf_colors =
                        \ { 'fg':      ['fg', 'Comment'],
                        \ 'bg':      ['bg', 'Normal'],
                        \ 'hl':      ['fg', 'Comment'],
                        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn', 'Normal'],
                        \ 'hl+':     ['fg', 'Statement'],
                        \ 'info':    ['fg', 'PreProc'],
                        \ 'border':  ['fg', 'Ignore'],
                        \ 'prompt':  ['fg', 'Conditional'],
                        \ 'pointer': ['fg', 'Exception'],
                        \ 'marker':  ['fg', 'Keyword'],
                        \ 'spinner': ['fg', 'Comment'],
                        \ 'header':  ['fg', 'Comment'] }

        "==========================================================================================
        function! s:fzf_statusline()
                highlight fzf1 ctermfg=161 ctermbg=2
                highlight fzf2 ctermfg=23 ctermbg=9
                highlight fzf3 ctermfg=237 ctermbg=13
                setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
        endfunction
        autocmd! User FzfStatusLine call <SID>fzf_statusline()

        "==========================================================================================
        "---------------------Ctrl-x--Lynx---------------------------------------------------------
        let g:fzf_command_prefix = 'Fzf'
        let g:fzf_action = {
                        \ 'ctrl-t': 'tab split',
                        \ 'ctrl-x': ':Lynx',
                        \ 'ctrl-v': 'vsplit' }
        "------------------------------------------------------------------------------------------
        " Selecting Mappings
        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)
        "------------------------------------------------------------------------------------------
        imap <expr><C-j> fzf#vim#complete#word({'left': '18%'})
        imap <C-l> <plug>(fzf-complete-line)
        "===SetPLAY3===============================================================================
        command! FZFTag if !empty(tagfiles()) | call fzf#run({
                                \ 'source': "cat " . join(tagfiles()) . ' | grep -P "' . expand('%:t') . '"',
                                \ 'sink': function('<sid>tag_handler'),
                                \ 'options': '+m --with-nth=1',
                                \ 'down': '50%'
                                \ }) | else | echo 'No tags' | endif
        "------------------------------------------------------------------------------------------
        function! s:tag_handler(tag)
                if !empty(a:tag)
                        let token = split(split(a:tag, '\t')[2],';"')[0]
                        let m = &magic
                        setlocal nomagic
                        execute token
                        if m
                                setlocal magic
                        endif
                endif
        endfunction
        nnoremap <silent> <Leader>t :FZFTag<cr>

        "===SetPLAY3===============================================================================
        "-[Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1
        "-[[B]Commits] Customize the options used by 'git log':
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
        "-[Tags] Command to generate tags file
        let g:fzf_tags_command = 'ctags -R'
        "-[Commands] --expect expression for directly executing the command
        let g:fzf_commands_expect = 'alt-enter,ctrl-x'
        "---???-----------------------------------------------------------
        let generate_tags=1
        "===SetPLAY3===============================================================================
        "   - :Unite [{options}] {source's'}
        "      - parameters of source
        "          - e.g. file:foo:bar -- here ['foo', 'bar'] is parameters
        "          - e.g. file:foo\:bar -- use \ to escape
        "          - e.g. file:foo::bar -- ['foo', '', 'bar']
        "   - press 'I' to search after prompt '>'
        "       - *word,
        "       - **/foo (directory recursively)
        "       - foo bar (AND)
        "       - foo|bar (OR)
        "       - foo !bar (negative)
        ":UniteResume, :UniteBookmarkAdd,
        "------------------------------------------------------------------------------------------
        "-- CUST-ERR --
        "call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
        "                        \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))
        "call unite#filters#sorter_default#use(['sorter_rank'])
        "call unite#filters#matcher_default#use(['matcher_fuzzy'])
        "call unite#filters#matcher_default#use(['matcher_fzf'])

        "===SetPLAY5===============================================================================
        let g:ctrlp_cmd = 'CtrlPMRU'
        let g:ctrlp_extensions = ['tag']
        let g:ctrlp_match_window_bottom = 0
        let g:ctrlp_match_window_reversed = 0
        let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
        let g:ctrlp_dotfiles = 0
        let g:ctrlp_switch_buffer = 0
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_map = '<leader>p'
        let g:ctrlp_open_new_file = 'R'
        "let g:ctrlp_working_path_mode = 'ar'
        "===SetPLAY6===============================================================================
        let g:CommandTMaxFiles = 10000 " maximum number of files scan.
        let g:CommandTMaxDepth = 15
        let g:CommandTMaxCacheDirectories = 1 " 0: no limit.
        let g:CommandTMaxHeight = 15 " 0: as much as available space.
        let g:CommandTMinHeight = 0 " 0: single line.
        let g:CommandTAlwaysShowDotFiles = 0 " only if entered string contains a dot
        let g:CommandTNeverShowDotFiles  = 0
        let g:CommandTScanDotDirectories = 0
        let g:CommandTMatchWindowAtTop   = 0 " match window appear at bottom.
        let g:CommandTMatchWindowReverse = 1 " let the best match at bottom.
        let g:CommandTTageIncludeFilenames = 1 " include filenames when matches
        "===PLAY5==================================================================================
        nnoremap ;p :CtrlP<cr>
        nnoremap ;m :CtrlPMRU<cr>
        "===PLAY6==================================================================================
        nnoremap ;h :CommandTHelp<cr>
        nnoremap ;b :CommandTBuffer<cr>
        let g:CommandTCancelMap=['<C-x>', '<C-c>']
                "--------------------------------------------------------------------------
                " <Leader>t provide fast, intuitive mechanism for opening files and buffers
                " <BS> <Del> -- delete
                " <Left> <C-h> -- move left.
                " <Right> <C-l> -- move right
                " <C-a> -- move to the start.
                " <C-e> -- move to the end.
                " <C-u> -- clear the contents of the prompt.
                " <Tab> -- switch focus between the file listing and prompt.
                "--------------------------------------------------------------------------
                " <C-CR> <C-s> -- split open
                " <C-v> -- vsplit
                " <C-t> -- tab
                " <C-j> <C-n> <Down> -- select next file in file listing.
                " <C-k> <C-p> <Up> -- select previous file in file listing.
                " <Esc> <C-c> -- cancel (dismisses file listing)
                "--------------------------------------------------------------------------
        "==========================================================================================
        command! LocationToggle call LocationToggle()
        function! LocationToggle()
                if exists("w:is_location_window")
                        unlet w:is_location_window
                        exec "q"
                else
                        lopen
                        let w:is_location_window = 1
                endif
        endfunction

        "==========================================================================================
        function! ToggleQuickFix()
                if exists("g:qwindow")
                        cclose
                        execute "wincmd p"
                        unlet g:qwindow
                else
                        try
                                copen
                                execute "wincmd J"
                                let g:qwindow = 1
                        catch
                                echo "Error!"
                        endtry
                endif
        endfunction

        "-Open-Quickfix-window-automatically-----------------------------------------------
        autocmd QuickFixCmdPost grep cwindow
        autocmd! vimrc QuickfixCmdPost [^l]* nested copen | wincmd p
        autocmd! vimrc QuickfixCmdPost l* nested lopen | wincmd p
        "===PLAY4===SUCHE========************======================================================
                nnoremap <Leader>l :lgrep -R <cword> .<cr>
                nnoremap <Leader>g :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
                nnoremap <Leader>a :Ack <cword> .<cr>
                "nnoremap ? :Ack
                nmap <Leader>5 :Pydoc <cword> .<cr>
                nmap <Leader>6 :Rg <cword> .<cr>
                nmap <Leader>7 :Ag <cword> .<cr>
                nmap <Leader>8 <Plug>AgRawSearch <cword> .<cr>
                nmap <Leader>/ <Plug>AgRawSearch
                "================================================================="
                "  s - open entry in a new horizontal window                      "
                "  v - open entry in a new vertical window                        "
                "  t - open entry in a new tab                                    "
                "  o - open entry and come back                                   "
                "  O - open entry and close the location/quickfix window          "
                "  p - open entry in a preview window                             "
                "-----------------------------------------------------------------"
                " :Keep                                                           "
                " :Reject                                                         "
                " :Restore                                                        "
                " :Doline s/^/--                                                  "
                " :SaveList                                                       "
                " :SaveList curlist                                               "
                " :SaveListAdd curlist                                            "
                " :LoadList curlist                                               "
                " :ListLists                                                      "
                "================================================================="
        "==========================================================================================
