       "--------------------------------------------------------------------------------- 

        "--------------------------------------------------------------------------------- 
        "Plug 'vim-scripts/YankRing.vim'
        "        ":YRShow
        "        "let g:yankring_n_keys = 'Y D x X'
        "        "let g:yankring_window_use_right = 1
        "        let g:yankring_window_use_bottom = 1
        "        let g:yankring_window_use_horiz = 1  " Use vertical split 0
        "        let g:yankring_window_height = 12
        "        let g:yankring_record_insert = 1
        "        let g:yankring_window_auto_close = 1
        "        let g:yankring_window_use_separate = 1
        "        let g:yankring_persist = 1
        "        let g:yankring_max_history = 100
        "        "let g:yankring_replace_n_pkey = '<m-p>'
        "        let g:yankring_replace_n_nkey = 'zb'
        "--------------------------------------------------------------------------------- 

        "--------------------------------------------------------------------------------- 

        "--------------------------------------------------------------------------------- 

        "--------------------------------------------------------------------------------- 
        "Plug 'google/vim-codefmt'
        " augroup autoformat_settings
        " autocmd FileType bzl AutoFormatBuffer buildifier
        " autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
        " autocmd FileType dart AutoFormatBuffer dartfmt
        " autocmd FileType go AutoFormatBuffer gofmt
        " autocmd FileType gn AutoFormatBuffer gn
        " autocmd FileType html,css,json AutoFormatBuffer js-beautify
        " autocmd FileType java AutoFormatBuffer google-java-format
        " autocmd FileType python AutoFormatBuffer yapf
        " " Alternative: autocmd FileType python AutoFormatBuffer autopep8
        " augroup END
        "--------------------------------------------------------------------------------- 
        "Plug 'vim-scripts/VimPdb'
                " * Highlighting of currently debugged line and breakpoint lines.
                " * F5 - Run/continue running.
                " * F2 - Toggle breakpoint at current line
                " * Ctrl-F2 / Shift-F2 - Toggle conditional/temporary breakpoint.
                " * F7 / F8 - Step into/over
                " * F12 - Print stack trace
                " * F3 / Ctrl-F3 - Eval/Exec a given statement (in the current debugging context)
                " * Save/load breakpoints into session files.
                " * Cross-platform


        "-Language-Support-Bundles-
        Plug 'wavded/vim-stylus'                " stylus
        Plug 'octol/vim-cpp-enhanced-highlight' " C++
        Plug 'pboettch/vim-cmake-syntax'        " CMake
        "---TESTED-----------------------------------------
"------------------------------------------------------------------------------------------
        " Plug 'michaeljsmith/vim-indent-object'
        "         let g:indent_object_except_first_level = 0
                " <count>ai      (A)n (I)ndentation level and line above.
                " <count>ii      (I)nner (I)ndentation level (no line above).
"------------------------------------------------------------------------------------------
        " Plug 'killphi/vim-textobj-signify-hunk'
"--------------------------------------------------------------------------------- 
        Plug 'michaeljsmith/vim-indent-object'
                let g:indent_object_except_first_level = 0
                        " <count>ai      (A)n (I)ndentation level and line above.
                        " <count>ii      (I)nner (I)ndentation level (no line above).
                        " <count>ii      (I)nner (I)ndentation level (no line above).
                        " <count>ii      (I)nner (I)ndentation level (no line above).
"--------------------------------------------------------------------------------- 
        " input:  [foo, bar()] (press (<M-e> at |)
        " output: ([foo, bar()])
"--------------------------------------------------------------------------------- 
        Plug 'jiangmiao/auto-pairs'
                "   <M-o> : newline with indentation
                "   <M-a> : jump to of line
                "   <M-n> : jump to next pairs
                "   <M-e> : jump to end of pairs.
                "   Ctrl-V ) : insert )' without trigger the plugin.
                "let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
                "let g:AutoPairscutToggle = '<another key>'
                "let g:AutoPairsShortcuts = 1
                "------------------------------------------------------------------------
                let g:AutoPairsShortcutToggle = '<M-p>'
                let g:AutoPairsShortcutFastWrap = '<M-e>'
                let g:AutoPairsShortcutJump = '<M-n>'
                let g:AutoPairsShortcutBackInsert = '<M-b>'
                let g:AutoPairsMapBS = 1
                let g:AutoPairsMapCR = 0 " insert a new indented line if cursor in pairs.
                " error in vimwiki <CR> Enter. but use upper inoremap can solve.
                let g:AutoPairsMapSpace = 0
                " error in abbreviations <space> auto expand.
                let g:AutoPairsCenterLine = 1
                let g:AutoPairsFlyMode = 0
                let g:AutoPairsMapCR=0
"--------------------------------------------------------------------------------- 
"--------------------------------------------------------------------------------- 
        "Plug 'vim-scripts/c.vim'
        "--------------------------------------
        "Plug 'python-mode/python-mode', { 'branch': 'develop' }
        "Plug 'rkulla/pydiction'
        "-Python-$-pydoc
        " au FileType python nnoremap H :exec "!pydoc" expand("<cword>")<CR>
        "--------------------------------------
        "Plug 'artur-shaik/vim-javacomplete2'
        "--------------------------------------
        "Plug 'rstacruz/sparkup'
        "-------------------------------------------------------------------------
        "Plug 'janko-m/vim-test'
        Plug 'junegunn/vader.vim'   " test vim.files ?
        "Plug 'idanarye/vim-vebugger'
        "Plug 'Shougo/echodoc.vim'
        "--------------------------------------
        "-------------------------------------------------------------------------
        "Plug 'itchyny/calendar.vim'
        "Plug 'jiangmiao/advancer-abbreviation'
        "-------------------------------------------------------------------------
        Plug 'mbbill/undotree'
        "-------------------------------------------------------------------------
        "Plug 'abudden/EasyColour'
        "--------------------------------------
        "Plug 'w0rp/ale'
        "--------------------------------------
        "Plug 'morhetz/gruvbox'
        "Plug 'tomasr/molokai'
        "Plug 'fmoralesc/molokayo'
        "--------------------------------------
        " Plug 'saaguero/vim-textobj-pastedtext'
        " Plug 'kana/vim-textobj-lastpat'
        " Plug 'kana/vim-textobj-line'
        " Plug 'kana/vim-textobj-fold'
        " Plug 'Julian/vim-textobj-variable-segment'

        "------------------------------------------------------
        "Plug 'whatyouhide/vim-textobj-erb'
        "Plug 'rsrchboy/vim-textobj-heredocs'
        "Plug 'deathlyfrantic/vim-textobj-blanklines'
        "Plug 'whatyouhide/vim-textobj-xmlattr'
        "Plug 'vim-scripts/paredit.vim' "lisp
        "Plug 'alvan/vim-closetag'
        "Plug 'jceb/vim-editqf'
        "------------------------------------------------------

        "Plug 'sgur/vim-textobj-parameter'
        "Plug 'vimtaku/vim-textobj-keyvalue'
        "Plug 'rhysd/vim-textobj-continuous-line'
        "Plug 'paulhybryant/vim-textobj-path'
        "Plug 'mattn/vim-textobj-url'
        "Plug 'jceb/vim-textobj-uri'
        "Plug 'jceb/vim-textobj-uri'


"--------------------------------------------------------------------------------- 
        Plug 'nathanaelkane/vim-indent-guides'
                let g:indentLine_enabled = 1
                let g:indent_guides_auto_colors = 1
                hi IndentGuidesOdd   ctermbg=235
                hi IndentGuidesEven  ctermbg=242
"--------------------------------------------------------------------------------- 
        Plug 'wesleyche/SrcExpl'
                let g:SrcExpl_pluginList = [
                                \ "__Tag_List__",
                                \ "_NERD_tree_",
                                \ "Source_Explorer",
                                \ "*unite*"
                                \ ]
                let g:SrcExpl_colorSchemeList = [
                                \ "Red",
                                \ "Cyan",
                                \ "Green",
                                \ "Yellow",
                                \ "Magenta"
                                \ ]
                " // The switch of the Source Explorer 
                nmap <F4> :SrcExplToggle<CR>  
                " // Set the height of Source Explorer window 
                let g:SrcExpl_winHeight = 8 
                " // Set 100 ms for refreshing the Source Explorer 
                let g:SrcExpl_refreshTime = 100 
                " // Set "Enter" key to jump into the exact definition context 
                let g:SrcExpl_jumpKey = "<ENTER>" 
                " // Set "Space" key for back from the definition context 
                let g:SrcExpl_gobackKey = "<SPACE>" 
        "Plug 'Raimondi/delimitMate'

        "Plug 'justinmk/vim-dirvish'
        "Plug 'tpope/vim-vinegar'

vim-scripts/argtextobj.vim 71 stars. Text objects for arguments
alfredodeza/coveragepy.vim 77 stars. Coverage.py integration.

bps/vim-textobj-python     50 stars. Text objects for python
osyo-manga/vim-brightest   63 stars. My nominee for most underrated! Constantly highlights the word
                              under the cursor and makes it easy to trace variable 
kana/vim-textobj-indent    98 stars. Some of my most-used text objects!


vim-exchange:           easy text exchange operator (from the author of vim-lion).
ReplaceWithRegister:    easy text replacement operator (avoids overwriting the replacement text).
quick-scope:             highlight characters targeted by f, t, etc.
vim-searchant:          highlight the current search result.
vim-highlightedyank:    highlight the yank region.


tpope/vim-abolish
Case preserving find and replace that can handle plurals.
:%S/facilit{y,ies}/building{,s}/g



        indent-object (ii and ai) (should be builtin)
        vim-matchup (i% and a% for b:match_words)
        visualrepeat (e.g. used by vim-sandwich)
        repmo-vim (e.g. repeat ]m with ;)
        vim-projectionist (precise project navigation)
        vim-apathy (sets the five path searching options — 'path', 'suffixesadd', 'include', 'includeexpr', and 'define')



"--------------------------------------------------------------------------------- 
                " Plug 'balta2ar/deoplete-matcherkey'
                " Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
                " Plug 'zchee/deoplete-jedi'
                " Plug 'zchee/deoplete-clang'
                "         let g:deoplete#enable_at_startup = 1
                "         let g:deoplete#enable_smart_case = 1
        "Plug 'dhruvasagar/vim-zoom'
        "Plug 'itchyny/vim-qfedit'
        "Plug 'vim-scripts/spell.vim'
        " Plug 'lambdalisue/lista.nvim'
            " <CR>		Accept the input and return the value
            " <C-M>		Accept the input and return the value
            " <Esc>		Cancel the input and return 0
            " <C-[>		Cancel the input and return 0
            " <C-t>		Select a previous line
            " <PageUp>  	Select a previous line
            " <S-Tab>  	Select a previous line
            " <C-g>		Select a next line
            " <PageDown>	Select a next line
            " <Tab>		Select a next line
            " <C-^>		Switch a matcher
            " <C-6>		Switch a matcher
            " <C-_>		Switch 'ignorecase' used in the prompt
            " <C-->		Switch 'ignorecase' used in the prompt
        "Plug 'vim-scripts/vim-signature'
        " Plug 'dahu/vim-zebra'
            " let g:zebra = 1
            " let zebra_gap = 2
            " hi Zebra ctermbg=23 
        "-----------------------------------
        "Plug 'Shougo/vimproc.vim'
        "Plug 'vim-scripts/spreadsheet.vim'
        "-----------------------------------
        "Plug 'rstacruz/vim-fastunite'
        "Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
        "Plug 'Shougo/denite.nvim'
        "Plug 'Townk/vim-autoclose'
        "-----------------------------------
        "Plug 'rkulla/pydiction'
        "Plug 'Valloric/ListToggle'
        "let g:lt_height = 10
        "Plug 'baabelfish/nvim-nim'
        "Plug 'lambdalisue/lista.nvim'
        "delimitMate 
        "Plug 'vim-scripts/vim-signature'
        "-----------------------------------
        "Plug 'sonph/onehalf'
        "Plug 'duythinht/inori'
        "Plug 'Shougo/neoyank.vim'
        "Plug 'vim-scripts/TagHighlight'
        "Plug 'christoomey/vim-tmux-navigator'
        "Plug 'bkad/CamelCaseMotion'
        "Plug 'tpope/vim-sensible'
        "Plug 'vim-scripts/marvim'
        "Plug 'xero/sourcerer.vim'
        "Plug 'Shougo/neco-vim'
        "Plug 'zchee/deoplete-zsh'
        "Plug 'mantiz/vim-plugin-dirsettings'
        "-----------------------------------
        "Plug 'wincent/loupe'
        "Plug 'tpope/vim-abolish'
        "Plug 'gergap/keystroke'
        "Plug 'fatih/vim-go'
        "quickfix-reflector.vim
        "bps/vim-textobj-python
        "Plug 'baabelfish/nvim-nim'

