" Typing: ci', ci", or ci)
"--------------------------GVIM-------------------------------------------------
call plug#begin('~/.vim/plugged')
    "Plug 'junegunn/seoul256.vim'
    "Plug 'bkad/CamelCaseMotion'
    "Plug 'tpope/vim-sensible'
    Plug 'vim-scripts/marvim'
    Plug 'gergap/keystroke'
    Plug 'kshenoy/vim-signature'
    Plug 'flazz/vim-colorschemes'
    Plug 'Shougo/vimproc.vim'
    Plug 'Shougo/neocomplete.vim'
    Plug 'Rykka/trans.vim'
    Plug 'ron89/thesaurus_query.vim'
    Plug 'thinca/vim-quickrun'
    Plug 'mtth/scratch.vim'
    Plug 'scrooloose/syntastic'
    Plug 'Chun-Yang/vim-action-ag'
    Plug 'rking/ag.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'dhruvasagar/vim-zoom'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'majutsushi/tagbar'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'scrooloose/nerdtree'
    Plug 'wincent/loupe'
    "-------------------------------------------------------------------------
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-abolish'        " Extended abbreviation/substition.
    Plug 'tpope/vim-repeat'         " Intelligent repeat with '.'
    Plug 'tpope/vim-surround'       " Work with pairs of quotes/anything.
    Plug 'tpope/vim-unimpaired'     " Handy bracket mappings.
    Plug 'tpope/vim-sleuth'         " indet reight ?
    Plug 'jremmen/vim-ripgrep'
    Plug 'kien/ctrlp.vim'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-eunuch'
    Plug 'wincent/command-t'
    "Plug 'Townk/vim-autoclose'
    "Plug 'balta2ar/deoplete-matcherkey'
    "-------------------------------------------------------------------------
    Plug 'burnettk/vim-angular'
    Plug 'fatih/vim-go'
    Plug 'mileszs/ack.vim'
    Plug 'motemen/git-vim'
    Plug 'nvie/vim-flake8'
    Plug 'jalvesaq/Nvim-R'
    "Plug 'christoomey/vim-tmux-navigator'
    "-------------------------------------------------------------------------
    Plug 'mbbill/undotree'
    Plug 'Shougo/vimfiler.vim'
    Plug 'vim-scripts/SearchComplete'
    Plug 'Shougo/vimshell.vim'
    "-------------------------------------------------------------------------
    Plug 'tpope/vim-dispatch'
        Plug 'Shougo/deoplete.nvim'
        Plug 'nixprime/cpsm'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
          Plug 'zchee/deoplete-clang'
          "Plug 'Shougo/neco-vim'
          "Plug 'zchee/deoplete-jedi'
          "Plug 'zchee/deoplete-zsh'
        let g:deoplete#enable_at_startup = 1
        let g:deoplete#enable_smart_case = 1
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'garbas/vim-snipmate'

    Plug 'ivyl/vim-bling'
    Plug 'brooth/far.vim'
    Plug 'kmnk/vim-unite-giti'
    Plug 'cskeeters/unite-fzf'
    Plug 'tsukkee/unite-tag'
    Plug'SpaceVim/unite-ctags'
    Plug 'Shougo/unite-outline/'
    Plug 'tsukkee/unite-help'

    Plug 'idanarye/vim-vebugger'
    Plug 'davidhalter/jedi-vim'

    Plug 'Shougo/neoyank.vim'
    Plug 'Shougo/neomru.vim'
    Plug 'Shougo/unite.vim' " One plugin to unite them all. Cool utilities
    Plug 'Shougo/echodoc.vim'
    "Generic Programming Support
    Plug 'janko-m/vim-test'
    Plug 'neomake/neomake'
    Plug 'tpope/vim-sleuth'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    "!"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
    Plug 'AndrewRadev/undoquit.vim'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'sonph/onehalf'
    Plug 'vim-scripts/TagHighlight'
    Plug 'aghareza/vim-gitgrep'
    "Plug 'xolox/vim-misc'
    "Plug 'xolox/vim-easytags'
    "Plug 'artur-shaik/vim-javacomplete2'
    Plug 'mantiz/vim-plugin-dirsettings'
    Plug 'ervandew/supertab'
    Plug 'exvim/ex-matchit'
    Plug 'AndrewRadev/switch.vim'
    Plug 'itchyny/calendar.vim'
    Plug 'guns/xterm-color-table.vim'
    Plug 'termhn/i3-vim-nav'
    Plug 'vim-scripts/spreadsheet.vim'
    Plug 'bronson/vim-crosshairs'
    Plug 'fergdev/vim-cursor-hist'
call plug#end()
