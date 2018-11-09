"AAA----------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------"

VimTip	{{{1 187: Making search powerful
http://vim.sourceforge.net/tip_view.php?tip_id=

(Sorry, I think I accidentally added an incomplete tip)

My tip is just a bunch of mappings that can be used while searching.
What it does?
  o. Extend your current search. (kinda emacs search where you can search each occurences 
      one by one and go back to the cursor position.
  o. Scroll/position during mapping.
  o. Other miscellaneous stuffs ;) read on

How to use?
   o. copy and paste the mappings into a file
   o. open vim (like vim .profile)
   o. :so <saved-file>
   o. start using the mappings

Note:
   In case these mappings dont work run like, 'vim -u NONE -U NONE -c "so the-saved-file.vim"'

   Some of my mappings override the default vim bindings. (like Ctrl-A, Ctrl-Q). I
   selected those because, I feel by taking those I can do all the search stuff with
   my left hand.

   One thing I did not like with this is, I usually miss the "search hit bottom" message. I could have
   handled that by complicating the current mappings, but I preferred to make it simple

Mappings Used
/          => regular forward search start
?         => regular backward search start
Rest of the mappings are used during search
Ctrl-A  => search again forward (In normal mode, search forward with the word under cursor)
Ctrl-Q  => search again backward (in normal mode, search backward with the word under cursor)
Ctrl-X  => restore cursor (use at any point of time/during-any-operation mentioned during searching)
Ctrl-F  => search with the word under cursor
Ctrl-G  => incrementally add the letters following the search pattern (in current line)
Ctrl-T Ctrl-T => search for the exact
Ctrl-T Ctrl-Y => search partial (just strips \< and \>)
Ctrl-E  => scroll up during searching
Ctrl-Y  => scroll down during searching
Ctrl-Z Ctrl-Z => position the cursor to mid of screen (like zz in normal)
Ctrl-Z Ctrl-A => position the cursor to top of screen (like zt in normal)
Ctrl-Z Ctrl-X => position the cursor to bottom of screen (like zb in normal)

Misc:
Ctrl-K during search save the current matching line
Ctrl-K in normal mode pastes the saved line

C mappings
Ctrl-V Ctrl-G search for the global variable of the search pattern/word under cursor
Ctrl-V Ctrl-H search for the local variable of the search pattern/word under cursor

" --- cut n paste from here to end of document ---
se nocp incsearch
" core mappings
noremap  / mg/
noremap  ? mg?
ounmap /
ounmap ?
noremap <C-A> mg"gyiw/<C-R>g
cnoremap <C-A> <CR>/<Up>
cnoremap <C-X> <CR>`g
cnoremap <C-Q> <CR>?<Up>

" extending current search mappings
cnoremap <C-F> <CR>yiw<BS>/<C-R>"
cnoremap <C-G> <CR>y/<Up>/e+1<CR><BS>/<C-R>=escape(@",'.*\/?')<CR>

" miscellaneous: copy current line during search and later paste in NORMAL mode
cnoremap <C-K> <CR>"hyy?<Up><CR>/<Up>
noremap <C-K> "hp

" exact/partial search mappings
cnoremap <C-T><C-T> <Home>\<<C-End>\>
cnoremap <C-T><C-Y> <Home><Del><Del><End><Del><Del>

" C global/local variable search mappings
noremap <C-V><C-G> mgyiw<CR>gg/\<<C-R>"\>
noremap <C-V><C-H> mgyiw?^{<CR>/\<<C-R>"\>
cnoremap <C-V><C-G> <CR>yiwgg/\<<C-R>"\>
cnoremap <C-V><C-H> <CR>yiw?^{<CR>/\<<C-R>"\>

" positioning/scrolling during search mappings
cnoremap <C-E> <CR>mt<C-E>`t<BS>/<Up>
cnoremap <C-Y> <CR><C-Y><BS>/<Up>
cnoremap <C-Z><C-A> <CR>zt<BS>/<Up>
cnoremap <C-Z><C-X> <CR>zb<BS>/<Up>
cnoremap <C-Z><C-Z> <CR>zz<BS>/<Up>

" VISUAL mappings
vnoremap / ymg/<C-R>=escape(@",'.*\/?')<CR>
vnoremap ? ymg?<C-R>=escape(@",'.*\/?')<CR>
"AAA----------------------------------------------------------------------------------"
do the following
:%s/\(bill\)\|\(ted\)\|\(harry\)/greg/g <enter>
"AAA----------------------------------------------------------------------------------"
VimTip	{{{1 220: Regexp: Match every word except 'foo'
http://vim.sourceforge.net/tip_view.php?tip_id=

This is a regular expression that matches all words except 'foo'
\v<(foo>)@!\k+>

\v 		Very magic
<		Start-of-word
(Foo>)	The atom 'Foo' followed by end-of-word
@!		Match (with zero length) when the previous atom doesn't
match.
\k+		Match one or more Keywords
>		Match end-of-word.

This is a kool example of using \@! in the middle of a regexp.
The non-magic version is:
\<\(foo\>\)\@!\k\+\>
"AAA----------------------------------------------------------------------------------"
VimTip	{{{1 340: Visual Select And Search
http://vim.sourceforge.net/tip_view.php?tip_id=

The following visual select and search map is a combination of information
from Benji's vimrc file (vmap S y/<C-R>=escape(@",'/\')<CR>) and a tip that
mentions the "\n" to "\\\\n" substitution.

It works for special characters and multiple lines.

vmap \s y/\V<C-R>=substitute(escape(@",'/\'),"\n","\\\\n","g")<CR>/<CR>

Quick explanation:

vmap       visual map
\s         your choice
y          yank selected text
/          search delimiter
\V         no magic, just text
<C-R>=     expression
substitute substitute "\n" for "\\\\n"
escape     escape '/' (delimiter) and '\' in yanked text (@")
<CR>       end expression
/<CR>      search

Warning: Folding will not match if the foldexpr expression is using
getline() to match against a search pattern that spans multiple lines.
"AAA----------------------------------------------------------------------------------"
This tip is inspired by tip #72 which titled 'Remove unwanted empty lines'.
:g/^$/d
==================
Well, if the line contains <Space> and <Tab>
:g/^\s*$/d
==================
If the line contains <Space> and <Tab> and chinese character <Space>, which takes two bytes, and the ASCII is 0xA1 0xA1.

:g/^\(\s\|&#12288;\)*$/d

Herein after the | I paste the `<Space> as a chinese character'.

:g/^[ \t|?]*$/d

"AAA----------------------------------------------------------------------------------"

VimTip	{{{1 378: Auto insert Java class template when editing a new Java file
public class ClassName
{
}
  autocmd BufNewFile *.java
    \ exe "normal Opublic class " .  expand('%:t:r') . "\n{\n}\<Esc>1G"

"AAA----------------------------------------------------------------------------------"
:1,$ s/^M//g
"AAA----------------------------------------------------------------------------------"
Let's say that you're editing C files, so all you would have to do is edit your
ftplugin/c_extra.vim file and include

nmap ,s :find %:t:r.c<cr>
nmap ,S :sf %:t:r.c<cr>

to switch to the corresponding source file, and

nmap ,h :find %:t:r.h<cr>
nmap ,H :sf %:t:r.h<cr>
"AAA----------------------------------------------------------------------------------"
This is a way to quickly prefix a char(or chars) to a parameter list, via :s
The command:
:s/\<\(\I\i*\s\{-}[,)]\)/_\1/g
"AAA----------------------------------------------------------------------------------"
VimTip	{{{1 393: PCRE search and replace (Perl Compatible Regular Expressions)
http://vim.sourceforge.net/tip_view.php?tip_id=

1. Verify in :ver that +perl or +perl/dyn is compiled in.
2. Install Perl if necessary. On Windows, ActivePerl is required.
3. Type  :perldo s/searchme/replaceme/g 
"AAA----------------------------------------------------------------------------------"
" define a highlight colour group for bookmarks
hi default BookmarkCol ctermfg=blue ctermbg=lightblue cterm=bold guifg=DarkBlue guibg=#d0d0ff gui=bold

" define a bookmark / sign: just highlight the line
sign define MyBookmark linehl=BookmarkCol

" add something to the context menue (right mouse)
amenu 1.200 PopUp.-SEP3-			:
amenu 1.200 PopUp.&mark.set\ bookmark		:exe 'sign place 1000 name=MyBookmark line='.line(".").' buffer='.winbufnr(0)<CR>
amenu 1.200 PopUp.&mark.del\ bookmarks		:sign unplace 1000 <CR>
amenu 1.200 PopUp.&mark.list\ bookmarks		:sign list<CR>
"AAA----------------------------------------------------------------------------------"
The solution
a) Make a copy of 'tags' file 
b) Search and replace all variables & functions of C files with _variables & _functions in the copy file, say 'Tags' 
    (ex in Vim ":g/\.c\>/s/^\(\l.\)/_\1/")
c) In Vim :set tags=tags,Tags 
d) Use Ctrl-] to sail through.
"AAA----------------------------------------------------------------------------------"
In many VI implementations you don't need to use the slash character as the
expression delimiter. You can use most non-alphanumeric characters (but not \,
" or |). This is very handy when working with UNIX filenames, as in the
following example:

:s+/usr/local/+/opt/+Whatever character follows the :s is defined to be the delimiter character. If your implementation doesn't support this, you can represent slashes in search and replace expressions by escaping them with backslashes, as follows:

:s/\/usr\/local\//\/opt\//As you can see, the escaping method is much less readable, so if you can use alternative delimiter characters, it's a good idea.

"AAA----------------------------------------------------------------------------------"
VimTip	{{{1 464: search & replace the word under the cursor
http://vim.sourceforge.net/tip_view.php?tip_id=

I have this usefull mapping in my vimrc:

nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/
"AAA----------------------------------------------------------------------------------"
Other solutions:

\(alice.*bob\)\|\(bob.*alice\)     -- "old-style" regexp
"AAA----------------------------------------------------------------------------------"
VimTip	{{{1 574: delete/move matching paragraphs/lines

" Put these in .vimrc, and these four items will become menu items.
" You can of course just type these one liners, if you don't have menus.
" Edit /word/ before pressing return, 
" Note: /word/ can be any perl expression to select paras.

:amenu Mo1./.Delete-Matching-Paras<tab>:1,$!perl :1,$! perl -0000lne 'print if m/word/'

:amenu Mo1./.Delete-Matching-Lines<TAB>:g//d     :g//d<CR>
:amenu Mo1./.Delete-Non-Matching-Lines<TAB>:v//d :v//d<CR>

:amenu Mo1./.Move-Matching-Lines-Top<TAB>g//\.m0     ma:g// .m0<CR>`a
:amenu Mo1./.Move-Non-Matching-Lines-Last<TAB>v//\.m$ ma:v// .m$<CR>`a    

"AAA----------------------------------------------------------------------------------"
VimTip	{{{1 575: chop long lines.

:amenu Mo1.Format.ChopLongLines         :%s!\(.\{-80,}\)\s!\1<C-v>\r!gc       

:amenu Mo1.Format.JoinHypenatedLines    :%s,\v\s+(\w+)-\n(\s*)(\S+)\s*, \1\3^M\2,gc

:amenu Mo1.Format.JoinBackSlashLines    :%s,\\\n,,gc
"AAA----------------------------------------------------------------------------------"
VimTip	{{{1 648: Uniq - Removing duplicate lines
http://vim.sourceforge.net/tip_view.php?tip_id=

There are two versions, the first leaves only the last line, the second leaves only the first line.

g/^\(.*\)$\n\1$/d

g/\%(^\1$\n\)\@<=\(.*\)$/d

Breakdown of the second version:

g//d    <-- Delete the lines matching the regexp

\@<=    <-- If the bit following matches, make sure the bit preceding this symbol directly precedes the match

\(.*\)$   <-- Match the line into subst register 1 

\%( )     <--- Group without placing in a subst register.
^\1$\n   <--- Match subst register 1 followed by end of line and the new line between the 2 lines

In this simple format (matching the whole line), it's not going to make much difference, but it will start to matter if you want to do stuff like match the first word only 

This does a uniq on the first word in the line, and deletes all but the first line:

g/\%(^\1\>.*$\n\)\@<=\(\k\+\).*$/d


"AAA----------------------------------------------------------------------------------"
1. Number all the lines in a file:
:%s/^/\=line('.').'^I'/

2. Number a range of lines (from line 10 to line 20):
:10,20s/^/\=line('.').'^I'/

3. Number a range of lines sequentially starting from 1:
:let counter=0|10,20g//let counter=counter+1|s/^/\=counter.'^I'

4. To number all the paragraphs in range starting from 1:
(assuming the paragraphs are separated by one or more blank lines)
:let counter=0|1,20g/^$\n^\s*[^\s]/let counter=counter+1|+1s/^/\=counter.'^I'

Note: The above command does not work for the first paragraph in the file if
there is no blank line above it.

see also:
:help sub-replace-special
:help sub-replace-expression
VimTip	{{{1 802: Specify what you do not want to have in a search and other helpful searches.
http://vim.sourceforge.net/tip_view.php?tip_id=

Sometimes, I found useful to specify in a search or a substitution what I do
not want to have. There is a way with Vim to do such a thing:
/^\(\(The_Regular_Expression\)\@!.\)*$

This will find everything but the regular expression you have specified. For
example, if we want to find all the lines not containing the word 'foo', simply
do:
/^\(\(.*foo.*\)\@!.\)*$

If we want to find a more complex regular expression on multiple lines,
like all the lines which do not begin with 'foo' with 'bar'
somewhere else and the word 'magic' at the end of the next line, do:
/^\(\(^foo.*bar.*\n.*magic$\)\@!.\)*$

Another thing useful in searches and substitutions is to ommit some
information, for instance, suppose we want to find every 'foo' with 'bar'
somewhere else on the line, but we do not want to take the 'bar' part in the
search (let's say not highlight it if the hlsearch is set), we can do:

/foo\(.*bar\)\@=
/foo.*\(bar\)\@=
/foo.\{-}\(bar\)\@=

The first one will highlight only 'foo' in lines containing both 'foo' and
'bar'. The second one will highlight 'foo' and everything up to the longest
much where 'bar' appear on the line. The third one, will do the same thing, but
with the shortest match (non-greedy). So, if there is more than one 'bar' on
the same line, the search will stop right before the first occurrence of 'bar'.

We can also do the opposite. Let's say for example finding all the 'foo' with
'bar' some place else without highlighting the 'foo', we can do:

/\(foo.*\)\@<=bar
/\(foo\)\@<=.*bar
/\(foo\)\@<=.\{-}bar

The first one will highlight only 'bar' in lines containing both 'foo' and
'bar'. The second one will highlight everything right after 'foo' up to the
last 'bar' on the line. The third one will highlight everything right after
'foo' and up to the first 'bar' (non-greedy).

There is also a way to specify that a part of the regular expression should not
be there. As an example, if we want to search for all the lines where there is
no word 'foo' preceding the word 'bar', we can do:

/\(foo.*\)\@<!bar

Or, on the other sie, find all the word 'foo' where there is no 'bar'
following, we can do:

/foo\(.*bar\)\@!

Now, let's see another kind of search. Imagine we want to find every 'bar'
where there is no 'foo' before it. We can do such a thing 

There is a way with vim to specify where the beginning of the search pattern
should start. As an example, suppose we want to find the lines beginning with
'foo', with the word 'bar' somewhere else and then 'magic', but that we only
want to highlight 'magic' and everything up to the end to the line. We can use
'zs' for that like this:
/^foo.*bar.*\zsmagic.*

We can also do the opposite, specify where the search sould stop highlight, for
example, if we want to highlight every 'foo' with 'bar' with 'magic' but not
highlighting 'magic', we can do:
/foo.*bar.*\zemagic
/foo.*bar.\{-}\zemagic

The last example was non-greedy, that is, mathches up to the first occurence of
the word 'magic' in a line.

Other interesting searches are the beginning of a file. For example to find the
first word of a file, we can do (this one needs the +syntax feature when
compiled):

/\%^\_.\{-}\<.\{-}\>

Or the first occurence of a word in a file:
/\%^\_.\{-}\zsVIM

We can also search for something at the end of a file. For example, the last
occurence of 'VIM' in a file (this one is tricky):

/VIM\ze\(\(VIM\)\@!\_.\)*\%$

It finds the word 'VIM' where there is no word 'VIM' after it until the end of
the file!

There are a lot of other searches of substitutions pattern out there. But I use
these very often for complex substitution (often for multiple line purpose).

For more information, you can type:
:h /\@=
:h /\@!
:h /\@<=
:h /\@<!
:h /\@>
:h /\zs
:h /\ze
:h /\%^
:h /\%$

"AAA----------------------------------------------------------------------------------"

VimTip	{{{1 654: special characters in VIM substitution

void
howdy(void)
{
   M00 =
   M01 =
   M10 =
   M11 =
   M20 =
   M21 = 0;
}

Now you want to change the code like

void
howdy(void)
{
   M[0][0] =
   M[0][1] =
   M[1][0] =
   M[1][1] =
   M[2][0] =
   M[2][1] = 0;
}

You can easily do that with

:g/\(M\)\([0-9]\)\([0-9]\)/s//\1[\2][\3]/g

Here,
   \1 is a special substitute character meaning first pair of the search pattern.

To specify a pair in your search pattern,
simply enclose your search pattern with "\(" and "\)".

Thus, in the above example
\(M\) corresponds to \1, and
\([0-9]\) to \2 and etc...

And substitute pattern "\1[\2][\3]" means
"1st pair" + "[" + "2nd pair" + "]" + "[" + "3rd pair" + "]",
which is what we want here.
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 658: Switching to unit test module for python
http://vim.sourceforge.net/tip_view.php?tip_id=

Doing a lot of programming in Python, I need to switch quickly between Python
module and corresponding unit-test module. Often there is one unit-testing
module for multiple python modules. 

This function allows you to switch to correct unit testing module quickly,
using the filename hardcoded at the end of the file. Idea is stolen from
Twisted sources.

Put this to your ftplugin/python.vim:

nmap <buffer> <F5> :call JumpToTestFile()<CR>

fun! JumpToTestFile()
	let line = getline("$")
	if line =~ "^### testfile: "
		let filename = strpart(line, 14)
		execute ":e " . filename
	else
		echo "TEST PATTERN ### testfile: NOT FOUND!"
	endif
endfun
