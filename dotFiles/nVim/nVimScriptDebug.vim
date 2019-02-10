Vimscript's Debugger

You can start up Vim in its debug mode with the -D argument.

" opens vim in debug mode
vim -D somefile.txt

This is useful for seeing what is run when Vim initializes and might help give you a better idea of everything that happens when you open Vim. You can use this to walk through the Vimscript in your vimrc that runs when an instance of Vim initializes. I will explain how to use the debugger momentarily.

If you are interested in profiling your Vim's startup, you may be interested in starting Vim with the startuptime option, which will write to a file you specify with timestamps and information about what Vim is loading. You can use this to find bottlenecks or problematic plugins that might be causing Vim to be slow.

" this will write startup info to a file: vim.log
vim --startuptime vim.log

How to Use the Debugger

Before we jump into how to use the debugger, you should also know that you can do more than just start up Vim in debug mode as that would not be terribly useful. You can also call the debug command from within Vim to debug Vimscript functions or commands that have already been sourced.

" debug a command
debug CommandName

" debug a fucntion
debug call FunctionName(arg)

Once you are in debug mode, you will see a prompt (>) in your status bar. This is where you can control and interact with the debugger.

    cont: continue execution until the next breakpoint (if one exists)
    quit: stop current execution, but still stops at the next breakpoint
    step: execute the current command and come back to debug mode when it is finished
    next: like step except it also steps over function calls and sourced files
    interrupt: like quit, but returns to debug mode for the next command
    finish: finishes the current script or function and returns to debug mode for the next command

You should note that each of these debug commands has the shorthand of the first letter of the word [c, q, s, n, i, f] and hitting enter (<CR>) will execute the previous command again.

The last thing you need to know is how to manage breakpoints to your Vimscript. You can add a breakpoint with the breakadd command, delete it with the breakdel command, and see all breakpoints with breaklist.

Adding Breakpoints

" bracketed [] arguments are optional

" add breakpoint to function
breakadd func [lineNumber] functionName
" add breakpoint to file
breakadd file [lineNumber] fileName
" add breakpoint to current line of current file
breakadd here

Deleting Breakpoints

" bracketed [] arguments are optional

" delete breakpoint number from breaklist output
breakdel number
" delete all breakpoints
breakdel *
" delete breakpoint on function
breakdel func [lineNumber] functionName
" delete breakpoint on file
breakdel file [lineNumber] fileName
" delete breakpoint at current line of current file
breakdel here

Read the documentation for debug
General Debugging with Verbose

Other than the debug command, Vim also has a verbose command that provides logging when actions take place in Vim, which can also be useful for debugging, especially things like autocommands. I recently used verbose to determine what autocommands I could leverage to hook into netrw (see post). Using verbose is as simple as:

" set verbose command
set verbose=9

" set verbose on startup
vim -V9 file.text

You can set verbose to any value from 0-15, where 0 is no extra output, and 15 gives you output for everything Vim is doing. Each number progressively adds more output and insight into what Vim is doing:

" >= 1  When the viminfo file is read or written.
" >= 2  When a file is ":source"'ed.
" >= 5  Every searched tags file and include file.
" >= 8  Files for which a group of autocommands is executed.
" >= 9  Every executed autocommand.
" >= 12 Every executed function.
" >= 13 When an exception is thrown, caught, finished, or discarded.
" >= 14 Anything pending in a ":finally" clause.
" >= 15 Every executed Ex command (truncated at 200 characters).

It will not take much playing around with verbose to become overwhelmed by the amount of output showing up in the status bar. Each message interrupts the flow of Vim, and may make it difficult to do anything. To get around this you can send verbose output to a file:

set verbosefile=filename.txt

Lastly, you can run verbose for just a single command using [count]verbose, which is useful if you only want to see what Vim is doing behind the scenes for one small action.

:12verbose call MyFunction()

Read the documentation for verbose
