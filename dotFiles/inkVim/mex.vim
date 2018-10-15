
    Find files and directories: At the shell prompt, press Ctrl+T and FZF scans the files and directories inside your current directory and starts filling up its list. Type a few characters of the file or directory you want to autocomplete. The characters do not need to be an exact substring. That is the fuzzy feature of this finder. Use up and down keys to navigate the list. You can even use the mouse to pick items from the list by clicking and Ctrl-clicking. Finally press Enter to pick the entry you want. Press Esc to dismiss FZF any point.

    Find directories: At the shell prompt, press Alt+C to autocomplete and find only directories. The rest of the interaction is same as that for Ctrl+T shown above.

    Find from history: Ctrl+R does the fuzzy finding for commands from your shell history. This works in Bash, but seems to be disabled in Fish. No worries cause Fish already has powerful history search.

    Find process to kill: Figuring out the PID of a process you want to kill is painful. With FZF, all you need to do is type kill, press TAB and you get a list of processes with full details. You can type some characters to find the process you want or scroll the list. For each item, it also shows the full command line at the bottom, enabling you choose the right program to kill. Press Enter to choose the process. Its PID will be added to your kill command.

file:///home/red/Desktop/vim-FZF/GitHub%20-%20junegunn_fzf:%20A%20command-line%20fuzzy%20finder.html
"--------------------------------------------------------------------------------- 
Environment variables / Aliases
unset **<TAB>
export **<TAB>
unalias **<TAB>
"--------------------------------------------------------------------------------- 

# Files under current directory
# - You can select multiple items with TAB key
vim **<TAB>

# Files under parent directory
vim ../**<TAB>

# Files under parent directory that match `fzf`
vim ../fzf**<TAB>

# Files under your home directory
vim ~/**<TAB>


# Directories under current directory (single-selection)
cd **<TAB>

# Directories under ~/github that match `fzf`
cd ~/github/fzf**<TAB>

"------------------------------------------------------------------------ 
# Files under current directory
$ cat **<TAB>
# Processes
$ kill -9 <TAB>
# Host names
$ ssh **<TAB>
# Environment variables / Aliases
$ export **<TAB>

"------------------------------------------------------------------------ 
!fire   	inverse-exact-match     	Items that do not include fire
!^music 	inverse-prefix-exact-match 	Items that do not start with music
!.mp3$  	inverse-suffix-exact-match 	Items that do not end with .mp3

'wild   	exact-match (quoted)    	Items that include wild
^music  	prefix-exact-match      	Items that start with music
.mp3$   	suffix-exact-match      	Items that end with .mp3

"------------------------------------------------------------------------ 
 :g/.*/m0
         This will reverse the order of the lines in the current file.
        m0 is the ex command to move the line to line 0.

  :v/./d or :g/^$/d 
         Removes all blank lines.

  :g/^[ <ctrl-v><tab>]*$/d
         Removes all lines that only have whitespace.

  :v/./$s/$/<ctrl-v><enter>./|'';/./-1j|$d
         Replaces multiple blank lines with just one blank line.
"------------------------------------------------------------------------ 
  Put `and' around the current word
    map *` i`<ctrl-v><esc>ea'<ctrl-v><esc>

  Put 'and' around the current word
    map *' i'<ctrl-v><esc>ea'<ctrl-v><esc>

  Put "and" around the current word
    map *" i"<ctrl-v><esc>ea"<ctrl-v><esc>

  Put `and' around the current word
    map! `` <ctrl-v><esc>bi`<ctrl-v><esc>ea'

  Split a line at the cursor, and put a > at the beginning of the next
line.  (For quoting Usenet, etc). I had some trouble with my old
version of this under some versions, so I've redone it, and I think
that it should work.
    map g may0O<ctrl-v><esc>P`ao<ctrl-v><esc>P:s/./ /g<ctrl-v><enter>0i><ctrl-v><esc>$mb`ay$`bP'add

  Insert one character
    map g i$<ctrl-v><esc>r

  Format a paragraph without the fmt program.  (To use, use J a few
times, then this a few times)
    map K 072lBhr<ctrl-v><enter>

  Or, a little less elegantly, but without the need to use J and K
multiple times.
    map K {wma}b:'a,.j<ctrl-v><enter>:s/\(.........................................................\)/\1<ctrl-v><ctrl-v><ctrl-v><enter>/g<ctrl-v><enter>

"------------------------------------------------------------------------
 Make ctrl-x work as cut, ctrl-v as paste, ctrl-p as copy.  You should
mark the beginning of the area as m (use mm).  (ctrl-c cannot be
remapped when it is defined as the interrupt character in Unix.)
    map <ctrl-v><ctrl-x> "zd`m
    map <ctrl-v><ctrl-p> "zy`m
    map <ctrl-v><ctrl-v><ctrl-v><ctrl-v> "zP`m

  Save a read-only file.  Careful, it changes the permissions. When
done, it changes them to read/write owner, read for everyone else. Note
that this might not be the same as the original permissions.
    map K :!chmod 666 %<ctrl-v><enter>:w!<ctrl-v><enter><ctrl-v><enter>
    :!chmod 644 %<ctrl-v><enter>

  vi status line (sort of...) [Note:  It's slow...]
    map <ctrl-v><up-arrow> k<ctrl-v><ctrl-g>
    map <ctrl-v><down-arrow> j<ctrl-v><ctrl-g>
    map k k<ctrl-v><ctrl-g>
    map j j<ctrl-v><ctrl-g>
    map <ctrl-v><ctrl-f> <ctrl-v><ctrl-f><ctrl-v><ctrl-g>
    map <ctrl-v><ctrl-b> <ctrl-v><ctrl-b><ctrl-v><ctrl-g>
    map H H<ctrl-v><ctrl-g>
    map M M<ctrl-v><ctrl-g>
    map L L<ctrl-v><ctrl-g>
    map G G<ctrl-v><ctrl-g>
    map <ctrl-v><ctrl-u> <ctrl-v><ctrl-u><ctrl-v><ctrl-g>
    map <ctrl-v><ctrl-d> <ctrl-v><ctrl-d><ctrl-v><ctrl-g>

  center a line
    map = 080i <ctrl-v><esc>$78hd0^D:s/  / /g<ctrl-v><enter>$p

  redefine tab to insert 5 spaces instead of a tab marker
    map! <ctrl-v><ctrl-i> <space><space><space><space><space>

  switch current and last line (repeat to reverse a file)
    map v Gdd''Pj

  yank until end of line, run it in a shell and read in the result
    map v y$o<ctrl-v><esc>pI:r!<ctrl-v><esc>"add@a

  allow vi to backspace over text that was inserted in a previous
insert mode
   map! <ctrl-v><ctrl-?> $<ctrl-v><esc>Xs
   map! <ctrl-v><ctrl-h> $<ctrl-v><esc>Xs

  print the document to the default printer (for BSD replace lp with lpr).
   map v 1G!Glp<ctrl-v><enter>u

  set # to toggle line numbers on and off:
   map \o# o:se nu<ctrl-v><enter>:se nonu<ctrl-v><esc>-:map \o# "wp<ctrl-v><enter>
   map \d# "w2dd
   map \x# "xdd@x"xpk
   map # ma3L\o#\x#\d#`a:<ctrl-v><enter>
 
  Quote the current paragraph with '>'s.
   map Z> mc{jma}kmb:'a,'bs/^ /> /<ctrl-v><enter>'c

  Allow <ctrl-z> to suspend processes within insert mode
   map! <ctrl-v><ctrl-z> <ctrl-v<esc>:stop<ctrl-v><enter>
  Make all tabs spaces
   map! <ctrl-v><ctrl-v><ctrl-v><ctrl-i> <ctrl-v><ctrl-v><space>

  Replace all tabs with the proper amount of spaces for the given
  tabstop. Removing the last two character (4<enter>) will allow you to
  specify the tabstop: #t4<enter>
   map #t 1G!Gpr -t -e4<ctrl-v><enter>
   map #T !}pr -t -e4<ctrl-v><enter>}

  Insert a ruler above the current line
   map #r O<ctrl-v><esc>i....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8<ctrl-v><esc>
"------------------------------------------------------------------------
 This is a macro that redefines itself: (more for heuristic reasons
than anything else) It inserts foo the first time it is run, and bar
all subsequent times. 
  map K ifoo<ctrl-v><esc>:map K ibar<ctrl-v><ctrl-v><ctrl-v><esc><ctrl-v><enter>

  This makes end notes. It will insert a [#] at the current location
and put a [#] at the bottom of the document and let you type there.
Hitting `a will take you back to the original location once you are
done with your end note. [#] will be the number of the end note, not
the literal # character. (Pretty crazy, huh?)
   map K ma1GO[0]<ctrl-v><esc>G$?\[[0-9]*\]<ctrl-v><enter>lyt]`aa<ctrl-v><enter><ctrl-v><esc>O<ctrl-v><esc>pI:r!echo '1 <ctrl-v><esc>A + p' <ctrl-v><ctrl-v>| dc<ctrl-v><ctrl-v><ctrl-v><ctrl-v><ctrl-v><ctrl-v><ctrl-v><enter><ctrl-v><esc>0"yD@y0i[<ctrl-v><esc>A]<ctrl-v><esc>kkJJJmb1Gdd`bF[yf]Go<ctrl-v><esc>pA   

   <ctrl-v....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8<ctrl-v>>


"------------------------------------------------------------------------
7.0 - Alphabetical vi quick reference

  ... means that something needs to be specified before or after the
  command, as appropriate.  This is normally a cursor movement 
  key (h,j,k,l,w,b, etc.) or a line number.

  #  (where # is a number) following command n times...  
  :  go to ex-mode 
  )  next sentence 
  (  previous sentence 
  }  next paragraph 
  {  previous paragraph 
 ]]  next section 
 [[  previous section
  0  beginning of line 
  $  end of line 
  ^  first non-whitespace character
  +  first character of next line 
  -  first character of previous line 
(spacebar) next character 
(return) next line 
  /  search forward 
  ? search backward 
  %  find match of current parenthesis, brace, or bracket 
  ,  reverse direction of last f, F, t, or T 
  ;  repeat last f, F, t, or T
  .  repeat last command
  `  goto mark 
  '  goto beginning of line with mark 
 ``  return to previous mark or location before a search 
 ''  go to start of line of previous mark or location before search
  ~  switch case of current character
  "  store in register 
  @  execute command in register
  !  send next to command, replace output (eg  !}fmt passes the current
       paragraph to the command fmt, and replaces the output with
       whatever fmt returns.) 
 !!  send line to command
 >>  shift line one shiftwidth to the right 
 <<  shift line one shiftwidth to the left 
 >%  shift until matching (, [, or { to the right 
 <%  shift until matching (, [, or { to the left
  a  append after the current location 
  A  append at the end of the line
 ^a  unused
  b  beginning of previous word 
  B  beginning of previous word, ignore punctuation 
 ^b  scroll back one screen
  c  change until...  
  C  change to end of line 
 ^c  ends insert mode, unused in command mode (if defined as interrupt)
  d  delete until...  
  D  delete to end of line 
 ^d  scroll down half a window, moves to previous shiftwidth in insert
       mode
  e  end of word 
  E  end of word, ignore punctuation 
 ^e  scroll screen down one line
  f  find...  
  F  find backward...  
 ^f  scroll forward one screen
  g  unused 
  G  ...Goto  [defaults to end of file] 
 ^g  show status line
  h  left 
  H  first line on screen 
 ^h  backspace in insert mode, left in command mode
  i  insert before current location 
  I  insert before first non-whitespace character on line 
 ^i  tab in insert, unused in command
  j  down 
  J  join next line with current line 
 ^j  down in command, create newline in insert
  k  up 
  K  unused 
 ^k  unused
  l  right 
  L  last line on screen 
 ^l  redraw screen
  m  mark position into register 
  M  middle of screen 
 ^m  carriage return
  n  repeat last search 
  N  repeat last search, reverse direction 
 ^n down in command
  o  open line below current 
  O  open line above current 
 ^o  unused
  p  put below current line 
  P  put above current line 
 ^p  up in command
  q  unused 
  Q  quit and run ex 
 ^q  unused
  r  replace current character 
  R  replace characters until insert mode is left 
 ^r  redraw screen in command mode
  s  substitute 
  S  substitute entire line 
 ^s  unused
  t  to...  
  T  backward to...  
 ^t  moves to next shiftwidth.
  u  undo last change 
  U  undo changes to current line 
 ^u  scroll up half a window
  v  unused 
  V  unused 
 ^v  unused in command, quotes next character in insert
  w  beginning of next word 
  W  beginning of next word, ignore punctuation 
 ^w  unused in command, in insert move back to beginning of previous
       word
  x  delete current character 
  X  delete previous character 
 ^x  unused
  y  yank...  
  Y  yank current line 
 ^y  scroll screen up one line
  z  reposition screen around line (Return to top of screen, . to 
       middle, - to bottom) 
 ZZ  write (only if changes have been made) and quit 
 ^z  unused

"------------------------------------------------------------------------
 :r <file>       read <file> into current text 
 :r !<command>   read output from command <command> into current text 
 :nr <file>      read in at line number 
 :!<file>        run command, return 
 :sh             goto shell 
 :so <file>      read and execute commands from <file>
 :x              write (only if changes have been made) and quit 
 :wq             write and quit 
 :l1,l2w <file>  write between lines l1 and l2 to <file>.  If <file> 
                   is not specified, assume current.  If l1,l2 not 
                   specified, assume entire file (making it :w)
 :w >> <file>    append to <file>.  May use line numbers
 :w!             overwrite current file 
 :q              quit
 :q!             quit, forget changes 
 :e <file>       edit <file> without leaving vi 
 :e!             forget changes since last write
 :n              edit next file 
 :e +n <file>    edit <file> at line n, if no end, assume end of file 
 :n <files>      specify <files> as new list of files to edit 
 :e#             edit alternate file (if :e <file> is used, alternate is
		   the original file)
 :args           show files to be edited 
 :rew            rewind list of files to top 
 :map m n        create a macro (make m do n) 
 :map! m n       create an insert mode macro (make m do n) 
 :unmap m        destroy macro m 
 :unmap! m       destroy insert mode macro m 
 :ab <1> <2>     abbreviate - replace <1> with <2> whenever typed as 
                   a word
 :unab <1>       unabbreviate <1> 
 :cd <directory> cd to <directory>
 :set <option>   set <option>...
"------------------------------------------------------------------------

Option:             Default:           What it does:

autoindent (ai)     noai               Makes new lines automatically
                                         indent to the position as the 
                                         line above or below
autoprint (ap)      ap                 Display changes after each 
                                         command 
autowrite (aw)      noaw               Automatically save file 
                                         before :n, :!  
beautify (bf)       nobf               Ignore all control characters
                                         during input (except tab, 
                                         newline, formfeed)
directory= (dir=)   /tmp               Name of the directory to store 
                                         buffer 
edcompatible        noedcompatible     Use ed-like features on 
                                         substitute 
errorbells (eb)     errorbells         Sound bell on error
exrc (ex)           noexrc             Allow .exrc files outside home 
                                         dir 
hardtabs= (ht=)     8                  Set boundary for hardware tabs 
ignore case (ic)    noic               Ignore case in regex expressions 
lisp                nolisp             Turn on lisp mode
list                nolist             Display all tabs, end of lines
magic               magic              Enable more regex expressions
mesg                mesg               Allows mesgs to be sent to 
                                         terminal 
number (nu)         nonumber           Displays line numbers in file 
open                open               Allows open and visual
optimize (opt)      optimize           Optimizes throughput of text by 
                                         not sending carriage returns 
                                         when printing text
paragraphs= (para=) IPLPPPQPPLIbp      Sets the delimiters for { & }
prompt              prompt             Command mode input gives : prompt 
readonly (ro)       noro               Cannot write unless ! is given  
redraw              noredraw           Redraw screen when edits are made 
remap               remap              Allows macros that point to other
					 macros
report=             5                  Report changes if they effect > x
					 lines
scroll              1/2 window         Amount of screen to scroll when
					 scroll down is received in
					 command mode.  Also, number of
					 lines printer by z.  (z prints
					 2*scroll)
sections=           SHNHH HU           Defines end of section for [[ 
                                         and ]] 
shell= (sh=)        /bin/sh            Default shell.  Uses SHELL
					 environment, if set
shiftwidth= (sw=)   8                  Characters to shift when using
					 shift commands
showmatch (sm)      nosm               Show matching {, }, (, ), [, or ] 
showmode            noshowmode         Shows which mode you are in.
slowopen (slow)                        Do not update display 
                                         immediately after insert
tabstop= (ts=)      8                  Sets tabstop length 
taglength= (tl=)    0                  Number of characters significant
                                         for tags (0 means all 
                                         characters)
tags=               tag, /usr/lib/tags Define pathname of files 
                                         containing tags.
term=                                  Set the terminal type
terse               noterse            Display shorter error messages
timeout (to)        timeout            Keyboard maps timeout after one 
                                         second 
ttytype=                               Set the terminal type
warn                warn               Display "No write since last 
                                         change" messages
window= (w=)                           Number of lines in window in visual
					 mode
wrapmargin= (wm=)   0                  Set the right margin.  Greater 
                                         than 0 will word wrap n spaces
                                         from the edge of the screen
wrapscan (ws)       ws                 Searches wrap around end of file
writeany (wa)       nowa               Allow saving to any file
"------------------------------------------------------------------------
"------------------------------------------------------------------------
"------------------------------------------------------------------------
"========================================================================
" if !exists('g:ycm_semantic_triggers')
"   let g:ycm_semantic_triggers = {}
" endif
" let g:EclimCompletionMethod = 'omnifunc'
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]
" let g:ycm_key_invoke_completion = '<C-a>'
"========================================================================
The resources can also be set with arguments to Vim:
argument		meaning	~
*-gui*
-display {display}	Run vim on {display}		*-display*
-iconic		Start vim iconified		*-iconic*
-background {color}	Use {color} for the background	*-background*
-bg {color}		idem				*-bg*
-foreground {color}	Use {color} for normal text	*-foreground*
-fg {color}		idem				*-fg*
-ul {color}		idem				*-ul*
-font {font}		Use {font} for normal text	*-font*
-fn {font}		idem				*-fn*
-boldfont {font}	Use {font} for bold text	*-boldfont*
-italicfont {font}	Use {font} for italic text	*-italicfont*
-menufont {font}	Use {font} for menu items	*-menufont*
-menufontset {fontset} Use {fontset} for menu items	*-menufontset*
-mf {font}		idem				*-mf*
-geometry {geom}	Use {geom} for initial geometry	*-geometry*
-geom {geom}		idem, see |-geometry-example|	*-geom*
-borderwidth {width}	Use a border width of {width}	*-borderwidth*
-bw {width}		idem				*-bw*
*-scrollbarwidth*
-scrollbarwidth {width}	Use a scrollbar width of {width}
-sw {width}		idem				*-sw*
-menuheight {height}	Use a menu bar height of {height} *-menuheight*
-mh {height}		idem				*-mh*
NOTE: On Motif the value is ignored, the menu height
is computed to fit the menus.
-reverse		Use reverse video		*-reverse*
-rv			idem				*-rv*
+reverse		Don't use reverse video		*-+reverse*
+rv			idem				*-+rv*
-xrm {resource}	Set the specified resource	*-xrm*
"========================================================================
VimTip	{{{1 24: changing the default syntax highlighting
http://vim.sourceforge.net/tip_view.php?tip_id=

1. I want *.foo files to be highlighted like HTML files.

:help new-filetype  http://www.vim.org/html/autocmd.html#new-filetype

2. I want to define a syntax file for *.bar files.  Read the above and also

:help mysyntaxfile  http://www.vim.org/html/syntax.html#mysyntaxfile

3. I want to make a few changes to the existing syntax highlighting.  Depending on the x in 5.x, either read the above and page down a few screens, or you may be able to skip right to

:help mysyntaxfile-add  http://www.vim.org/html/syntax.html#mysyntaxfile-add

4. I want to change some of the colors from their defaults.  Again, read

:help mysyntaxfile  http://www.vim.org/html/syntax.html#mysyntaxfile
"------------------------------------------------------------------------
1. replace all extraneous ^M:
:%s/^M$//g

BE SURE YOU MAKE the ^M USING "CTRL-V CTRL-M" NOT BY TYPING "CARROT M"! This expression will replace all the ^M's that have carriage returns after them with nothing. (The dollar ties the search to the end of a line)
2. replace all ^M's that need to have carriage returns:

:%s/^M//g
"------------------------------------------------------------------------
ma       -    set current cursor location as mark a

'a       -    jump to beginning of line of mark a

`a       -    jump to postition of mark a

d'a      -    delete from current line to line of mark a

d`a      -    delete from current cursor position to mark a

c'a      -    change text from current line to line of mark a

y`a      -    yank text to unnamed buffer from cursor to mark a

:marks   -    list all the current marks
"------------------------------------------------------------------------
$       - move to the end of the line          
<End>   - same as $
0       - move to the beginning of the line
<Home>  - same as 0

)   - jump forward one sentence
(   - jump backward one sentence

}   - jump forward one paragraph
{   - jump backward one paragraph

H   - jump to the top of the display       
M   - jump to the middle of the display   
L   - jump to the bottom of the display

'm  - jump to the beginning of the line of mark m
`m  - jump to the location of mark m

G   - jump to end of file
1G  - jump to beginning of file
50G - jump to line 50

'' - return to the line where the cursor was before the latest jump
`` - return to the cursor position before the latest jump (undo the jump).

%  - jump to corresponding item, e.g. from an open brace to its 
     matching closing brace
------------------------------------------------------------------------
"------------------------------------------------------------------------
"------------------------------------------------------------------------
"------------------------------------------------------------------------
"------------------------------------------------------------------------
"------------------------------------------------------------------------
