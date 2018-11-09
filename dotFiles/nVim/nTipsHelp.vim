"AAA---------------------------------------------------------------------------------- 
"AAA---------------------------------------------------------------------------------- 
"AAA---------------------------------------------------------------------------------- 
"AAA---------------------------------------------------------------------------------- 
"AAA---------------------------------------------------------------------------------- 
??? wozu: Simplify help buffer navigation

Vim is distributed with comprehensive help system, which has basic hyperlink support - 
you can press <C-]> over |some subject| or 'some option' to read more about particular term.

The following mappings simplify help buffer navigation:
pressing s(or S) will find next(previous) subject from cursor position
pressing o(or O) will find next(previous) option from cursor position
pressing Enter will jump to subject under cursor
pressing Backspace will return from the last jump
Put them into help filetype plugin (like ~/.vim/ftplugin/help.vim on UNIX).

nmap <buffer> <CR> <C-]>
nmap <buffer> <BS> <C-T>
nmap <buffer> o /'[a-z]\{2,\}'<CR>
nmap <buffer> O ?'[a-z]\{2,\}'<CR>
nmap <buffer> s /\|\S\+\|<CR>
nmap <buffer> S ?\|\S\+\|<CR>


"AAA---------------------------------------------------------------------------------- 
VimTip	{{{1 326: Help for VIM Help (VIM QuickRef)
http://vim.sourceforge.net/tip_view.php?tip_id=

Type 
:help quickref
or
:h quic  

And get a VIM Command Quick Reference Page brilliant for beginners & oldtimers alike

type
:h help to learn how to use help

Other Help Tips

# help for help
:h visual<C-D><tab>     : obtain  list of all visual help topics
                        : Then use tab to step thru them
:h ctrl<C-D>            : list help of all control keys
:h :r                   : help for :ex command
:h CTRL-R               : normal mode
:h \r                   : what's \r in a regexp
:h i_CTRL-R             : help for say <C-R> in insert mode
:h c_CTRL-R             : help for say <C-R> in command mode
:h v_CTRL-V             : visual mode
:h tutor              : VIM Tutor

These are also listed in my Best Of VIM Tips vimtip #305



"AAA---------------------------------------------------------------------------------- 
VimTip	{{{1 598: (PHP) on line help
http://vim.sourceforge.net/tip_view.php?tip_id=

Hi,
vim is my favorite; so, I use it for .php file.
Very often I need the php manual to see the parametrs order for functions. 
Unitl a month ago I always opened a browser and gone to http://http://ro.php.net/FUNCTION_NAME
for example http://ro.php.net/printf .

A month ago I have discovered  
set keywordprg=a_script

What it does:
default, when you ar with the cursor on a WORD and press K (SHIFT+k) in `command mode',
the vim will run 'man WORD'.
If you set keywordprg=a_script,  the  vim will run `a_script WORD'

So I have 
set keywordprg=/home/marcel/php_doc
and php_doc looks like:
#######
#!/usr/bin/bash
links http://www.php.net/$1
#######
And now I have the online help

`links' is a text browser for *nix, http://links.browser.org/
Of course you can use the `lynx'.

"AAA---------------------------------------------------------------------------------- 
VimTip	{{{1 867: quickly get help on python libraries
http://vim.sourceforge.net/tip_view.php?tip_id=

Add this to your .vimrc, note that this requires pydoc (comes with most python)

:command -nargs=+ Pyhelp :call ShowPydoc("<args>")
function ShowPydoc(module, ...)
    let fPath = "/tmp/pyHelp_" . a:module . ".pydoc"
    :execute ":!pydoc " . a:module . " > " . fPath
    :execute ":sp ".fPath
endfunction


Then  from vim:

:Pyhelp time.strftime
:Pyhelp os
:Pyhelp yourFunkyModuleHere

"AAA---------------------------------------------------------------------------------- 

VimTip	{{{1 937: tip on looking up vim help topics
http://vim.sourceforge.net/tip_view.php?tip_id=

In addition to the existing techniques for searching vim help pages, such as
the built-in :helpgrep and other grep techniques such as using external
grep/id-utils, here is another technique that you can use to quickly lookup
help topics.

You are probably already aware that Vim creates tags to lookup help topics
(using :helptags command), and commands such as :tselect (or :ts in short) do
work in the help windows (it is automatically scoped to only the tags files in
your runtime doc directories). This other than providing a way to use familiar
tag commands to lookup help topics (such as tag completion and using regex to
lookup), allows us to take advantage of any tools that enhance the Vim built-in
tag commands. I would like to show here one such tool that you can use.

This requires the tagselect.vim plugin (vimscript #1282), and its dependent
plugins (vimscript #171 and vimscript #197). The plugin allows you execute a
:tselect command and view the results in a new window. You can then use Vim's
navigation (such as search) to find the tag you want and press enter to jump to
it. When used inside a help window, this naturally works on the help topics
too. E.g., say you want to view all the topics that have "shell" in its name,
one way to do this is use tag completion 

:h shell<Tab>

and go one by one. But this is not easy as often you find tens, if not hundreds
of matches for a keyword, so going through the list and using :tnext and
:tprevious commands to navigate to other matching results is painful. But if
you use the :Tselect command provided by the plugin, it becomes relatively
simpler.

:h
:Tselect /.*shell.*

The above gives you the full matching results for all the topics containing
"shell" in their names. You can try other regular expressions (see :help
tag-regexp), but the above is probably the most useful, so you can create a
command for it:

:command! -nargs=+ -complete=tag Helpt :Tselect /.*<args>.*

You can put the above command definition in your vimrc. You can then say:

:Helpt tag

The best part of this is that you will discover topics that you overlooked
several times, including any help topics for plugins.

"AAA----------------------------------------------------------------------------------
VimTip	{{{1 937: tip on looking up vim help topics
http://vim.sourceforge.net/tip_view.php?tip_id=

In addition to the existing techniques for searching vim help pages, such as
the built-in :helpgrep and other grep techniques such as using external
grep/id-utils, here is another technique that you can use to quickly lookup
help topics.

You are probably already aware that Vim creates tags to lookup help topics
(using :helptags command), and commands such as :tselect (or :ts in short) do
work in the help windows (it is automatically scoped to only the tags files in
your runtime doc directories). This other than providing a way to use familiar
tag commands to lookup help topics (such as tag completion and using regex to
lookup), allows us to take advantage of any tools that enhance the Vim built-in
tag commands. I would like to show here one such tool that you can use.

This requires the tagselect.vim plugin (vimscript #1282), and its dependent
plugins (vimscript #171 and vimscript #197). The plugin allows you execute a
:tselect command and view the results in a new window. You can then use Vim's
navigation (such as search) to find the tag you want and press enter to jump to
it. When used inside a help window, this naturally works on the help topics
too. E.g., say you want to view all the topics that have "shell" in its name,
one way to do this is use tag completion 

:h shell<Tab>

and go one by one. But this is not easy as often you find tens, if not hundreds
of matches for a keyword, so going through the list and using :tnext and
:tprevious commands to navigate to other matching results is painful. But if
you use the :Tselect command provided by the plugin, it becomes relatively
simpler.

:h
:Tselect /.*shell.*

The above gives you the full matching results for all the topics containing
"shell" in their names. You can try other regular expressions (see :help
tag-regexp), but the above is probably the most useful, so you can create a
command for it:

:command! -nargs=+ -complete=tag Helpt :Tselect /.*<args>.*

You can put the above command definition in your vimrc. You can then say:

:Helpt tag

The best part of this is that you will discover topics that you overlooked
several times, including any help topics for plugins.

"----------------------------------------------------------------------------------
VimTip	{{{1 937: tip on looking up vim help topics
http://vim.sourceforge.net/tip_view.php?tip_id=

In addition to the existing techniques for searching vim help pages, such as
the built-in :helpgrep and other grep techniques such as using external
grep/id-utils, here is another technique that you can use to quickly lookup
help topics.

You are probably already aware that Vim creates tags to lookup help topics
(using :helptags command), and commands such as :tselect (or :ts in short) do
work in the help windows (it is automatically scoped to only the tags files in
your runtime doc directories). This other than providing a way to use familiar
tag commands to lookup help topics (such as tag completion and using regex to
lookup), allows us to take advantage of any tools that enhance the Vim built-in
tag commands. I would like to show here one such tool that you can use.

This requires the tagselect.vim plugin (vimscript #1282), and its dependent
plugins (vimscript #171 and vimscript #197). The plugin allows you execute a
:tselect command and view the results in a new window. You can then use Vim's
navigation (such as search) to find the tag you want and press enter to jump to
it. When used inside a help window, this naturally works on the help topics
too. E.g., say you want to view all the topics that have "shell" in its name,
one way to do this is use tag completion 

:h shell<Tab>

and go one by one. But this is not easy as often you find tens, if not hundreds
of matches for a keyword, so going through the list and using :tnext and
:tprevious commands to navigate to other matching results is painful. But if
you use the :Tselect command provided by the plugin, it becomes relatively
simpler.

:h
:Tselect /.*shell.*

The above gives you the full matching results for all the topics containing
"shell" in their names. You can try other regular expressions (see :help
tag-regexp), but the above is probably the most useful, so you can create a
command for it:

:command! -nargs=+ -complete=tag Helpt :Tselect /.*<args>.*

You can put the above command definition in your vimrc. You can then say:

:Helpt tag

The best part of this is that you will discover topics that you overlooked
several times, including any help topics for plugins.

"----------------------------------------------------------------------------------

VimTip	{{{1 930: highlighted text -> HTML
http://vim.sourceforge.net/tip_view.php?tip_id=

I'm sure this has been covered somewhere, but it took me some time to find it.
You can convert highlighted text to HTML code in Vim. 

:TOhtml

this works with a complete file or  segments of code (selected in visual mode).
GUI users can also use the drop-down menu 

Syntax -> Convert To HTML

This is really nice when you are writing webpages with code snippets in it:
    - set the highlighting of the file to your programming language of choice
    - enter the code
    - highlight the code
    - type :TOhtml
    - copy and paste the HTML code from the opening window (part)


