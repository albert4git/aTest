
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
    " alt+n or alt+p to navigate between entries in QuickFix 
    set mat=5  " Bracket blinking.
    set visualbell
    set laststatus=2  " Always show status line.
    set mouse=a  " Mouse in all modes
    set nobackup  
"AAA-----------------------------------------------------
    syntax on
    colorscheme desert
    colorscheme ron
    colorscheme delek
    syntax enable
    colorscheme darkblue
    colorscheme molokayo
    colorscheme anderson
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

