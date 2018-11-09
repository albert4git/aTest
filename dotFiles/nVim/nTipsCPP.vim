"AAA--------------------------------------------------------------------------------- 
"AAA--------------------------------------------------------------------------------- 
"AAA--------------------------------------------------------------------------------- 
"AAA--------------------------------------------------------------------------------- 
VimTip	{{{1 141: Add your function heading with a keystroke
Below is a tip that the C/C++ Newbies may find interesting and handy to use.
The following code will add a function heading and position your cursor just
after Description so that one can document as one proceeds with code.

function FileHeading()
	let s:line=line(".")
	call setline(s:line,"/***************************************************")
	call append(s:line,"* Description - ")
	call append(s:line+1,"* Author -      Mohit Kalra")
	call append(s:line+2,"* Date -        ".strftime("%b %d %Y"))
	call append(s:line+3,"* *************************************************/")
	unlet s:line
endfunction

imap <F4>  <esc>mz:execute FileHeading()<RET>`zjA

Where <esc> stands for ^V+ESC and <RET> for ^V+ENTER
"AAA--------------------------------------------------------------------------------- 
There's a handy plug in for MS Visual Studio called CodeWiz that has a nifty
ability to copy a function declaration and deposit it into the implementation
file on command.  I actually missed while using vim, so I wrote an
approximation of that capability.  This isn't foolproof, but it works alright.  

" Copy Function Declaration from a header file into the implementation file.
nmap <F5> "lYml[[kw"cye'l
nmap <F6> ma:let @n=@/<cr>"lp==:s/\<virtual\>/\/\*&\*\//e<cr>:s/\<static\>/\/\*&\*\//e<cr>:s/\s*=\s*0\s*//e<cr>:s/(.\{-}\zs=\s*[^,)]\{-1,}\>\ze\(\*\/\)\@!.*)/\/\*&\*\//e<cr>:s/(.\{-}\zs=\s*[^,)]\{-1,}\>\ze\(\*\/\)\@!.*)/\/\*&\*\//e<cr>:s/(.\{-}\zs=\s*[^,)]\{-1,}\>\ze\(\*\/\)\@!.*)/\/\*&\*\//e<cr>:let @/=@n<cr>'ajf(b"cPa::<esc>f;s<cr>{<cr>}<cr><esc>kk

To use this, source it into vim, for example by placing it in your vimrc, press
F5 in normal mode with the cursor on the line in the header file that declares
the function you wish to copy.  Then go to your implementation file and hit F6
in normal mode with the cursor where you want the function implementation
inserted.



"AAA--------------------------------------------------------------------------------- 
VimTip	{{{1 514: Automatic insertion of C/C++ header gates
http://vim.sourceforge.net/tip_view.php?tip_id=

C/C++ header files should be guarded against multiple inclusions using preprocessor directives, e.g.:

#ifndef FOO_H
#define FOO_H

/* Declarations. */

#endif

Placing the following snippet in your .vimrc file, makes vim insert these preprocessor gates automatically, when a new header file is created:

function! s:insert_gates()
        let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
        execute "normal i#ifndef " . gatename 
        execute "normal o#define " . gatename . "   "
        execute "normal Go#endif /* " . gatename . " */" 
        normal kk
endfunction

autocmd  BufNewFile *.{h,hpp} call <SID>insert_gates()


"AAA--------------------------------------------------------------------------------- 
"AAA--------------------------------------------------------------------------------- 

VimTip	{{{1 476: multime errorformat & makeprgs
http://vim.sourceforge.net/tip_view.php?tip_id=

I was fiddling around with the errorformat and makeprg opts, and as I code in
different languages, i was wondering if there was a way of specifiing a special
makeprg and errorformat parameter for each language.... and THERE IS!!

just edit the $VIM/ftplugin/[syntaxfile].vim

i.e.: perl.vim
added at the end :
set makeprg=$HOME/bin/vimparse.pl\ -c\ %\ $*
set errorformat=%f:%l:%m

c.vim
set makeprg=g++\ %

well, and you get the pattern.

It works delightfully with the :Make tip vimtip #203

Ah! I mapped F-5 to :Make, and made it go back to the main window:
map <F5> :Make<cr><C-w><Up>

"AAA--------------------------------------------------------------------------------- 
VimTip	{{{1 434: Autogroup commands for C/C++ editing - inserting skeletons etc (long post!)
http://vim.sourceforge.net/tip_view.php?tip_id=

Hi all,

When you start editing a *.h file, you'd need some format like this:
CODE STARTS:
/*****************************************************************
* Filename: abc.h
* Description: 
* Created: Mar 5 03 09:00:00
* Last modified: Mar 6 03 09:00:00
* <some more stuff like author, copyright, blah-blah>
*
* Revision History
*   Date                  Author            Remarks
*   Mar 5 2003         KG                 File Created
*******************************************************************/
#ifndef _ABC_H_
#define _ABC_H_

#endif
// vim:ts=3:sw=3:ft=c
CODE ENDS
I wanted my gvim to do the following things at various stages of editing a abc.h file:
1. Upon opening a new file, insert the skeleton like the one above, and leave me in insert mode after "Description"
2. When writing a file, update the "Last Modified" timestamp
3. On opening a existing file, modify the "Revision History" to add a new line, and leave me in insert mode below "Remarks"

The following autogroup (:help au) commands let you do these (put these in your .vimrc):
CODE STARTS:
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  au BufNewFile *.h call InsertCHHeader()
  au BufWrite *.h call ModifyTime()
  " You might want to comment-out the line below - see note 6 at the end of the post.
  au BufReadPost *.h call ModifyHeader()
endif

function! InsertCHHeader()
   call InsertSkeleton("skeleton.h")  " CHANGE this!
   call InsertFname()
   1
   " Search for Description
   call search("Description:")
   normal $
   startinsert
endfunction

function! InsertSkeleton(fname)
   let path_to_skeletons = $HOME . "/etc/skeletons/"  " CHANGE this!
   " Save cpoptions
   let cpoptions = &cpoptions
   " Remove the 'a' option - prevents the name of the
   " alternate file being overwritten with a :read command
   exe "set cpoptions=" . substitute(cpoptions, "a", "", "g")
   exe "read " . path_to_skeletons . a:fname
   " Restore cpoptions
   exe "set cpoptions=" . cpoptions
   " Delete the first line into the black-hole register
   1, 1 delete _
   " Search for Filename:
   call search("Filename:")
   exe "normal A " . expand("%:t")
   " Search for Created:
   let current_time = strftime("%b %d %Y %T") "CHANGE this!
   call search("Created:")
   exe "normal A " . current_time
   " Search for Last modified:
   call search("Last modified:")
   exe "normal A " . current_time

   " Search for Date
   let date_line_no = search("Date")
   let rev_history = getline(line("."))
   let rev_history = substitute(rev_history, "Date       ", strftime("%b %d %Y"), "")  " CHANGE this!
   let rev_history = substitute(rev_history, "Author", "KG    ", "")  "CHANGE this!
   let rev_history = substitute(rev_history, "Remarks", "File created.", "")
   call append(date_line_no, rev_history)
endfunction

function! InsertFname()
   " Convert newname.h to _NEWNAME_H_
   let fname = expand("%:t")
   let fname = toupper(fname)
   let fname = substitute(fname, "\\.", "_", "g")
   " Search for #ifndef
   call search("#ifndef")
   exe "normal A " . "_" . fname . "_"
   " Search for #define
   call search("#define")
   exe "normal A " . "_" . fname . "_"
endfunction

function! ModifyHeader()
   " Modify header only if we have write permissions
   if &readonly == 0
      " Search for Date
      let date_line_no = search("Date")
      if date_line_no != 0
         let rev_history = getline(line("."))
         " Substitute Date, and Author fields
         let rev_history = substitute(rev_history, "Date       ", strftime("%b %d %Y"), "")  " CHANGE this!
         let rev_history = substitute(rev_history, "Author", "KG    ", "")  " CHANGE this!
         let rev_history = substitute(rev_history, "Remarks", "", "")
         " echo "Modified = " . rev_history
         call append(date_line_no, rev_history)
         normal j$
         startinsert
      endif
   endif
endfunction

function! ModifyTime()
   " Do the updation only if the current buffer is modified
   if &modified == 1
      let current_time = strftime("%b %d %Y %X")  " CHANGE this!
      " Save current position at mark i
      normal mi
      " Search for Last modified:
      let modified_line_no = search("Last modified:")
      if modified_line_no != 0 && modified_line_no < 10
         " There is a match in first 10 lines
         " Go to the : in modified:
         exe "normal f:2l" . strlen(current_time) . "s" . current_time
         echo "Modified date stamp to " . current_time
         sleep 500m
         " Restore position
         normal `i
      endif
   endif
endfunction
CODE ENDS

Notes:
1. The strftime( ) function is not-portable. You might need to change the format specifier for your system
2. The autogroup commands assumes that there is a file called skeleton.h at the location ~/etc/skeletons.
    You might have to modify the path and file name. In my case, the skeleton.h file looks like:
   /******************************************************************************
    *  Filename:
    *  Description: 
    *
    *  Version: 1.0
    *  Created:
    *  Last modified:
    *  Revision: None
    *
    *  Author:    Karthick Gururaj
    *  Company: [Removed]
    *  e-mail: [Removed]
    *
    *  Revision history
    *  Date           Author       Remarks
    *
    ******************************************************************************/
   #ifndef
   #define
   
   #endif
   // vim:sw=3:ts=3
Search the script for the pattern "CHANGE" to see where you might have to make changes..
3. I have not tried to make the script super-portable (that looks obvious eh?). The reasoning is, any changes are a one time effort.
4. The scripts don't modify search history or register values. I have used one letter for marking thou'
5. If you open a new header file, and quit it without writing, no file is created.
6. I found having an autogroup command for modifing the revision history everytime the file is opened to be irritating. So I have disabled this in my system. Note on note: I also had some problems when trying to open the file thro' the quickfix window.
7. You can define more such skeletons for other extentions.
8. Feedback is welcome!

Cheers!

"AAA--------------------------------------------------------------------------------- 
