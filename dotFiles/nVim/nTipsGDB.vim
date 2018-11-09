"AAA----------------------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------"
"xxxx59

VimTip	{{{1 357: Adding a console to gdbvim
http://vim.sourceforge.net/tip_view.php?tip_id=


This tip shows how to enhance the gdbvim vimscript #84 by 
making the outputs from gdb appear in a "console buffer" 
inside vim.

"1.a) In gdbvim.vim, one needs to add the following two buffer 
"     manipulation functions:

"--------------------------------------------------------
" Buffer manipulation functions {{{1
"
" function! s:GdbFocusBuf(nameref)  {{{2
" move the focus to the buffer nameref -- create 
" it if it doesn't exist
" return the number of the currently focused buffer 
"
function! s:GdbFocusBuf(nameref)
  let l:oldnr = bufnr("%")
  let l:win_nu = bufwinnr(a:nameref)
  if l:win_nu > 0
    execute l:win_nu "wincmd w"
  else
    if bufexists(a:nameref)
      execute "sbuffer" a:nameref
    else
      execute "new" a:nameref
    endif
  endif
  return l:oldnr
endfunction

" function! s:GdbAppendBuf(nameref, stuff) {{{2
" append stuff to buffer nameref
" 
function! s:GdbAppendBuf(nameref, stuff)
   let l:oldnr = s:GdbFocusBuf(a:nameref)
   call append("$", a:stuff)
   execute "normal G\<End>"
   return l:oldnr
endfunction

"1.b) And modify the two source file management functions
"     to be as follows:

"--------------------------------------------------------
" Source file management functions {{{1
" function! Gdb_Bpt(id, file, linenum) {{{2
"
function! Gdb_Bpt(id, file, linenum)
        let s:nowfile = a:file
        let l:curnr = s:GdbFocusBuf(a:file)
        execute "sign unplace ". a:id
        execute "sign place " .  a:id ." name=breakpoint line=".a:linenum." file=".a:file
        execute a:linenum
endfunction

" function! Gdb_CurrFileLine(file, line) {{{2
"
function! Gdb_CurrFileLine(file, line)
        if a:file != 0
           let s:nowfile=a:file
        endif

        let l:curnr = s:GdbFocusBuf(s:nowfile)

        execute "silent! " . a:line . "foldopen"
        execute "sign unplace ". 1
        execute "sign place " .  1 ." name=current line=".a:line." file=".s:nowfile
        execute a:line
endf


"1.c) And add the following console function: 

"--------------------------------------------------------
" function! Gdb_Console(stuff, set_prompt) {{{2
"
function! Gdb_Console(stuff, set_prompt)

  let l:fooey = s:GdbAppendBuf("console", a:stuff)

  if a:set_prompt == 1
      " What needs to happen here is to enter command mode
      " with the partial command ":Gdb " typed out.
      " The following line shows what doesn't work 
      " call input(":Gdb ")   
  endif 
endfunction

"1.d) And while we are modifying gdbvim.vim, we could also
"     add a text section to the definitions of the signs:

"--------------------------------------------------------
sign define breakpoint linehl=DebugBreak    text=bb
sign define current    linehl=DebugStop     text=cc


#2) The subroutine worker in the perl script gdbvim needs to
#   be modified as indicated below.  The key points to note 
#   are the two calls the vim-script function Gdb_Console().

# this function processes the gdb output, prints it and sends vim commands
sub worker # {{{
{   
    vim_call('Gdb_interf_init(\"'.$PIPE.'\", \"'.$ENV{"PWD"}.'\")');
    print GDB_WTR "set prompt (gdb)\\n\n";
    while (<GDB_RDR>)
    {
        if (/^.*?gdb\)/) 
        {
            print RL_WTR "READ\n";
            chomp ; 
            print $_ . " "; 
            vim_call("Gdb_Console(\\\"$_\\\", 1)");
        }
        else
        {
            my $stuff = $_;
            if(
                  s/Breakpoint ([0-9]+) at 0x.*: file ([^,]+), line ([0-9]+)./Gdb_Bpt($1,\\\"$2\\\",$3)/ ||
                  s/Breakpoint ([0-9]+), 0x.*at ([^,]+):([0-9]+)/Gdb_CurrFileLine(\\\"$2\\\",$3)/ ||
                  s/^\s*0x.*\s+at\s+(\S+):([0-9]+)/Gdb_CurrFileLine(\\\"$1\\\",$2)/ ||
                  s/\032\032([^:]*):([0-9]+).*/Gdb_CurrFileLine(\\\"$1\\\", $2)/  || 
                  s/^\s*0x\S+\s*([0-9]+)\s+.*/Gdb_CurrFileLine(0, $1)/ 
              )
              {
                  chomp;
                  vim_call($_);
              } 
              print $stuff;
              chomp($stuff);
              # the next substitution is because I couldn't figure out how to 
              # pass (from perl) double quotes inside string arguments to 
              # vim-script functions
              $stuff =~ s/"/'/g; 
              vim_call("Gdb_Console(\\\"$stuff\\\", 0)");
        }
    }
    vim_call("Gdb_interf_close()");
    close GDB_RDR; close GDB_WTR;
}; # }}} 

That's all the modifications -- and now gdbvim will show 
the output of gdb inside a vim.  (Errors from gdb won't 
show up in the console but still go to the terminal.)

Happy gdbVimming!

Acknowledgment:
   I learnt about functions in vim-scripts by the process of tracking 
   down an annoying behavior in cvscommand.vim vimscript #90.  
   Also, the author of cvscommand.vim, Bob Hiestand, graciously 
   improved my earlier versions of the functions GdbFoucBuf and 
   GdbAppendBuf. 



