    ]p 	paste under the current indentation level
==============================================================================

:e doc/potion.txt
:set ft=help
:set ft=text

Use ft=help to preview it
and ft=text to edit it.


*ack.txt*   Plugin that integrates ack with Vim

==============================================================================
USAGE INSTRUCTIONS                                                 *ack-usage*

:Ack[!] {pattern}                                                       *:Ack*

    Search recursively for {pattern}. See |:AckAdd|.
    Also see http://beyondgrep.com for more information.

Final modeline
vim:tw=78:ts=8:ft=help:norl:
vim:tw=78:ts=8:ft=help:norl:

==============================================================================
zo / zO 	Open
zc / zC 	Close
za / zA 	Toggle
zv      	Open folds for this line
zM      	Close all
zR      	Open all
zm      	Fold more (foldlevel += 1)
zr      	Fold less (foldlevel -= 1)
zx      	Update fol
==============================================================================
[m      	previous method start
[M      	previous method end
==============================================================================
[( [{   	previous ( or { or <
])      	next
==============================================================================
:tag Classname  	Jump to first definition of Classname
<C-]>           	Jump to definition
g]              	See all definitions
<C-T>           	Go back to last tag
<C-O> <C-I>     	Back/forward
:tselect Clasn  	Find definitions of Classname
:tjump Clasn    	Find definitions of Classname (auto-select 1st)
==============================================================================
<C-R><C-W>      	insert current word into the command line
<C-R>"          	paste from “ register
Calculator
<C-R>=128/2
==============================================================================
`^ 	Last position of cursor in insert mode
`. 	Last change
`` 	Last jum

==============================================================================
ma 	Mark this cursor position as a
`a 	Jump to the cursor position a
'a 	Jump to the beginning of the line with position 

==============================================================================
Text alignment
:center [width]
:right [width]
:left

==============================================================================
Text objects
p       	Paragraph
w       	Word
s       	Sentence
[ ( { < 	A [], (), or {} block

' " `   	A quoted string

b       	A block [(
B       	A block in [{
t       ???
==============================================================================
Text objects let you operate (with an operator) in or around text blocks (objects).
v 	i 	p
----------------
Operator 	[i]nside or [a]round
vip      	Select paragraph
vipipip  	Select more
yip      	Yank inner paragraph
yap      	Yank paragraph (including newline)
dip      	Delete inner paragraph
cip      	Change inner paragraph
==============================================================================
e / ge  	Previous/next end of word
0       	Start of line
^       	Start of line (after whitespace)
$       	End of line
==============================================================================
h j k l 	Arrow keys
<C-U> / <C-D>
==============================================================================
CTRL-X  	Code text
==============================================================================
Exiting insert mode
Esc / <C-[>     	Exit insert mode
<C-C>           	Exit 
==============================================================================
SANDWICH        ??

