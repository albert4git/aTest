VimTip	{{{1 547: Smarter Table Editing
http://vim.sourceforge.net/tip_view.php?tip_id=

Smarter Table Editing

I frequently need to edit tables where the fields are of varying lengths.
Switching between fields is a pain as the fields can contain multiple words and
using the w key is impractical. Moreover adding a new row to the table is most
troublesome. The new fields need to be aligned with the old entries and tabs
don't work very well. Below is an example of such a table that I pulled from
the vim user's guide:

USAGE                         RESULT    DESCRIPTION

append( {lnum}, {string})     Number    append {string} below line {lnum}
argc()                        Number    number of files in the argument list
argidx()                      Number    current index in the argument list
argv( {nr})                   String    {nr} entry of the argument list

* The table above might not be aligned vertically because of the font vim-online 
is using

I wrote the NextField function (given below) to automatically check the fields
on the line directly above and move the cursor to the beginning of the next
field. The function pads the line if required. I am using 2 or more spaces as
the field separator but the field separator is an argument to the function and
can be changed easily. 

I have mapped <S-Tab> (Shift-Tab) to invoke the function. In the case of the
above table hitting <S-Tab> anywhere on the lines after the line that starts
with "append" will cause the cursor to move to the next field position or just
before it depending on the context. The function will not work on the line
starting with "append" as there is an empty line with no fields above it. It
will work on the empty line below the table titles as there are fields on the
line above it. Same is the case with the empty line below the last line of the
table.

The function takes the following arguments:

fieldsep:   A pattern that specifies the field separator between table columns
minlensep:  Minimum length of field separator. It is used to make the function
            move to the next field even when the cursor is positioned less than
            the length of a field separator from the next table column. Set this
            to 0 if you are not sure what this argument is for.  
padstr:     The string to be used for padding when the current line needs to be
            padded in order to reach the next table column.  
offset:     The offset at which you want the cursor to be positioned in the 
            next table column. Set it to 0 if you want the cursor positioned at
            the start of the next table column.  

(The above table is another case where the function is helpful)

To use the function, place the code below in vimrc and add the following lines
after it:

map <S-Tab> :call NextField(' \{2,}',2,' ',0)<CR>
map! <S-Tab> <C-O>:call NextField(' \{2,}',2,' ',0)<CR>

Note: If the whitespace between the fields consists of anything other than
spaces, the function will not work correctly without changing the field
separator. Use expandtab option if you must use tabs.

Many variations of the above idea are possible. One variation would be to have
a plugin that when invoked on a specific line, extracts the field information
on that line and maps the tab key to move to the next field then onwards. That
way there won't be any dependence on the line directly above the cursor. If you
have any suggestions of your own let me know. If enough people show interest in
enhancing this feature I most likely will code an enhanced version.

--------------------------------Cut Here----------------------------------------
" function: NextField 
" Args: fieldsep,minlensep,padstr,offset
"
" NextField checks the line above for field separators and moves the cursor on
" the current line to the next field. The default field separator is two or more
" spaces. NextField also needs the minimum length of the field separator,
" which is two in this case. If NextField is called on the first line or on a
" line that does not have any field separators above it the function echoes an
" error message and does nothing. 

func! NextField(fieldsep,minlensep,padstr,offset)
    let curposn = col(".")
    let linenum = line(".")
    let prevline = getline(linenum-1)
    let curline = getline(linenum)
    let nextposn = matchend(prevline,a:fieldsep,curposn-a:minlensep)+1
    let padding = ""

    if nextposn > strlen(prevline) || linenum == 1 || nextposn == 0
        echo "last field or no fields on line above"
        return
    endif

    echo ""

    if nextposn > strlen(curline)
        if &modifiable == 0
            return
        endif
        let i = strlen(curline)
        while i < nextposn - 1
            let i = i + 1
            let padding = padding . a:padstr
        endwhile
        call setline(linenum,substitute(curline,"$",padding,""))
    endif
    call cursor(linenum,nextposn+a:offset)
    return 
endfunc
--------------------------------Cut Here----------------------------------------
VimTip	{{{1 554: Smarter Table Editing II
http://vim.sourceforge.net/tip_view.php?tip_id=

In vimtip #547 I described some functions that enable easier navigation
and editing of tables. I have considerably enhanced the functionality
and placed all the relevant code in a script file vimscript #769.

The idea of the script is to automatically extract fields from a table
row and use that information to create maps that aid in editing and
navigation of the table. The user first marks a table row as table
heading. The line does not literally have to be the table heading, but
it should be representative of the typical row of the table in
question.

After this step the script maps tab and shift-tab keys to move between
fields. These mappings work in both insert and normal modes. The tab
mapping is especially useful in insert mode as it inserts the correct
amount of padding to reach the start of the next field. 

The script also has an alignment feature that aligns the fields of the
row with that of the heading. Editing a pre-existing table frequently
leads to misaligned rows and this feature alleviates the need to
manually add/remove padding.

To better illustrate the functionality of the script, I have created
the table below:

====================================================================                                                 
This table      illustrates the use of         table.vim script
====================================================================                                                 
<Leader>th      marks a line as table heading  and
activates maps  for <Tab>                      and <S-Tab> keys
<Leader>th      must be invoked on a well      formed line with
the right       number of columns
This means      that the above line does not   qualify
Also notice     that the field separator is    atleast two spaces
--------------------------------------------------------------------                                                 
when the maps   are active, pressing           <Tab> here
<-- moves here  <Tab> here                     <-- moves here
<==             <S-Tab> moves back to "<=="    <**
<S-Tab> here    moves to "<**" above
--------------------------------------------------------------------                                                 
The maps for    <Tab> and <S-Tab> work in      insert and normal
modes, and can  be deactivated by pressing     <Leader>tt
pressing        <Leader>tt again,              re-enables the maps
--------------------------------------------------------------------                                                 
The script      has some very basic support    for field alignment
 It is very       easy to get out of alignment        when editing
<Leader>ta      on the line above will         fix the line to:
It is very      easy to get out of alignment   when editing
--------------------------------------------------------------------                                                 
<Leader>ta      can be very handy if the user  wants to expand or
contract        fields, just change the width  of the fields on the
  heading line      and press                      <Leader>th
  to mark the       new heading and then           num<Leader>ta
  on the top        line of the table.             num is the
  number of         lines in the table
--------------------------------------------------------------------                                                 
The alignment   command fails when a row has   more fields than
the heading     or when the contents of a      field don't fit
inside the      field, as specified by the     heading row
case1           is        this                 row
case2 is this row      ...                       ...  
this is another     example of case2, there    is no space for 
field           separator on the first         field on above line
====================================================================                                                 

If you don't like the default mappings change them to whatever you
like. The mappings are defined on top of the table.vim script file.

To install the script, place table.vim in the vim macros directory 
and source it in your vimrc using:
source $VIMRUNTIME/macros/table.vim

If you simply want to check the functionality of the script, place
the script file in your current directory, open vim in the same 
directory and use 
:so table.vim

If you have questions/comments or bug-reports to submit, send them
to latif@techuser.net or visit my website http://www.techuser.net

The script can also be downloaded from http://www.techuser.net/files

