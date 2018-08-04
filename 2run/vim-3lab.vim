echo "Hello, world!"
echom "Hello again, world!"
messages
imap <c-d> <esc>dd
imap <c-d> <esc>ddi

map <space> viw
map <c-d> dd
map <space> viw " Select word

nnoremap -d dd
nnoremap -c ddO
""""""""""""""""""""""""""""""""""
let mapleader = ","

echo mapleader 
echo leader 

let maplocalleader = "\\"
echo localleader

""""""""""""""""""""""""""""""""""
nnoremap <leader>ev :split $MYVIMRC<cr>

nnoremap <leader>e :split $MYVIMRC<cr>

iabbrev @@    albert@stevelosh.com
iabbrev ccopy Copyright 2013 Steve Losh, all rights reserved.

steve@stevelosh.com 
Copyright 2013 Steve Losh, all rights reserved. 


nnoremap <leader>m viw<esc>a"<esc>bi"<esc>lel
inoremap jj <esc>
"inoremap <esc> <nop>
setlocal nonumber

"world" 
"world" 
"world" 
"world" 

autocmd BufNewFile * :write
autocmd BufNewFile *.txt :write

:normal gg=G
:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>

iabbrev <buffer> --- &mdash;

autocmd FileType vim :iabbrev <buffer> iff if ()<left>
autocmd FileType vim :iabbrev <buffer> iff if ()<left>

iabbrev <buffer> iff if ()<left>



autocmd BufNewFile * :write
autocmd BufNewFile *.txt :write

:normal gg=G
:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>

iabbrev <buffer> --- &mdash;

autocmd FileType vim :iabbrev <buffer> iff if ()<left>
autocmd FileType vim :iabbrev <buffer> iff if ()<left>

iabbrev <buffer> iff if ()<left>

iff 
if ()

    " Keys   Operator   Movement
    " ----   --------   -------------
    " dw     Delete     to next word
    " ci(    Change     inside parens
    " yt,    Yank       until comma

    augroup testgroup
        autocmd!
        autocmd BufWrite * :echom "Cats"
    augroup END


    augroup testgroup
        autocmd BufWrite * :echom "Foo"
        autocmd BufWrite * :echom "Bar"
    augroup END

    " ----   --------   -------------
    " ----   --------   -------------
    onoremap p i(
    onoremap p i(
    iabbrev <buffer> iff if ()<left>
    nnoremap <leader>m viw<esc>a"<esc>bi"<esc>lel
    onoremap b /return<cr>


