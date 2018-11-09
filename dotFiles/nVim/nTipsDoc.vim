
"AAA----------------------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 804: single 'tags' file for a source tree
http://vim.sourceforge.net/tip_view.php?tip_id=

At the top of a source tree, create a tags file by

% ctags -R

(assuming Exuberant Ctags).  The -R (or --recurse) option tells ctags to recurse into directories.

Then, set the tags option in ~/.vimrc as

set tags=tags;

The last semicolon is the key here.  When Vim tries to locate the 'tags' file,
it first looks at the current directory, and then looks at the parent
directory, then the parent of the parent...

This setting works nicely together with 'set autochdir'.  You need +path-extra
feature for this tip.  Also see *file-searching* .

"AAA----------------------------------------------------------------------------------------------
Based on 'grep-find' which is a emacs commands.

" Put this in ~/_vimrc and use g/ to repeat current search as a grep-find.
" Usage 
"   /xyz   .. not found in current file, so lets look for it in *.* with 
"   g/     .. search for xyz in *.*, next lets look for it in the whole tree
"   :call Mosh_grep("../..") 
"   :call Mosh_grep("/usr/include","strstr")
" GNU-grep -recursive,nocase,linenum,noerror,VimRegexp (in that order).
:set  grepprg=grep\ -rinsE

:map g/  :call Mosh_grep()<CR>

function! Mosh_grep(...)
    if a:0 == 0 
        :exec "grep '".@/."' *.*"
    elseif a:0 == 1
        :exec "grep '".@/."' " a:1
    elseif a:0 == 2
        :exec "grep" a:2 " " a:1
    endif
    " Optional mappings for easy navigation of results
    :map <c-n>  :cnext<CR>
    :map <c-p>  :cprev<CR>
    :copen 
endfunction
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 826: PHP manual in VIM help format
http://vim.sourceforge.net/tip_view.php?tip_id=

Download http://planetxml.de/php_manual.txt and put it into your vim/doc
folder, then run :helptags [path to vim/doc]. Documentation for PHP functions
can be shown by pressing K while the cursor is on a function name.
"AAA----------------------------------------------------------------------------------------------
Charles E. Campbell wrote an excellent Vim reference card in 1999 for Vim 5.7.
I revised it for Vim 6.3.
http://utools.com/vimrefcard.pdf
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 914: Looking for the perfect programming font ?
http://vim.sourceforge.net/tip_view.php?tip_id=

Changed from Debian to Ubuntu on my Laptop today and noticed
that I don't like the default font used by gvim. So I started to look
for an alternative and found this wonderful page:

http://www.proggyfonts.com/index.php?menu=about

The first impression from the Proggy Clean font is really good! The
only problem I had was the installation of the font. (I use gvim with gtk2)

Tried the pcf format first and couldn't get the font registered by 
freetype/fontconfig which means I could select it via "xfontsel" but 
not with the gtk2 font selector. Probably a gtk build would have worked. 

Anyway -- the ttf format works fine. Just copy ProggyCleanTT.ttf in ~/.fonts
and run "fc-cache" once. This should work on every Unix system with 
fontconfig installed. 

Afterwards start gvim and and choose the font or insert
"set guifont=ProggyCleanTT\ 12" in your .gvimrc.  Note that the size of 
12pt is necessary for a good look.



"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1007: disable F1 built-in help key
http://vim.sourceforge.net/tip_view.php?tip_id=
It can be really annoying when you keep hitting F1 key by accident and help
screen keeps popping up. Here is a solution:
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>
(note: you can't just ":unmap <F1>" because Vim would complain that no such mapping exists)

"AAA----------------------------------------------------------------------------------------------
Our current development requires everything to be MISRA compliant. One of the
MISRA rules are: // style comments are not acceptable. These occurences must be
replaced by /* style comments */. The following mapping will do this per line.
:map <Functionkey> /\/\/<enter>xxi/*<esc>A*/<esc>

where with Functionkey being a definable key. So with F5 as Functionkey, the map will be  
:map <F5> /\/\/<enter>xxi/*<esc>A*/<esc>


"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1015: Preview file on localhost
http://vim.sourceforge.net/tip_view.php?tip_id=

map <F8> :w^M:!mozilla `echo http://localhost/${PWD\#*/*/*/*/}/%`^M

"AAA----------------------------------------------------------------------------------------------

VimTip	{{{1 1157: from vim to web search... via firefox & google
http://vim.sourceforge.net/tip_view.php?tip_id=

vmap g "gy:silent! exec 'cd C:\Archivos de programa\Mozilla Firefox\ <bar> !Start firefox "www.google.com/search?q='@g'&ie=utf-8"'<cr>


"AAA----------------------------------------------------------------------------------------------

VimTip	{{{1 1172: Vim FAQ & misc documentation
http://vim.sourceforge.net/tip_view.php?tip_id=

For those of you who do not realize this already, Vimdoc contains some of the
most useful information on Vim found on the Internet:

  http://vimdoc.sourceforge.net/

Especially useful is the FAQ at:

  http://www.geocities.com/yegappan/vim_faq.txt
  http://vimdoc.sourceforge.net/htmldoc/vimfaq.html

that answers a lot of basic (and advanced) questions about how to perform tasks in Vim. If you ever had any questions regarding Vim, make sure you do a search through the FAQ first before looking at any other resource.

To make the FAQ part of Vim help, copy the file at:

  http://www.geocities.com/yegappan/vim_faq_help.txt

to the "doc" directory - for example, in Unix/Linux systems:

  $ cp vim_faq_help.txt ~/.vim/doc

Then in Vim, do:

  :helptags ~/.vim/doc

After that, to access the FAQ, do:

  :help FAQ

Also, a must-read is Bram Moolenaar's "Seven Habits of Effective Text Editing" at:

  http://www.moolenaar.net/habits.html


"AAA----------------------------------------------------------------------------------------------

VimTip	{{{1 823: Add your note files to vim's help system.
http://vim.sourceforge.net/tip_view.php?tip_id=

I guess you have one or more files containing short notes regarding your
computer, stuff you study and suche. If you have several years of notes laying
around, and are like me..:o), You tend to forget what's in your notes and you
start grepping through your files ore start over again to figure stuff out. 

One of my solution has been to vim-helpify my note files and add a link to them
from my ~/.vim/doc/ folder. 

This is the process:
Make a few changes to your note file.

---- sample notes file start -------------------------------
" vim: filetype=help foldmetod=tags foldtags=<<<,>>> modifiable noreadonly

NOTE! You need the noreadonly and modifiable keywords in the vim modeline
above. help files are by default regarded as readonly and nomodifiable files by
vim.

Notes about sed		*sed* *sfsed*	<<<
swapping word's in stream (I know, you don't need the cat)
	cat Myfile.h|sed 's/foo/fyy/g'


Notes about vim		*vim* *sfvim*	<<<
	Stuff I have learned about vim.
	Create a help link like this |add-local-help|
	Regenerate help tags: |helptags|

	A realy big section closed with a tag <<<
	--- lots of stuf ---
	Closing tag >>>
	

Telephonelist		*sfphone*	<<<
	mom:	555-676767-333
	dad:	555-767676-222
	sis:	555-121212-999

---- sample notes file end ---------------------------------

As you can see from my sample I tend to prepend my keywords with sf so I can
get a handy list with <CTRL+d> later.

I have tried to index files placed in an arbitray place. Sadly enough the
helptags command does not seem to like this, so my solution has been to make a
soft link from the ~/.vim/doc/ folder to my file. You can do this from vim:

	:!ln -s ~/.vim/doc/mynotes.txt ~/Documents/mynotesfile.myext
To have vim create the tags
	:helptags ~/.vim/doc

Viola, now when I need that important phone numer it's only one :h command away
	:h sfp<CTRL-d>
	

You could also create your own helptags function adding tags containing a more
specifig file position. A realy simple function would be.

function! AddMyHelpTags()
	exe 'echo -e "sfsed\t ~/Documents/mynotesfile.mytext\t/\*sfsed\*" >> ~/.vim/doc/tags'
	exe 'echo -e "sfphone\t ~/Documents/mynotesfile.mytext\t/\*sfphone\*" >> ~/.vim/doc/tags'
	exe 'sort ~/.vim/doc/tags > /tmp/foo.vim.tags'
	exe 'mv -f /tmp/foo.vim.tags ~/.vim/doc/tags'
endfunction

NOTE! I do not use such a AddMyHelpTags function myself. But I have tested the
principle (The sample function it self is not tested, only the commands). This
is just a sample to get you going. Remember that you probably would have to run
this AddMyHelpTags function each time :helptags has been called, so as-is it is
not very convinient..:o(

Happy viming, regards
Staale Flock
