"AAA----------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 103: Move to next/previous line with same indentation
http://vim.sourceforge.net/tip_view.php?tip_id=

When working with Python and other languages which don't use braces, it's
useful to be able to jump to and from lines which have the same indentation as
the line you are currently on.

nn <M-,> k:call search ("^". matchstr (getline (line (".")+ 1), '\(\s*\)') ."\\S", 'b')<CR>^
nn <M-.> :call search ("^". matchstr (getline (line (".")), '\(\s*\)') ."\\S")<CR>^

will map Alt-< and Alt-> in Normal mode to upward and downward searching for lines with the same indent as the current line.
"AAA----------------------------------------------------------------------------------"
VimTip	{{{1 280: Integration with PyUnit testing framework

Vim has a wonderful ability to integrate with external tools, like compilers, make, ctags etc.
That's one of the reasons we love it.

PyUnit can be seen as a "compiler" for the Python test code. 
To understand it, Vim should be told about the language
the PyUnit speaks. This could be done with 'errorformat' option:

setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

This magic spell enables Vim to parse unittest.TextRunner's output and to enter quick-fix mode.
To run all your unit tests at once you'll need to setup 'makeprg' option and provide a runner.
I'm using this setup:

setlocal makeprg=./alltests.py

And contents of the alltests.py (for the sake of completeness):


#!/usr/bin/env python2

import unittest
import sys
sys.path.append('unittests')

modules_to_test = (
	'fooTest', 
	'barTest',
	'bazTest',
)

def suite():
    alltests = unittest.TestSuite()
    for module in map(__import__, modules_to_test):
        alltests.addTest(unittest.findTestCases(module))
    return alltests

if __name__ == '__main__':
    unittest.main(defaultTest='suite')

============== end of the alltests.py file ========================

While talking about it, I'd also suggest to add a couple of mappings.
In the end, my vim/files/ftplugin/python.vim looks like this:

setlocal makeprg=./alltests.py\ -q
setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
iabbr <buffer> sae self.assertEquals
iabbr <buffer> sar self.assertRaises



For details see :help quick-fix,  :help 'efm' and  :help 'makeprg'.
See also:  http://c2.com/cgi/wiki?PythonUnit

Many thanks to Stefan Roemer who patiently spent quite some time to build 'efm' for me.

"AAA----------------------------------------------------------------------------------"
VimTip	{{{1 556: Help on <F2> for Python with pydoc

Add the following 2 lines to your ~/.vim/ftplugin/python.vim,
open an pythonscript place the cursor over an keyword and press F2 and be happy.

map <F2> :exec "!xterm -e 'pydoc ".expand("<cword>")."'"<CR><CR>
imap <F2> <ESC>:exec "!xterm -e 'pydoc ".expand("<cword>")."'"<CR><CR>i
"AAA----------------------------------------------------------------------------------"
VimTip	{{{1 608: Evaluate current line (or pease of line) using Python
http://vim.sourceforge.net/tip_view.php?tip_id=

Pyhton language has more powerfull evaluation functions than vim editor.
If you have need to evaluate some by python you can use command

:py print 2*2

(see :help :if_pyth.txt)
But I can tell you more pleasant example. Write in your .vimrc file followings:

=== begin paste ========
python << EOL
import vim
# do not say from vim import * beacuse this instraction
# delete builtins function eval
def EvaluateCurrentLine(*args):
	cur_str = vim.current.line
	action, symb = None, None
	for i in args:
		if i in ["r","p"]: action = i
		else:              symb   = i
	try:    start = cur_str.rindex(symb)+len(symb)
	except: start = 0
	result = eval(cur_str[start:],globals())
	if action == "r":
		vim.current.line = cur_str[:start]+str(result)
	else:
		print result
EOL
command -narg=* PyEv python EvaluateCurrentLine(<f-args>)
=== end paste ============

Be carefull about identation in python part. This text provide command
:PyEv
This command evaluate expression in line under cursor and print result in echo area. With r argument
:PyEv r

evaluate expression and replased it by resalt of evaluation. And other arg in
argument searching the arg backword from the end of current line and evaluate
followed expression. For example: let we have string

\setlength{\textwidth}{450-63
:PyEv r {
\setlength{\textwidth}{387
"AAA----------------------------------------------------------------------------------"
VimTip	{{{1 609: Execute python from within current file
http://vim.sourceforge.net/tip_view.php?tip_id=

Inspired by vimtip #608.

To execute python from a range within the current text file and write the
output to that file (replacing the python), add the snippet below to .vimrc (or
other suitable *rc file).

Requires a 'proper' python setup so that the imported modules can be found.

I find it a handy intermediate step between using the python interpreter on
command line and running a complete script. Can be used for easy buffer
manipulation, filtering input, preprocessing text and templating-like tasks.

def PyExecReplace(line1,line2):
    r = vim.current.buffer.range(int(line1),int(line2))
    redirected = cStringIO.StringIO()
    sys.stdout = redirected
    exec('\n'.join(r[:]) + '\n')
    sys.stdout = sys.__stdout__
    output = redirected.getvalue().split('\n')
    r[:] = output[:-1] # the -1 is to remove the final blank line
    redirected.close()
EOL
command -range Pyer python PyExecReplace(<f-line1>,<f-line2>) 

Some examples of use:
Simple
------
print 2 + 2
:Pyer
(if cursor is on the 'print' line, replaces line with 4)

Filter
------
for line in vim.current.buffer:
    if line[0] != '\t':
        print line
:%Pyer
(filters out lines beginning with a tab in the current buffer)

Inserting time
--------------
import time
print time.ctime()
:%Pyer
(replaces line with date/time)

Getting web content without tags
-------------------------------
import urllib2,htmllib,formatter
h = htmllib.HTMLParser(formatter.AbstractFormatter(formatter.DumbWriter()))
h.feed(urllib2.urlopen('http://www.somesite.com').read())
:%Pyer
(inserts the web page text, but not the html tags, for a given site)

I also use a slightly modified version that appends the output, leaving the python intact.
"AAA----------------------------------------------------------------------------------"

VimTip	{{{1 733: Python the SciTe way...
http://vim.sourceforge.net/tip_view.php?tip_id=

I just discovered vim, I really liked 'split' capability, I'm so used to edit
Python source code on SciTe editor, I really missed the default CTRL-1 to check
the sintax and F5 to run the script...

So, this is my suggestion, add these lines to your _vimrc file:

autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py nmap <F5> :!python %<cr>

Make your that python is in your path, now when you open any python file just type ":make" to get the syntax errors, use ":cnext", to move to next error, check the help on make (":help make") for more info on how to navigate errors.

As you are checking now, <F5> is mapped to execute the current script. Also I suggest you to use add the following lines to _vimrc:

autocmd BufRead *.py set tabstop=4
autocmd BufRead *.py set nowrap
autocmd BufRead *.py set go+=b

That will make to use a 4 spaces for you tabstop (only visually), it avoids wrapping your code and will add a bottom scrollbar. Now I like vim a litle bit more.

"AAA----------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------"

VimTip	{{{1 949: Integrate Pylint and Pychecker support into Vim Cwindows.
http://vim.sourceforge.net/tip_view.php?tip_id=

Simple function to add pylint and pychecker support to Vim.

      function <SID>PythonGrep(tool)
        set lazyredraw
        " Close any existing cwindows.
        cclose
        let l:grepformat_save = &grepformat
        let l:grepprogram_save = &grepprg
        set grepformat&vim
        set grepformat&vim
        let &grepformat = '%f:%l:%m'
        if a:tool == "pylint"
            let &grepprg = 'pylint --parseable=y --reports=n'
        elseif a:tool == "pychecker"
            let &grepprg = 'pychecker --quiet -q'
        else
            echohl WarningMsg
            echo "PythonGrep Error: Unknown Tool"
            echohl none
        endif
        if &readonly == 0 | update | endif
        silent! grep! %
        let &grepformat = l:grepformat_save
        let &grepprg = l:grepprogram_save
        let l:mod_total = 0
        let l:win_count = 1
        " Determine correct window height
        windo let l:win_count =  l:win_count + 1
        if l:win_count <= 2 | let l:win_count = 4 | endif
        windo let l:mod_total = l:mod_total + winheight(0)/l:win_count |
        \ execute 'resize +'.l:mod_total
        " Open cwindow
        execute 'belowright copen '.l:mod_total
        nnoremap <buffer> <silent> c :cclose<CR>
        set nolazyredraw
        redraw!
    endfunction

    if ( !hasmapto('<SID>PythonGrep(pylint)') && (maparg('<F3>') == '') )
        map  <F3> :call <SID>PythonGrep('pylint')<CR>
        map! <F3> :call <SID>PythonGrep('pylint')<CR>
    else
        if ( !has("gui_running") || has("win32") )
            echo "Python Pylint Error: No Key mapped.\n".
            \  "<F3> is taken and a replacement was not assigned."
        endif
    endif

    if ( !hasmapto('<SID>PythonGrep(pychecker)') && (maparg('<F4>') == '') )
        map  <F4> :call <SID>PythonGrep('pychecker')<CR>
        map! <F4> :call <SID>PythonGrep('pychecker')<CR>
    else
        if ( !has("gui_running") || has("win32") )
            echo "Python Pychecker Error: No Key mapped.\n".
            \  "<F8> is taken and a replacement was not assigned."
        endif
    endif



