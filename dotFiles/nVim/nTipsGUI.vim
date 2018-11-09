"AAA----------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------





Switching to a different file is made easier using a simple map:
:map <F5> :buffers<CR>:e #
"AAA----------------------------------------------------------------------------------
Now, Ctrl-J and Ctrl-K will move the cursor one line down or up, and scroll one
line down or up--so the cursor remains on the same screen line (except near the
beginning and end of the file)--in both normal and visual modes.  And the
scroll parameter is unaffected.

    " N<C-D> and N<C-U> idiotically change the scroll setting
    function! s:Saving_scroll(cmd)
        let save_scroll = &scroll
        execute "normal" a:cmd
        let &scroll = save_scroll
    endfunction

    " move and scroll
    nmap <C-J>      :call <SID>Saving_scroll("1<C-V><C-D>")<CR>
    vmap <C-J> <Esc>:call <SID>Saving_scroll("gv1<C-V><C-D>")<CR>
    nmap <C-K>      :call <SID>Saving_scroll("1<C-V><C-U>")<CR>
    vmap <C-K> <Esc>:call <SID>Saving_scroll("gv1<C-V><C-U>")<CR>

This is an example of several terrible vim hacks, to boot.
"AAA----------------------------------------------------------------------------------
set guioptions-=m            " to get rid of the menu bar
set go-=T                       " to get rid of the tool bar
"AAA----------------------------------------------------------------------------------

VimTip	{{{1 603: Bookmarks as menu item
http://vim.sourceforge.net/tip_view.php?tip_id=

I like to save location of files I am editing
in a bookmark file. Each bookmark shows up as a 
menu item.

Add the attached lines to ~/_vimrc, and the Bookmark->Add
menu items will appeare in gvim (I use it on Windows/NT).

Note: I used cmd.exe,sh.exe,echo.exe to write the bookmark
to a file, it is tricky to get the quotes right.
It would be whole lot easier if vim had a function
append-register-or-string-to-file. Maybe someone can
find a way to do this without external shells?

- Mohsin (mosh.cs.albany.edu)

:set shell=sh shellslash shellcmdflag=-c shellxquote=\" shellpipe=\|\ tee
:amenu Mo2.BookMarks.Add
                \ :let @b='\\042 Bookmark: '.
                \    " DATE=".strftime("%Y-%b-%d_%X").
                \    " PWD=".escape(getcwd(),'\').
                \ escape("\\n",'\').
                \ ":amenu Mo2.BookMarks.".
                \ escape(escape(expand("%:t"),'.\'),'\').
                \ ' :sp +'.line(".").' '.
                \ escape(expand("%:p"),' \')<CR>
                \ :exe ':!(echo '.@b.' >> $HOME/bookmark.vim)'<CR>
                \ :so $HOME/bookmark.vim<CR>

:amenu Mo2.BookMarks.Edit :sp $HOME/bookmark.vim<CR>
:amenu Mo2.BookMarks.Load :so $HOME/bookmark.vim<CR>
 
if filereadable(expand("$HOME/bookmark.vim"))
    :amenu Mo2.BookMarks.-Sep-	:
    :so $HOME/bookmark.vim
endif


"AAA----------------------------------------------------------------------------------
VimTip	{{{1 672: Buffer Bar
http://vim.sourceforge.net/tip_view.php?tip_id=

Hello,

GVim does not have a buffer bar (i.e. a toolbar with buffer names listed), but we can make a simple one
by using (GUI only)

:tearoff Buffers

this will float (:help tearoff) the Buffers menu, giving an easier access to switching buffers. The advantage of
using this floating menu is that we does not have to switch mode and giving commands
everytime we want to switch buffer also it gives the list of files currently being edited.

The problem is that when you switch buffer, the floating menu disappear. To make it always
appear, we can put this command in the .vimrc

autocmd VimEnter * tearoff Buffers

The floating menu will become quite lenghty if we open many buffers, to make it somehow smaller,
we can edit the file menu.vim in $VIMRUNTIME to make it (1) show only the filename, 
not with the path and (2) not showing
the delete, refresh, etc, since these command can easily done from command mode (:help buffer).

For the first one, we can set this variable to 0

:let g:bmenu_max_pathlen=0

in our .vimrc

and for the second one, we can use this command (assuming the commands are around lines 563-573,
in my menu.vim -> may differ to yours)

:563-573s/"/'/g
:563-573s/exe/"exe/

the order of these commands does matter. You should check if the command are really located
in those lines, the commands to be commented are

exe 'an <silent> ' . g:bmenu_priority . ".2 &Buffers.&Refresh\\ menu :call <SID>BMShow()<CR>"
exe 'an ' . g:bmenu_priority . ".4 &Buffers.&Delete :bd<CR>"
exe 'an ' . g:bmenu_priority . ".6 &Buffers.&Alternate :b #<CR>"
exe 'an ' . g:bmenu_priority . ".7 &Buffers.&Next :bnext<CR>"
exe 'an ' . g:bmenu_priority . ".8 &Buffers.&Previous :bprev<CR>"
exe 'an ' . g:bmenu_priority . ".9 &Buffers.-SEP- :"

After that, restart gVim.

Thanks.


