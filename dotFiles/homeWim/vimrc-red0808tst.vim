" ln -s /usr/etc/vim_settings/vimrc /home/user/.vimrc
" ln -s /usr/etc/vim_settings/vim /home/user/.vim
"------------------------------------------------
" export VIMINIT="source ~/.vim/vimrc"
" echo ($VIMRUNTIME)
" echo ($MYVIMRC)
"------------------------------------------------
" set viminfo+=n~/.vim/viminfo
" set runtimepath=/home/b/.vim,$VIMRUNTIME
" letVIMHOME =HOME."/.vim"
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
"-------------------------------------------------------------------------------
set nocompatible        " Must be first line
set runtimepath+=~/.vim/plugged/vimproc/
let mapleader=","
let maplocalleader = "\\"
highlight Cursor ctermbg=Green
" Vimscript file settings za ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
"-------------------------------------------------------------------------------
nmap <Leader>m [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
nmap <LocalLeader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
"-------------------------------------------------------------------------------
nnoremap <leader>g :grep -R <cword> .<cr>
nnoremap <leader>l :lgrep -R <cword> .<cr>
nnoremap <leader><leader> :Ag <cword> .<cr>
"-------------------------------------------------------------------------------
" map <F4> :execute "grep " . expand("<cword>") . "/j **" <Bar> cw<CR>
" colorscheme colorful256
"-------------------------------------------------------------------------------
syn match DoubleSpace " "
"-------------------------------------------------------------------------------
hi def DoubleSpace ctermbg=Gray 
" utomatically delete whitespace, trailing dos returns
autocmd BufRead * silent! %s/[\r \t]\+\$//
" change to directory of current file automatically
autocmd BufEnter * lcd %:p:h
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
"-------------------------------------------------------------------------------
vmap sb "zdi"<C-R>z"<ESC>
vmap st "zdi( <C-R>z )<ESC>
"-------------------------------------------------------------------------------
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
" Visual shifting (does not exit Visual mode)
vnoremap > >gv
" Format Paragraph -------------------------------------------------------------
map <f3> gqap
" Format File ------------------------------------------------------------------
map <f4> ggVGgq
"-------------------------------------------------------------------------------
" map <F2> msHmtgg/Last [cC]hange:\s*/e+1<CR>"_D"=strftime("%Y %b %d")<CR>p'tzt`s
"-------------------------------------------------------------------------------
inoremap <C-J> <C-X><C-E>
inoremap <C-K> <C-X><C-Y>

" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
set mat=2 " How many tenths of a second to blink when matching brackets
set foldcolumn=1 " Add a bit extra margin to the left
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FILES, BACKUPS AND UNDO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
""""""""""""""""""""""""""""""
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Remap VIM 0 to first non-blank character
map 0 ^
" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"-------------------------------------------------------------------------------
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
"-------------------------------------------------------------------------------


source ~/vim-plug.vim
source ~/vim-preSet.vim
source ~/vim-deopleteA.vim
"source ~/vim-neo-omni.vim
"source ~/vim-2syntastic.vim
"source ~/vim-make.vim
"source ~/vim-autocmd.vim
source ~/vim-maps.vim
source ~/vim-2optic.vim
source ~/vim-searchA.vim
source ~/vim-abbr.vim
source ~/vim-postSet.vim


function! s:vimscript()
    setlocal tabstop=2 " number of space for tab
    setlocal shiftwidth=2 " width of auto indent
    setlocal expandtab
endfunction

augroup vimrc-vimscript
    autocmd!
    autocmd FileType vim call s:vimscript()
augroup END

"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=2
nnoremap j gj
nnoremap k gk
nnoremap Y y$
set cursorline " highlight current line
highlight Cursor ctermbg=Cyan
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
" Always show the status line
set laststatus=2
" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set gfn=IBM\ Plex\ Mono:h16,:Hack\ 16,Source\ Code\ Pro\ 14,Bitstream\ Vera\ Sans\ Mono\ 14
" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
"colorscheme peaksea
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map auto complete of (, ", ', [
inoremap1 ()<esc>i
inoremap2 []<esc>i
inoremap3 {}<esc>i
inoremap4 {<esc>o}<esc>O
"inoremapq ''<esc>i
"inoremape ""<esc>i

"q is super useful when browsing on the command line
" it deletes everything until the last slash 
" cnoq <C-\>eDeleteTillSlash()<cr> "not an edittor command cnoq

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"cnoh e ~/
"cnod e ~/Desktop/
"cnoj e ./
"cnoc e <C-\>eCurrentFileDir("e")<cr>

nnoremap gF <C-W>gf

set tags=./tags;/
sign define fixme text=!? linehl=Todo
hi SignColumn ctermbg = Red

function! SignFixme()
    execute(":sign place ".line(".")." line=".line(".")." name=fixme file=".expand("%:p"))
endfunction
map <F3> :call SignFixme()<CR>

function! SignLines() range
    let n = a:firstline
    execute(":sign define fixme text=!! texthl=Todo")
    while n <= a:lastline
        if getline(n) =~ '\(TODO\|FIXME\)'
            execute(":sign place ".n." line=".n." name=fixme file=".expand("%:p"))
        endif
        let n = n + 1
    endwhile
endfunction
map <F6> :call SignLines()<CR>

set guioptions-=mTrlb
"amenu Help.usr_08.txt
"amenu Help.-SEP- :
5amenu First.first :echo 'first'<cr>

"set grepprg=ack
"set grepformat=%f:%l:%m
"set keywordprg=man, ri, perldoc, <== K, 7K ??
set nolinebreak
nmap Q gqap

"colorscheme dracula
colorscheme vividchalk



"highlight CursorLine guibg=White ctermbg=DarkBlue
"-------------------------------------------------------------------------------
""highlight CursorLine guibg=White ctermbg=Cyan
""highlight CursorLine guibg=White ctermbg=DarkBlue
""highlight CursorLine guibg=White ctermbg=Brown
""highlight CursorLine guibg=White ctermbg=magenta
""highlight CursorLine guibg=White ctermbg=Black
""highlight Cursor ctermfg=Cyan
"-------------------------------------------------------------------------------
