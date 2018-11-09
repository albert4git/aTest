VimTip	{{{1 124: Number a group of lines
http://vim.sourceforge.net/tip_view.php?tip_id=

Below is a way to number a set of lines.  Here is an exaple before and after snapshot:

apple
bob
pear
tree

1 apple
2 bob
3 pear
4 tree

" Description:
" This provides a command and a function.  They both can be called with or
VimTip	{{{1 131: Scroll alternate window
http://vim.sourceforge.net/tip_view.php?tip_id=
This mapping allow you to quickly scroll inactive window when displaying several windows concurrently.

nmap <silent> <M-Down> :call ScrollOtherWindow("down")<CR>
nmap <silent> <M-Up> :call ScrollOtherWindow("up")<CR>

fun! ScrollOtherWindow(dir)
	if a:dir == "down"
		let move = "\<C-E>"
	elseif a:dir == "up"
		let move = "\<C-Y>"
	endif
	exec "normal \<C-W>p" . move . "\<C-W>p"
endfun

" without a range.  In addition, they can be called with or without
" arguments.  Without a range they operate on the current line.
"
" There are two supported arguments.  They are described below:
"     arg1 -> the number to start at.  The default is one.  This will
"             number your selected lines sequentially.  The start can be a
"             number, ., $, or, 'x (like getline).
"     arg2 -> Text to append after numbers.  The default is a space.
"
" Examples:
"     To provide your functionality:
"         :%Nlist 20
"         :%call Nlist(20)
"     To make a list start at 1:
"         :'<,'>Nlist
"         :'<,'>call Nlist()
"     To number the whole buffer (with it's actual line number):
"         :%Nlist
"         :%call Nlist()
"     To number a subset of lines with their line number (and put a '] ' in
"     front of every number):
"         :'<,'>Nlist . ]\
"         :'<,'>call Nlist(".", "] ")

command! -nargs=* -range Nlist <line1>,<line2>call Nlist(<f-args>)
function! Nlist(...) range
    if 2 == a:0
        let start = a:1
        let append = a:2
    elseif 1 == a:0
        let start = a:1 
        let append = " "
    else
        let start = 1
        let append = " "
    endif

    " try to work like getline (i.e. allow the user to pass in . $ or 'x)
    if 0 == (start + 0)
        let start = line(start)
    endif

    exe a:firstline . "," . a:lastline . 's/^/\=line(".")-a:firstline+start.append/'
endfunction


