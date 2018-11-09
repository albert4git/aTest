"AAA----------------------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 562: modeline sets vimrc options on a per file basis
http://vim.sourceforge.net/tip_view.php?tip_id=

Sometimes I want vi to treat a file different than the .vimrc file.
For example, I have a file that has fixed length text records,
 tabs in this file would mess it up.
Setting the option expandtab will force tabs to be converted to spaces.

Near the top of the file I put a line that says:
# vim: set expandtab:

When I open the file after that it will replace ^I (tab characters) with the
correct number of spaces.

"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 563: useful Occurences under cursor and with prompt
http://vim.sourceforge.net/tip_view.php?tip_id=

[I is very useful  display all lines that contain the keyword under the cursor
so following are two function for selection contain in two way under cursor or prompt find

a big thanx Yegappan give me the hint for ijump


function! s:UnderOccurences()
   exe "normal [I"
   let nr = input("Which one: ")
   if nr == ""
       return
   endif
   exe "normal " . nr . "[\t"
endfunction!

function! s:FindOccurences()
   let pattern = input("Prompt Find: ")
   if pattern == ""
       return
   endif
   exe "ilist " . pattern
   let nr = input("Which one: ")
   if nr == ""
       return
   endif
   exe "ijump " . nr . pattern 
endfunction
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 565: never see ^M again
http://vim.sourceforge.net/tip_view.php?tip_id=

There have been plenty of tips dealing with ridding of ^M characters
appended to dos text files. However, all of the previous tips involve
some typing. With the following command in your vimrc, you won't have to
type anything. Moreover, you are not likely to see ^M characters again
at all, they get removed before you get to view the file. The only
exception being readonly files.

autocmd BufRead * silent! %s/^M$//

Note: Use <C-V><C-M> to enter ^M and not caret followed by M
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 566: Autocomplete with TAB when typing words
"-- Use TAB to complete when typing words, else inserts TABs as usual.
"-- Uses dictionary and source files to find matching words to complete.

"-- See help completion for source, 
"-- Note: usual completion is on <C-n> but more trouble to press all the time.
"-- Never type the same word twice and maybe learn a new spellings!
"-- Use the Linux dictionary when spelling is in doubt.
"-- Window users can copy the file to their machine.
"-- http://www.cs.albany.edu/~mosh - Mohsin Ahmed

function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction

:inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

:set  dictionary="/usr/dict/words"     


"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 570: Align badly formatted text region into table.
http://vim.sourceforge.net/tip_view.php?tip_id=

" What: Aligns badly formatted text into a table.

" How: Select region and press <A-a>, 
"    in this case aligns the '=', you decide the centering string
"    before pressing return

" You need the perl script "align" from
"    http://www.cs.albany.edu/~mosh/Perl/align 
" Inspired by Emacs align.el  
" Works on Windows and Unix.

" Default key Mapping is:

:vmap <A-a> !perl ~/perl/align -c:=  


" Example input:
"  x = 1;
"    xyz = 245;
"  a=1;

" Example Output:
"    x = 1;
"  xyz = 245;
"    a = 1;
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 582: Quick way to write to your file.
http://vim.sourceforge.net/tip_view.php?tip_id=

Put this in your .vimrc
map , :w^M
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 584: Awesome text formatter
http://vim.sourceforge.net/tip_view.php?tip_id=

The berkeley program 'par' can format/justify 
text/c-comments (examples below) better (and much more) than 
the default unix formatters.

Download from: http://www.cs.berkeley.edu/~amc/Par/  

Usage:

Select region and press <A-q> to format.
In ~/_vimrc put (-j is for justify lines)

  :set formatprg=par\ -w60          
  : map <A-q> {v}!par -jw60<CR>
  :vmap <A-q> !par -jw60<CR>          

"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 586: Smarter Pasting
Frequently I yank a few words or part of a line and like to have them pasted on
a separate line. Vim provides the put and put! commands for that purpose but
they are not mapped by default to anything.  Typing the commands is much slower
than inserting a line and pasting to it so I have created the following maps:

nnoremap ,p :pu "<CR>
nnoremap ,P :pu! "<CR>
"AAA----------------------------------------------------------------------------------------------"
	:'<,'>Vissort
		seven eight  nine
		ten   eleven twelve
		four  five   six
		one   two    three

	:'<,'>B !sort
		one   eight  three
		four  eleven six
		seven five   nine
		ten   two    twelve

	:'<,'>B Bisort
		one   eight  three
		four  eleven six
		seven five   nine
		ten   two    twelve
"AAA----------------------------------------------------------------------------------------------"
Inside VIm I do ",cs" or ",cl"  and then simply paste into other document using regular windows paste command.
The mappings work in normal mode.

,cs is used to copy just the file name
,cl is used to copy file name including the full path

nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>

"AAA----------------------------------------------------------------------------------------------"
Instead of marking all the time with "ma", mark with "ml".  When you need to
return to the mark, `l is a little quicker to type than `a.  

"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 613: open last edited file, AKA lvim for bash

to open the last edited file in csh. In bash, do it like so:
alias lvim='vim -c "normal '\''0"'

"AAA----------------------------------------------------------------------------------------------"

VimTip	{{{1 618: how to make and submit a patch
http://vim.sourceforge.net/tip_view.php?tip_id=

     Vim is developed using an open-source model, and users are encouraged to contribute to its development.  Users with programming experience should have a look at the to-do list from time to time (:help todo), and even beginners can help by asking and answering questions on the mailing lists, adding tips to this database, and suggesting improvements to the documentation.  (IMHO, if you get a question answered on one of the lists, a good way to repay the Vim community is by posting the answer as a tip here.)  Even rating tips and scripts on the vim web site helps others, by pointing them to the most useful ones.

     Another way to give back to the community is to support vim's charity:

:help uganda

     Here is how to make a patch.  Make a local copy of the file you are going to change, and edit it.  Then, change to the directory (such as vim62/) containing the src/ source directory.  If you are editing one of the help files and do not have the vim source files, change to your $VIMRUNTIME directory (usually /usr/local/share/vim/vimxx/ on *NIX systems).  Use the diff program to make the patch like this:

$ diff -c /src/eval.c path/to/my/eval.c > /tmp/eval.c.diff

for a patch to the source or (assuming you do not have the sources)

$ diff -c doc/help.txt path/to/my/help.txt > /tmp/help.txt.diff

The directory and file name for the patches are just suggestions.  If you change more than one file, you can concatenate the patches or read the man page for diff to create one big patch.

     If you are on a Windows system that does not have the diff program, you may be able to get one from http://gnuwin32.sourceforge.net/ .  (I have not used Windows for a while now, so I have not tried this.)  If the usage is substantially different from the above, perhaps someine will be kind enough to add a comment below explaining this.

      The -c option produces a "context diff."  This is fairly easy for both humans and machines to read, and all official patches for vim are released in this form.

     Once you have your patch, you can submit it to the vim-dev mailing list.

:help vim-dev



"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 663: Annoyed that some stuff is reset during GUI init?
http://vim.sourceforge.net/tip_view.php?tip_id=

I've always been. t_vb is one of those things that forced me to have a separate
.vimrc and .gvimrc or to fudge around with $GVIMINIT. And while not documented
as such, guioptions seems to get reset as well. Be annoyed no longer:

	if has("gui_running")
		autocmd GUIEnter * source ~/.vimrc
	endif

Make sure your .vimrc is safe for multiple sourcings. autocmds should be
cleared, in particular.

	autocmd!

There may also be more things to take into account I'm not aware of.

Now you can keep all your settings neatly in a single place.



"AAA----------------------------------------------------------------------------------------------"
I have several hundred file path names in a buffer, each filling a line, e.g. created with vim tip # 659.
About half of them are help files, starting with './help/'  which I want to delete, but I want to keep 
the german ones, starting with './help/de/'. Here comes how I do it with VIM:

  :global:^./help/:if (match(getline(line(".")), '^./help/de/') == -1) | delete | endif

"AAA----------------------------------------------------------------------------------------------"
" I find myself typing \":wq\" in insert-mode many a time.
" Add this to your .vimrc.

function WQHelper()
    let x = confirm(\"Current Mode ==  Insert-Mode!\\n Would you like \':wq\'?\",\" &Yes \\n &No\",1,1)
    else
    if x == 1
    silent! :wq
        \"???
    endif
endfunction
iab wq <bs><esc>:call WQHelper()<CR>

"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 691: gf for standard URL, like file:///C:/myfile.txt
http://vim.sourceforge.net/tip_view.php?tip_id=

To make gf worked for URL, say, file:///C:/myfile.txt
I copy the following to my _vimrc on Windows

au BufReadCmd file:///* exe "bd!|edit ".substitute(expand("<afile>"),"file:/*","","")
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 692: runtime syntax check for php
map <C-B> :!php -l %<CR>
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 738: fix META-keys when META-keys break out of Insert mode
http://vim.sourceforge.net/tip_view.php?tip_id=

Q: My META-keys don't work. When I press META-key in insert mode,
they break me out out of insert mode and execute some normal-mode 
commands.

A: This happens with non-GUI vim under some terminal
emulators -- those which generate escape-sequences for META-characters.
The actually generated escape-sequences are <ESC>a .. <ESC>z.
You must manually configure vim to recognize these escape-sequences
as META-characters, see below. Terminal emulators which are known to
generate these sequences for META-keys are: rxvt (unix), putty (PC), 
teraterm (PC). Vim expects characters 225-250 for META-keys.

Here's how to fix META-keys on vim side:
--
- check what your META-keys generate:
  i<press Ctrl-V><press Meta-A>

if you see ^[a (that is, escape character followed by something),
then add this snippet to your vimrc:

--
" fix meta-keys which generate <esc>a .. <esc>z
let c='a'
while c != 'z'
    exec "set <M-".toupper(c).">=\e".c
    exec "imap \e".c." <M-".toupper(c).">"
    let c = nr2char(1+char2nr(c))
endw 
--

To fix META-keys definitions manually key-by-key:
   set <M-A>=<press Ctrl-V><press Meta-A>
   :imap <press ctrl-v><press Esc>a <M-A>
; repeat each META-key.

"AAA----------------------------------------------------------------------------------------------"

VimTip	{{{1 794: Scripting - Indirectly Referencing Variables
http://vim.sourceforge.net/tip_view.php?tip_id=

It is possible to indirectly reference a variable using {} (curly braces) in
your VIM script. This give you the ability to build up variable names
on-the-fly and subseqnetly reference the data that those variables hold.

For example:

:let richard_name = "Richard"
:let name_pointer="richard_name"
:echo {name_pointer}

will display the string "Richard" on screen

Another example:

:let richard_name = "Richard"
:let alan_name = "Alan"
:let postfix="_name"
:let name_pointer = "richard" . postfix
:echo {name_pointer}
:let name_pointer = "alan" . postfix
:echo {name_pointer}

"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 795: Simulating arrays with VIM
http://vim.sourceforge.net/tip_view.php?tip_id=

It is possible to simulate arrays in VIM, without recourse to third party
scripts or libraries. This can be done by dynamically constructing variable
names, and then referencing their data.

For example, implementing a 1 dimensional array :

:let interests_0="Running"
:let interests_1="Swimming"
:let interests_2="Inline Skating"
:let interests_3="Cycling"
:let j = 0
:while j < 4
:  let entry = 'interests_' . j
:  echo entry . ':'
:  echo {entry} 
:  let j = j + 1
:endwhile

This can be extended to 2 or more dimensional arrays :

:let interests_0_0="Walking"
:let interests_0_1="Running"
:let interests_0_2="Jogging"
:let interests_1_0="Backstroke"
:let interests_1_1="Butterfly"
:let interests_1_2="Front Crawl"
:let j = 0
:while j < 2
:  let i = 0
:  while i < 3
:    let entry = 'interests_' . j . '_' . i
:    echo entry . ':'
:    echo {entry}
:    let i = i + 1
:  endwhile
:  let j = j + 1
:endwhile

Or arrays of records :

:let academic_0_graduation_year="1995"
:let academic_0_college="Bristol Polytechnic"
:let academic_1_graduation_year="1998"
:let academic_1_college="Bristol University"
:let j = 0
:while j < 2
:  let year = 'academic_' . j . '_graduation_year'
:  echo {year} 
:  let college = 'academic_' . j . '_college'
:  echo {college} 
:  let j = j + 1
:endwhile

"AAA----------------------------------------------------------------------------------"
VimTip	{{{1 656: Recursive mappings - (2 examples to learn from)
http://vim.sourceforge.net/tip_view.php?tip_id=

Recursive mappings are fun to learn and really handy when you want to do
repetitive tasks.  One way to do this is Tip#144 (recording).  This is another
way when you find that you are using the same **editing pattern** again and
again.  Recursion may seem a bit complicated at first but it is very intuitive
once you get the hang of it.   Here are two examples for you to learn from.

For example, you have a file with the following contents -

aaa.txt
bbbbbb.txt 
ccc.txt

You want to change the file as follows -

wc aaa.txt> aaa.log
echo "HelloWorld"
wc bbbbbb.txt > bbbbbb.log
echo "HelloWorld"
wc ccc.txt> ccc.log
echo "HelloWorld"

A simple recursive mapping that will do the job is 
:map z Iwc <Esc>lyawA><Esc>pa.log<CR>echo "HelloWorld"<Esc>jz

Now type z in the first line and everything else is magic.

Here is the breakup where {} contain the vim commands.  
1.  Goto the beginning of the line and type "wc " and then come back to normal mode {Iwc <Esc>}
2.  Copy the word aaa (or bbbb or ccc).  We do this by going right one character and copying the word under it. {lyaw}
3.  Goto the end of the line and append > and then come back to normal mode.   {A><Esc>}
4.  Paste what we had copied {p}
5.  Append .log<CR>echo "HelloWorld" to the line.  {a.log<CR>echo "HelloWorld"}
6.  Goto the next line but first we switch to the normal mode. {<Esc>j}
7.  Do steps 1 to 7 all overagain {z}

The recursion terminates when the j cannot take you one more line further.  If you manually execute a command for one line, you will find it very intuitive to create recursive mappings. 

Here is another example.

Say you want to change
#define myid   199
#define myid2 200
#define myid3 201 

To
#define myid   201
#define myid2 202
#define myid3 203 

The simple  mapping would be -
:map z 2^Ajz  

Where ^A is CTRL_V+A

1.  Add 2 to the number in the line
2.  Go down one line.  
3.  Do steps 1 to 3 again.

Also see 
:help recursive_mapping
:help CTRL-A
:help nowrapscan  // when using recursion with searching.

There may be many ways to solve the above problems... this is just another way
which I like to use.  Recursion is very powerful espcially when I manipulate
many open windows where the content of one is to be used in another.  
