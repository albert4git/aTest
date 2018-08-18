"--------------------------------------------------------------------------------
" Typing: ci', ci", or ci)
"---------------------------GVIM-------------------------------------------------
call plug#begin('~/.vim/plugged')
    "Plug 'junegunn/seoul256.vim'
    "Plug 'bkad/CamelCaseMotion'
    "Plug 'tpope/vim-sensible'
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
    Plug 'majutsushi/tagbar'
    Plug 'dhruvasagar/vim-zoom'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'ludovicchabant/vim-gutentags'
    "Plug 'scrooloose/nerdtree'
    "Plug 'wincent/loupe'
    "-------------------------------------------------------------------------
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-abolish'         " Extended abbreviation/substition.
    Plug 'tpope/vim-repeat'          " Intelligent repeat with '.'
    "Plug 'Townk/vim-autoclose'
    "Plug 'tpope/vim-surround'       " Work with pairs of quotes/anything.
    "Plug 'tpope/vim-unimpaired'     " Handy bracket mappings.
    "Plug 'balta2ar/deoplete-matcherkey'
    Plug 'tpope/vim-sleuth'          " indet reight ?
    Plug 'tpope/vim-eunuch'
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
    "Plug 'vim-scripts/SearchComplete'
    "Plug 'Shougo/vimshell.vim'
    "-------------------------------------------------------------------------
    "Plug 'tpope/vim-dispatch'
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
    Plug 'Shougo/unite.vim' " One plugin to unite them all. Cool utilities
    Plug 'Shougo/echodoc.vim'
    "Generic Programming Support 
    "Plug 'janko-m/vim-test'
    "Plug 'neomake/neomake'
    Plug 'tpope/vim-sleuth'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

    Plug 'AndrewRadev/undoquit.vim'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    "Plug 'sonph/onehalf'
    "Plug 'vim-scripts/matrix.vim'
    "-Plug 'uguu-org/vim-matrix-screensaver'
    "Plug 'artur-shaik/vim-javacomplete2'
call plug#end()

"========================================================================
" let g:ycm_semantic_triggers.tex = [
"       \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
"       \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
"       \ 're!\\hyperref\[[^]]*',
"       \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
"       \ 're!\\(include(only)?|input){[^}]*'
"       \ ]
"========================================================================
" if !exists('g:ycm_semantic_triggers')
"   let g:ycm_semantic_triggers = {}
" endif
" let g:EclimCompletionMethod = 'omnifunc'
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]
" let g:ycm_key_invoke_completion = '<C-a>'
"========================================================================
