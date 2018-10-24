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
        Plug 'Shougo/neosnippet.vim'
        Plug 'Shougo/neosnippet-snippets'
        Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
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
        Plug 'gergap/keystroke'
        "--------------------------------------
        Plug 'michaeljsmith/vim-indent-object'
        Plug 'vim-scripts/c.vim'
        Plug 'romainl/vim-qf'
        Plug 'sk1418/QFGrep'
        Plug 'AndrewRadev/qftools.vim'
        Plug 'itchyny/vim-qfedit'
        Plug 'jceb/vim-editqf'
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
        Plug 'wincent/loupe'
        "-------------------------------------------------------------------------
        Plug 'jremmen/vim-ripgrep'
        Plug 'tpope/vim-commentary'
        Plug 'tomtom/tcomment_vim'
        Plug 'tpope/vim-abolish'        " Extended abbreviation/substition.
        Plug 'tpope/vim-repeat'         " Intelligent repeat with '.'
        Plug 'tpope/vim-sleuth'         " indet reight ?
        "-------------------------------------------------------------------------
        Plug 'burnettk/vim-angular'
        "Plug 'fatih/vim-go'
        Plug 'motemen/git-vim'
        Plug 'nvie/vim-flake8'
        "-------------------------------------------------------------------------
        Plug 'mbbill/undotree'
        Plug 'Shougo/vimfiler.vim'
        Plug 'vim-scripts/SearchComplete'
        "-------------------------------------------------------------------------
        Plug 'thinca/vim-quickrun'
        Plug 'brooth/far.vim'
        Plug 'neomake/neomake'
        Plug 'airblade/vim-gitgutter'
        "Plug '/wincent/command-t'
        Plug 'dhruvasagar/vim-zoom'
        Plug 'Shougo/vimshell.vim'
        Plug 'majutsushi/tagbar'
        Plug 'scrooloose/syntastic'
        Plug 'tpope/vim-surround'
        Plug 'w0rp/ale'

        Plug 'roxma/nvim-completion-manager'
        Plug 'Townk/vim-autoclose'

        Plug 'tpope/vim-dispatch'
        Plug 'nixprime/cpsm'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'

        "! Plug 'Shougo/neocomplete.vim'
        "! Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
        "! Plug 'Valloric/YouCompleteMe'
        Plug 'balta2ar/deoplete-matcherkey'
        Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
        Plug 'zchee/deoplete-jedi'
        Plug 'zchee/deoplete-clang'

                let g:deoplete#enable_at_startup = 1
                let g:deoplete#enable_smart_case = 1
        Plug 'duythinht/inori'

        Plug 'tpope/vim-eunuch'
        Plug 'rking/ag.vim'
                Plug 'Shougo/neosnippet.vim'
                Plug 'Shougo/neosnippet-snippets'
                Plug 'honza/vim-snippets'
                Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
        Plug 'jalvesaq/Nvim-R'
        Plug 'Rykka/trans.vim'
        Plug 'ron89/thesaurus_query.vim'
"--------------------------------------------------------------------------------- 
        Plug 'MarcWeber/vim-addon-mw-utils'
        "Plug 'garbas/vim-snipmate'

        Plug 'ivyl/vim-bling'

        Plug 'junegunn/seoul256.vim'

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


        Plug 'idanarye/vim-vebugger'
        Plug 'davidhalter/jedi-vim'

        Plug 'Shougo/neoyank.vim'
        Plug 'Shougo/neomru.vim'
        Plug 'Shougo/echodoc.vim'
        "Generic Programming Support
        Plug 'janko-m/vim-test'
        Plug 'aghareza/vim-gitgrep'
        Plug 'AndrewRadev/undoquit.vim'
        Plug 'MattesGroeger/vim-bookmarks'
        Plug 'morhetz/gruvbox'
        Plug 'sonph/onehalf'
        Plug 'tomasr/molokai'
        Plug 'fmoralesc/molokayo'
        "------------------------------------
        Plug 'artur-shaik/vim-javacomplete2'
        Plug 'ervandew/supertab'
        Plug 'adriaanzon/vim-textobj-matchit'
        Plug 'exvim/ex-matchit'
        Plug 'AndrewRadev/switch.vim'
        Plug 'itchyny/calendar.vim'
        Plug 'guns/xterm-color-table.vim'
        Plug 'termhn/i3-vim-nav'
        "Plug 'vim-scripts/spreadsheet.vim'
        Plug 'brookhong/cscope.vim'
        Plug 'abudden/EasyColour'
        "------------------------------------
        Plug 'xolox/vim-misc'
        Plug 'xolox/vim-easytags'
        Plug 'vim-scripts/tagselect'
        Plug 'junegunn/vader.vim'
        Plug 'vim-scripts/paredit.vim'
        Plug 'alvan/vim-closetag'
        Plug 'Townk/vim-autoclose'
        Plug 'python-mode/python-mode', { 'branch': 'develop' }
        Plug 'maxbrunsfeld/vim-yankstack'
        "-------------------------------------------------------------------------
call plug#end()

"-------2EXPLORE---------------------------------------------------------------------------
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
