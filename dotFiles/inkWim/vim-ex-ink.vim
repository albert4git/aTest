                zz, zt, zb - position cursor at middle, top, or bottom of screen


                Build and debug your code from within vim!
                Configuration

                Not much, really. You need a Makefile in the current directory.
                To Compile

                While you're in vim, type :make to invoke a shell, build your program. Don't worry when the output scrolls by; just press [Enter] when it's finished to return to vim.
                The Magic

                Back within vim, you have the following commands at your disposal:

                :cl lists the errors, warnings, and other messages.
                :cc displays the current error/warning message at the bottom of the screen and jumps to the offending line in your code.
                :cc n jumps to the nth message.
                :cn advances to the next message.
                :cp jumps to the previous message.

                There are more; if you're interested, type :help :cc from within vim.

                let @d = '<td></td>'
                let @r = '<tr>' . repeat(@d, 5) . '</tr>'
                let @t = '<table>' . repeat(@r, 5) . '</table>'
                "reg
                "echo @d
                "put reg d= "dp

                "bashrc
                "alias trim="ex +'bufdo!%s/\s\+$//e' -scxa"
                "alias retab="ex +'set ts=2' +'bufdo retab' -scxa"

                "replaces "hello" with "/world/"
                :%s/hello/\/world\//
                "does the same thing
                :%s#hello#/world/#
                :s/hello.*world/***&***/
                :2,$s/^\(.*\):\(.*\):\(.*\)$/\2 \1 is \3 years old./

                Normal-mode operations
                :g/vim/ norm A;
                :g/vim/ norm @a

                :%s/^/hello/g	Replace the begining of each line by hello
                :%s/$/Harry/g	Replace the end of each line by Harry
                :%s/onward/forward/gi	Replace onward by forward, case unsensitive
                :%s/ *$//g	Delete all white spaces
                :g/string/d	Delete all lines containing string
                :v/string/d	Delete all lines containing which didn’t contain string
                :s/Bill/Steve/	Replace the first occurence of Bill by Steve in current line
                :s/Bill/Steve/g	Replace Bill by Steve in current line
                :%s/Bill/Steve/g	Replace Bill by Steve in all the file
                :%s/\r//g	Delete DOS carriage returns (^M)
                :%s/\r/\r/g	Transform DOS carriage returns in returns
                :%s#<[^>]\+>##g	Delete HTML tags but keeps text
                :%s/^\(.*\)\n\1$/\1/	Delete lines which appears twice

                :e .	Open integrated file explorer
                :Sex	Split window and open integrated file explorer
                :browse e	Graphical file explorer
                :ls	List buffers
                :cd ..	Move to parent directory
                :args	List files
                :args *.php	Open file list
                :grep expression *.php	Returns a list of .php files contening expression
                gf	Open file name under cursor

                :!pwd	Execute the pwd unix command, then returns to Vi
                !!pwd	Execute the pwd unix command and insert output in file
                :sh	Temporary returns to Unix
                $exit	Retourns to Vi

                Window spliting
                :e filename	Edit filename in current window
                :split filename	Split the window and open filename
                ctrl-w up arrow	Puts cursor in top window
                ctrl-w ctrl-w	Puts cursor in next window
                ctrl-w_	Maximise current window
                ctrl-w=	Gives the same size to all windows
                10 ctrl-w+	Add 10 lines to current window
                :vsplit file	Split window vertically
                :sview file	Same as :split in readonly mode
                :hide	Close current window
                :­nly	Close all windows, excepted current
                :b 2	Open #2 in this window

Auto-completion
Ctrl+n Ctrl+p (in insert mode)	Complete word
Ctrl+x Ctrl+l	Complete line
:set dictionary=dict	Define dict as a dictionnary
Ctrl+x Ctrl+k	Complete with dictionnary

"
" InsertMode paste yanked text ...
<C-r>0
<C-r><C-p>0
<C-h> " delete back one character (backspace)
<C-w> " delete back one word
<C-u> " delete back to start of line
<C-k> " delete forward to end of line

We can see which files are loaded in the arguments list ...
:args app/assets/javascripts/ext*.js
:argdo %s/From/To/g
:argdo update

:vimgrep /CurrencyNumberHelper/ app/models/*.rb
:Qargs
:argdo %s/CurrencyNumberHelper/CurrencyHelper/g
:argdo update

:args `ack-grep -l CurrencyNumberHelper`
:argdo %s/CurrencyNumberHelper/CurrencyHelper/g
:argdo update

:Ack CurrencyNumberHelper
:cfdo s/CurrencyNumberHelper/CurrencyHelper/g | update


Then we run the macro (that is recorded in register a) with:
In the end we save all the buffers with:
:args app/models/*.rb
:argdo normal @a
:argdo update
select                                   v
select row(s)                            SHIFT + v
select blocks (columns)                  CTRL  + v
indent selected text                     >
unindent selected text                   <
list buffers                             :ls
open buffer                              :bN (N = buffer number)
print                                    :hardcopy
open a file                              :e /path/to/file.txt
                                         :e C:\Path\To\File.txt
sort selected rows                       :sort
search for word under cursor             *
open file under cursor                   gf
  (absolute path or relative)
format selected code                     =
select contents of entire file           ggVG
convert selected text to uppercase       U
convert selected text to lowercase       u
invert case of selected text             ~
convert tabs to spaces                   :retab
start recording a macro                  qX (X = key to assign macro to)
stop recording a macro                   q
playback macro                           @X (X = key macro was assigned to)
replay previously played macro *         @@
auto-complete a word you are typing **   CTRL + n
bookmark current place in file           mX (X = key to assign bookmark to)
jump to bookmark                         `X (X = key bookmark was assigned to
                                             ` = back tick/tilde key)
show all bookmarks                       :marks
delete a bookmark                        :delm X (X = key bookmark to delete)
delete all bookmarks                     :delm!
split screen horizontally                :split
split screen vertically                  :vsplit
navigating split screens                 CTRL + w + j = move down a screen
                                         CTRL + w + k = move up a screen
                                         CTRL + w + h = move left a screen
                                         CTRL + w + l = move right a screen
close all other split screens            :only

*  - As with other commands in vi, you can playback a macro any number of times.
     The following command would playback the macro assigned to the key `w' 100
     times: 100@w

** - Vim uses words that exist in your current buffer and any other buffer you
     may have open for auto-complete suggestions.






" select last paste in visual mode
"  last paste blowsier in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
        nnoremap gF <C-W>gf

<C-h> " delete back one character (backspace)
<C-w> " delete back one word
<C-u> " delete back to start of line
<C-k> " delete forward to end of line

var element =(this)
var tabName = element.data('tab')
var report = element.data('report')

We can visually select all 3 lines and then run command :normal A;  that will
execute A; (append ;) for each line. Alternatively, we can run same on the
whole content of the file with  :%normal A;.

8. Replace in multiple files Replacing in multiple files is not a straight
forward action in Vim. To search & replace in multiple files, first we need to
create a list of files in which we'll execute a command. We do that by using
the :args command. For example, lets load all javascript files that start with
the "ext" string: :args app/assets/javascripts/ext*.js We can see which files
are loaded in the arguments list by running the :args command. Having the
arguments list prepared, we can execute search & replace with: :argdo
%s/From/To/g Once changes have been made in the files, we can save all the
files in arguments list with: :argdo update


even more easier, if you're on a newer version of Vim, you can simply use cdo
and cfdo as pointed out by Thiago A. in the comments:

:Ack CurrencyNumberHelper
:cfdo s/CurrencyNumberHelper/CurrencyHelper/g | update


10. Edit already recorded macro

While recording a macro it's easy to do mistakes. And when that happens, it's
easier to edit the already recorded macro than to re-record it. Lets say we
have recorded new macro in register a . We can print the content of the macro
in the current buffer using :put a and then edit the macro in Vim. Once macro
is changed, we can select it and then yank it to register a with "ay . Then we
are ready to execute the new macro from register a with @a .







