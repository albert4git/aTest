"xxxx61


VimTip	{{{1 305: Best of VIM Tips (VIM's best Features)
http://vim.sourceforge.net/tip_view.php?tip_id=

Here's a necessarily cryptic list of "MY" Best Vim Tips that I've gleaned
from http://vim.sf.net/  & comp.editors  
http://groups.google.com/groups?safe=off&group=comp.editors

updated version at http://www.rayninfo.co.uk/vimtips.html
------------------------------------------------------------------------------
# Absolutely essential
------------------------------------------------------------------------------
vim.sf.net         : Visit frequently
comp.editors    : "VIM" dominated newsgroup
* # g* g#          : find word under cursor (forwards/backwards)
%                   : match brackets {}[]()
matchit.vim      : % now matches tags <tr><td><script> etc
<C-N> <C-P>   : word completion in insert mode 
<C-X><C-L>    : Line complete SUPER USEFUL
/<C-R><C-W>   : Pull <cword> onto search/command line
:set ignorecase # you nearly always want this
:syntax on    : colour syntax in Perl,HTML,PHP etc
:h slash<C-D> : type control-D and get a list all help topics containing
                   slash (plus use TAB for Help completion)
------------------------------------------------------------------------------
# MAKE IT EASY TO UPDATE/RELOAD_vimrc 
:nmap ,s :source $VIM/_vimrc
:nmap ,v :e $VIM/_vimrc
------------------------------------------------------------------------------
#VISUAL MODE Mappings
:vmap sb "zdi<b><C-R>z</b><ESC> : wrap <b></b> around VISUALLY selected Text
:vmap st "zdi<?= <C-R>z ?><ESC>  : wrap <?=   ?> around VISUALLY selected Text
------------------------------------------------------------------------------
# Exploring
:Ex                             : file explorer note capital Ex
\be                             : builtin buffer explorer
:ls                             : list of buffers(eg following)
:cd ..                          : move to parent directory
------------------------------------------------------------------------------
# Great
guu                             : lowercase line
gUU                             : uppercase line
gf                              : open file name under cursor (SUPER)
ga                              : display hex,ascii value of character under cursor
ggVGg?                          : rot13 whole file
CTRL-A,CTRL-X                   : increment,decerement number under cursor
                                  win32 users must remap CNTRL-A
CTRL-R=5*5                      : insert 25 into text
------------------------------------------------------------------------------
# Makes all other tips superfluous
:h 42                           
:h holy-grail                  
:help!                        
------------------------------------------------------------------------------
# Markers & moving about
'.               : jump to last modification line (SUPER)
`.               : jump to exact spot in last modification line
<C-O>            : retrace your movements in file (old)
<C-I>            : retrace your movements in file (new)
:ju(mps)
:help jump-motions
:history          : list of all your commands
------------------------------------------------------------------------------
# Abbreviations & maps
:map   <f7>   :'a,'bw! c:/aaa/x
:map   <f8>   :r c:/aaa/x
:map   <f9>   :w<CR>:!c:/php/php.exe %<CR>
:map   <f11>  :.w! c:/aaa/xr<CR>
:map   <f12>  :r c:/aaa/xr<CR>
:ab php           : list of abbreviations beginning php
:map ,            : list of maps beginning ,
# For use in Maps
<CR>             : carriage Return for maps
<ESC>            : Escape
<LEADER>         : normally \
<BAR>            : | pipe
------------------------------------------------------------------------------
# List your Registers
:reg             : display contents of all registers
"1p....          : retrieve numeric buffers
------------------------------------------------------------------------------
# Useful trick
"ayy@a            : execute "Vim command" in a text file 
yy@"              : same thing using unnamed register 
------------------------------------------------------------------------------
# Get output from other commands
:r!ls.exe        : reads in output of ls
!!date           : same thing
:%!sort -u       : use an external program to filter content
------------------------------------------------------------------------------
# Multiple Files Management
:wn              : write file and move to next (SUPER)
:bd              : remove file from buffer list (SUPER)
:sav php.html    : Save current file as php.html and "move" to php.html
:sp fred.txt     : open fred.txt into a split
:e!              : return to unmodified file
:w c:/aaa/%      : save file elsewhere
:e #                 : edit alternative file
:e %
:rew                : rewwind to first file in ARGS
:bn                 : next file
:bp                 : next file
:brew
------------------------------------------------------------------------------
# Recording (BEST TIP of ALL)
qq  # record to q
your commands
q
@q to execute
@@ to Repeat
# editing a register/recording
"ap
<you can now see register contents, edit as required>
"add
@a
------------------------------------------------------------------------------
# _vimrc essentials
:set incsearch : jumps to search word as you type (annoying but excellent)
:set wildignore=*.o,*.obj,*.bak,*.exe
:set shiftwidth=3
------------------------------------------------------------------------------
# launching Win IE
:nmap ,f :update<CR>:silent !start c:\progra~1\intern~1\iexplore.exe file://%:p<CR>
:nmap ,i :update<CR>: !start c:\progra~1\intern~1\iexplore.exe <cWORD><CR>
------------------------------------------------------------------------------
# FTPing from VIM
cmap ,r  :Nread ftp://209.51.134.122/public_html/index.html 
cmap ,w  :Nwrite ftp://209.51.134.122/public_html/index.html
gvim ftp://209.51.134.122/public_html/index.html
------------------------------------------------------------------------------
# appending to registers (use CAPITAL)
# yank 5 lines into "a" then add a further 5
"a5yy
10j
"A5yy
------------------------------------------------------------------------------
[I     : show lines matching word under cursor <cword>
------------------------------------------------------------------------------
#Conventional Shifting
:'a,'b>>
# visual shifting (builtin-repeat)
:vnoremap < <gv 
:vnoremap > >gv
------------------------------------------------------------------------------
# searching
/^joe.*fred.*bill/ : normal
/^[A-J]\+/         : search for lines beginning A-J followed by at leat 1 A-J
/forum\(\_.\)*pent   search over possible multiple lines
/fred\_s*joe/i    : any whitespace including newline
/fred\|joe        : Search for FRED OR JOE
------------------------------------------------------------------------------
#substitution
:%s/fred/joe/igc            : general substitute command
:%s/\r//g                   : Delete DOS returns ^M
:'a,'bg/fred/s/dick/joe/gc  : VERY USEFUL
:s/\(.*\):\(.*\)/\2 :  \1/  : reverse fields separated by :
:%s/^.\{-}pdf/new.pdf/  non greedy matching (ie to first pdf)
:s/fred/<c-r>a/g substitute "fred" with contents of register "a"
:%s/^\(.*\)\n\1/\1$/  delete duplicate lines
# non-greedy matching \{-} 
:%s/^.\{-}pdf/new.pdf/
:help /\{-} 
:s/fred/<c-r>a/g substitute "fred" with contents of register "a"
# multiple commands
:%s/\f\+\.gif\>/\r&\r/g | v/\.gif$/d | %s/gif/jpg/
:%s/suck\|buck/loopy/gc  : ORing
:s/__date__/\=strftime("%c")/ : insert datestring
------------------------------------------------------------------------------
# global command
:g/^\s*$/d       :delete all blank lines
:g!/^dd/d        : delete lines not containing string
:v/^dd/d         : delete lines not containing string
:g/fred/,/joe/d  : not line based
:v/./.,/./-1join : compress empty lines
:'a,'b g/^Error/ . w >> errors.txt
:g/cmap\|form/p  : ORing
------------------------------------------------------------------------------
# Paste register *
:redir @*   : redirect commands to paste
:redir END
"*yy        : yank to paste
"*p         : insert paste buffer
------------------------------------------------------------------------------
# Formatting text
gq<CR>
gqap  (a is motion p paragraph (visual mode))
------------------------------------------------------------------------------
# Operate command over multiple files
:argdo %s/foo/bar/
:bufdo %s/foo/bar/ 
:windo %s/foo/bar/ 
------------------------------------------------------------------------------
# Command line tricks
gvim -h
ls | gvim -   : edit a PIPE!!
# vg.ksh (shell script)
# vi all files in directory containing keyword $1 and jump to $1
gvim.exe -c "/$1"  $(grep -isl "$1" *) &
------------------------------------------------------------------------------


"xxxx61
