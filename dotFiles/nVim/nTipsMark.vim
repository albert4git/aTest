VimTip	{{{1 602: How to remove one mark or all marks at once
http://vim.sourceforge.net/tip_view.php?tip_id=

To remove a mark you can use \mh in normal mode. Go to the mark and type \mh.

If you are using marks in a script you can use the function below.
Then you would write e.g.

function! MyFunction()
	...
	kl "set mark l
	...
	"do something
	...
	call RemoveMark("l") "Mark l is no longer used, remove it
	...
endfunction 

Here is the function:

function! RemoveMark(mark)
	try 
		exe "normal '" . a:mark "go to the mark
		normal \mh "remove it
	catch
	endtry	
endfunction	

If you want to remove all  your marks in normal mode you can use the mapping
map \rm :call RemoveMarks()<cr>

It calls the function:

function! RemoveMarks()
	try 
		call RemoveMark("a")
		call RemoveMark("b")
		call RemoveMark("c")
		call RemoveMark("d")
		call RemoveMark("e")
		call RemoveMark("f")
		call RemoveMark("g")
		call RemoveMark("h")
		call RemoveMark("i")
		call RemoveMark("j")
		call RemoveMark("k")
		call RemoveMark("l")
		call RemoveMark("m")
		call RemoveMark("n")
		call RemoveMark("o")
		call RemoveMark("p")
		call RemoveMark("q")
		call RemoveMark("r")
		call RemoveMark("s")
		call RemoveMark("t")
		call RemoveMark("u")
		call RemoveMark("v")
		call RemoveMark("w")
		call RemoveMark("x")
		call RemoveMark("y")
		call RemoveMark("z")
	catch
	endtry	
endfunction	

Could you think of other possibilities?
Please share it with us.

Note:
I am using the try-catch clause so the following works only for >= vim 6.2.
If you want to use the functions for an older version remove the try-catch
clauses.



