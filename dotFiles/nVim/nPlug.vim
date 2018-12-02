"---Paredit ???---
call plug#begin()
        "----------
        "Plug 'Shougo/vimproc.vim'
        "----------
        "---TESTED-----------------------------------------
        Plug 'kien/ctrlp.vim'
        Plug 'tpope/vim-unimpaired'  " Handy bracket mappings.
        "---PreTESTED--------------------------------------
        Plug 'mtth/scratch.vim'
        "---TODO--------------------------------------------
        Plug 'tpope/vim-fugitive'
        "---NEW----------------------------------------------
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        "----------------------------------------------------
        Plug 'yssl/QFEnter'
        Plug 'henrik/git-grep-vim'
        Plug 'henrik/vim-qargs'
        Plug 'mileszs/ack.vim'
        Plug 'nathanaelkane/vim-indent-guides'
        Plug 'vim-scripts/YankRing.vim'
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
        Plug 'gilligan/textobj-gitgutter'
        "--------------------------------------
        Plug 'michaeljsmith/vim-indent-object'
        Plug 'vim-scripts/c.vim'
        Plug 'romainl/vim-qf'
        Plug 'sk1418/QFGrep'
        Plug 'AndrewRadev/qftools.vim'
        Plug 'jceb/vim-editqf'
        "Plug 'itchyny/vim-qfedit'
        "----------
        Plug 'killphi/vim-textobj-signify-hunk'
        Plug 'kshenoy/vim-signature'
        Plug 'flazz/vim-colorschemes'
        Plug 'rafi/awesome-vim-colorschemes'
        Plug 'Chun-Yang/vim-action-ag'
        Plug 'rking/ag.vim'
        Plug 'vim-scripts/ReplaceWithRegister'
        Plug 'ludovicchabant/vim-gutentags'
        Plug 'scrooloose/nerdtree'
        "Plug 'wincent/loupe'
        "-------------------------------------------------------------------------
        Plug 'jremmen/vim-ripgrep'
        Plug 'tpope/vim-commentary'
        "Plug 'tomtom/tcomment_vim'
        "!"Plug 'tpope/vim-abolish'        " Extended abbreviation/substition.
        Plug 'tpope/vim-repeat'         " Intelligent repeat with '.'
        Plug 'tpope/vim-sleuth'         " indet reight ?
        "-------------------------------------------------------------------------
        "Plug 'gergap/keystroke'
        "Plug 'burnettk/vim-angular'
        "Plug 'fatih/vim-go'
        Plug 'motemen/git-vim'
        Plug 'nvie/vim-flake8'
        "-------------------------------------------------------------------------
        Plug 'mbbill/undotree'
        Plug 'Shougo/vimfiler.vim'
        "-------------------------------------------------------------------------
        Plug 'thinca/vim-quickrun'
        Plug 'brooth/far.vim'
        Plug 'neomake/neomake'
        Plug 'airblade/vim-gitgutter'
        Plug 'wincent/command-t'
        Plug 'echuraev/translate-shell.vim'
        "Plug 'Rykka/trans.vim'
        Plug 'ron89/thesaurus_query.vim'

        "Plug 'dhruvasagar/vim-zoom'
        Plug 'Shougo/vimshell.vim'
        Plug 'majutsushi/tagbar'
        Plug 'scrooloose/syntastic'
        Plug 'tpope/vim-surround'
        Plug 'w0rp/ale'

        Plug 'tpope/vim-dispatch'
        Plug 'nixprime/cpsm'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'

        Plug 'roxma/nvim-completion-manager'
"--------------------------------------------------------------------------------- 
                " Plug 'balta2ar/deoplete-matcherkey'
                " Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
                " Plug 'zchee/deoplete-jedi'
                " Plug 'zchee/deoplete-clang'
                "         let g:deoplete#enable_at_startup = 1
                "         let g:deoplete#enable_smart_case = 1
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
        Plug 'sophacles/vim-bundle-mako'
        "Plug 'jabbas/vimplates'
        Plug 'aperezdc/vim-template'

        Plug 'vim-scripts/mako.vim'

        Plug 'amiorin/vim-project'
        Plug 'int3/vim-extradite'

        " language support bundles
        Plug 'wavded/vim-stylus'                " stylus
        Plug 'jparise/vim-graphql'              " GraphQL
        Plug 'octol/vim-cpp-enhanced-highlight' " C++
        Plug 'pboettch/vim-cmake-syntax'        " CMake
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
"-Next-----------------------------------------------------------------------
"Plug 'Valloric/ListToggle'
"let g:lt_height = 10
"Plug 'baabelfish/nvim-nim'
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
        Plug 'kmnk/vim-unite-giti'
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
        Plug 'aghareza/vim-gitgrep'
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

"Plug 'rstacruz/vim-fastunite'
"Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }

        "Plug 'termhn/i3-vim-nav'
        "Plug 'vim-scripts/spreadsheet.vim'
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
"Plug 'Shougo/denite.nvim'
"Plug 'Townk/vim-autoclose'
"delimitMate 


        Plug 'python-mode/python-mode', { 'branch': 'develop' }
        Plug 'maxbrunsfeld/vim-yankstack'
        "-------------------------------------------------------------------------
        Plug 'Yggdroot/indentLine'
        Plug 'sonph/onehalf'
        Plug 'Shougo/context_filetype.vim'
        Plug 'rstacruz/sparkup'
        Plug 'jesseleite/vim-agriculture'
call plug#end()



"-------2EXPLORE---------------------------------------------------------------------------
        "Plug 'sonph/onehalf'
        "Plug 'duythinht/inori'
        "Plug 'Shougo/neoyank.vim'
        "Plug 'vim-scripts/TagHighlight'
        "Plug 'christoomey/vim-tmux-navigator'
        "Plug 'bkad/CamelCaseMotion'
        "Plug 'tpope/vim-sensible'
        "!Plug 'vim-scripts/marvim'
        "Plug 'Yggdroot/indentLine'
        "Plug 'xero/sourcerer.vim'
        "Plug 'Shougo/neco-vim'
        "Plug 'zchee/deoplete-zsh'
        "Plug 'mantiz/vim-plugin-dirsettings'



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
