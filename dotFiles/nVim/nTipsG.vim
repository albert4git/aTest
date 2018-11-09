
"AAAAyy----------------------------------------------------------------------------------
"AAAAyy----------------------------------------------------------------------------------
"AAAAyy----------------------------------------------------------------------------------
"AAAAyy----------------------------------------------------------------------------------
I use the command 'gf' quite often. But with this command the current buffer is
hidden. To avoid that I use the following mapping :

map gw <Esc>:sp %<CR> gf
"AAAAyy----------------------------------------------------------------------------------

VimTip	{{{1 227: Power of :g
http://vim.sourceforge.net/tip_view.php?tip_id=

:g is something very old and which is very powerful. I just wanted to illustrate the use of it 
with some examples. Hope, it will be useful for someone.

Brief explanation for ":g"
-------------------------
Syntax is:
    :[range]:g/<pattern>/[cmd]
You can think the working as, for the range (default whole file), execute
the colon command(ex) "cmd" for the lines matching <pattern>. Also, for all
lines that matched the pattern, "." is set to that particular line (for
certain commands if line is not specified "." (current line) is assumed).

Some examples
-------------
Display context (5 lines) for all occurences of a pattern
    :g/<pattern>/z#.5
    :g/<pattern>/z#.5|echo "=========="
    << same as first, but with some beautification >>
Delete all lines matching a pattern
    :g/<pattern>/d
Delete all blank lines (just an example for above)
    :g/^\s*$/d
Double space the file
    :g/^/pu =\"\n\"
    :g/^/pu _
    << the above one also works >>
Copy all lines matching a pattern to end of file
    :g/<pattern>/t$
Yank all lines matching a pattern to register 'a'
    0"ay0:g/<pattern>/y A
Increment the number items from current line to end-of-document by one
    :.,$g/^\d/exe "normal! \<c-a>"
Comment (C) lines containing "DEBUG" statements
    g/^\s*DEBUG/exe "norm! I/* \<Esc>A */\<Esc>"
A Reverse lookup for records
(eg: An address book, with Name on start-of-line and fields after a space)
    :g/<patern>?^\w?p               "if only name is interested
    :g/<patern>/ka|?^\w?p|'ap       "if name and the lookup-line is interested
    :g/<patern>/?^\w?|+,/^[^ ]/-1p  "if entire record is interested
Reverse a file (just to show the power of 'g')
    :g/^/m0

Foot note 1: use :v to negate the search pattern
Foot note 2: Some explanation of commonly used commands with :g
 :2,8co15 => Copy lines 2 through 8 after line 15
 :4,15t$  => Copy linesa 4 through 15 towards end of document (t == co)
    :-t$  => Copy previous line to end of document
     :m0  => Move current line to the top of the document
:.,+3m$-1 => Move current line through cur-line+3 to the last but one line
             of the document
Foot note 3: Commands used with :g are ex commands, so a help search should
             be,
                :help :<help-topic>
                eg. :help :k

