
"AAA---------------------------------------------------------------------------------

VimTip	{{{1 351: Using quickfix in a different way
http://vim.sourceforge.net/tip_view.php?tip_id=

I'm a software developer and I find vim's quickfix (:help quickfix) very helpful.
You can also use this while debugging your code, in a slightly different way...

Usually, you will have some print messages in your code, and after the program 
runs, you'll look at the output to see the execution trace (e.g which if-constructs
were taken, how many times did a while loop iterate.. ). If you precede these
statements with a <filename>:<linenumber>, then, the program output can be parsed
with a :cfile, and the execution trace becomes very simple.
For instance, in C++

   // fdebug is the pointer to the debug file called, debug.txt say.
   #define DEBUG_MESG( ) fprintf(fdebug, "%0s:%0d\n", __FILE__, __LINE__)

   ...
   
   function( )
   {
      ...
      if (something)
         DEBUG_MESG( );
      else
         DEBUG_MESG( );
      ...
   }

Open your code in vim and do a ":cfile debug.txt"
"AAA---------------------------------------------------------------------------------
VimTip	{{{1 391: Simple programmers TODO list using grep and quickfix
http://vim.sourceforge.net/tip_view.php?tip_id=

I use this to maintain a TODO list for projects I am working on. All my
projects are pretty small scale with each project stored in it's own directory
so this tip was writtten with that in mind.  Basically it is two keymappings
one which inserts //TODO_ITEM leaving Vim in insert mode so you can add a note
to help you remember what you wanted to do ;) The other mapping uses :grep to
search for all occurrences of TODO_ITEM in files in the current directory
excluding ~ files and then opens the error window displaying the list of
TODO_ITEMs. 

imap \q <ESC>i//TODO_ITEM<SPACE>
map \q i//TODO_ITEM<SPACE>
imap \w <ESC>:grep --exclude=*~ TODO_ITEM * <CR> :copen <CR>
map \w :grep --exclude=*~ TODO_ITEM * <CR> :copen <CR>

Change the comment style to suit your language and the lame keymappings to something better.
"AAA---------------------------------------------------------------------------------
VimTip	{{{1 444: quickfix show entire contents of multiline error in cwindow on cn, cp and cc
http://vim.sourceforge.net/tip_view.php?tip_id=

put this in your .vimrc if you use the cwindow

" \cc
map <Leader>cc :cwindow<cr>:cc<cr><c-w>b<cr>
" \cn
map <Leader>cn :cwindow<cr>:cn<cr><c-w>b<cr>
" \cp
map <Leader>cp :cwindow<cr>:cp<cr><c-w>b<cr>

and when you use \cc (or whatever your leader character is + cc), \cn or \cp, it will do what :cc, :cn and :cp usually did, with the added bonus of showing the entire contents of multiline errors.  this is especially useful for javac via ant, and it's obnoxious to keep typing <c-w>b<cr> every time i do a :cn, so i mapped this.

detailed explaination:
":cwindow<cr>" ensures that the quickfix window is show.
":cc" (:cn, and :cp) actually do the operation
"<c-w>b" go to the bottom window (which cwindow will be if it's shown) which will magically center on the error
"<cr>" carriage-return on the error line, taking you back to the code with the error

i know it probably seems superfluous if you haven't been personally affected by this particular annoyance.
thanks to freenode #vim for inspiration.
"AAA---------------------------------------------------------------------------------

VimTip	{{{1 688: lid & cscope = custom grep
http://vim.sourceforge.net/tip_view.php?tip_id=

Sometimes you want to use quickfix for some other things than grep & make.
You can always replace one of them and then return to what it was.
So, I have in my  .vimrc:
===
fu! Mycscope(func)
    let tmp1=&grepprg
    let tmp2=&grepformat
    set grepformat=%f\ %*[a-zA-Z_0-9]\ %l\ %m
    set grepprg=cscope\ -R\ -L\ -3
    exe "grep ".a:func
    exe "set grepprg=".escape(tmp1,' ')
    exe "set grepformat=".escape(tmp2, ' ')
endf
command -nargs=* CScope :silent call Mycscope("<args>")
===
This will create the command CScope, that does a cscope's "find functions calling this function" with quickfix.
Another example: lid
===
fu! Mylid(arg)
    let tmp1=&grepprg
    set grepprg=lid\ -Rgrep\ -s\ $*
    exe "grep ".a:arg
    exe "set grepprg=".escape(tmp1," ")
endf
command -nargs=* Lid :silent call Mylid("<args>")
===
Bug: sometimes vim is unable to come back from the command, and you have to hit CTRL+C. I have no idea why.
"AAA---------------------------------------------------------------------------------- 
VimTip	{{{1 761: Reviewing code effectively (using quickfix)
http://vim.sourceforge.net/tip_view.php?tip_id=

Hi,

If you do code reviews on a regular basis, this tip could be of help to you. This tip is about -
1. Helping the reviewer review code
2. Helping the author in collating reviews from various peers
3. Helping the author in fixing the review comments

First learn about quickfix if you don't know about it already (:help quickfix)

If you type your comments in a file in the format as shown below, then the author can use the quickfix mode for zeroing on the exact file/line.
<file_name>:<line_number>: <your comment in a single line>

For filling in the file name/line number automatically, put the following code in your .vimrc/_vimrc/vimrc:
" Code starts
function SavePosition()
   let g:file_name=expand("%:t")
   let g:line_number=line(".")
   let g:reviewer_initials="KG" " Your initials
endfunction
function InsertComment()
   execute "normal i". g:file_name . ":" . g:line_number . ": " . g:reviewer_initials . " - "
   startinsert
endfunction
nmap ,sp :call SavePosition()<CR>
nmap ,ic :call InsertComment()<CR>
" Code ends

Typical review session:
1. A reviewer open the code to review, positions the cursor on the line he wants to comment on and types ",sp"
2. He/She then opens a text file in the same vim session (say my_comment.txt) and types ",ic" - this puts the file name and the line number
3. The comment is typed next to the line number, all in a single line. This makes it possible for the file to be sorted later
4. Send the comments to the author of the code
5. The author collates the inputs from various reviewers into one file (by simply concatenating them) and sorts it. Now the comments are arranged per file, in the order of line numbers (in a file called say, all_comments.txt)
6. Using the :cfile all_comments.txt the author can now navigate through all the comments.

Cheers,
Karthick

