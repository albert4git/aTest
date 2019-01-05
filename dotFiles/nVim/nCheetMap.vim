
----------------------------------------------------------------------------------
As always the doc is your friend: :h map-listing

    * indicates that it is not remappable (i.e. it is not a recursive mapping, see know when to use nore later in this answer)
    & indicates that only script-local mappings are remappable
    @ indicates a buffer-local mapping

----------------------------------------------------------------------------------
:map j
:map <Leader>m
:map <F5>

Note that the <Leader> key will be replaced by its actual value in the list.
----------------------------------------------------------------------------------
This will prompt the last file which modified your mapping.
:verbose map

----------------------------------------------------------------------------------
Try to temporarily remove your .tmux.conf if you use tmux
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
Don't do that:
------------------

nnoremap <Leader>x :w | !% python -m json.tools

Vim will consider the pipe | as a command termination:
When you source your .vimrc the mapping
nnoremap <Leader>x :w will be created then
the external command !% python -m json.tools will be executed.

Instead do that:
------------------
nnoremap <Leader>x :w <bar> !% python -m json.tools
----------------------------------------------------------------------------------
Do that
------------------

nnoremap > dd
nnoremap - >

This way Vim will translate - as > and will not try to do any other
translation because of the nore.
----------------------------------------------------------------------------------
Remember that some key combinations are equivalent: Because of the hexadecimal
codes that are produced some key combinations will be interpreted by Vim as
another key. For example

Ctrl-I      Tab
Ctrl-[      Esc
Ctrl-M      Enter
Ctrl-H      Backspace
<C-h> is equivalent to <backspace> <C-j> as <enter>
<C-S-a> is equivalent to <C-a>.
----------------------------------------------------------------------------------
Mapping Ctrl+upper case letter separately from Ctrl+lower case
letter is not possible cause of the way the terminals send ASCII codes.
----------------------------------------------------------------------------------
<BS>           Backspace
<Tab>          Tab
<CR>           Enter
<Enter>        Enter
<Return>       Enter
<Esc>          Escape
<Space>        Space
<Up>           Up arrow
<Down>         Down arrow
<Left>         Left arrow
<Right>        Right arrow
<F1> - <F12>   Function keys 1 to 12
#1, #2..#9,#0  Function keys F1 to F9, F10
<Insert>       Insert
<Del>          Delete
<Home>         Home
<End>          End
<PageUp>       Page-Up
<PageDown>     Page-Down
<bar>          the '|' character, which otherwise needs to be escaped '\|'
----------------------------------------------------------------------------------
:nnoremap <C-P> {
:nnoremap <Char-16> {
:nnoremap <Char-020> {
:nnoremap <Char-0x10> {

You can also use the termcap entry for a key in the map. The termcap entries are represented using the format <t_xx> where 'xx' is replaced with the key. You can get a list of termcap keys using the ":set termcap" command. For example, to map F8 you can use <t_F8>:
:nnoremap <t_F8> :make<CR>
----------------------------------------------------------------------------------
:nnoremap ;g :echo 'First command'<CR>
:nnoremap ;k :echo 'Second command'<CR>

When you press ';' to repeat the last 't' or 'f' or 'T' or 'F' command, Vim will now wait for 'timeoutlen' milliseconds to check whether you are going to enter 'g' or 'k'. If you enter any other character or don't enter any character for a second, then Vim will repeat the last 't' or 'f' or 'T' or 'F' command. If you enter 'g' or 'k' after ';', then Vim will execute the corresponding map.

it is better to avoid starting your mapped key sequence with:
a frequently used Vim command like j, k, l, etc. 
----------------------------------------------------------------------------------

If you want your map to accept a range, then you have to specify the range
attribute when defining the function as shown below:

function! Myfunc() range
  echo 'range = ' . a:firstline . ',' . a:lastline
endfunction
:nnoremap _w :call Myfunc()<CR>
----------------------------------------------------------------------------------
:nnoremap <F9> :set invignorecase \| set ignorecase?<CR>

:nnoremap <F9> :set invignorecase <Bar> set ignorecase?<CR>
:nnoremap <F9> :set invignorecase <press Ctrl-V>| set ignorecase?<CR>

Some Ex commands use the command that follows them (separated by |) as part of
the command itself. For example, the ":global" (or ":g") command repeats the
command that follows it for every matched pattern. In the following command,

:g/foo/s/abc/xyz/g | echo 'Completed substitution'

The ":echo" command is repeated for every 'foo' found in the current buffer.
To execute the ":echo" command only once after the ":g" command completes, you
have to use the ":exe" command.

:exe 'g/foo/s/abc/xyz/ge' | echo 'Completed substitution'

If your map uses one of these commands like ":g" then you have to use ":exe"
in your map command.

:nnoremap <F9> :set invignorecase<CR>:set ignorecase?<CR>

Ex commands invoked from a map are not added to the command history. You can't
recall the individual ....
----------------------------------------------------------------------------------
:map <buffer> :map! <buffer>
----------------------------------------------------------------------------------
You can use the <expr> attribute to a map command to invoke a Vim function and
use the returned value as the key sequence to execute.

For example, the following code creates a normal mode map to change to the
directory of the current buffer.

function! ChangeToLocalDir()
  lchdir %:p:h
  return ''
endfunction
nnoremap <expr> _c ChangeToLocalDir()

In this example, the function returns an empty string so the map takes no
action other than executing the function.

The <expr> attribute can be used with all the mode specific map commands.
----------------------------------------------------------------------------------
Special characters in mapsEdit

To use non-printable characters using the <> notation like <F5> in a map
command, the '<' flag should not be present in the 'cpoptions' option. For
example, the following map command will not work:

:set cpo+=<
:inoremap <F7> <C-X><C-N>

In insert mode, if you press <F7>, instead of executing the map, the
characters <F7> will be inserted. To prevent this, you can use the <special>
map attribute:

:inoremap <special> <F7> <C-X><C-N>

With the <special> map attribute, independent of the 'cpoptions' option setting, Vim will correctly process the <> key codes in the {rhs} of a map command. 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
