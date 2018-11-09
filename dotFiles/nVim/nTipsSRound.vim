
"AAA----------------------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------------------
The mnemonic used is perls qw() operator.
  " 'quote' a word
  nnoremap qw :silent! normal mpea'<esc>bi'<esc>`pl
  " double "quote" a word
  nnoremap qd :silent! normal mpea"<esc>bi"<esc>`pl
  " remove quotes from a word
  nnoremap wq :silent! normal mpeld bhd `ph^M
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 855: Automatically add closing brace to block when coding
http://vim.sourceforge.net/tip_view.php?tip_id=

I got fed up with having to add the closing brace to a code block, so I've got
my Vim to automatically add a closing brace when coding in c#. Add the
following to any appropriate ftplugin files (prefereably in vimfiles/ftplugin)
so they don't get overwritten on upgrades.

The script will automatically add the closing brace and position the cursor on
a line between the opening and closing braces. It ignores braces in comments,
strings and if the word new is in the line (e.g. for string[] myArray = new
string[] {"a", "b"}.

There are maps for enclosing code in a set of braces.

imap { <esc>:call ReplaceCurly()<Cr>cl

function! ReplaceCurly()
    imap { {
    " only replace outside of comments or strings (which map to constant)
    let elesyn = synIDtrans(synID(line("."), col(".") - 1, 0))
    if elesyn != hlID('Comment') && elesyn != hlID('Constant') && match(getline("."), "\\<new\\>") < 0
      exe "normal a{"
      " need to add a spare character (x) to position the cursor afterwards
      exe "normal ox"
      exe "normal o}"
      exe "normal kw"
    else
      " need to add a spare character (x) to position the cursor afterwards
      exe "normal a{x"
    endif
    imap { <esc>:let word= ReplaceCurly()<Cr>cl
endfunction

"Surround code with braces
nmap <leader>{} O{<esc>ddj>>ddkP
vmap <leader>{} <esc>o{<esc>ddgv>gvdp

"AAA----------------------------------------------------------------------------------------------

Try this:
1. Create new file (for example, qwerty.txt).
2. Execute the following:

    :syntax on
    :syntax include @CPP syntax/cpp.vim
    :syntax region cppSnip matchgroup=Snip start="@begin=cpp@" end="@end=cpp@" contains=@CPP
    :hi link Snip SpecialComment

3. Now type in following text:

This is simple text; and this is C++:
@begin=cpp@
  int q;
  struct w { double e };
@end=cpp@

4. Now you have text between @begin=cpp@ and @end=cpp@ highlightied as C++, though filetype is not 'cpp'.

Isn't it magnificent?

-------------------------
Here is more useful version:

function! TextEnableCodeSnip(filetype,start,end) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  unlet b:current_syntax
  execute 'syntax region textSnip'.ft.'
    \ matchgroup=textSnip
    \ start="'.a:start.'" end="'.a:end.'"
    \ contains=@'.group
  hi link textSnip SpecialComment
endfunction

Now we can write something like:
  call TextEnableCodeSnip('c'   ,'@begin=c@'   ,'@end=c@'  )
  call TextEnableCodeSnip('cpp' ,'@begin=cpp@' ,'@end=cpp@')
  call TextEnableCodeSnip('sql' ,'@begin=sql@' ,'@end=sql@')
to enable highlighting of code pieces for c, cpp and sql.


"???
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 874: Fold C-style Comments
http://vim.sourceforge.net/tip_view.php?tip_id=

Do want to make the 10-line /*style*/ comment disappear?

You can add folding capability to C-style comments using the command:
au BufNewFile,BufRead *.cpp,*.c,*.h,*.java   syn region myCComment start="/\*" end="\*/"  fold keepend transparent

This will work on C, .h, C++, and Java files.

The "keepend" and "transperent" commands are necessary to avoid overriding the default syntax highlighting of comments.

If you want to keep the "/*" beginning of the comment in the folded text, you can
use the following function:

  set foldtext=MyFoldText()
  function MyFoldText()
    let line = getline(v:foldstart)
    let sub = substitute(line, '^[\t ]*', '', '')
    let nlines = v:foldend - v:foldstart + 1
    if strlen(nlines) == 1
      let nlines = "  " . nlines
    elseif strlen(nlines) == 2
      let nlines = " " . nlines
    endif
    return "+-" . v:folddashes . nlines . ": " . sub
  endfunction

The resulting line should look about the same as the default, without removing the comments.
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 863: Vimsessions utilization
http://vim.sourceforge.net/tip_view.php?tip_id=

I often use vimsession-files to save set of options, buffers, etc., that are
specific for each job (see :help mksession).  To save some additional settings,
which are not saved in vimsession (like commands, autocommands, functions), I
use vimsession-extra file.  When I want modify that extra-file, it had to type
something like :new <c-r>=v:this_session<cr>, then edit commandline to get
proper extra-file name and edit it.  It was tiring.  So I wrote this plugin:

	command! -bar SessSave call SessSave()

	function! SessSave()
		if v:this_session==""
			call confirm("There is no loaded session","&Ok",1)
			return
		endif
		if 2==confirm('Save session '.v:this_session.'?',"&No\n&Yes",1)
			exe 'mksession! '.v:this_session
			call confirm('Session '.v:this_session.' saved.','&Ok',1)
		endif
	endfunction

	function! SessExtraFname()
		if v:this_session==""
			call confirm("There is no loaded session","&Ok",1)
			return ''
		endif
		return substitute(v:this_session,'\.[^.]*$','x.vim','')
	endfunction

	command! -bar SessExtraOpen   exe 'new '.SessExtraFname()
	command! -bar SessExtraReread exe 'source '.SessExtraFname()

I also put following mapping there: nmap <c-z>l :SessSave<cr> Of course, you
can change lhs to whatever you want, or add some extra mappings, for example
for SessExtraOpen or SessExtraReread.




"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 977: Quickly align whole file
http://vim.sourceforge.net/tip_view.php?tip_id=

gg=G would quickly align the whole file, but you will be at the beginiing of
the file after that. To align and still remain in the same line where you were,
just add this mapping to your .vimrc

map <F7> mzgg=G'z<CR>
"AAA----------------------------------------------------------------------------------------------
For example:  map  gC :'a,. s/^/ */^M:. s/\(.*\)/\1^V^V^M **************\//^M:'a s/\(.*\)/\/**************^V^V^M\1/^M

maps the sequence gC to a macro which wraps a block of text, from the current line back to the line marked by the "a" in a C style comment like:

 /************************
  *
  * ....
  * ....
  ************************/
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 988: Surround selection with text
http://vim.sourceforge.net/tip_view.php?tip_id=

Inspired by tip #987 I wrote a small function to surround selected text in Visual-mode with text.
e. g. to quote a selection:

before: bla bla Selected Text bla bla
:'<,'>call Surround('"', '"')<CR>
after   : bla bla "Selected Text" bla bla

fun! Surround(s1, s2) range
    exe "normal vgvmboma\<ESC>"
    normal `a
    let lineA = line(".")
    let columnA = col(".")

    normal `b
    let lineB = line(".")
    let columnB = col(".")

    " exchange marks
    if lineA > lineB || lineA <= lineB && columnA > columnB
        " save b in c
        normal mc
        " store a in b
        normal `amb
        " set a to old b
        normal `cma
    endif

    exe "normal `ba" . a:s2 . "\<ESC>`ai" . a:s1 . "\<ESC>"
endfun

Surround also works for a selection over more than one line.
before: bla bla Selec
ted Text bla bla
:'<,'>call Surround('"', '"')<CR>
after   :  bla bla "Selec
ted Text" bla bla

Some handy mappings:
vnoremap _" :call Surround('"', '"')<CR>
vnoremap _( :call Surround('(', ')')<CR>
vnoremap _[ :call Surround('[', ']')<CR>
vnoremap _{ :call Surround('{', '}')<CR>

I defined it as a command to perform fast on-demand-surroundings
command! -range -nargs=* Sur call Surround(<f-args>)

before: bla bla Selected Text bla bla
:'<,'>Sur (<\ - -\ >) 
after   : bla bla (< -Selected Text- >) bla bla

Hope this helps somebody else.

"AAA--Java:wa--------------------------------------------------------------------------------------------
VimTip	{{{1 994: manipulate quotes with <CR> and <BS>
http://vim.sourceforge.net/tip_view.php?tip_id=

In java I found that I rarely needed to insert a carriage return in the middle of a string without first adding a "+ to the end.
Also I found that when deleting the opening quote of a string which is part of a longer string
I almost always indent to connect it back up to the previous line. So here was my solution.
This is my first attempt to make something like this with VIM so the coding might be a bit messy, but it gets the job done.

For example when typing this in:

String s = "A very long string <cursor>

If you press enter at this point you will get

String s = "A very long string "+
  "<cursor>

At this point pressing backspace you will be back where you were before.

It's come in handy. Let me know.

" If the cursor is in the middle of a quote block when <CR> is pressed
" a quote is added to the end of the line followed by a plus, a <CR>
" and another quote.
function! Quotereturn()
	let before=strpart(getline(line(".")), 0, col(".")-1)
	"let after=strpart(getline(line(".")), col("."))
	if(before =~ '^\([^"]*"\([^"\\]\|\\.\)*"\)*[^"]*"\([^"\\]\|\\.\)*$')
		return "\"+\"\<Left>\<CR>\<Right>"
	else
		return "\<CR>"
	endif
endf
inoremap <CR> <C-R>=Quotereturn()<CR>

" If you backspace over a quote and it's a continuation fromanother line
" the two strings will be concatenated with quotes, spaces, and + removed.
function! Quotebackspace()
	if( (strpart(getline(line(".")), 0, col(".")-1) =~ '^\s*"$') && (getline(line(".")-1) =~ "\"+$") )
		return "\<Esc>d0kgJhhxxxi"
	else
		return "\<C-H>"
	endif
endf
inoremap <BS> <C-R>=Quotebackspace()<CR>


"AAA----------------------------------------------------------------------------------

VimTip	{{{1 966: Multi-line abbreviations are possible!
http://vim.sourceforge.net/tip_view.php?tip_id=

I searched the Internet intently, hoping to find how to
incorporate multi-line abbreviations in VIM.  I was taken
aback when I discovered that everyone maintained that
multi-line abbreviations were not possible.  I've found this
to be untrue. After trying various permutations of carriage
returns, line feeds, and line continuation characters, I've
determined that if you place a line continuation character
(\) and a carriage return (<CR>) at the BEGINNING of each
line, then multi-line abbreviations are possible.  Here is
an example of a multi-line abbreviation:

iab abtest 
\<CR>this is line one
\<CR>this is line two
\<CR>this is line three

It's important to note here that there must be a space
following the abbreviation name, in order to avoid
this error when sourcing abbreviations defined like 
this:

   E474: Invalid argument

This caveat means that the abreviation definition
quoted looks like this:

   "iab abtest " <--Space after the abbreviation name!


To simplify creating multi-line abbreviations, I've
included two substitution commands which will add
or remove the \<CR> to the beginning of each line.
These are mapped in visual mode, and are bound to the
Ctrl-C and Ctrl-Alt-C keys:

   :vmap <C-c>   :s/^/\\\<\C\R\>/<CR>:nohlsearch<CR>
   :vmap <C-A-c> :s/\\<CR[>]//<CR>:nohlsearch<CR>

To create a multi-line abbreviation using these 
mappings, follow these steps. This example creates
a multi-line abbreviation for the proverbial
"hello world" C program:

#include <stdio.h>

void main(void) {

  printf("Hello World\n");

}


1. Place the :vmap key mappings into a file and source it.
2. Place the cursor on the first line and press Shift-V.
3. Press the 'j' key until the entire code block is highlighted.
4. Press Ctrl-C.  This places the \<CR> in front of each line.
   It should now look like this:

\<CR>#include <stdio.h>
\<CR>
\<CR>void main(void) {
\<CR>
\<CR>  printf("Hello World\n");
\<CR>
\<CR>}


5. Add an "iab cmain " (unquoted) just above the abreviation, and insure 
   there's a space after cmain. It should look like this:

iab cmain 
\<CR>#include <stdio.h>
\<CR>
\<CR>void main(void) {
\<CR>
\<CR>  printf("Hello World\n");
\<CR>
\<CR>}


6. Now simply source the file, and type cmain to expand the abbreviation.
   That's it!  I've included a perl, java, and C multi-line abbreviation below that 
   you may find useful.


iab abperl 
\<CR>###############################################################################
\<CR>#	
\<CR># File:
\<CR>#
\<CR># Date:
\<CR>#
\<CR># Description:
\<CR>#
\<CR># Syntax:
\<CR>#
\<CR># Author:
\<CR>#
\<CR># Copyright (c) 
\<CR>#
\<CR>#
\###############################################################################



iab abjava 
\<CR>/////////////////////////////////////////////////////////////////////////////
\<CR>//	
\<CR>// File:
\<CR>//
\<CR>// Date:
\<CR>//
\<CR>// Description:
\<CR>//
\<CR>// Syntax:
\<CR>//
\<CR>// Author:
\<CR>//
\<CR>// Copyright (c) 
\<CR>//
\<CR>//
\//////////////////////////////////////////////////////////////////////////////



iab abc 
\<CR>/*****************************************************************************
\<CR>*	
\<CR>* File:
\<CR>*
\<CR>* Date:
\<CR>*
\<CR>* Description:
\<CR>*
\<CR>* Syntax:
\<CR>*
\<CR>* Author:
\<CR>*
\<CR>* Copyright (c) 
\<CR>*
\<CR>*
\******************************************************************************/


