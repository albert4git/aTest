
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
" ln -s /usr/etc/vim_settings/vimrc /home/user/.vimrc
" ln -s /usr/etc/vim_settings/vim /home/user/.vim
"--------------------------------------------------------------------------------
" Typing: ci', ci", or ci)
"---------------------------GVIM-------------------------------------------------
call plug#begin('~/.vim/plugged')
    "Plug 'junegunn/seoul256.vim'
    "Plug 'bkad/CamelCaseMotion'
    Plug 'tpope/vim-sensible'
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
    "Plug 'wincent/loupe'
    "Plug 'vim-scripts/ReplaceWithRegister'
    "Plug 'ludovicchabant/vim-gutentags'
    "Plug 'scrooloose/nerdtree'
    "-------------------------------------------------------------------------
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-abolish'         " Extended abbreviation/substition.
    Plug 'tpope/vim-repeat'          " Intelligent repeat with '.'
    Plug 'tpope/vim-surround'        " Work with pairs of quotes/anything.
    Plug 'tpope/vim-unimpaired'      " Handy bracket mappings.
    Plug 'tpope/vim-sleuth'          " indet reight ?
    Plug 'tpope/vim-eunuch'
    "-------------------------------------------------------------------------
    Plug 'burnettk/vim-angular'
    "Plug 'fatih/vim-go'
    "Plug 'christoomey/vim-tmux-navigator'
    Plug 'mileszs/ack.vim'
    Plug 'motemen/git-vim'
    Plug 'nvie/vim-flake8'
    Plug 'jalvesaq/Nvim-R'
    "-------------------------------------------------------------------------
    Plug 'mbbill/undotree'
    Plug 'Shougo/vimfiler.vim'
    "Plug 'vim-scripts/SearchComplete'
    "Plug 'Shougo/vimshell.vim'
    "-------------------------------------------------------------------------
    "Plug 'tpope/vim-dispatch'
        Plug 'Shougo/deoplete.nvim'
        Plug 'nixprime/cpsm'
        Plug 'balta2ar/deoplete-matcherkey'
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
    "Plug 'Shougo/unite.vim' " One plugin to unite them all. Cool utilities
    "Plug 'Shougo/echodoc.vim'
    "Generic Programming Support
    "Plug 'Townk/vim-autoclose'
    "Plug 'janko-m/vim-test'
    "Plug 'neomake/neomake'
    Plug 'tpope/vim-sleuth'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
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

        set so=5
        nnoremap n nzz
        set nowrapscan
        set wrapscan
        "-------------------------------AAA---------------------------------------------
        au BufRead * normal zR
        "-------------------------------------------------------------------------------
        set cmdheight=2
        "-------------------------------------------------------------------------------
        set  t_Co=256
        set showcmd
        let leader = '\'
        let mapleader=","
        let maplocalleader = '_'
        set runtimepath+=~/.vim/plugged/vimproc/
        noremap <silent><leader>lc :lcl<CR>
        noremap <silent><leader>lo :lw<CR>
        "-------------------------------------------------------------------------------
        filetype on
        filetype plugin on
        filetype indent on
        syntax on
        "set backup
        "set backupdir=~/.vim/backup
        set nobackup
        set nowritebackup
        "-------------------------------------------------------------------------------
        set wildignore=*.swp,*.swo,*.bak,*.pyc,*.class
        set noswapfile
        "set nobackup
        "set nowritebackup
        "set wrapscan
        "set spell
        "-------------------------------BBB---------------------------------------------
        set nu
        set title
        colorscheme blue
        colorscheme darkblue
        colorscheme desert
        colorscheme delek
        colorscheme peachpuff
        colorscheme Benokai
        set nowrapscan
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
        set textwidth=80
        set smarttab
        set expandtab
        set mouse=a
        "-------------------------------------------------------------------------------
        set nocompatible
        "-------------------------------------------------------------------------------
        """"set backspace=indent,eol,start              " Backspace for dummies
        """"set wildmode=list:longest,full              " Command <Tab> completion, list matches
        """"set showmatch                               " Show matching brackets/parenthesis
        set linespace=0                                 " No extra spaces between rows
        set incsearch                                   " Find as you type search
        set winminheight=0                              " Windows can be 0 line high
        set ignorecase                                  " Case insensitive search
        set smartcase                                   " Case sensitive when uc present
        set wildmenu                                    " Show list instead of just completing
        set whichwrap=b,s,h,l,<,>,[,]                   " Backspace and cursor keys wrap too
        set scrolloff=3                                 " Minimum lines to keep above and below cursor
        set foldenable                                  " Auto fold code
        set list                                        "list?
        set matchpairs+=<:>                             " Match, to be used with %
        set listchars=tab:›\ ,trail:•,extends:#,nbsp:.  " Highlight problematic whitespace
        "-------------------------------CCC---------------------------------------------
        set visualbell
        set laststatus=2
        "-------------------------------------------------------------------------------
        set nowrap                           " Do not wrap long lines
        set cindent                          " cindent
        set nojoinspaces                     " Prevents inserting two spaces punctuation
        set splitright                       " Puts new vsplit windows to the right
        set splitbelow                       " Puts new split windows to the bottom
        "-------------------------------------------------------------------------------
        set gfn=Lucida_Sans_Typewriter:h14:cANSI
        set guifont=Monospace\ Bold\ 18
        "-------------------------------------------------------------------------------
        if has("clipboard")
            set clipboard=unnamed " copy to the system clipboard
            if has("unnamedplus") " X11 support
                set clipboard+=unnamedplus
            endif
        endif
        "-------------------------------------------------------------------------------
        let g:miniBufExplMapWindowNavVim = 1
        let g:miniBufExplMapWindowNavArrows = 1
        let g:miniBufExplMapCTabSwitchBufs = 1
        let g:miniBufExplModSelTarget = 1
        "-------------------------------------------------------------------------------
        set timeoutlen=250             " Time to wait after ESC (default annoying)
        set cf                         " Enable error files & error jumping.
        set autowrite                  " Writes on make/shell commands
        set clipboard+=unnamed
        set history=2024
        set noruler
        set smartindent
        set autoindent
        set cinoptions=N-s,g0,+2s,l-s,i2s
        set gfn=Lucida_Sans_Typewriter:h14:cANSI
        set guifont=Monospace\ Bold\ 18
        set hidden
        set hlsearch
        hi Search ctermbg=yellow
        hi Search ctermfg=Red
        "--------------------------------DDD--------------------------------------------
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undo
            set undoreload=10000        " Maximum number lines to save for undo on
        endif
        "-------------------------------------------------------------------------------
        hi StatusLine         ctermfg=5     ctermbg=4     cterm=NONE
        hi StatusLineNC       ctermfg=6     ctermbg=3     cterm=NONE
        hi statusline ctermfg=White
        hi statuslineNC guifg=White
        hi StatusLine cterm=bold
        "-------------------------------------------------------------------------------
        let wordUnderCursor = expand("<cword>")
        let currentLine   = getline(".")
        "-------------------------------------------------------------------------------
        set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %P%*
        "set statusline+=%{gutentags#statusline()}
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        "-------------------------------------------------------------------------------
        highlight Pmenu ctermbg=208 gui=bold
        highlight Pmenu guibg=brown gui=bold
        "-------------------------------------------------------------------------------
        "--XXX--------ToDO--------------------EEE---------------------------------------
        source ~/git/aTest/2run/vim-deopleteA.vim
        "source ~/git/aTest/2run/vim-neo-omni.vim
        "source ~/git/aTest/2run/vim-2syntastic.vim
        "source ~/git/aTest/2run/vim-make.vim
        "source ~/git/aTest/2run/vim-autocmd.vim
        source ~/git/aTest/2run/vim-maps.vim
        source ~/git/aTest/2run/vim-2optic.vim
        source ~/git/aTest/2run/vim-searchA.vim
        source ~/git/aTest/2run/vim-abbr.vim

        "-------------------------------------------------------------------------------
        "-------------------------------------------------------------------------------
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ neocomplete#start_manual_complete()
        inoremap <S-TAB> <C-p>
        "-------------------------------------------------------------------------------
        " expansion
        "-------------------------------------------------------------------------------
        inoremap <silent> <C-]> <C-x><C-]>
        inoremap <silent> <C-o> <C-x><C-o>
        inoremap <silent> <C-k> <C-x><C-k>
        inoremap <silent> <C-d> <C-x><C-d>
        inoremap <silent> <C-u> <C-x><C-u>
        inoremap <silent> <C-f> <C-x><C-f>
        inoremap <silent> <C-l> <C-x><C-l>

        "-----XXX-------ToDO--------------------FFF-------------------------------------
        "= 1. Whole lines                                          i_CTRL-X_CTRL-L
        "= 2. keywords in the current file                         i_CTRL-X_CTRL-N
        "= 3. keywords in 'dictionary'                             i_CTRL-X_CTRL-K
        "= 4. keywords in 'thesaurus', thesaurus-style             i_CTRL-X_CTRL-T
        "= 5. keywords in the current and included files           i_CTRL-X_CTRL-I
        "= 6. tags                                                 i_CTRL-X_CTRL-]
        "= 7. file names                                           i_CTRL-X_CTRL-F
        "= 8. definitions or macros                                i_CTRL-X_CTRL-D
        "= 9. Vim command-line                                     i_CTRL-X_CTRL-V
        "= 10. User defined completion                             i_CTRL-X_CTRL-U
        "= 11. omni completion                                     i_CTRL-X_CTRL-O
        "= 12. Spelling suggestions                                i_CTRL-X_s
        "= 13. keywords in 'complete'                              i_CTRL-N
        "-------------------------------------------------------------------------------
        let g:UltiSnipsSnippetsDir='~/.vim/plugged/ultisnips/'
        let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/ultisnips/', 'UltiSnips']
        let g:UltiSnipsExpandTrigger="<c-l>"
        let g:UltiSnipsJumpForwardTrigger="<c-l>"
        let g:UltiSnipsJumpBackwardTrigger="<c-m>"
        "let g:UltiSnipsEditSplit="vertical"

        " circular windows navigation
        nnoremap <Tab>   <c-W>w
        nnoremap <S-Tab> <c-W>W
        " jump list
        nnoremap <C-j> <C-i>
        nnoremap <C-k> <C-o>
        "-------------------------------------------------------------------------------
        imap <C-b>     <Plug>(neosnippet_expand_or_jump)
        smap <C-b>     <Plug>(neosnippet_expand_or_jump)
        xmap <C-b>     <Plug>(neosnippet_expand_target)
        "-------------------------------------------------------------------------------
        "-------------------------------------------GGG---------------------------------
        "-------------------------------------------------------------------------------
        set wmh=0
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-H> <C-W>h<C-W>|
        map <C-L> <C-W>l<C-W>|
        map <C-=> <C-W>=
        "-------------------------------------------------------------------------------
        filetype plugin on
        set omnifunc=syntaxcomplete#Complete
        set complete=.,w,b,u,t,k
        "-------------------------------------------------------------------------------
        if !exists('g:neocomplete#sources#omni#input_patterns')
            let g:neocomplete#sources#omni#input_patterns = {}
        endif
        "-------------------------------------------------------------------------------
        if !exists('g:neocomplete#force_omni_input_patterns')
            let g:neocomplete#force_omni_input_patterns = {}
        endif
        "-------------------------------------------------------------------------------
        set dictionary+=~/git/aTest/redVim/dikt/english-words.txt
        let g:neocomplete#sources#dictionary#dictionaries = {
                    \ 'default' : '',
                    \ 'vimshell' :CACHE.'/vimshell/command-history',
                    \ 'java' : '~/.vim/dict/java.dict,~/.vim/dict/ruby.dict',
                    \ }
        "-------------------------------------------------------------------------------
        let g:tq_mthesaur_file="~/git/aTest/redVim/dikt/mthesaur.txt"
        "--------------------------------------------HHH--------------------------------
        set thesaurus=mthesaur.txt
        let s:thesaurus_pat = "~/git/aTest/redVim/dikt/.txt"

        imap <c-s> <plug>(fzf-complete-line)
        imap <c-s> <plug>(fzf-complete-line)


        command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
            \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))

