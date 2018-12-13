"AAA--------------------------------------------------------------------------------- 
"AAA--------------------------------------------------------------------------------- 
"AAA--------------------------------------------------------------------------------- 

VimTip	{{{1 374: VIM's Filtering Commands Summary
http://vim.sourceforge.net/tip_view.php?tip_id=


Vim's Filtering Commands or how to get text into or out of a file

# Redirection to Paste register * (or any other a-z)
:redir @*                    : start redirect commands to paste buffer
:history
:g/fred/
etc etc
:redir END                   : end redirect

# Redirection to a file
:redir >> out.txt            : redirect to a file
blahblah
:redir END                   : end redirect

# Storing glob results in register a (note must use APPEND)
:g/fred/y A                  : append all lines fred to register a
# to a file (must use >>)
:'a,'b g/^Error/ . w >> errors.txt

# Get output from external commands 
:r!ls.exe                    : reads in output of ls
!!date                       : same thing

# Filtering current file using an external command
:%!sort -u                   : use an external program to sort current file
:'a,'b!sort -u               : use an external program to sort current file


"AAA--------------------------------------------------------------------------------- 
VimTip	{{{1 422: A Quick Reference
http://vim.sourceforge.net/tip_view.php?tip_id=

After using vi and similar for a few years, I have accumulated a list of commands I use most often, and pass it on to people starting with vi.  The available quick reference tends to be verbose, but is useful for people with more vi experience (type ":help quickref" or go to  http://vim.sourceforge.net/htmldoc/quickref.html).  For beginners, here is my file:

VI is a text editor.  Its idea is that you manipulate text (as opposed to enter it all the time).  Almost all commands can be "repeated" a number of times, which you specify before typing the command itself (to delete a line, type dd; to repeat the deletion of a line 55 times, type 55dd).

At almost any time, "u" means "undo", and "Esc" stops all command or text entering.  For help, type :help<enter>.  There is a difference between what I call direct and indirect commands: "u" is a direct command, ":h" is an indirect one (it uses an underlying program).

:q to quit, :q! to quit without saving

Entering and manipulating text:

  Command           Interpretation

  .                 repeat the last command
  i<text>Esc        enter <text> on current line, at current position
  I<text>Esc        enter <text> on current line, at beginning of line
  a<text>Esc        enter <text> on current line, at next character position
  A<text>Esc        enter <text> on current line, at the end of the line
  o<text>Esc        enter <text> on a new line below
  O<text>Esc        enter <text> on a new line above
  r<character>      replace  characters by <character> repeated  times, 
                    starting from cursor towards end of line
  s<text>Esc        substitute characters by <text>, starting from cursor
                    towards end of line
  R<text>Esc        substitute characters by <text>, starting from cursor
                    towards end of line
  ~                 change the case
  d                 delete (combine with a movement: dl deletes to the 
                    right, d0 deletes to beginning of line, 5dw deletes 5 
                    words forward)
  dd                delete line
  D                 delete to the end of the line (like d$)
  c                 change (same combinations as with d)
  cc                change line
  C                 change to the end of the line (like c$)
  S                 change line, like cc
  x                 delete the character at the current position
  X                 delete the character at the left (backspace)
  J                 join the next line to the current line
  y                 yank (copy, same combinations as with d)
  p, ]p             paste the result of the last deletion or yanking command 
                    after the cursor
  P, [p             paste the result of the last deletion or yanking command 
                    before the cursor
  /, ?              find forward, backward (then, n means next in the same 
                    direction, N means next in the opposite direction)
  Ctrl-a, Ctrl-x    increase, decrease by 1 the number under the cursor (5Ctrl-a
                    increases by 5)
  :<number1>,<number2>g/<pattern>/<command>
                    on all lines within <number1>,<number2> range and matching 
                    <pattern>, execute <command>.
                    :3,$g/^  table/d
                        deletes all lines from 3 to end of buffer that start
                        with "  table"
                    :%g/[a-z0-9]$/s/boo/table/
                        on all lines in buffer that end with a lowercase letter 
                        or a digit, replace "boo" with "table"
                    :%g/[^RT]umble.*cran[0-6]/m'a
                        move all lines in buffer of the kind "Aumble...cran4"
                        or "Gumble...cran6" (NOT Tumble or Rumble) underneath 
                        line marked as a.
  :<number1>,<number2>v/<pattern>/<command>
                    on all lines within <number1>,<number2> range and not 
                    matching <pattern>, execute <command>.
  :<number1>,<number2>!<command>
                    execute shell <command> on lines <number1> to <number2>

Moving around:

  Command           Interpretation

  0, $              jump to the beginning, end of the line
  h, j, k, l        left, down, up, right (you can also use the arrow keys)
  H, M, L           jump to the highest, middle, lowest line on screen
  {, }              move up, down to the next empty line
  %                 jump to the corresponding parenthesis, square bracket or 
                    curly brace
  [[, ]]            jump to the beginning, end of the file
  :1, :$            jump to the beginning, end of the file
  <number>G         jump to line <number> (without the number, jumps to the 
                    end of the file)
  Ctrl-f, Ctrl-b    next page down, up
  Ctrl-d, Ctrl-u    next half-page down, up
  Ctrl-e, Ctrl-y    shift all the text by one line down, up
  w, b              go forward, backward to the next word
  e, ge             go to the end of the word, backwared to the end of the previous word
  f<char>           goes to the next <char> in the current line
  t<char>           goes to the character just before the next <char>
  m<character>, '<character>
                    set mark <character>, go to mark <character>
  ''                go to the line that was last modified

Manipulating files:

  Command           Interpretation

  :r <file>         read file in
  :w <file>         write current buffer to <file> (default: write current 
                    buffer to current file, if defined)
  :w! <file>        same as write file, overriding permissions
  :wq, ZZ           write to file and quit
  :wq!              write to file and quit, no matter what
  :sp <file>        split window and edit file
  :e <file>         edit <file>
  :n                edit next file in list
  :ls               list buffers
  :buf <number>     edit buffer number <number>

Executing a command easily several times:

  Mapped keys:

    To map a key to a command to execute, type:

      :map <key> <command>

    Then, type <key> to execute <command>.

  Macros:
    To enter a macro, type:
      q<character><commands>q
    To execute the macro <number> (default: 1) times, type:
      <number>@<character>
    Important note: macros can contain calls to mapped keys.

  Registers:
    To use a register named <character>, type "<character> before your command.
      Example: copying the word under the cursor and saving into register z:
        "zyw
      Example: pasting the result of register c before this word or line:
        "cP
    Important note 1: register characters are independent of marks ('a is not affected by "a)
    Important note 2: a macro named <character> is actually stored in the register of same name.  To edit the macro f, just create a new line (o<Esc>), paste the contents of register f ("fp), edit the commands (...), go to the beginning of the line and delete/store the line into register f (0"fD), and remove the temporary line (dd).

