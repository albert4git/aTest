"AAA----------------------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 639: Comment highlight #ifdef DEBUG for code-read ease (C/C++)
http://vim.sourceforge.net/tip_view.php?tip_id=

Hi all,

If your C/C++ code is scattered with statements like
#ifdef DEBUG
   // Some code..
   cout << "Debug output: blah" << endl;
#endif

and you would like to highlight these segments in a different colour (so that
you can skip them visually), add the following code in your .vimrc (colouring
follows that of comments)

CODE STARTS
syn region MySkip contained start="^\s*#\s*\(if\>\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*#\s*endif\>" contains=MySkip

let g:CommentDefines = ""

hi link MyCommentOut2 MyCommentOut
hi link MySkip MyCommentOut
hi link MyCommentOut Comment

map <silent> ,a :call AddCommentDefine()<CR>
map <silent> ,x :call ClearCommentDefine()<CR>

function! AddCommentDefine()
   let g:CommentDefines = "\\(" . expand("<cword>") . "\\)"
   syn clear MyCommentOut
   syn clear MyCommentOut2
   exe 'syn region MyCommentOut start="^\s*#\s*ifdef\s\+' . g:CommentDefines . '\>" end=".\|$" contains=MyCommentOut2'
   exe 'syn region MyCommentOut2 contained start="' . g:CommentDefines . '" end="^\s*#\s*\(endif\>\|else\>\|elif\>\)" contains=MySkip'
endfunction

function! ClearCommentDefine()
   let g:ClearCommentDefine = ""
   syn clear MyCommentOut
   syn clear MyCommentOut2
endfunction

CODE ENDS

To see the effect, position the cursor on the word DEBUG in the C code snippet above and type ,a


"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 641: Highlighting of method names in the definition (C++)
http://vim.sourceforge.net/tip_view.php?tip_id=

When editing big cpp files, it can be very convenient to highlight the method name
(the part after "::") in a method definition.

--> I use the following function in my .vimrc:

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
    syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
    hi def link cppFuncDef Special
endfunction

--> I have another line to call this function automatically when editing a C++ file:

autocmd Syntax cpp call EnhanceCppSyntax()

--> That's it! This doesn't work in all cases (for instance, it doesn't highlight constructors
using an initialization list on the same line) but it shouldn't highlight function calls
(such as "MyClass::MyStaticMethod( int foo );" )
Don't hesitate to extend the regular expression for a more accurate matching...

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 701: Simple code beautifier

Occasionally, I get code from other people who, for instance, don't like to put spaces in the for-loops or assignments.
For example, what I get looks like
     for(int j=0;j<size;j++)
            if(vector[j]>d)
and what I would like to see is
     for ( int j = 0; j < size; j ++ )
            if ( vector[j] > d )

Here are a few vimrc lines, that can help. Put them in your .vimrc, or .vim/after/ftplugin/cpp.vim (or whatever language you are using),
then you can beautify at least single lines using one mouse click.

nmenu Misc.Beautify.For          :s/for\s*(\s*/for ( /<CR>:s/\s*)\s*$/ )/<CR>:s/\(\i\+\)\s*=\s*/\1 = /<CR>:s/\s*\([=<>!]=\\|[<>]\)\s*/ \1 /<CR>:s/\s*\(--\\|++\)/\1/<CR>:s/\s*;\s*/; /g<CR>
nmenu Misc.Beautify.Func        :s/\s*)/ )/g<CR>:s/\s*\([(,]\)\s*/\1 /g<CR>:s/(\s\+)/()/g<CR>
nmenu Misc.Beautify.If              :s/if\s*(\s*/if ( /<CR>:s/\s*)\s*$/ )/<CR>:silent s/\s*\([=<>!]=\\|[<>]\)\s*/ \1 /<CR>
nmenu Misc.Beautify.Assign      :s/\s*\([-+*\/&\|]\?\)\s*=\s*/ \1= /g<CR>

(Each nmenu-line must be one single line!)
Tip: if you need to beautify several lines, tear of the menu.
Of course, being simple regexp's, these little helpers can be fooled pretty easily by complicated code, but they should work for 90% of your code.

"AAA----------------------------------------------------------------------------------------------
" automatically give executable permissions if filename is *.sh
au BufWritePost *.sh :!chmod a+x <afile>
" automatically insert "#!/bin/sh" line for *.sh files
au BufEnter *.sh if getline(1) == "" | :call setline(1, "#!/bin/sh") | endif
" automatically give executable permissions if file begins with #!/bin/sh
au BufWritePost * if getline(1) =~ "^#!/bin/[a-z]*sh" | silent !chmod a+x <afile> | endif
"AAA----------------------------------------------------------------------------------------------


Now here is the statusline:
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"AAA----------------------------------------------------------------------------------------------
I found that lines beyong textwidth in .c and .h files can be highlighted using the below line in .vimrc.

au BufNewFile,BufRead *.c,*.h exec 'match Todo /\%>' .  &textwidth . 'v.\+/' 
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 963: Highlight tabs which do not appear at the beginning of lines
http://vim.sourceforge.net/tip_view.php?tip_id=

Tabs are fine - as long as they're only used for indentation.  That way,
everyone editing the code can change the tab width to their preferred size and
be happy.  If tabs are used for lining things up relative to normal characters
the spacing looks different for different tab widths.  I like to highlight
these tabs for manual cleanup by adding:

    syn match cTodo display "\(\_^\|\_^\t\+\)\@<!\t"

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1017: Highlight text inside matching parentheses
http://vim.sourceforge.net/tip_view.php?tip_id=

Sometimes (specially when programming in lisp dialects) it's
useful to easily find matching parentheses. vim provides
the showmatch option but you need to (re)type the closing
parenthesis in order to find the opening one. Alternatively,
you can also type '%' over an already written parenthesis
so the cursor travel to its matching pair. This is almost ok,
but if you are inside a parenthesized form perhaps you
don't want to lose you current cursor position but just
to find the delimiting parenthesis and continue typing
(or whatever you were doing). So I find more convenient
to define the following simple key bindings:

nmap <a-key> m[%v%:sleep 350m<CR>`[

imap <a-key> <ESC>m[%v%:sleep 350m<CR>`[a

They simply put a mark, visit the opening parenthesis
with '%', enter visual mode (to highlight the parenthesized
block), travel to the closing parenthesis with '%', sleep
for a while and return to the mark. The second one is for
visual mode, so it enters normal mode first and returns
to visual mode via 'a' at the end. Of course, they both
work with (:), [:], {:} or whatever pairs the matchpairs
option happens to be setted to.
Personally I prefer <M-p> for the key.


"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 969: Highlight simple python syntax errors
http://vim.sourceforge.net/tip_view.php?tip_id=

If you want simple syntax errors highlighted in Python (such as if statements with a missing colon at the end) then do the following:

1. Download and install vimscript #30
2. Search for the line beginning "syn match pythonError". Add the following lines after that:

    syn match pythonError		"^\s*def\s\+\w\+(.*)\s*$" display
    syn match pythonError		"^\s*class\s\+\w\+(.*)\s*$" display
    syn match pythonError		"^\s*for\s.*[^:]$" display
    syn match pythonError		"^\s*except\s*$" display
    syn match pythonError		"^\s*finally\s*$" display
    syn match pythonError		"^\s*try\s*$" display
    syn match pythonError		"^\s*else\s*$" display
    syn match pythonError		"^\s*else\s*[^:].*" display
    syn match pythonError		"^\s*if\s.*[^\:]$" display
    syn match pythonError		"^\s*except\s.*[^\:]$" display
    syn match pythonError		"[;]$" display
    syn keyword pythonError         do

"AAA----------------------------------------------------------------------------------------------
