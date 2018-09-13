" FUNCTIONS
function! ToggleSpell()
  if &spell
    if &spelllang == "pt"
      set spelllang=pt,en
      echo "toggle spell" &spelllang
    elseif &spelllang == "pt,en"
      set spelllang=en
      echo "toggle spell" &spelllang
    else
      set spell!
      echo "toggle spell off"
    endif
  else
    set spelllang=pt
    set spell!
    echo "toggle spell" &spelllang
  endif
endfunction
" Toggle spell check
nmap <silent>ts :call ToggleSpell()<CR>

" Convert variable case
function! TwistCase(str)
  if a:str =~# '^[a-z0-9_]\+[!?]\?$'
    let result = substitute(a:str, '_', '-', 'g')
  elseif a:str =~# '^[a-z0-9?!-]\+[!?]\?$'
    let result = substitute(a:str, '\C-\([^-]\)', '\u\1', 'g')
  elseif a:str =~# '^[a-z0-9]\+\([A-Z][a-z0-9]*\)\+[!?]\?$'
    let result = toupper(a:str[0]) . strpart(a:str, 1)
  elseif a:str =~# '^\([A-Z][a-z0-9]*\)\{2,}[!?]\?$'
    let result = strpart(substitute(a:str, '\C\([A-Z]\)', '_\l\1', 'g'), 1)
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vmap ^ ygv"=TwistCase(@")<CR>Pgv

function! MyFoldText()
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
  return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction

fun! ToggleFold()
  if &foldmethod == 'marker'
    exe 'set foldmethod=indent'
  else
    exe 'set foldmethod=marker'
  endif
endfun
map <silent>tf :call ToggleFold()<cr>

function! StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

function! Clipboard()
    reg
    echo "Register: "
    let char = nr2char(getchar())
    if char != "\<Esc>"
        execute "normal! \"".char."p"
    endif
    redraw
endfunction
command! -nargs=0 Clipboard call Clipboard()
nmap <silent>C :call Clipboard()<cr>

" Enable the auto-creation of missing folders in a save path
if !exists('*s:MakeNewDir')
  function s:MakeNewDir(fullpath, buf)
    if empty(getbufvar(a:buf,'&buftype')) && a:fullpath!~#'\v^\w+\:\/'
      let dirpath=fnamemodify(a:fullpath,':h')
      if !isdirectory(dirpath)|call mkdir(dirpath,'p')|endif
    endif
  endfunction
  augroup WriteDir
    autocmd!
    autocmd BufWritePre * :call s:MakeNewDir(expand('<afile>'),+expand('<abuf>'))
  augroup END
endif
 "SETTINGS
" General
set title                          " change the terminal's title
set history=1000                   " keep 100 lines of command line history
set autoread                       " Set to auto read when a file is changed from the outside
set autowrite                      " Auto save before commands like next and make
set backspace=2                    " make backspace work normal
set diffopt=foldcolumn:0,filler    " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite                " Ignore whitespace changes (focus on code changes)
set gdefault                       " regex /g by default
set hid                            " you can change buffers without saving
set nostartofline                  " don't jump to first character when paging
set printoptions=paper:a4,syntax:n " controls the default paper size and the printing of syntax highlighting (:n -> none)
set report=0                       " tell us when anything is changed via :...0
set switchbuf=useopen              " reveal already opened files from the quickfix window instead of opening new buffers
set ttyfast                        " smoother changes
set viminfo='20,\"80               " read/write a .viminfo file, don't store more
set virtualedit=onemore            " Allow for cursor beyond last character
" set shortmess+=filmnrxoOtT         " Abbrev. of messages (avoids 'hit enter')
set cursorline
set viewoptions=cursor,folds,slash,unix
" vertical/horizontal scroll off settings
if !&scrolloff
  set scrolloff=7
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

" No bell or flash wanted
set novisualbell " No blinking
set noerrorbells " No noise.
set vb t_vb=     " disable any beeps or flashes on error

" Use the '*' register as well as the the '+' register if it's available too
set clipboard=unnamed
if has('unnamedplus')|set clipboard+=unnamedplus|endif

" Configure to primarily use utf8
if has("multi_byte")
  if &termencoding == ""|let &termencoding = &encoding|endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
endif
set fileformats=unix,dos,mac "set compatible line endings in order of preference

" Enable mouse
if has("mouse")
  set mouse=a
  set mousehide
  set mousemodel=popup
  if !has('nvim')
    set ttymouse=xterm2
  endif
endif

" Editor Settings
set cmdheight=1          " the command bar is 1 high
set equalalways          " Close a split window in Vim without resizing other windows
set guitablabel=%t
set laststatus=2         " always show statusline
set lazyredraw           " do not redraw while running macros (much faster) (Lazy Redraw)
set linespace=0          " space it out a little more (easier to read)
set number               " turn on line numbers
set showmode             " If in Insert, Replace or Visual mode put a message on the last line.
set ttimeout
set ttimeoutlen=100

" wildmode
set complete-=i
set completeopt-=preview
set wildmenu           " nice tab-completion on the command line
set wildchar=9         " tab as completion character
set wildmode=longest:full,list:full
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Suffixes that get lower priority when doing tab completion for filenames
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pdf,.exe

" chars to show for list
"" chars to show for list
set listchars=tab:▸\ ,eol:¬,trail:⋅

" Appearance Settings
" switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || GUI()
  syntax enable
endif
" default colorscheme
set background=dark
if GUI()
  set t_Co=256
  "colorscheme badwolf
  colorscheme gruvbox
  " Access colors present in 256 colorspace
  let base16colorspace=256
  "colorscheme base16-monokai
  "colorscheme base16-eighties
  " color fixes
  hi Comment ctermfg=bg ctermbg=240
  hi Comment guifg=#585858 guibg=bg
elseif &t_Co >= 256
  colorscheme gruvbox
  hi Comment ctermfg=bg ctermbg=240
  hi Comment guifg=#585858 guibg=bg
else
  colorscheme gruvbox
  set t_Co=8
  set t_Sf=^[[3%p1%dm
  set t_Sb=^[[4%p1%dm
endif

" GUI options
if GUI()
  set guicursor=a:blinkon0 " cursor-blinking off!!
  set guioptions=ac
  set guioptions+=p " enable pointer callbacks for X11 (required by some WMs)
  set guioptions+=h " prevent the cursor jumping to the longest line while scrolling
  set winaltkeys=no " don't select the menu when pressing the alt-keys
  " Linux
  if WINDOWS()
    set gfn=DejaVu_Sans_Mono_for_Powerline:h10
  elseif OSX()
    set gfn=Liberation_Mono_for_Powerline:h13
  else
    set gfn=Roboto\ Mono\ Medium\ 13
  endif
  nmap <F8> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
endif

" Language Settings
" Highlight problematic whitespace (spaces before tabs)
highlight SpellBad term=underline gui=undercurl guisp=Orange
" highlight clear SignColumn " SignColumn should match background
" highlight clear LineNr " Current line number row will have same background color in relative mode

" Files, backups and undo
" Turn backup off, since most stuff are in git anyway...
set nobackup
set nowb
set noswapfile
" enable persistent undo
if has('persistent_undo')
  set undodir=$HOME/.vim/.undofile
  set undofile
  set undolevels=1000  " maximum number of changes that can be undone
  set undoreload=10000 " maximum number lines to save for undo on a buffer reload
  if ! isdirectory(&undodir)
    call mkdir(&undodir, 'p')
  endif
endif

" Wrap
set display=lastline         " don't display @ with long paragraphs
" set formatoptions=tcroql     " t=text, c=comments, q=format with gq command, o,r=autoinsert comment leader
set formatoptions=roqnl12    " How automatic formatting is to be done
set lbr                      " line break
set nojoinspaces             " Prevents inserting two spaces after punctuation on a join (J)
set nowrap                   " word wrap
set splitbelow               " Puts new split windows to the bottom of the current
set splitright               " Puts new vsplit windows to the right of the current
set textwidth=0
set wrapscan                 " Searches wrap around end of file
let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines

" Text, tab and indent related
set autoindent    " Keep the indent when creating a new line
set copyindent    " Copy the previous indentation on autoindent
set smartindent
set expandtab     " Spaces instead of tabs for better cross-editor compatibility
set shiftwidth=2  " Number of spaces to use in each autoindent step
set smarttab      " Use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set softtabstop=2 " Number of spaces to skip or insert when <BS>ing or <Tab>ing
set tabstop=2     " Two tab spaces

" Search
"set hlsearch        " highlight all matches...
set ignorecase      " select case-insenitiv search
set incsearch       " ...and also during entering the pattern
set magic           " change the way backslashes are used in search patterns
set matchpairs+=<:> " these tokens belong together
set matchtime=2     " How many tenths of a second to blink
set showmatch       " jump to matches during entering the pattern
set smartcase       " No ignorecase if Uppercase chars in search
nohlsearch          " avoid highlighting when reloading vimrc

" Folding
set foldenable            " enable folding
set foldcolumn=1
set foldlevel=1           " start out with everything folded
set foldmethod=syntax     " detect triple-{ style fold markers
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldtext=MyFoldText() " Which command trigger auto-unfold

" Session
set sessionoptions=buffers,curdir,folds,tabpages,winsize
let s:sessiondir  = expand("~/.vim/sessions", 1)
let s:sessionfile = expand(s:sessiondir . "/session.vim", 1)
let s:sessionlock = expand(s:sessiondir . "/session.lock", 1)

" KEYMAPPINGS
"DISABLED DEFAULT MAPPING: UNSET SHORTCUTS {{{
" Unmapping help from F1 and Ctrl-F1 for use toggling the reference manual
" the :h topic feature works, and <leader><F1> displays quickref
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>
"unmap the suspend function
map <C-z> <Nop>
"}}}


" Set mapleader
let g:mapleader=","

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" spacebar create/open/close folding
nmap <silent> <Space> za
vmap <silent> <Space> zf

" enable/disable list
nmap <silent> <C-l> :set nolist!<CR>

" Map escape key to jj or <leader>e
imap jj <ESC>

"" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Move visual block
vnoremap <c-J> :m '>+1<CR>gv=gv
vnoremap <c-K> :m '<-2<CR>gv=gv

" Spell commands
nmap ?n ]s
nmap ?p [s
nmap ?+ zg
nmap ?? z=

" Make Y consistent with C and D
nnoremap Y y$

" jump to start/end of line
noremap H ^
noremap L

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Keep search pattern at the center of the screen
nmap <silent> n nzz
nmap <silent> N Nzz
nmap <silent> * *zz
nmap <silent> # #zz
nmap <silent> g* g*zz
nmap <silent> g# g#zz

" Circular windows navigation
nmap <C-j> <c-w>w
nmap <C-k> <c-w>W

" Circular windows navigation
nnoremap <silent> <C-w>1 :only<CR>
nnoremap <silent> <C-w>2 :only<CR> <C-w>v
nnoremap <silent> <C-w>3 :only<CR> <C-w>v<C-w>s
nnoremap <silent> <C-w>4 :only<CR> <C-w>v<C-w>s<C-w>h<C-w>s

" switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" set text wrapping toggles
nmap <silent> tw :set invwrap<cr>:set wrap?<cr>

" Underline the current line with '-'
nmap <silent> <leader>ul :t.<CR>Vr-
