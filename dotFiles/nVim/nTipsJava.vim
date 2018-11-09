
"AAA----------------------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 3: use vim to quickly compile java files
http://vim.sourceforge.net/tip_view.php?tip_id=

For a number of years I used vim on an SGI box. When I left my job at SGI I went to a company that developed on PCs. For 2 years I used IDEs. I was unhappy. I was frustrated. I couldn't figure out why. (Beyond my machine crashing twice a day.) Finally I upgraded to windows 2000 (kind of stable!) and started using vim as an IDE. All was good. Here is how you use vim to compile your java:

1. While I'm sure this works with javac, javac is slow slow slow. So download the Jikes complier first. (Jikes is from ibm, search on google for jikes and you will find it..available on most platforms.)

2. Add the following to your vimrc:

set makeprg=jikes -nowarn -Xstdout +E %
set errorformat=%f:%l:%c:%*\d:%*\d:%*\s%m 

3. When you are editing a java file type :make and it will compile the current file and jump you to the first error in the file (if any). Read ":help quickfix" for how to move between errors.

To setup your classpath environment either launch gvim from a shell that has your classpath/path setup or use the "let" command to configure it in your vimrc.

"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 120: Compiling Java with Sun JDK (javac) within VIM

The $VIMRUNTIME/compiler has 'jikes.vim', but there's nothing for traditional Sun JDK(javac),
so I tried (Only tested on Win 2000):

" Vim Compiler File    javac.vim
" Compiler:	Sun/IBM JDK: Javac

if exists("current_compiler")
  finish
endif
let current_compiler = "javac"

" Javac defaults to printing output on stderr and no options can convert, so we have to set 'shellpipe'
setlocal shellpipe=2> 
" 2> works on Win NT and UNIX
setlocal makeprg=javac\ #<.java
setlocal errorformat=%f:%l:%m
" Sorry I'm not familiar with 'errorformat', so I set it very simple.

"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 142: Automatic function end commenting for C++ and Java
http://vim.sourceforge.net/tip_view.php?tip_id=

Some people have a habit of adding the function name as a comment to the end of
that function, if it is long, so that he/she knows which function the '}' ends.
Here's a way to automate the process.

Use the following abbreviation:
iab }// } // END: <esc>10h%$?\w\+\s*(<cr>"xy/\s*(<cr>/{<cr>:nohl<cr>%$"xpa

If you now end the function with '}//', the follwoing string will be automatically generated: '} //END: functionname'
"AAA----------------------------------------------------------------------------------------------"

VimTip	{{{1 288: A keymapping to generate Java setters and getters automatically
http://vim.sourceforge.net/tip_view.php?tip_id=

To use, first write a basic class with the following format:

public class MyClass
{

     private <type> <varname> = <initvalue>;
     private <type> <varname> = initvalue>;

     // getters


     // setters

}


Note the getters/setters comment -- they are important as they are used to place the getters and setters.
The mapping is:

map jgs mawv/ <Enter>"ty/ <Enter>wvwh"ny/getters<Enter>$a<Enter><Enter>public <Esc>"tpa<Esc>"npbiget<Esc>l~ea()<Enter>{<Enter><Tab>return <Esc>"npa;<Enter>}<Esc>=<Enter><Esc>/setters<Enter>$a<Enter><Enter>public void <Esc>"npbiset<Esc>l~ea(<Esc>"tpa <Esc>"npa)<Enter>{<Enter><Tab>this.<Esc>"npa=<Esc>"npa;<Enter>}<Esc>=<Enter>`ak


(the above should be one long line with no spaces between the end of the lines above).
To use this to generate a class go to the variable that should have a
setter/getter and place the curser at the beginning of the 'private':

   private <type> <variable> = <initvalue>'
   ^

Then type:

jgs

this will create the first getter/setter and then move up to the next variable.
You can just keep typing jgs until all the  getters/setters have been
generated.

This should mapping isn't perfect and someone could probably make it a little
cleaner.  It could also relatively easily be adapted to C++.  Please feel free
to send me any feedback/enhancements as I am trying to compile a list of these.
"AAA----------------------------------------------------------------------------------------------"
:map! <S-space> <esc>
:map! <S-space><S-space> <esc>
"AAA----------------------------------------------------------------------------------------------"
If you'd like to have javadoc folded together with areas in braces try that
<pre>
set foldmethod=syntax
set foldenable
syn region foldBraces start=/{/ end=/}/ transparent fold 
syn region foldJavadoc start=,/\*\*, end=,\*/, transparent fold keepend
</pre>
and play a bit with:
<pre>
set foldlevel=0
set foldnestmax=10
</pre>
parameters
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 407: PHPdoc: Use JCommenter.vim for php-scripts
http://vim.sourceforge.net/tip_view.php?tip_id=

Use JCommenter.vim for php-scripts: 

jcommenter.vim : A script for automatically generating JavaDoc comments 
http://vim.sourceforge.net/script.php?script_id=20
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 525: JavaBeans helper function
http://vim.sourceforge.net/tip_view.php?tip_id=

This one helps creating beans. Nothing serious actually, but might come in
handy. It's pretty fresh, cuz I just got annoyed with Netbeans - I haven't
tested it fully. Perhaps we could create some bigger Java Struts thing, huh?

nnoremap <buffer> <silent>dc :call <SID>AddBean()<CR>
function! s:AddBean()
    let line = line('.')
    let name = inputdialog('Enter the name of the variable: ')
    let type = inputdialog('Enter the type of the variable: ')
    let upperName = substitute(name, '^\(\w\)\(.*\)$', '\u\1\2', '')
    call append(line, "\t}")
    call append(line, "\t\tthis.".name." = ".name.";")
    call append(line, "\tpublic void set".upperName."(".type." ".name.") {")
    call append(line, "")
    call append(line, "\t}")
    call append(line, "\t\treturn (this.".name.");")
    call append(line, "\tpublic ".type." get"."".upperName."() { ")
    call append(line, "")
    call append(line, "\tprivate ".type." ".name.";")
    call append(line, "\t//".name)
    return line
endfunction
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 558: Using TagList for ANT build files
http://vim.sourceforge.net/tip_view.php?tip_id=

ANT is a XML based make utility (mainly for Java, http://ant.apache.org).

A build file can have several projects, and each project can have many targets.
Here is a simple example:
ant clean
ant compile
ant run

Editing an ANT file can be tiresome looking for the appropriate target entry.

Using the taglist plugin at least version 2.02 (http://vim.sourceforge.net/script.php?script_id=273) you can easily navigate an ANT file by creating these entries:

In your _vimrc file:
let g:tlist_ant_settings = 'ant;p:Project;t:Target'

And either add to or create a ctags.cnf file:
--langdef=ant
--langmap=ant:.xml
--regex-ant=/^[ \t]*<[ \t]*project.*name="([a-zA-Z0-9 ]+)".*>/\1/p,project/i
--regex-ant=/^[ \t]*<[ \t]*target.*name="([a-zA-Z0-9 ]+)".*>/\1/t,target/i

To determine where to create the ctags.cnf file see the ctags documentation (http://ctags.sourceforge.net/ctags.html, on WinXP this file goes into C:\Documents and Settings\local_user_name\ctags.cnf). 

When this is used in conjuction with the Vim compiler for ANT and a Vim Menu  for ANT (http://www.vim.org/script.php?script_id=155), it can be very powerful.
"AAA----------------------------------------------------------------------------------------------"
"this is for java, c++,c# can reshape as necessary
:ab ff <ESC>^d$ifor(int i=0;i<<ESC>pi.length;i++){<CR><CR>}//end for loop over array <ESC>pi[i]<ESC>==k==k==ji<TAB>

this way, if I need a loop over the array lines[] then I would type
lines<SPACE>ff<SPACE> and vim would transform this into (with proper indentation)

for(int i=0;i<lines.length;i++){
        <CURSOR>
}//end for loop over array lines[i]
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 653: doxygen '///' :comments setting
http://vim.sourceforge.net/tip_view.php?tip_id=

This will continue lines of '///' doxygen comments when you reach the end of a
line while typing a comment.  It also works if you use 'o' to open a new line
while on a comment starting with '///'.  It only works if there is a space
  between the last '/' and the first letter of the comment, that is no big
  deal, since it lends itself to readability.  So for example: /// This will
  work. ///This won't.

Here is the magic line.  Make sure you put it somewhere that will get sourced
whenever you open a file you want to use with doxygen.  I have it in
~/.vim/after/ftplugin/c/c.vim, so it gets sourced for all C and C++ files.

set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,bO:///,O://

All other comments will continue to work as expected.

"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 700: indenting for Java
http://vim.sourceforge.net/tip_view.php?tip_id=

I needed to do a few tweaks to .vimrc get Java code looking smooth in vim and
I'm passing the joy.  This is probably good for at least 80% of Java
programmers.  Hope this helps my fellow Java/Vim peeps.

Randy Solomonson

My .vimrc file:
"Take care of indents for Java.
set autoindent
set si
set shiftwidth=4

"Java annonymous classes.  Sometimes, you have to use them.
set cinoptions+=j1

"AAA----------------------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------"

VimTip	{{{1 849: Shortcuts to compile/run default file and alternate file in Java
http://vim.sourceforge.net/tip_view.php?tip_id=

Coding in Java? Add this to your .vimrc to map F9 to compile, and F10 to run. You can also use F11 and F12 to compile and run the alternate file. I\'ve found this .vimrc very useful where I am working on a Java class in one file, and a driver program to test it in the alternate file. See also: #vimtip 3 and #vimtip 120. Note that ^M and ^[[ below need to be typed as control characters (hit Ctrl+V, Ctrl+M, etc.), and makeprg could easily be modified for those using jikes. Hope someone else finds this useful.

\" F9/F10 compile/run default file
\" F11/F12 compile/run alternate file
map <F9> :set makeprg=javac\\ %^M:make

map <F10> :!echo %\\|awk -F. \'{print $1}\'\\|xargs java^M
map <F11> :set makeprg=javac\\ #^M:make^M
map <F12> :!echo #\\|awk -F. \'{print $1}\'\\|xargs java^M

map! <F9> ^[[:set makeprg=javac\\ %^M:make^M
map! <F10> ^[[:!echo %\\|awk -F. \'{print $1}\'\\|xargs java^M
map! <F11> ^[[set makeprg=javac\\ #^M:make^M
map! <F12> ^[[!echo #\\|awk -F. \'{print $1}\'\\|xargs java^M

\" Tip: load a file into the default buffer, and its driver
\"    into the alternate buffer, then use F9/F12 to build/run. 
\" Note: # (alternate filename) isn\'t set until you :next to it!
\" Tip2: You can make then run without hitting ENTER to continue. F9-F12

\" With these you can cl/cn/cp (quickfix commands) to browse the errors
\" after you compile it with :make
set makeprg=javac\\ %
set errorformat=%A:%f:%l:\\ %m,%-Z%p^,%-C%.%#

\" If two files are loaded, switch to the alternate file, then back.
\" Useful because then # is set!
if argc() == 2
    n
    e #
endif

"AAA----------------------------------------------------------------------------------------------"

VimTip	{{{1 822: add java import statements easily (assume using ctags)
http://vim.sourceforge.net/tip_view.php?tip_id=


I like the build (make) process to be fast... Eclipse/Netbeans users are excited about "auto-import" features...
Vim can do it just fine....  Well, I just got this working today....and it may need some tweaking.
If It doesn't work for you.... take some java.... that compiles... break one of the imports (assume you don't using foo.*; syntax much).
Then comment lines below starting from bottom up....  watch editing happen.... try to do edits slow to reproduce whats here.
I generally hit F1 key to build with (jikes) (tip # 3).... 90% of build failures are missing import statements....
If you already have a ctags system (tip #804, 94, etc)... the information can be found!
I hit F1 (:make), then hit F9 (add import for keword found under cursor)...then F1 (make/build)....and so on.  (FAST)

(Add Import)   
:noremap <F9> <esc>
                  \<C-W>}o//TEMP MARKER<esc>
                  \<C-W>P1G/public class<cr><esc>yy<C-W>pG?import<cr><esc>p<esc>
	          \<C-W>P1G/package<cr><esc>yy<C-W>pG?import<cr><esc>p<esc>
	          \$xa.<esc>0jwwi<cr><esc>kdd<esc>
                  \wDx<esc>kJxx<esc>$a;<esc>
	          \0cwimport<esc>
	          \:update<cr><esc>
                  \/TEMP MARKER<cr>dd<esc>
(Make)    
 :noremap <F1> :update<cr>:make<cr><C-W>j<esc>:cw 3<cr><C-W>p  

"AAA---------------------------------------------------------------------------------=

VimTip	{{{1 325: Errorformat for java/ant/junit/cygwin/bash
http://vim.sourceforge.net/tip_view.php?tip_id=

If you program in Java and use Jakarta ant for builds *and* if you have the
bash shell, this tip will make your development experience a little
smoother.

This tip will result in a working compile/edit/debug system (in Win32
vim/gvim and in Cygwin vim) that takes you to the exact lines where the
build fails, whether the failure is a compilation error or a junit test
failure.  If you use bash on a linux box, you shouldn't have to change very
much to get everything to work.

There are 6 sections:
1. set up your build script
2. set up makeprg
3. set up shell options
4. set up path formatting options
5. set up your errorformat
6. set up key mappings

Set up build script
-------------------
Add the following script to your path (I use /usr/local/bin/):

mymake:
#!/bin/bash
cd /work/
ant -emacs $* 2>&1 | tr '\\' / | tr ^M ' ' | sed -u -n -f /usr/local/bin/testerrors.sed | tee /tmp/errors

Comment: sed -u is non-standard, use the code at:
http://mail.gnu.org/pipermail/bug-gnu-utils/2002-May/000192.html to get
the -u option for sed (this avoids waiting for the build output to get to
the screen)

testerrors.sed:
# This assumes that all your junit test cases are in a com.* package
/^Running com\./ {
    # duplicate the line
    s!\(.*\)!\1\
\1!
    P

    # turn the test package into a directory path for %D errorformat
    s!.*\(com\..*\)\.[A-Za-z_][A-Za-z0-9_]*!\1!
    s!\.!/!g
    s!.*!Entering: /work/src/&!

    # print the line and go on
    p
    n
}

# just pass any unmatched lines through
p

Set up makeprg
--------------
Add the following lines to your vimrc:
  autocmd BufNewFile,BufRead /work/*.java set makeprg=mymake
  autocmd BufNewFile,BufRead ?:/work/*.java set makeprg=mymake

Set up shell options
--------------------
Add the following lines to your vimrc:
  " in order to have bash as the shell for win32 vi.exe and gvim.exe, you have
  " to set these options, and also build vimrun.exe in the cygwin environment
  " so that the system() call is executed via bash, not cmd.exe -- the command
  " to build vimrun.exe is "make -f Make_cyg.mak vimrun.exe"
  set shell=bash.exe
  set shellcmdflag=-c
  set shellslash

Also to use this environment in Win32 gvim, you must recompile vimrun so
that gvim invokes the shell via bash, not via cmd.exe.

Set up path formatting options
------------------------------
Add the following lines to your vimrc:
  " allows DOS file names from UNIX (Cygwin) vim
  set isfname+=\

Set up your errorformat
-----------------------
Add the following lines to your vimrc:
  " the "\%DEntering:\ %f," rule relies on a sed script which generates
  " "Entering: " messages for each test class run (the directory name is
  " generated from the test class package and a hard-coded src root)

  " the "%\\C" at the start of the exception matching line tells to match
  " case-exact (the exception mathching lines rely on the %D rule that sets
  " up the correct directory from the package structure)

  " ant/junit/javac errorformat
  set errorformat=
      \%-G%.%#build.xml:%.%#,
      \%-G%.%#warning:\ %.%#,
      \%-G%\\C%.%#EXPECTED%.%#,
      \%f:%l:\ %#%m,
      \C:%f:%l:\ %m,
      \%DEntering:\ %f\ %\\=,
      \%ECaused\ by:%[%^:]%#:%\\=\ %\\=%m,
      \%ERoot\ cause:%[%^:]%#:%\\=\ %\\=%m,
      \%Ecom.%[%^:]%#:%\\=\ %\\=%m,
      \%Eorg.%[%^:]%#:%\\=\ %\\=%m,
      \%Ejava.%[%^:]%#:%\\=\ %\\=%m,
      \%Ejunit.%[%^:]%#:%\\=\ %\\=%m,
      \%-Z%\\C\	at\ com.mypkg.%.%#.test%[A-Z]%.%#(%f:%l)\ %\\=,
      \%-Z%\\C\	at\ com.mypkg.%.%#.setUp(%f:%l)\ %\\=,
      \%-Z%\\C\	at\ com.mypkg.%.%#.tearDown(%f:%l)\ %\\=,
      \%-Z%^\ %#%$,
      \%-C%.%#,
      \%-G%.%#

NOTE: Make sure that the character before "at" is an actual Tab character in
the three long -Z lines above

Here is an annotated version:
  set errorformat=
      " don't treat the build.xml diagnostic as an error
      \%-G%.%#build.xml:%.%#,

      " don't treat warning lines as errors
      \%-G%.%#warning:\ %.%#,

      " don't treat lines containing "EXPECTED" as errors
      \%-G%\\C%.%#EXPECTED%.%#,

      " look for this standard error format
      \%f:%l:\ %#%m,

      " look for this standard error format (with C: on front)
      \C:%f:%l:\ %m,

      " look for special sed-generated "Entering" lines while running tests
      \%DEntering:\ %f\ %\\=,

      " look for exceptions that were thrown in the tests, use the exception
      " description as the error message (don't know how to also include the
      " exception name in the error message)
      \%ECaused\ by:%[%^:]%#:%\\=\ %\\=%m,
      \%ERoot\ cause:%[%^:]%#:%\\=\ %\\=%m,
      \%Ecom.%[%^:]%#:%\\=\ %\\=%m,
      \%Eorg.%[%^:]%#:%\\=\ %\\=%m,
      \%Ejava.%[%^:]%#:%\\=\ %\\=%m,
      \%Ejunit.%[%^:]%#:%\\=\ %\\=%m,

      " using the "Entering" directory and the filename/line number provided
      " in the exception trace, go to the test method where the exception
      " was thrown
      \%-Z%\\C\	at\ com.mypkg.%.%#.test%[A-Z]%.%#(%f:%l)\ %\\=,
      \%-Z%\\C\	at\ com.mypkg.%.%#.setUp(%f:%l)\ %\\=,
      \%-Z%\\C\	at\ com.mypkg.%.%#.tearDown(%f:%l)\ %\\=,

      " empty lines terminate searching for further exception lines
      \%-Z%^\ %#%$,

      " any line can intervene between the start of an exception printout
      " and the line where it ends (last in list so that it is matched if
      " none of the other exception trace patterns match)
      \%-C%.%#,

      " all other lines are not errors
      \%-G%.%#

Set up key mappings
-------------------
Add the following lines to your vimrc:
  nmap <F10> :clist<CR>
  nmap <F11> :cprev<CR>
  nmap <F12> :cnext<CR>

This allows for quick error navigation.


NOTES
-----
Vim treats the "Entering: /work/src/..." messages in a weird way.  If there
are any actual errors, then these error lines are ignored by the :cnext and
:cprev commands, but if there are no real errors, then :cnext and :cprev
roll through these "Entering:" messages as if they were errors, but since
they don't include any line numbers, the cursor position is never moved.

I thought that this was strange, but even stranger, it is programmed
directly into the vim error handling code to function exactly this way.
There were no comments, and nobody responded on the vim mailing list, so I
just decided to live with it.

The upshot of it all is that if you see an error like "Entering:", chances
are that your build succeeded and all the tests ran without a problem.


Hope this helps...

Mail me with bugs at jdsumsion at earthlink.net.


"xxxx60
