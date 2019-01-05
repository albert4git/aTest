"---Paredit ???---
call plug#begin()

        Plug 'mattboehm/vim-accordion'
        Plug 'godlygeek/tabular'

        "Some shrt from,some over phrase
        "A much longer phrase here,and another long phrase
        "Tabular

        " abc,def,ghi , some , shrt 
        " a,b,c

        Plug 'Raimondi/delimitMate'
        Plug 'vim-scripts/SpellCheck'
        Plug 'justinmk/vim-dirvish'

        " {(hh kkk55k  ) (hhhh)hh (hhhh)}
        " [uuu]k ['i555'bbb]

"--------------------------------------------------------------------------------- 
        Plug 'echuraev/translate-shell.vim'
            let g:trans_directions_list = [
                        \['en', 'de'],
                        \['de', 'en'],
                        \['en', 'ru'],
                        \['ru', 'en'],
                        \['en', 'ru', 'de'],
                        \['', 'ru'],
                        \['en', 'ja'],
                        \['en', 'zh-CN'],
                        \['en', 'zh-TW'],
                        \['en', 'la'],
                        \['en', 'es'],
                        \['', ''],
                        \]
            let g:trans_save_history = 1
"--------------------------------------------------------------------------------- 
        Plug 'tpope/vim-vinegar'
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
"--------------------------------------------------------------------------------- 
        Plug 'vim-scripts/tinykeymap'
        Plug 'nathanaelkane/vim-indent-guides'
            let g:indent_guides_auto_colors = 0
            hi IndentGuidesOdd   ctermbg=235
            hi IndentGuidesEven  ctermbg=242
        Plug 'skywind3000/vim-preview'
        Plug 'kshenoy/vim-signature'
        Plug 'krisajenkins/vim-pipe'
            let b:vimpipe_command="lynx -dump -stdin"
            let b:vimpipe_command='jslint <(cat)'
            autocmd BufNewFile,BufReadPost *.json setlocal filetype=javascript.json
            let b:vimpipe_command="python -m json.tool"
            let b:vimpipe_command="multimarkdown"
            "let b:vimpipe_filetype="html"
"--------------------------------------------------------------------------------- 
        Plug 'junegunn/gv.vim'
            " o or <cr> on a commit to display the content of it
            " o or <cr> on commits to display the diff in the range
            " O opens a new tab instead
            " gb for :Gbrowse
            " ]] and [[ to move between commits
            " . to start command-line with :Git [CURSOR] SHA à la fugitive
            " q to close

        Plug 'alfredodeza/coveragepy.vim'
            ":Coveragepy report
            let g:coveragepy_uncovered_sign = '-'
        Plug 'osyo-manga/vim-brightest'
            " let g:brightest#highlight = { "group" : "DiffText" }
            " let g:brightest#highlight = { "group" : "CtrlPNoEntries" }
            " let g:brightest#highlight = { "group" : "Exception" }
             let g:brightest#highlight = { "group" : "Define" }
"--------------------------------------------------------------------------------- 
        Plug 'c9s/helper.vim'
        Plug 'c9s/treemenu.vim'

"--------------------------------------------------------------------------------- 
        Plug 'tpope/vim-fugitive'
        Plug 'int3/vim-extradite'
        Plug 'kmnk/vim-unite-giti'
        Plug 'gilligan/textobj-gitgutter'
        Plug 'henrik/git-grep-vim'
"--------------------------------------------------------------------------------- 
        Plug 'aghareza/vim-gitgrep'
        Plug 'airblade/vim-gitgutter'
        Plug 'motemen/git-vim'
        Plug 'c9s/hypergit.vim'
            " <leader>G    toggle hypergit menu
            " <leader>ci   commit current file changes
            " <leader>ca   commit all changes
            " <leader>ga   add file to git repository
            " <leader>gb   branch manager buffer
            " <leader>gs   status manager buffer
            " <leader>gh   stash manager buffer
            " :GitCommit
            " :GitCommitAll
            " :GitCommitAmend
            " :GitStatus
            " :GitStash
            " :GitPush
            " :GitPull
"--------------------------------------------------------------------------------- 
        Plug 'xolox/vim-session'
            " Persist the options of the session plug-in using the session plug-in...
            let g:session_persist_globals = ['&sessionoptions']
            call add(g:session_persist_globals, 'g:session_autoload')
            call add(g:session_persist_globals, 'g:session_autosave')
            call add(g:session_persist_globals, 'g:session_default_to_last')
            call add(g:session_persist_globals, 'g:session_persist_globals')
            "let g:loaded_session = 1
            let g:session_autosave = 'yes'
"--------------------------------------------------------------------------------- 
        Plug 'machakann/vim-highlightedyank'
            let g:highlightedyank_highlight_duration = -1
        "sd,sr, sa{motion/textobject}{addition}	(normal and visual mode)
        Plug 'machakann/vim-sandwich'
        Plug 'tpope/vim-surround'
        Plug 'jiangmiao/auto-pairs'
"---------------------------------------------------------------------------------
        Plug 'tyru/capture.vim'
        Plug 'wellle/visual-split.vim'
        Plug 'gastonsimone/vim-dokumentary/'
        "??? apt-get install dictd dict-gcide dict
"--------------------------------------------------------------------------------- 
        " Plug 'zefei/vim-colortuner'
        " Plug 'jabbas/vimplates'
        Plug 'sophacles/vim-bundle-mako'
        Plug 'aperezdc/vim-template'
        Plug 'vim-scripts/mako.vim'

        Plug 'amiorin/vim-project'
        "-Language-Support-Bundles-
        Plug 'wavded/vim-stylus'                " stylus
        Plug 'octol/vim-cpp-enhanced-highlight' " C++
        Plug 'pboettch/vim-cmake-syntax'        " CMake

        "---TESTED-----------------------------------------
        Plug 'kien/ctrlp.vim'
        Plug 'tpope/vim-unimpaired'  " Handy bracket mappings.
        "---PreTESTED--------------------------------------
        Plug 'mtth/scratch.vim'
        "---NEW----------------------------------------------
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        "----------------------------------------------------
        Plug 'henrik/vim-qargs'
        Plug 'mileszs/ack.vim'
        Plug 'vim-scripts/YankRing.vim'
                ":YRShow
                "let g:yankring_n_keys = 'Y D x X'
                "let g:yankring_window_use_right = 1
                let g:yankring_window_use_bottom = 1
                let g:yankring_window_use_horiz = 1  " Use vertical split 0
                let g:yankring_window_height = 12
                let g:yankring_record_insert = 1
                let g:yankring_window_auto_close = 1
                let g:yankring_window_use_separate = 1
                let g:yankring_persist = 1
                let g:yankring_max_history = 100
                "let g:yankring_replace_n_pkey = '<m-p>'
                let g:yankring_replace_n_nkey = 'zb'
        "-NewNew----------------------------------------------
        Plug 'haya14busa/vim-easyoperator-line'
        Plug 'easymotion/vim-easymotion'
        Plug 'unblevable/quick-scope'
        "---New-Txt-Object------------------------------------
        "Plug 'sgur/vim-textobj-parameter'
        "Plug 'vimtaku/vim-textobj-keyvalue'
        "Plug 'rhysd/vim-textobj-continuous-line'
        "Plug 'paulhybryant/vim-textobj-path'
        "Plug 'jceb/vim-textobj-uri'
        "Plug 'mattn/vim-textobj-url'
        Plug 'saaguero/vim-textobj-pastedtext'
        Plug 'reedes/vim-textobj-sentence'
        Plug 'kana/vim-textobj-lastpat'
        Plug 'kana/vim-textobj-function'
        Plug 'kana/vim-textobj-fold'
        Plug 'whatyouhide/vim-textobj-erb'
        Plug 'kana/vim-textobj-entire'
        Plug 'kana/vim-textobj-diff'
        Plug 'Julian/vim-textobj-brace'

        Plug 'deathlyfrantic/vim-textobj-blanklines'
        Plug 'kana/vim-textobj-user'
        Plug 'beloglazov/vim-textobj-quotes'
        Plug 'kana/vim-textobj-line'
        Plug 'glts/vim-textobj-indblock'
        Plug 'Julian/vim-textobj-variable-segment'
        Plug 'whatyouhide/vim-textobj-xmlattr'
        Plug 'rsrchboy/vim-textobj-heredocs'
        "--------------------------------------
        Plug 'michaeljsmith/vim-indent-object'
        Plug 'vim-scripts/c.vim'
        "--------------------------------------
        Plug 'romainl/vim-qf'
        Plug 'yssl/QFEnter'
        Plug 'sk1418/QFGrep'
        Plug 'AndrewRadev/qftools.vim'
        Plug 'jceb/vim-editqf'
        "----------
        Plug 'killphi/vim-textobj-signify-hunk'
        Plug 'flazz/vim-colorschemes'
        Plug 'rafi/awesome-vim-colorschemes'
        Plug 'Chun-Yang/vim-action-ag'
        Plug 'rking/ag.vim'
        Plug 'vim-scripts/ReplaceWithRegister'
        Plug 'ludovicchabant/vim-gutentags'
        Plug 'scrooloose/nerdtree'
        "-------------------------------------------------------------------------
        Plug 'jremmen/vim-ripgrep'
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-repeat'         " Intelligent repeat with '.'
        Plug 'tpope/vim-sleuth'         " indet reight ?
        "-------------------------------------------------------------------------
        Plug 'nvie/vim-flake8'
        "-------------------------------------------------------------------------
        Plug 'mbbill/undotree'
        Plug 'Shougo/vimfiler.vim'
        "-------------------------------------------------------------------------
        Plug 'thinca/vim-quickrun'
        Plug 'brooth/far.vim'
        Plug 'neomake/neomake'
        Plug 'wincent/command-t'

        "Plug 'Rykka/trans.vim'
        Plug 'ron89/thesaurus_query.vim'

        Plug 'Shougo/vimshell.vim'

        Plug 'majutsushi/tagbar'
        Plug 'scrooloose/syntastic'
        Plug 'w0rp/ale'

        Plug 'tpope/vim-dispatch'
        Plug 'nixprime/cpsm'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'

        Plug 'roxma/nvim-completion-manager'
"--------------------------------------------------------------------------------- 
         Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
         Plug 'Valloric/YouCompleteMe'
        Plug 'davidhalter/jedi-vim'
        Plug 'Shougo/neocomplete.vim'
"--------------------------------------------------------------------------------- 
        Plug 'honza/vim-snippets'
        Plug 'SirVer/ultisnips'
        Plug 'ervandew/supertab'
"--------------------------------------------------------------------------------- 
        Plug 'Shougo/neosnippet.vim'
        Plug 'Shougo/neosnippet-snippets'
"--------------------------------------------------------------------------------- 
         Plug 'garbas/vim-snipmate'
"--------------------------------------------------------------------------------- 
        Plug 'AndrewRadev/switch.vim'
        Plug 'auwsmit/vim-hydra'
        Plug 'haya14busa/incsearch.vim'
        Plug 'vim-scripts/SearchComplete'
        Plug 'rstacruz/vim-fastunite'
        "Plug ''
        "Plug ''
"--------------------------------------------------------------------------------- 
        Plug 'jalvesaq/vimcmdline'
        Plug 'terryma/vim-expand-region'
"--------------------------------------------------------------------------------- 
        Plug 'jalvesaq/Nvim-R'
        Plug 'tpope/vim-eunuch'
        Plug 'rking/ag.vim'
"--------------------------------------------------------------------------------- 
        Plug 'tomtom/tlib_vim'       
        Plug 'MarcWeber/vim-addon-mw-utils'
"--------------------------------------------------------------------------------- 
        Plug 'ivyl/vim-bling'
        Plug 'Shougo/unite.vim' 
        Plug 'tsukkee/unite-tag'
        Plug 'SpaceVim/unite-ctags'
        Plug 'Shougo/unite-outline/'
        Plug 'tsukkee/unite-help'
        Plug 'cskeeters/unite-fzf'
        Plug 'junegunn/fzf'
        Plug 'junegunn/fzf.vim'
        Plug 'pbogut/fzf-mru.vim'
"--------------------------------------------------------------------------------- 
        Plug 'idanarye/vim-vebugger'
        Plug 'Shougo/neomru.vim'
        Plug 'Shougo/echodoc.vim'
"--------------------------------------------------------------------------------- 
        "Generic Programming Support
        Plug 'janko-m/vim-test'
        Plug 'AndrewRadev/undoquit.vim'
        Plug 'MattesGroeger/vim-bookmarks'
        Plug 'morhetz/gruvbox'
        Plug 'tomasr/molokai'
        Plug 'fmoralesc/molokayo'
        "------------------------------------
        Plug 'artur-shaik/vim-javacomplete2'
        Plug 'adriaanzon/vim-textobj-matchit'
        Plug 'exvim/ex-matchit'
        Plug 'AndrewRadev/switch.vim'
        Plug 'itchyny/calendar.vim'
        Plug 'guns/xterm-color-table.vim'
"--------------------------------------------------------------------------------- 
        Plug 'brookhong/cscope.vim'
        Plug 'abudden/EasyColour'
        "------------------------------------
        Plug 'xolox/vim-misc'
        Plug 'xolox/vim-easytags'
        Plug 'vim-scripts/tagselect'
        Plug 'vim-scripts/genutils'

        Plug 'junegunn/vader.vim'
        Plug 'vim-scripts/paredit.vim'
        Plug 'alvan/vim-closetag'

        Plug 'python-mode/python-mode', { 'branch': 'develop' }
        Plug 'maxbrunsfeld/vim-yankstack'
        "-------------------------------------------------------------------------
        Plug 'Yggdroot/indentLine'
        Plug 'sonph/onehalf'
        Plug 'Shougo/context_filetype.vim'
        Plug 'rstacruz/sparkup'
        Plug 'jesseleite/vim-agriculture'
call plug#end()



"----------------------------------------------------------------------------------
    "Plug 'reedes/vim-lexical'
    " zg	- Mark as a good word
    " zw	- Like zg but mark the word as a wrong (bad) word.
    " zug - Unmark as good word
    " zuw - Unmark as wrong (bad) word
    " z=	- For the word under/after the cursor suggest correctly spelled words
    " 1z=	- Use the first suggestion, without prompting
    " . - Redo - repeat last word replacement
    " :spellr - Repeat the replacement done by z= for all matches with the replaced word in the current window
    " For spelling suggestions while in Insert mode:
    " «CTRL-X» «CTRL-S» (or «CTRL-X» «s» for terminal users) - suggest spelling, using «CTRL-P» and «CTRL-N» to navigate.

    " augroup lexical
    "     autocmd!
    "     autocmd FileType markdown,mkd call lexical#init()
    "     autocmd FileType textile call lexical#init()
    "     autocmd FileType text call lexical#init({ 'spell': 0 })
    " augroup END

    " let g:lexical#spell = 1         " 0=disabled, 1=enabled
    " let g:lexical#spelllang = ['en_us','en_ca',]
    " help spellfile.vim
    " let g:lexical#dictionary = ['/usr/share/dict/words',]
    " let g:lexical#spellfile = ['~/.vim/spell/en.utf-8.add',]

    " let g:lexical#spell_key = '<leader>s'
    " let g:lexical#thesaurus_key = '<leader>t'
    " let g:lexical#dictionary_key = '<leader>k'
    " command -nargs=0 LexMed call lexical#init({ 
    "             \ 'spell': 1, 
    "             \ 'spelllang':  ['en', 'medical'],
    "             \ 'dictionary': ['~/.vim/dictionary/medical_terms.txt',
    "             \                '/usr/share/dict/words',
    "             \               ],
    "             \ 'thesaurus':  ['~/.vim/dictionary/medical_synonyms.txt',
    "             \                '~/.vim/thesaurus/mthesaur.txt',
    "             \               ],
    "             \ 'spellfile':  ['~/.vim/spell/en.add'],
    "             \ })
"----------------------------------------------------------------------------------
        " fun! JumpToDef()
        "         if exists("*GotoDefinition_" . &filetype)
        "                 call GotoDefinition_{&filetype}()
        "         else
        "                 exe "norm! \<C-]>"
        "         endif
        " endf

        " " Jump to tag
        " nn <M-g> :call JumpToDef()<cr>
        " ino <M-g> <esc>:call JumpToDef()<cr>

"----------------------------------------------------------------------------------
" let g:hytrigger = 'z.'
" let g:hyquit  = [ 'q', '.', '<space>' ]
" let g:hykeys =  [ 'u', '<c-u>', 'd', '<c-d>' ]
" let g:hykeys += [ '[', '{',     ']', '}', ]
" call MakeHydra(g:hytrigger,g:hyquit,g:hykeys)
"
" map format: map lhs rhs
" hykeys format: [ lhs1, rhs1, lhs2, rhs2, lhs3, rhs3, etc ]
"
" EFFECTS: (currently only normal mode)
"
" - Press z. to enable hydra
" - While enabled,
"   - u is <c-u>
"   - d is <c-d>
"   - [ is {
"   - etc
" - Press q, ., or <space> to disable hydra
"   - z. would also work if it were a single key
"     because timeoutlen is disabled for the hydra
"----------------------------------------------------------------------------------


" Based on abo-abo/hydra (an Emacs plugin): hydras for vim.
" maparg can be used to read, store and restore pre-existing mappings.
" also important is having just one place to define hydras
" the rest should be automatically generated
"----------------------------------------------------------------------------------

" function! Hydra_Move_Enable()
"         call Hydra_OpenCheatsheet("move") 
"         nmap <buffer> s :m .+1<CR>==
"         nmap <buffer> w :m .-2<CR>==
"         nmap <buffer> q :call Hydra_Move_Disable()<CR>
" endfunction

" nmap <silent> <leader>m :call Hydra_Move_Enable()<CR>

" function! Hydra_Move_Disable()
"         nunmap <buffer> s
"         nunmap <buffer> w
"         nunmap <buffer> q
"         bufdo call Hydra_CloseCheatsheets()
" endfunction

" function! Hydra_OpenCheatsheet(filename)
"         exe "bo split ~/.vim/hydra/cheatsheets/" . a:filename
"         setlocal laststatus=0
"         exe "resize " . line('$')
"         set nonumber
"         setlocal filetype=hydracheatsheet
"         setlocal nomodifiable
"         wincmd p
" endfunction

" function! Hydra_CloseCheatsheets()
"         if &ft == "hydracheatsheet"
"                 bd!
"         endif
" endfunction
"----------------------------------------------------------------------------------
    "" Eclim {{{ bring Eclipse functionality to Vim support various languages
        " code complete: <C-X><C-U>
        " :Validate/:w to check syntax error.
        "let java_highlight_java_lang_ids=1 " highlight Identifiers in java.lang.*

        " javacomplete
        " http://www.vim.org/scripts/script.php?script_id=1785

        " Vim JDE : Vim - Just a Development Envirement (Java/C++)
        " http://www.vim.org/scripts/script.php?script_id=1213
     ""}}}
"----------------------------------------------------------------------------------

    " " Initialize Help Syntax
    " syntax match HelpComment +^#.*+
    " syntax match String      +".\{-}"+
    " hi HelpComment ctermfg=blue
    " hi String      ctermfg=red

"-AAA----------------------------------------------------------------------------------------------------------
" ctrl+[ it will put you in normal mode just like hitting esc.  
" :ab php           : list of abbreviations beginning php
" :map ,            : list of maps beginning ,
" # For use in Maps
" <CR>             : carriage Return for maps
" <ESC>            : Escape
" <LEADER>         : normally \
" <BAR>            : | pipe
"AAA-----------------------------------------------------------------------------------------------------------
"let g:indentLine_color_term = 000 There never seem to be enough spare keys for maps.
" The command is executed by doing a @m
" let @m=":'a,'bs/"
"AAA-----------------------------------------------------------------------------------------------------------
" function! SaveCurrentSession()
"   if v:this_session != ""
"     exe "mksession! " . v:this_session
"   endif
" endfunction
" au BufRead Session.vim so %
" au VimLeave * call SaveCurrentSession()
"--------------------------------------------------------------------------------------------------------------
"   help jump-motions
" )   - jump forward one sentence
" (   - jump backward one sentence
" }   - jump forward one paragraph
" {   - jump backward one paragraph
" H   - jump to the top of the display       
" M   - jump to the middle of the display   
" L   - jump to the bottom of the display
" 'm  - jump to the beginning of the line of mark m
" `m  - jump to the location of mark m
" ''  - return to the line where the cursor was before the latest jump
" ``  - return to the cursor position before the latest jump (undo the jump).
" %   - jump to corresponding item, e.g. from an open brace to its 
"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-""-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-
" execute 'nnoremap \, :edit' resolve(expand('~/.bashrc')) '<CR>'
" nnoremap ,l mayiw`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
" vnoremap ,l may`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
"--------------------------------------------------------------------------------------------------------------
"-Plugin: insearch + insearch-fuzzy
" map <Space>  <Plug>(incsearch-forward)
" map /        <Plug>(incsearch-forward)
" map ?        <Plug>(incsearch-backward)
" map g/       <Plug>(incsearch-stay)
" map z<Space> <Plug>(incsearch-fuzzyspell-/)
" map z/       <Plug>(incsearch-fuzzyspell-/)
" map z?       <Plug>(incsearch-fuzzyspell-?)
" map zg/      <Plug>(incsearch-fuzzyspell-stay)
"--------------------------------------------------------------------------------------------------------------
" Plugin: qf
" nmap <F5>   <Plug>QfSwitch
" nmap <F6>   <Plug>QfCtoggle
" nmap <F7>   <Plug>QfCprevious
" nmap <F8>   <Plug>QfCnext
" nmap <C-F6> <Plug>QfLtoggle
" nmap <C-F7> <Plug>QfLprevious
" nmap <C-F8> <Plug>QfLnext
"--------------------------------------------------------------------------------------------------------------
"--------------------------------------------------------------------------------------------------------------
        " " Run tests
        " " Plugin: test
        " nmap <Leader>rt :w<CR>:TestToggleStrategy<CR>
        " nmap <Leader>rs :w<CR>:TestSuite<CR>
        " nmap <Leader>rf :w<CR>:TestFile<CR>
        " nmap <Leader>rl :w<CR>:TestLast<CR>
        " nmap <Leader>rn :w<CR>:TestNearest<CR>
        " nmap <Leader>rv :w<CR>:TestVisit<CR>

        "----------------------------------------------------------------------------------
        " if dein#tap('completor.vim')
        "         let g:completor_python_binary = '/usr/bin/python3'
        "         let g:completor_racer_binary = '/usr/bin/racer'
        "         let g:completor_clang_binary = '/usr/bin/clang'
        "         let g:completor_node_binary = '/usr/bin/node'
        "         let g:completor_disable_ultisnips = 1
        "         let g:completor_min_chars = 3
        " elseif dein#tap('deoplete.nvim')
        "         let g:deoplete#enable_at_startup = 1
        "         call deoplete#custom#set('buffer', 'min_pattern_length', 3)
        "         if dein#tap('deoplete-clang')
        "         let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
        "         let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
        "         endif
        " endif
        "----------------------------------------------------------------------------------
        " Then rebuild **helptags** in vim:
        " :helptags ~/.vim/doc/
        " let g:pymode_python = 'python3'
        " :help pymode-faq

        "----------------------------------------------------------------------------------
        " :nmap - Display normal mode maps
        " :imap - Display insert mode maps
        " :vmap - Display visual and select mode maps
        " :smap - Display select mode maps
        " :xmap - Display visual mode maps
        " :cmap - Display command-line mode maps
        " :omap - Display operator pending mode maps

        "----------------------------------------------------------------------------------
        " *  The {rhs} of the map is not re-mappable. Defined using the
        " ':noremap' or ':nnoremap' or ':inoremap', etc. commands.
        " &  Only script local mappings are re-mappable in the {rhs} of the
        " map. The map command has the <script> attribute.
        " @  A buffer local map command with the <buffer> attribute.

        "----------------------------------------------------------------------------------
        "----------------------------------------------------------------------------------
        "----------------------------------------------------------------------------------
        "----------------------------------------------------------------------------------
        "----------------------------------------------------------------------------------
        "----------------------------------------------------------------------------------
        "----------------------------------------------------------------------------------
        " 5. Compile `YouCompleteMe` to get nice support for code completion:
        "     * This step is optional but recommended. If you do not need code completion, 
        "     just delete the directory `~/.vim/bundle/YouCompleteMe`.
        "     * To be able to compile, it depends on [CMake](https://cmake.org) and Python headers (`python-dev` package in Ubuntu)
        "     * `cd ~/.vim/bundle/YouCompleteMe`
        "     * `./install.py` # for regular install
        "     * `./install.py --clang-completer` # for install with support for C-family languages. Refer to `.vim/bundle/YouCompleteMe/README.md` for more more details. 
        "----------------------------------------------------------------------------------
        " TDD
        " Write a test
        " Watch it fail
        " Make it compile
        " Make it pass
        " Refactor the code
        " Refactor the test (and elaborate)
        " Rinse and repeat

        " unittest
        " pymock
        " nose
        " nosy
        " py.test
