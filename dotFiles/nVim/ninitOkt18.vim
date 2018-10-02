"""""""""""""""""""""" nVIM Neo VIM """""""""""""""""""""""""""""""""""""
"------------------------------------------------------------------------
call plug#begin()
        Plug 'roxma/nvim-completion-manager'
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
        Plug 'brooth/far.vim'
        Plug 'neomake/neomake'
        Plug 'thinca/vim-quickrun'
        Plug 'mtth/scratch.vim'

        Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
        Plug 'zchee/deoplete-jedi'
        Plug 'zchee/deoplete-clang'
        Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
        Plug 'duythinht/inori'

        Plug 'rafi/awesome-vim-colorschemes'
        Plug 'tomasr/molokai'
        Plug 'fmoralesc/molokayo'

        Plug 'tpope/vim-eunuch'
        Plug 'rking/ag.vim'
        Plug 'tpope/vim-surround'
            Plug 'Shougo/neocomplete.vim'
            Plug 'Shougo/neosnippet.vim'
            Plug 'Shougo/neosnippet-snippets'
         Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
        Plug 'tpope/vim-fugitive'
        Plug 'airblade/vim-gitgutter'

        Plug 'scrooloose/syntastic'
        Plug 'dhruvasagar/vim-zoom'
        Plug 'jalvesaq/Nvim-R'
        Plug 'Shougo/vimshell.vim'
        Plug 'majutsushi/tagbar'
        Plug 'w0rp/ale'
        Plug '/wincent/command-t'

Plug'uguu-org/vim-matrix-screensaver'
        Plug 'Rykka/trans.vim'
        Plug 'ron89/thesaurus_query.vim'
call plug#end()

"--------------------------------------------------------------------------------
    noremap <F10> :SyntasticCheck<CR>
    "   echo syntastic#util#system('echo "$PATH"')
"--------------------------------------------------------------------------------
    "let g:syntastic_java_checkers = ['checkstyle']
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_java_javac_executable = '~/.vim/plugged/syntastic/syntax_checkers/java/javac.vim'
    let g:systastic_python_checkers = ['pylint', 'python']
    let g:syntastic_mode_map = {'mode': 'active'}
    let g:syntastic_python_pylint_quiet_messages = {}
    let g:syntastic_auto_jump = 1
    let g:syntastic_echo_current_error  = 1
    let g:syntastic_javascript_checkers=['jshint']
    let g:syntastic_php_checkers=['php']
    let g:syntastic_css_checkers=['csslint']
    let g:syntastic_check_on_w = 1
    let g:syntastic_python_checkers = ['pylint']
    let g:syntastic_always_populate_loc_list = 1
    "let g:syntastic_quiet_messages = { "type": "style" }
    let g:syntastic_enable_highlighting=0
    let g:syntastic_enable_signs=1
    highlight SyntasticErrorLine guibg=#550000
    highlight SyntasticWarningLine guibg=#331d1e
    let mapleader = ','
    let maplocalleader = '_'
    let leader = '\'

    syntax enable
    set nocompatible  " We don't want vi compatibility.
"AAA-----------------------------------------------------
let g:quickrun_known_file_types = {
        \"cpp": ["!g++ %", "./a.out"],
        \"c": ["!gcc %", "./a.out"],
        \"php": ["!php %"],
        \"vim": ["source %"],
        \"py": ["!python %"],
    \}

"AAA-----------------------------------------------------
    highlight SignColumn guibg=darkgrey
    highlight GitGutterAdd ctermfg=green
    highlight GitGutterChange ctermfg=yellow
    highlight GitGutterDelete ctermfg=red
    highlight GitGutterChangeDelete ctermfg=yellow

    nmap ]c <Plug>GitGutterNextHunk
    nmap [c <Plug>GitGutterPrevHunk
    nmap <Leader>hs <Plug>GitGutterStageHunk
    nmap <Leader>hu <Plug>GitGutterUndoHunk
"BBB-----------------------------------------------------
"=    imap <C-b>     <Plug>(neosnippet_expand_or_jump)
"=    smap <C-b>     <Plug>(neosnippet_expand_or_jump)
"=    xmap <C-b>     <Plug>(neosnippet_expand_target)
"BBB-----------------------------------------------------
    if !exists('g:ycm_semantic_triggers')
      let g:ycm_semantic_triggers = {}
    endif
    let g:EclimCompletionMethod = 'omnifunc'
    let g:ycm_key_list_select_completion=[]
    let g:ycm_key_list_previous_completion=[]
    let g:ycm_key_invoke_completion = '<C-b>'
    " let g:UltiSnipsExpandTrigger="<C-l>"
"AAA-----------------------------------------------------
"=    let g:UltiSnipsSnippetsDir='~/.vim/plugged/ultisnips/'
"=    let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/ultisnips/', 'UltiSnips']
"AAA-----------------------------------------------------
    let g:UltiSnipsExpandTrigger="<c-l>"
    let g:UltiSnipsJumpForwardTrigger="<c-l>"
    let g:UltiSnipsJumpBackwardTrigger="<c-m>"
    "let g:UltiSnipsEditSplit="vertical"
"AAA-----------------------------------------------------
    set wmh=0
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-H> <C-W>h<C-W>|
    map <C-L> <C-W>l<C-W>|
    map <C-=> <C-W>=
"AAA-----------------------------------------------------
    set nu
    set cf  " Enable error files & error jumping.
    set clipboard+=unnamed  
    set history=2024  
    set autowrite  " Writes on make/shell commands
    set ruler
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=80
    set smarttab
    set expandtab
    set smartindent
    set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
    set guifont=Monospace\ 14
    set cinwords=if,else,while,do,for,switch,case
"AAA-----------------------------------------------------
    " Minibuffer Explorer Settings
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMapWindowNavArrows = 1
    let g:miniBufExplMapCTabSwitchBufs = 1
    let g:miniBufExplModSelTarget = 1
    " alt+n or alt+p to navigate between entries in QuickFix 
    set mat=5  " Bracket blinking.
    set visualbell
    set laststatus=2  " Always show status line.
    set mouse=a  " Mouse in all modes
    set nobackup  
"AAA-----------------------------------------------------
    syntax on
    colorscheme blue
    colorscheme desert
    colorscheme ron
    colorscheme darkblue
    colorscheme delek
    syntax enable
    colorscheme darkblue
    colorscheme molokayo
"AAA-----------------------------------------------------
    hi Comment ctermfg=DarkGrey guifg=Grey
    hi statusline guibg=Orange guifg=#0000AA
    hi Search guibg=Orange
    hi statusline guibg=green
"AAA-----------------------------------------------------
    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set cindent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
""-------------------------------------------------------
    set cursorline
    highlight CursorLine cterm=bold term=bold guibg=Black ctermbg=Black
    set cursorline

""-------------------------------------------------------
    hi statusline guibg=White guifg=DarkBlue
    hi statusline ctermbg=White ctermfg=DarkBlue
    hi StatusLine                  ctermfg=5     ctermbg=4     cterm=NONE
    hi StatusLineNC                ctermfg=6     ctermbg=3     cterm=NONE
    hi statusline ctermfg=White
    hi StatusLine cterm=bold
    hi statuslineNC ctermfg=White
""-------------------------------------------------------
    set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
"-------------------------------------------------------------------------------
" expansion 
" enlargement
"-------------------------------------------------------------------------------
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ neocomplete#start_manual_complete()
inoremap <S-TAB> <C-p>
"-------------------------------------------------------------------------------

inoremap <silent> <C-]> <C-x><C-]>
inoremap <silent> <C-o> <C-x><C-o>
inoremap <silent> <C-k> <C-x><C-k>
inoremap <silent> <C-d> <C-x><C-d>
inoremap <silent> <C-u> <C-x><C-u>
inoremap <silent> <C-f> <C-x><C-f>
inoremap <silent> <C-l> <C-x><C-l>

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
"- let g:neocomplete#sources#dictionary#dictionaries = {
"-             \ 'default' : '',
"-             \ 'vimshell' :CACHE.'/vimshell/command-history',
"-             \ 'java' : '~/.vim/dict/java.dict,~/.vim/dict/ruby.dict',
"-             \ }
"-------------------------------------------------------------------------------
let g:tq_mthesaur_file="~/git/aTest/redVim/dikt/mthesaur.txt"
"--------------------------------------------HHH--------------------------------
set thesaurus=mthesaur.txt
let s:thesaurus_pat = "~/git/aTest/redVim/dikt/.txt"

imap <c-s> <plug>(fzf-complete-line)
imap <c-s> <plug>(fzf-complete-line)


command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
      \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))


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
