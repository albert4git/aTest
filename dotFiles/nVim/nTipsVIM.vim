"AAA--------------------------------------------------------------------------------- 
"AAA--------------------------------------------------------------------------------- 
"AAA--------------------------------------------------------------------------------- 
"AAA--------------------------------------------------------------------------------- 
(1) Check version:
if version >= 600
    set foldcolumn=2
endif

(2) Use environment variables:
source $VIMRUNTIME/vimrc_example.vim

(3) Loading scripts(especially useful for scripts just merged into standard macros):
if filereadable($VIMRUNTIME . "/macros/matchit.vim")
  source $VIMRUNTIME/macros/matchit.vim
endif

"AAA--------------------------------------------------------------------------------- 
VimTip	{{{1 367: What is this $VIMRUNTIME ?
http://vim.sourceforge.net/tip_view.php?tip_id=

$VIMRUNTIME points to a directory where most of the files needed by Vim are kept.
As the name suggests these files are needed during "run-time". Though they are not necessary for
Vim to run, but they help in adding extra functionality to the basic Vim.

Here is a brief overview of files and directories in $VIMRUNTIME.

bugreport.vim :- Use this file if you think you have discovered a bug in VIM. see "help bugreport"
colors :- Contains various clorschemes. see ":help :colorscheme"
compiler :- Contains compilation scripts for various languages. see ":help :compiler"
delmenu.vim :- Deletes all Menu's 
doc :- Contains Documentation :-) 
evim.vim :- script for easy vim. see :help evim"
filetype.vim :- Detects filetype of files based on their extensions. see "help filetype"
ftoff.vim :- SOurce this to disable ditection of filetypes.
ftplugin :- Contains plugins that are loaded based on the filetype.
ftplugin.vim :- Enables flietype plugins
ftplugof.vim :- Disables filetype plugins
gvimrc_example.vim :- The name says it all, right :-)
indent :- contains indentaion scripts for various languages
indent.vim :- Enables indentation based on filetype.
indoff.vim :- Disables indentation based on filetype.
keymap :-  Contains keymap files for various encodings. see ":help keymap"
lang :- Contains Message files in different language. see ":help language"
macros :- Contains variuos cool stuff. read "macros/README.txt"
menu.vim :- Default Menus  
mswin.vim :- sets options for Vim to behave like Windows.
optwin.vim :- commands to create option window.
plugin :- Contains plugins. All .vim files in this directory are automatically sourced.
scripts.vim :- helps detect filetype in Vim scripts.
syntax :- Contains Syntax defination files for various programming languages.see ":help syntax"
tools :- Some useful tools. like blink to blink the cursor in xterm.
tutor :- Contains tutor.vim. see ":help tutor"
vim32x32.xpm :- Vim Logo.
vimrc_example.vim :- again name says it all. 
~


"AAA--------------------------------------------------------------------------------- 
VimTip	{{{1 371: Encrypting a file within vim session and not leaving behind traces.
http://vim.sourceforge.net/tip_view.php?tip_id=

I was desperately looking for a simple way to encrypt files.
(I find this very useful. Despite all the user permissions you set, it's easy for someone/admin
to do sudo and read your personal files..Many work environments provide users the permission
to sudo or become super user)

Vim let's you encrypt file within the edit session. 

:X

Will prompt for encryption key. Enter the encryption key and REMEMBER to save
it using :w. That will encrypt the file.

Try
:help  :X
for more info.

If you don't want to leave behind traces of your edits:
By default, once you finish your vim session, ~/.viminfo will be written with
the  files you edited (marks), commands you entered and possibly what you wrote
(the registers you copied or pasted...). If you don't want such trace to be left behind,
then place the following file in in your .vimrc 

set viminfo='0,\"0,\/0,:0,f0


"AAA--------------------------------------------------------------------------------- 
VimTip	{{{1 411: How to initialize plugins
http://vim.sourceforge.net/tip_view.php?tip_id=

Plugins have two basic ways of being initialized:

    a) via some variable that the plugin script uses;
       the initialization here is obvious -- set the
       desired variables in your <.vimrc> (or use
       an appropriate autocmd to do so).

    b) via a map or function call.  The problem here
       is that <.vimrc> is sourced prior to plugin
       sourcing, so the map or function call isn't
       available yet.

       Solution: put in .vim/after/plugin a file
       of the same name as the plugin you're initializing.
       In that file put

            call TheInitializationFunction()

            -or-

            norm TheInitializationMap

For example, the <HiMtchBrkt.vim> script which supports the
highlighting of matching brackets as you move onto a
bracket is not on by default.  Normally it requires one to
type "\[i" to start it.  However, if you'd like to have the
script to start enabled, then put

            norm \[i

into the file <.vim/after/plugin/HiMtchBrkt.vim> (see tip
vimtip#177).
"AAA--------------------------------------------------------------------------------- 
VimTip	{{{1 433: a rough mapping to spellcheck the buffer
http://vim.sourceforge.net/tip_view.php?tip_id=

well, certainly

well, certainly there are plugins to do this much better, but, if you 
like to have most of the stuff placed on your vimrc file, the
following must help:
 
 map ,SS :exec system("ispell -l -t -d br < ".expand("%")." \| sort -u \| sed 's/\\(.*\\)/syntax match Underlined \"\\\\<\\1\\\\>\" contains=TOP /'")
 
basically, i use 'ispell' to collect all misspelled words, and assign
each one to the 'Underlined' syntax group (seems better than 'Error')
=]

improvements aren't so hard to do; actually, I use another mappings 
for another 'spell' functions, but the essential can fit in just one 
line;
"AAA--------------------------------------------------------------------------------- 

VimTip	{{{1 450: Working with multiple sessions
http://vim.sourceforge.net/tip_view.php?tip_id=

The problem I'm trying to solve:
I usually need to work on different projects (let us call them: PROJ1 and PROJ2). These are in different directories, have 
different files.. etc. It would be nice if I can instruct my editor to take me back to the exact session (see :help sessions)
for each of these projects - open the required files and buffers, window layout etc...

Solution
1. Append the following code to your .vimrc
    - Change the variable g:PathToSessions to your desired place, if needed (make sure that this directory exists and is writable)
2. Open all/some files in a particular project (as if you are working on that) in gvim. Say I open all my PROJ1 related files.
    You can split windows etc.. and make it look as if you are really working! :-) Do a 

    :SetSession PROJ1

3. Quit gvim
4. Restart gvim without any filenames at the command line.
5. You ought to get a popup-entry asking you which session to restore. Choose PROJ1.vim to see the effect.
6. Repeat with other projects.

Note:
1. You don't have to :SetSession everytime you open gvim as in step 5. Only once.
2. If you start vim with no files at the command line, you have an option of going back to the last saved session (this
    is available in the gui if you choose LastSession.vim)

CODE STARTS
au VimLeave * call VimLeave()
au VimEnter * call VimEnter()

let g:PathToSessions = $HOME . "/.vim/sessions/"

function! VimEnter()
   if argc() == 0
      " gvim started with no files
      if has("browse") == 1
         let g:SessionFileName = browse(0, "Select Session", g:PathToSessions, g:PathToSessions . "LastSession.vim")
         if g:SessionFileName != ""
            exe "source " . g:SessionFileName
         endif
      else
         " For non-gui vim
         let LoadLastSession = confirm("Restore last session?", "&Yes\n&No")
         if LoadLastSession == 1
            exe "source " . g:PathToSessions . "LastSession.vim"
         endif
      endif
   endif
endfunction

function! VimLeave()
   exe "mksession! " . g:PathToSessions . "LastSession.vim"
   if exists("g:SessionFileName") == 1
      if g:SessionFileName != ""
         exe "mksession! " . g:SessionFileName
      endif
   endif
endfunction

" A command for setting the session name
com -nargs=1 SetSession :let g:SessionFileName = g:PathToSessions . <args> . ".vim"
" .. and a command to unset it
com -nargs=0 UnsetSession :let g:SessionFileName = ""
CODE ENDS
"AAA--------------------------------------------------------------------------------- 
VimTip	{{{1 510: one way to set $VIMRUNTIME within vimrc
http://vim.sourceforge.net/tip_view.php?tip_id=


In general, $VIMRUNTIME cannot be set within vimrc.
(:set helpfile is not so useful) 
Bram prefers to let vim figures it out. 

This tip is for those who want to avoid setting $VIMRUNTIME as an enviromental variable
(either rc file on UNIX or enviroment on Windows).

I found the following steps worked on my PC and unix:

  1. find out your $VIM
     (On Windows, it is the directory where gvim.exe lives)
  
  2. create a directory called doc under $VIM
     (now, we have $VIM/doc)
  
  3. copy help.txt from official $VIMRUNTIME/doc
     (now, we have $VIM/doc/help.txt)

Now, we can set $VIMRUNTIME within vimrc, for example

   let $VIMRUNTIME='C:/usr/share/vim/vim62'

I find it is useful on PC especially when I have cygwin
installed, thus a single copy of VIMRUNTIME can be shared for
both vi (cygwin version) and gvim.exe (win32 version).

"AAA--------------------------------------------------------------------------------- 
"AAA--------------------------------------------------------------------------------- 

VimTip	{{{1 487: jump to a file to a certain line number
http://vim.sourceforge.net/tip_view.php?tip_id=

Dear VIMMERS:

It is useful to have cn, cl for locating errors. however, when the compilation was done off-line,
gcc  ... >& compile.log
how to use the compile.log to locate the errors? for example, 
     vim.h:1506
if i use "gf" when the cursor is over "vim.h", it just jumps to the begining of the file. 
here may be one solution by combining several steps:
      nmap gt mAT f:l"aywbbgf:^Ra^M
"mA"   --- marks the current position to global register A so that i can return the log file by 'A
"T "     --- goes to the begining of the tag, so in any characters of "vim.h:1506", it first places the cursor to "v".
"f:"      --- goes to the ":" separator
"l"       --- goes to the starting of line number
"ayw   --- try to use register a to remember the line number
"bb"    --- move cursor back to the filename
"gf"     --- now jump to the file
":^Ra^M" 
          --- jump to the line number remembered in register a
 
nmap gt ... place the above steps into key combinations "g" "t" so next time use "gt" instead of "gf" on the error tag!


"AAA--------------------------------------------------------------------------------- 

VimTip	{{{1 342: Remap <ESC>
http://vim.sourceforge.net/tip_view.php?tip_id=

Tired of hunting down <ESC> at upper-left of your keyboard while using a keyboard with useless Windows keys?

Well, remap them -- use xmodmap. I'm using Debian and my xmodmap config file is in /etc/X11/xinit/xmodmap, ymmv. 
You may have to use xmodmap directly (from ~/.xinitrc  in *BSD or whatever).

Anyway, here's my xmodmap:
[ .. other irrelevant mappings skipped ... ]
keycode 115 = braceleft
keycode 116 = Escape
keycode 117 = braceright

Btw, the keys are:
    * 115 - Windows key, between the left-hand Ctrl and Alt keys
    * 116 - Windows key, to the right of the AltGr key
    * 117 - Menu key, to the left of the right-hand Ctrl key

Valid for all environments with X, on *BSD as well as on Linux.
You get the same mappings under ordinary console by modifying the console keymap file (pretty self-explanatory), in my case it's 
/usr/share/keymaps/i386/qwerty/et.kmap.gz.

I'm using mapping braces to winkeys because of my Estonian keyboard.
