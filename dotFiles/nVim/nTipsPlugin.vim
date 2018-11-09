



VimTip	{{{1 147: How to write a plugin
http://vim.sourceforge.net/tip_view.php?tip_id=

This tip gives a skeleton for writing a plugin; Vim's help files have plenty
of details (:he plugin, :he write-plugin, :he plugin-details).

# ------------------------------------------------------------------------------
# Exit when your app has already been loaded (or "compatible" mode set)
if exists("loaded_YourAppName") || &cp
  finish
endif

# Public Interface:
#  AppFunction: is a function you expect your users to call
#  PickAMap: some sequence of characters that will run your AppFunction
# Repeat these three lines as needed for multiple functions which will
# be used to provide an interface for the user
if !hasmapto('<Plug>AppFunction')
  map <unique> <Leader>PickAMap <Plug>AppFunction
endif

# Global Maps:
#  
map <silent> <unique> <script> <Plug>AppFunction 
\ :set lz<CR>:call <SID>AppFunc<CR>:set nolz<CR>

# ------------------------------------------------------------------------------

# AppFunction: this function is available vi the <Plug>/<script> interface above
fu! <SID>AppFunction()
..whatever..

# your script function can set up maps to internal functions
nmap <silent> <left> :set lz<CR>:silent! call <SID>AppFunction2<CR>:set nolz<CR>

# your app can call functions in its own script and not worry about name
# clashes by preceding those function names with <SID>
call <SID>InternalAppFunction(...)

# or you could call it with
call s:InternalAppFunction(...)
endf
# ------------------------------------------------------------------------------

# InternalAppFunction: this function cannot be called from outside the
#  script, and its name won't clash with whatever else the user has loaded
fu! <SID>InternalAppFunction(...)
..whatever..
endf

# ------------------------------------------------------------------------------

Plugins are intended to be "drop into <.vim/plugin>" and work.  The problem
that the <Plug>, <SID>, etc stuff is intended to resolve: what to do about
functions that have the same names in different plugins, and what to do about
maps that use the same sequence of characters?  The first problem is solved
with <SID> (a script identifier number) that vim assigns: program with it and
your users will be happier when your stuff works with all their other stuff.
The second problem: what to about those maps is addressed with <Plug>, <unique>,
etc.  Basically the idea is: let the user know that there are clashes and don't
overwrite previously existing maps.  Use the user's preferred map-introducer
sequence (I like the backslash, but there are many keyboards which make
producing backslashes unpleasant, and those users usually prefer something
else).

What I like to do is to have a pair of start/stop maps to reduce my impact on
the namespace.  When the starting map is used, it kicks off a starting function
that introduces all the maps needed.  When the stopping map is used, it not
only removes the maps the starter made but restores any maps the user had had
that would have clashed.  I also use the start/stop pair of functions to set
and restore options that cause my scripts difficulties.

Check out DrawIt.vim's SaveMap() function for a way to save user maps.
Restoring maps with it is easy:

if b:restoremap != ""
 exe b:restoremap
 unlet b:restoremap
endif

So you can see it sets up a string variable with all the maps that the user
had that would have clashed with my application.

One final thing: if your application needs to share information between its
various functions, see if you can use s:varname (a variable that only your
script's functions can access) or b:varname (a variable that anything associated
with the buffer your application is running with can access) instead of using
global variables.

Good luck and happy Vimming!



"AAA----------------------------------------------------------------------------------

VimTip	{{{1 591: Have a nice and easy use of plugins
http://vim.sourceforge.net/tip_view.php?tip_id=

Are you tired of hundreds of mappings and functions that pollute your .vimrc ? Do you want to
nicely organize your customization to quickly find what you search ? Perhaps is it time for you to
consider the use of plugins (if it is not already done).

Plugins are really easy to do and provide a simple way to organize functions and mappings. They are
automaticaly loaded

Here is an example of simple and very short plugin that provides a command MyCommand that saves the
selected text in the file passed in parameter.
I don't know if the function is useful but the example show the parameter passing, the
autocompletion and the use of ranges in a function.

Autocompletion is very practical to help to remember the commands you defined. It is often a
problem to remember all the mappings you've done so it may be faster to type your command than to
remember the mapping you've chosen.
Using user-commands allows you to use mappings only when it is absolutely pertinent

------------------ file MyPlugin.vim -----------------------
" save 'cpo'
let s:cpo_save = &cpo
set cpo&vim

" To Edit the Plugin
nnoremap <F12> :e $VIMRUNTIME/plugins/MyPlugin.vim
" To reload the plugin if you modify it
nnoremap <S-F12> :so $VIMRUNTIME/plugins/MyPlugin.vim

" It is very interesting to define commands to call your functions because you can then use
" autocompletion and other features you cannot use for usual functions
if !exists(':MyCommand')
    command -range=% -nargs=1 -complete=file MyCommand <line1>,<line2>call s:MyCommandFunction(<f-args>)
endif

" the ! allows you to modify the function and reload the plugin. It will be your new version that
" will be considered
function! s:MyCommandFunction(...) range
    split
    execute "norm " . a:firstline . "GV"
    execute "norm " . a:lastline . 'G"ay'
    enew
    norm "ap
    exe "sav! " . a:1
    q
endfunction

" restore 'cpo'
let &cpo = s:cpo_save
unlet s:cpo_save
---------------------End of file --------------------------

commented version of the function :

function! s:MyCommandFunction(...) range
    " create a temporary window
    split
    " select and copy the lines in the range passed (a:firstline and a:lastline are the vim
    " variables for the first and the last lien of the range
    execute "norm " . a:firstline . "GV"
    execute "norm " . a:lastline . 'G"ay'
    " create a new file and paste
    enew
    norm "ap
    " saves the file with the name passed in parameter
    " exe executes the string passed as a command
    " a:1 is the first parameter (if you have more, a:2, a:3. a:0 gives you the number of parameter
    " passed
    exe "sav! " . a:1
    " quit the temporary window
    q
endfunction


Of course you can separate your functions in different plugins (one for the mapping, one for the
functions...
You can use prefix to classify your functions and use the autocompletion more efficiently.

Where to find help on these subjects

General considerations on plugins
:help plugins

How to create a user-command and how to use the parameters (-range, -nargs, -complete...)
:help user-commands

How to program vim
:help eval.txt

all the buildin functions
:help functions 
How to define a function
:help user-functions


