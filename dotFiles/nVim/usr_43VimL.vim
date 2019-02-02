Example:
:set runtimepath=~/vimruntime,/mygroup/vim,$VIMRUNTIME
   This will use the directory "~/vimruntime" first (containing your
   personal Vim runtime files), then "/mygroup/vim" (shared between a
   group of people) and finally "$VIMRUNTIME" (the distributed runtime
   files).
   You probably should always include $VIMRUNTIME somewhere, to use the
   distributed runtime files.  You can put a directory before $VIMRUNTIME
   to find files which replace a distributed runtime files.  You can put
   a directory after $VIMRUNTIME to find files which add to distributed
"============================================================
"============================================================
"============================================================


:let i = 1
:while i < 5
:  echo "count is" i
:  let i += 1
:endwhile
"============================================================
:for i in range(1, 4)
:  echo "count is" i
:endfor

"============================================================
:let s:count = 1
:while s:count < 5
:  source other.vim
:  let s:count += 1
:endwhile

"============================================================
Since "s:count" is local to this script, you can be sure that sourcing the
"other.vim" script will not change this variable.  If "other.vim" also uses an
"s:count" variable, it will be a different copy, local to that script.

"============================================================
        b:name          variable local to a buffer
        w:name          variable local to a window
        g:name          global variable (also in a function)
        v:name          variable predefined by Vim
"============================================================
        :if !exists("s:call_count")
        :  let s:call_count = 0
        :endif
        :let s:call_count = s:call_count + 1
        :echo "called" s:call_count "times"
"============================================================
The "exists()" function checks if a variable has already been defined.  Its
argument is the name of the variable you want to check.  Not the variable
itself!  If you would do this: 

        :if !exists(s:call_count)
"============================================================
"if !exists()" can be read as "if not exists()"
"============================================================
:let name = "\"peter\""
:echo name

"============================================================
In double-quote strings it is possible to use special characters.  Here are
a few useful ones:

        \t              <Tab>
        \n              <NL>, line break
        \r              <CR>, <Enter>
        \e              <Esc>
        \b              <BS>, backspace
        \"              "
        \\              \, backslash
        \<Esc>          <Esc>
        \<C-W>          CTRL-W
"============================================================
        $NAME           environment variable
        &name           option
        @r              register

Examples: 

        :echo "The value of 'tabstop' is" &ts
        :echo "Your home directory is" $HOME
        :if @a > 5
"============================================================
Strings can be concatenated with ".".  Example: 
        :echo "foo" . "bar"
"============================================================
Borrowed from the C language is the conditional expression:

        a ? b : c

If "a" evaluates to true "b" is used, otherwise "c" is used.  Example: 

        :let i = 4
        :echo i > 5 ? "i is big" : "i is small"
"============================================================
        :if &term == "xterm"
        :  " Do stuff for xterm
        :elseif &term == "vt100"
        :  " Do stuff for a vt100 terminal
        :else
        :  " Do something for other terminals
        :endif
"============================================================
:if v:version >= 700
:  echo "congratulations, new Vim"
:  echo v:version
:else
:  echo "you are using an old version, upgrade!"
:  echo v:version
:endif
"============================================================
let str = "usr43 string theory."
:if str =~ " "
:  echo "str contains a space"
:endif
:if str !~ '\.$'
:  echo "str does not end in a full stop"
:endif
:if str =~ '\.$'
:  echo "str does !!! end in a full stop"
:endif
"============================================================
    :execute "tag " . tag_name

The "." is used to concatenate the string "tag " with the value of variable
"tag_name".  Suppose "tag_name" has the value "get_cmd", then the command that
will be executed is: 

???
:let tag_name ="superTag"
:execute "tag " . tag_name
:echo tag_name
:tag get_cmd

The ":execute" command can only execute colon commands.  The ":normal" command
executes Normal mode commands.  However, its argument is not an expression but
the literal command characters.  Example: 

        :normal gg=G

This jumps to the first line and formats all lines with the "=" operator.
   To make ":normal" work with an expression, combine ":execute" with it.
Example: 

        :execute "normal " . normal_commands

The variable "normal_commands" must contain the Normal mode commands.
   Make sure that the argument for ":normal" is a complete command.  Otherwise
Vim will run into the end of the argument and abort the command.  For example,
if you start Insert mode, you must leave Insert mode as well.  This works: 

        :execute "normal Inew text \<Esc>"

This inserts "new text " in the current line.  Notice the use of the special
key "\<Esc>".  This avoids having to enter a real <Esc> character in your
script.

If you don't want to execute a string but evaluate it to get its expression
value, you can use the eval() function: 

        :let optname = "path"
        :let optval = eval('&' . optname)

A "&" character is prepended to "path", thus the argument to eval() is
"&path".  The result will then be the value of the 'path' option.
   The same thing can be done with: 
        :exe 'let optval = &' . optname
"============================================================

"============================================================

"============================================================
