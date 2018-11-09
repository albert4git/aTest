
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 79: How to use :grep to get a clickable list of function names
The following function will make a :cwindow window with a line per function
in the current C source file. NOTE: It writes the file as a side effect.

" Invoke with ':call ShowFunc()'
" You may want to do :nmap <somekey> :call ShowFunc()<CR>

function! ShowFunc()
    let gf_s = &grepformat
    let gp_s = &grepprg

    let &grepformat = '%*\k%*\sfunction%*\s%l%*\s%f %*\s%m'
    let &grepprg = 'ctags -x --c-types=f --sort=no -o -'

    write
    silent! grep %
    cwindow

    let &grepformat = gf_s
    let &grepprg = gp_s
endfunc
" You may want to do :nmap <somekey> :call ShowFunc()<CR>

"AAA-ZZZ---------------------------------------------------------------------------------------------
This will remove a l l  empty line in the document.
:%g/^$/d
"AAA----------------------------------------------------------------------------------------------

function! change_curr_dir()
	let _dir = expand("%:p:h")
	exec "cd " . _dir
	unlet _dir
endfunction

autocmd bufenter * call change_curr_dir()

"AAA----------------------------------------------------------------------------------------------
If you want to bind two or more windows such that when one
window is scrolled, the other windows are scrolled simultaneously,
set the 'scrollbind' option for these windows:
:set scrollbind

"AAA----------------------------------------------------------------------------------------------
"   help jump-motions
"   help CTRL-O
"   help CTRL-I
"   '' - return to the line where the cursor was before the latest jump
"   `` - return to the cursor position before the latest jump (undo the jump).
"   'm  - jump to the beginning of the line of mark m
"   `m  - jump to the location of mark m
"AAA----------------------------------------------------------------------------------------------
Simple text changes in normal mode (e.g. "dw" or "J") can be repeated with the "." command.
The last command-line change (those invoked with ":", e.g. ":s/foo/bar") can be 
repeated with the "@:" command.
"AAA----------------------------------------------------------------------------------------------
:r foo.txt        inserts the file foo.txt below the cursor

:0r foo.txt       inserts the file foo.txt above the first line

:r !ls            inserts a listing of your directory below the cursor

:$r !pwd          inserts the current working directory below the last line 
"AAA----------------------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------------------
"VARDEF JUMP:wa
:help [i
:help [d
"JUMP C-Code-Block
:help [{
:help ]}
:help [(
:help ])
"AAA----------------------------------------------------------------------------------------------
http://vim.sourceforge.net/tip_view.php?tip_id=

Here's a (what should be a one-line) map to help you tell just what
syntax highlighting groups the item under the cursor actually is:

VimTip	{{{1 99: How to tell what syntax highlighting group *that* is!
map  <F10>  :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

Once known you can override the current highlighting with whatever you want.
If you're debugging a syntax highlighting file (a rare occupation), sometimes
you'll wish to know the entire chain of syntax highlighting.  For that,
check out
"AAA----------------------------------------------------------------------------------------------
function InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
endfunction

then define the appropriate mapping:
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"AAA----------------------------------------------------------------------------------------------
map <f1> :previous<cr>
map <f2> :next<cr>
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 131: Scroll alternate window
http://vim.sourceforge.net/tip_view.php?tip_id=
This mapping allow you to quickly scroll inactive window when displaying several windows concurrently.

nmap <silent> <M-Down> :call ScrollOtherWindow("down")<CR>
nmap <silent> <M-Up> :call ScrollOtherWindow("up")<CR>

fun! ScrollOtherWindow(dir)
  if a:dir == "down"
    let move = "\<C-E>"
  elseif a:dir == "up"
    let move = "\<C-Y>"
  endif
  exec "normal \<C-W>p" . move . "\<C-W>p"
endfun

"AAA----------------------------------------------------------------------------------------------
Just place this in your .vimrc.
map _F ma[[k"xyy`a:echo @x<CR>
now _F will display which function you are currently in.


"AAA----------------------------------------------------------------------------------------------
"vimtip 149: automatically update your diff upon writing.
  au bufwritepost                  *              if &diff == 1
  au bufwritepost                  *              :diffupdate
  au bufwritepost                  *              endif
"AAA----------------------------------------------------------------------------------------------
An FAQ on the vim users' mailing list is whether <Tab> and <C-I>
can be mapped to different things.  The answer is no.  As I understand
it, this is a low level issue:  <Tab> and <C-I> are different names
for the same ASCII code, and there is no way for vim to tell them
apart.  Similarly, <Esc> and <C-[> are the same thing.

"AAA-ZZZ----------------------------------------------------------------------------------------------
"182: Keep your cursor centered vertically on the screen
map j jzz
map k kzz
"AAA----------------------------------------------------------------------------------------------
" map control-backspace to delete the previous word
    imap <C-BS>        <Esc>vBc
"AAA----------------------------------------------------------------------------------------------
"Bouncing Parentheses (during insertion)
    inoremap ) )<c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
"AAA----------------------------------------------------------------------------------
"Very Handydandy
g/profile/d

"AAA----------------------------------------------------------------------------------
set makeprg=gcc\ -o\ %<\ % 
:make
compile file.c with the output file. (gcc file.c -o file).
" if no errors, it closes any open cwindow.
:command -nargs=* Make make <args> | cwindow 3
"AAA----------------------------------------------------------------------------------
"!!! :Xbit
!chmod a+x %

fun! SetExecutableBit()
	let fname = expand("%:p")
	:checktime
	exec "au FileChangedShell " . fname . " :echo"
	:silent !chmod a+x %
	:checktime
	exec "au! FileChangedShell " . fname
endfun

" Create an EX command that will call the function.
command -nargs=0 Xbit call SetExecutableBit()

Now you can type :Xbit to make the file executable!
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 230: copy current file to another location from within vim
http://vim.sourceforge.net/tip_view.php?tip_id=

I work on jsp pages in my source tree but I have to copy the jsp files over to the tomcat directory in order to view my changes.The following mapping will copy the file being edited to another location.

command Cpage silent !cp '%:p' "c:/Progra~1/Tomcat/webapps/console/pages/%"

Explanation:

% refers to the current buffer
%:p refers to the path to the file 
silent suppresses the command prompt window.

Usage:

:Cpage

"AAA----------------------------------------------------------------------------------------------
abb dotlin ???????????????????????????????????????????????????????????????????????^M
abb cdotlin /*???????????????????????????????????????????????????????????????????*/^M
abb fdotlin ???????????????????????????????????????????????????????????????????????^M
abb cfdotlin /*???????????????????????????????????????????????????????????????????*/^M
abb dlin =======================================================================^M
abb cdlin /*===================================================================*/^M
abb lin -----------------------------------------------------------------------^M
abb clin /*-------------------------------------------------------------------*/^M
abb ulin _______________________________________________________________________^M
abb culin /*___________________________________________________________________*/^M
abb Ulin ???????????????????????????????????????????????????????????????????????^M
abb cUlin /*???????????????????????????????????????????????????????????????????*/^M
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 238: Very basic session persistence

  " function! SaveCurrentSession()
  "   if v:this_session != ""
  "     exe "mksession! " . v:this_session
  "   endif
  " endfunction
  " au BufRead Session.vim so %
  " au VimLeave * call SaveCurrentSession()

"AAA----------------------------------------------------------------------------------------------
'|' as you may well be aware is the goto column motion,
and that "75|" will place your cursor on column 75 of the current line.

"AAA----------------------------------------------------------------------------------------------
You can of course list the whole lot with
:ab<cr>
But did you know that you can type the first few letters of your abbreviations and get a list of just thos abs eg
:ab php<cr>
gives me all my php abs
:ab perl<cr>
gives me all my perls
also try control-D instrad of <cr>

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 306: Open a web-browser with the URL in the current line
http://vim.sourceforge.net/tip_view.php?tip_id=

function! Browser ()
    let line = getline (".")
    let line = matchstr (line, "http[^ ]*")
    exec "!netscape ".line
endfunction

map <Leader>w :call Browser ()<CR>

"AAA----------------------------------------------------------------------------------------------
imap <S-Space> <esc>l
imap <C-CR> <esc>o
imap <S-CR> <esc>O

nmap <S-Space> i
nmap <space><space> i
nnoremap <CR> o

"AAA----------------------------------------------------------------------------------------------
Instead you can use :normal command.  The secret is to add a <CR> (^M) on the
end of the command.   For example, to search for "pattern" and move the cursor
to the end of the matching pattern issue the command:

:normal /pattern/e+1^M

where ^M is a real carriage return.  It can be entered with <c-v><c-m>.

Another use is when you want to enter a bunch of normal commands together.  For
example, if you were looking to find a '{' to highlight and delete a C block.
The '{' may not be on the same line so you can't use the "f" normal command.   

:normal V/{/^M%d

"AAA----------------------------------------------------------------------------------------------
Setting nocindent, noautoindent, nosmartindent still cannot stop this.
All you need to do is "set paste", then paste your stuff, and then
"set nopaste" again.

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 352: disabling cabbrev
http://vim.sourceforge.net/tip_view.php?tip_id=

Have you ever been annoyed by an over-zealous cabbrev? A simple way to
temporarily disable it is to set invpaste. Very convenient in combination with
the pastetoggle key.

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 398: Mapping for quicker access to macros
http://vim.sourceforge.net/tip_view.php?tip_id=

:nnoremap <space> @q

Start recording keystrokes by hitting 'qq'. 
End recording with 'q'  (<esc> q if you're in insert mode).
Play keystrokes by hitting space.

"AAA----------------------------------------------------------------------------------"
"Jump between windows
map <space> <c-W>w
"Open window wide
map <space><space> :call OpenSplittedWindowWide()<cr>

function OpenSplittedWindowWide()
	normal ^W|
	normal ^W20+
endfunction


"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 423: Finding more available keys to map
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 430: Fast switching between buffers
nmap <tab> :if &modifiable && !&readonly && &modified <cr> :w<cr> :endif<cr> :bn<cr>
nmap <s-tab> :if &modifiable && !&readonly && &modified <cr> :w<cr> :endif<cr> :bp<cr>
"AAA----------------------------------------------------------------------------------------------
The . register is basically everything you've just typed in input mode
:let @a = @.
"aP

"AAA----------------------------------------------------------------------------------------------
The solution is to type '<Esc>gqap' to format a paragraph  or 
make a mapping for this command. However, it annoys me to do 
it repeatedly.

There is a better solution.

1. Go to http://cream.sourceforge.net/vim.html
and download the latest patched Vim

2. Install the program.

3. See :help auto-format. 

I will not repeat the docs here. For the impatient, set 
fotmatoptions to aw2tq ':set fo=aw2tq' and start typing.
The text flows automagically between lines as you type
text inside the paragraph.
GREAT!!!

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 442: Show all lines that contain keyword under cursor
a word, place your cursor over the word and press [I
Started finding this one pretty useful.
**********************************************************************
imap <Backspace> <left><del>
" this will allow me to always use the backspace key in insert mode

imap <C-j> <Esc>Ji
" this will allow me to join a line while still in insert mode

map .f v%zf
" fold an entire block of code

nnmap ,y <S-v>y
" This will select a whole line of text or it will select 
" everything in a fold.

map .; v%:s/^/;;;/<CR>:noh<CR>
" comments out and entire block of code from paren to paren

:au BufRead *.lsp :loadview 1<cr>
:au BufRead *.LSP :loadview 1<cr>
" load the first fold view file for the current file

" this will allow you to format an entire block of text
map st :set tw=70<cr>v<S-}>gq<End>
**********************************************************************
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 446: Quick and dirty Postgres query
map <F9> :!psql -d yourdb < % <BAR> less
"AAA----------------------------------------------------------------------------------------------
"Use this vmap to enclose a block with fold markers:
vmap    <leader>fold mz:<esc>'<O// {{{<esc>'>o// }}}<esc>`z?{{{<cr>A<space>

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 478: Copy the search results into clipboard
http://vim.sourceforge.net/tip_view.php?tip_id=

" previous clear the clipboard with this command
:normal "*y0
" Usage: :g/<pattern>/call CopyPattern()
function CopyPattern()
	let idx = 0
	let xEnd = 0

	while idx >= 0
		let @* = @* . matchstr(getline("."), '' . histget("/", -1), idx) . "\n"
		let xEnd = matchend(getline("."), '' . histget("/", -1), idx)
		let idx = match(getline("."), '' . histget("/", -1), xEnd)
	endwhile

	unlet idx
	unlet xEnd
endfunction

"AAA----------------------------------------------------------------------------------------------
I made the following (example) to have a unique abbreviation:
  iabbrev date^A  <c-r>=strftime("%F")<cr>
"AAA--------------------------------------------------------------------------------- 
VimTip	{{{1 486: Search for word under cursor, but don't move.
:noremap <F1> #*
"AAA----------------------------------------------------------------------------------------------
:set  complete=k
autocmd Syntax * exec('set dict=/usr/share/vim/syntax/' .expand('<amatch>') .'.vim')
"AAA----------------------------------------------------------------------------------------------
This is a errorformat for Intel icc7 compiler:
errorformat=%E%f(%l): %m,%-C,%-C%p,%Z
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 596: Insert location of the currently edited file
:imap <C-r>@ <C-r>=expand("%:p:h")<cr>
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 597: indet a code block - >i{
http://vim.sourceforge.net/tip_view.php?tip_id=

Let's say we have:
// some code
{ // start block
//some other code
// HERE IS THE CURSOR
// other code
} // end block

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 605: replace a word with the yanked text
map S diw"0P

I rarely use S command, because it's equal to cc.
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 622: Deleting a buffer without changing your window layout
http://vim.sourceforge.net/tip_view.php?tip_id=

Here's a small command for your <.vimrc>:

com! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

To use it, type   :Kwbd

Kwbd stands for:  Keep window (layout) and delete the associated buffer.

        function! Kwbd(kwbdStage)
        if(a:kwbdStage == 1)
                if(!buflisted(winbufnr(0)))
                bd!
                return
                endif
                let g:kwbdBufNum = bufnr("%")
                let g:kwbdWinNum = winnr()
                windo call Kwbd(2)
                execute "normal " . g:kwbdWinNum . ""
                let g:buflistedLeft = 0
                let g:bufFinalJump = 0
                let l:nBufs = bufnr("$")
                let l:i = 1
                while(l:i <= l:nBufs)
                if(l:i != g:kwbdBufNum)
                        if(buflisted(l:i))
                        let g:buflistedLeft = g:buflistedLeft + 1
                        else
                        if(bufexists(l:i) && !strlen(bufname(l:i)) && !g:bufFinalJump)
                                let g:bufFinalJump = l:i
                        endif
                        endif
                endif
                let l:i = l:i + 1
                endwhile
                if(!g:buflistedLeft)
                if(g:bufFinalJump)
                        windo if(buflisted(winbufnr(0))) | execute "b! " . g:bufFinalJump | endif
                else
                        enew
                        let l:newBuf = bufnr("%")
                        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
                endif
                execute "normal " . g:kwbdWinNum . ""
                endif
                if(buflisted(g:kwbdBufNum) || g:kwbdBufNum == bufnr("%"))
                execute "bd! " . g:kwbdBufNum
                endif
                if(!g:buflistedLeft)
                set buflisted
                set bufhidden=delete
                set buftype=nofile
                setlocal noswapfile
                normal athis is the scratch buffer
                endif
        else
                if(bufnr("%") == g:kwbdBufNum)
                let prevbufvar = bufnr("#")
                if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != g:kwbdBufNum)
                        b #
                else
                        bn
                endif
                endif
        endif
        endfunction



"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 633: spell check of word below cursor
http://vim.sourceforge.net/tip_view.php?tip_id=

poor man's grep of spell checking for unix based systems

requires aspell/ispell to be available in path or use full path in map command

map <A-e> :!echo <cword> \| ispell -d british -a -- <return>
map <A-d> :!echo <cword> \| ispell -d danish -a -- <return>

spell check words in either english or danish
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 655: search with one key
I found it simpler to map these to a single key.
put these mappings in your _vimrc file

:nmap  <F8> :execute ":normal #"<CR>
:nmap  <F9> :execute ":normal *"<CR>

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 675: How to turn off all colors

syntax off
set nohlsearch
set t_Co=0
"AAA----------------------------------------------------------------------------------------------
" Opening and closing braces
imap <C-F> {<CR>}<C-O>O
Example:
int main() Ctrl-F
will produce:
int main() {
    |
}
</code>

"AAA----------------------------------------------------------------------------------------------
"Instead of setting 'verbose' in your vimrc, use autocommands, as follows (for instance)
if &cmdheight == 1
    set cmdheight=2
endif
if &verbose == 0
    augroup late-verbose
        autocmd    VimEnter    *    set verbose=1
        autocmd    VimLeave    *    set verbose=0
    augroup END
endif
"AAA----------------------------------------------------------------------------------------------
Intel changed the errorformat for their fortran compiler with version 8.0. An
errorformat string that works with the new compiler is:

set efm=%E%.%#rror:\ %f\\,\ line\ %l:\ %m,\%-C%.%#,\%-Z\%p^


"AAA----------------------------------------------------------------------------------------------
:map <Leader>p :!open -a Safari %<CR><Enter>
"AAA----------------------------------------------------------------------------------------------
The <C-^> command is very handy for fast buffer switching.  Used by itself, it
switches you to the previous buffer you were editing.  With a number before it,
it switches to that buffer number.  However, I find it's location on the
keyboard inconvenient.

With a few extra mappings, buffer switching can be easy indeed.  Pick an unused, easy-to-type char - I picked \ :
   :nnoremap  \  <C-^>
"AAA----------------------------------------------------------------------------------------------
"Append the following to your .vimrc (_vimrc on windows):
highlight ShowMatches guibg=darkgrey guifg=white
au! Cursorhold * exe 'match ShowMatches /\v%(%#\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*%#\})/'
set ut=30
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 784: Word under cursor for command
http://vim.sourceforge.net/tip_view.php?tip_id=

During editing, there are many situations where one would like to do a command based on the word under cursor. Idea is to yank into a register and then use this register automatically.  Basis of this functionality are two commands
1) Yanking into a register
     e.g: "zyw - will yank the word into z reg, "byy - yanks the line into b reg
 2)  Concatenating the register to a command and executing it.
     e.g:  :exe "/".@z.""<CR>  - searches for string in z reg      

Some more e.g:
a) Lets say that you have a file that has a list of files.  You don't want to edit all the files, but selectively.  
     :map <F2> "zyw:exe "vs ".@z.""<CR>
      Pressing <F2> will open the file in vertically split window
b) Browsing a text file and saving all those difficult words you want to refer to during leisure
     Open the text file and in a split window open an empty file.
    :map <F2> "zyw<C-w>wo<Esc>"zp<C-w>w
    yank the word under cursor, change window, paste and return
c)  Help in help in help
     :help 
     :map <F3> "zyw:exe  "h ".@z.""<CR>
     Press <F3> on any word and we can see vim help for that keyword.

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 792: Preloading registers
http://vim.sourceforge.net/tip_view.php?tip_id=

There never seem to be enough spare keys for maps.
The command is executed by doing a @m
let @m=":'a,'bs/"
let @s=":%!sort -u"

here's a twisted one
let @y='yy@"'


You can overwrite them of course when doing a recording or a plain yank; I
prefer to leave registers a-q for yanks or recordings and preload the others
"AAA----------------------------------------------------------------------------------------------
This just splits the current window and starts you at the next occurrence of
the word under the cursor in the new split.  Repeat search as usual.  Close the
split window when you're done.  You return to the original window at the cursor
position you left.

	:map zm :let @/=expand("<cword>") <BAR> split <BAR> execute 'normal n'<CR>
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 813: Reverse all the lines in a file
http://vim.sourceforge.net/tip_view.php?tip_id=
   :g/^/m0
will reverse all the lines in a file. Useful for certain files like logs.

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 821: Simplest buffer explorer ever
http://vim.sourceforge.net/tip_view.php?tip_id=

    nnoremap :e :ls<CR>:e<Space>

"AAA----------------------------------------------------------------------------------------------
Word-wise cut, copy & paste over the current word. There's nothing special or
magical about these bindings, just that I find them really useful for coding,
and I thought I'd share.

map <A-v> viw"+gPb
map <A-c> viw"+y
map <A-x> viw"+x
"AAA----------------------------------------------------------------------------------------------
"VimTip1 835: Get Intellisense for C++ to search CWD/PWD
let $INCLUDE = expand("%:p:h") . ";" . $INCLUDE
"AAA----------------------------------------------------------------------------------------------
nnoremap <C-]> <Esc>:exe "ptjump " . expand("<cword>")<Esc>
Control-] pop open a window and show the tag there.  The :ptjump
command shows the tag in a preview window without changing the current buffer
or your cursor position.
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 875: grep and bar---AKA |, OR, or alternation
http://vim.sourceforge.net/tip_view.php?tip_id=

When using bar in grep from a shell prompt you would use something like:

grep -i "main\(menu\|tool\)" *
or
grep -iE "main(menu|tool)" *

but you must remember to add an extra escape the '|' character
in your regex when using grep from Vim like so:

grep -i "main\(menu\\|tool\)" *
or
grep -iE "main(menu\|tool)" *

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 876: selecting blocks of paragraphs.
one:
:map <C-S-v> (V)

two:
:map <C-S-v> (V)*y''
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 877: Replace all commas with new lines
http://vim.sourceforge.net/tip_view.php?tip_id=

If you wanted to turn a comma-separated list of items into a list where each item is on its own line do this in vim:
:%s/,/^M/g
do not type the "^M" literally but hit CTRL-ENTER to get it.
"AAA----------------------------------------------------------------------------------------------
"Last modified: Mo Okt 22, 2018  12:58
" Search the first 20 lines for Last modified: Mo Okt 22, 2018  12:58
function! LastMod()
    if line("$") > 20
	let l = 20
    else
	let l = line("$")
    endif
    exe "1," . l . "g/Last modified: Mo Okt 22, 2018  12:58
		\ strftime("%a %b %d, %Y  %I:%M%p")
endfun

" This auto command will call LastMod function everytime you save a file
autocmd BufWrite *   ks|call LastMod()|'s
"AAA----------------------------------------------------------------------------------------------
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')

"AAA----------------------------------------------------------------------------------------------
[snip]
And as an added bonus, for those new to text folding, add this to your .vimrc file too:

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

That way whatever folds you set won't get lost when you quit.  I had that
happen after spending 15 minutes folding up a 3000+ line file.  Happy vimming!
[/snip]
"AAA----------------------------------------------------------------------------------------------

VimTip	{{{1 1008: Toggle quickf
http://vim.sourceforge.net/tip_view.php?tip_id=

Using this function & command:

command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

Calling ':QFix' will "toggle" the quickfix open and closed.  It's easiest to map this to something fast.  I use:
nmap <silent> \` :QFix<CR>

If you want to force the window open, use ':QFix!' and the window will open or stay open.

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1063: Send results of a g// to a new window
http://vim.sourceforge.net/tip_view.php?tip_id=

" .vimrc
nmap <F3>  :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>

How to Use:-
perfect your g/regexp/
The when you are satisfied hit <F3>

Explanation:-
:redir @a            redirect output to register a
:g//                    repeat last global command
:redir END          end redirection
:new                  create new window
:put! a                paste register a into new window

Idea  by Peppe (map by me zzapper)

"AAA----------------------------------------------------------------------------------------------
ESC -to- tab ...

inoremap <m-i> <tab>
nnoremap <tab> <esc>
vnoremap <tab> <esc>gV
onoremap <tab> <esc>
inoremap <tab> <esc>`^

Notes: the gV makes sure to deselect the selection; and the `^ puts the cursor
back to where it was last in insert mode (so there is no going back a char when
escaping to normal modeooo).

"AAA----------------------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1220: Use Vi shortcuts in terminal.
http://vim.sourceforge.net/tip_view.php?tip_id=

I got addicted to using vim shortcuts like h,j,k,l, b (back one word), e
(forward one word), ... and I miss it every time when I'm not in vim. But there
is a way to use basic Vi shortcuts when you are in command line. All you have
to do, is write the following lines to /etc/inputrc or ~/.inputrc :

######################################################

set editing-mode vi
set keymap vi

######################################################

Now exit the terminal and come back. The main difference is that by default you
are in INSERT mode and you have to pres Esc to get to normal mode.
"AAA----------------------------------------------------------------------------------------------
If you have gVim toolbars disabled (like myself), here's an easier and quicker way to toggle the spellcheck funcitonality:
  :map <F5> :setlocal spell! spelllang=en_us<cr>
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1228: Completion popup selection like other IDEs
http://vim.sourceforge.net/tip_view.php?tip_id=

Vim 7's popup menu for completion (omni or otherwise) takes a little getting
used to when it comes to selecting the completed word. See ":help
ins-completion". The completed word can be selected using the arrow keys,
PageUp/Down, Enter and Esc. In addition to that, there is Ctrl-E, Ctrl-Y,
Ctrl-N and Ctrl-P.

Here's an alternative setup that feels a little more like the completion menu of other IDEs. Place in vimrc.

  inoremap <silent><Esc>      <C-r>=pumvisible()?"\<lt>C-e>":"\<lt>Esc>"<CR>
  inoremap <silent><CR>       <C-r>=pumvisible()?"\<lt>C-y>":"\<lt>CR>"<CR>
  inoremap <silent><Down>     <C-r>=pumvisible()?"\<lt>C-n>":"\<lt>Down>"<CR>
  inoremap <silent><Up>       <C-r>=pumvisible()?"\<lt>C-p>":"\<lt>Up>"<CR>
  inoremap <silent><PageDown> <C-r>=pumvisible()?"\<lt>PageDown>\<lt>C-p>\<lt>C-n>":"\<lt>PageDown>"<CR>
  inoremap <silent><PageUp>   <C-r>=pumvisible()?"\<lt>PageUp>\<lt>C-p>\<lt>C-n>":"\<lt>PageUp>"<CR>

Use up/down arrow and PageUp/Down keys to scroll through the popup menu. The word in text will change as you scroll through. Press Enter to accept the selected word. Hit Esc to cancel completion and go back to the original word.

For those of you who prefer Esc to work like Enter, you can use this:

  inoremap <silent><Esc>      <C-r>=pumvisible()?"\<lt>C-y>":"\<lt>Esc>"<CR>


"AAA----------------------------------------------------------------------------------------------
        "???193: Insert the current filename at cursor postion.
        imap fnp   <C-R>=expand("%:t:r")<CR>
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1378: Change colors when switching to other directory
http://vim.sourceforge.net/tip_view.php?tip_id=

When you edit files in two different directories, for example
when copying parts of code from one into the other, you may
change Vims color scheme so that you always see at the first
glance in which directory the file resides that you edit:

:autocmd BufEnter * if match(@%,'/otherdir/')>=0 | colorscheme oceanblack | else | colorscheme inkpot | end

Sorry, this does not work very well for splitted windows.

"AAA----------------------------------------------------------------------------------------------
This tip is to add a good calculator to vim visual mode selections.
It allows you to replace a (block of) math expression(s) by
its computation (see the 3 Usage modes below).
It uses Dr. Chip visual block plugin vis.vim (vimscript #1195),

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1343: Setting diff environment while running vim
http://vim.sourceforge.net/tip_view.php?tip_id=

If you already run vim, and you want to do a vimdiff, you have by default 2 ways to do it:
- Running another vim with command line vimdiff
- Opening a new window [C-w s] and then making a lot of commands in the two buffers

This tip provides a function (MHooremanSetDiffEnviron) to set the "diff" environment in buffer. So, if you want to diff the right and the left window, you have to run :MHooremanSetDiffEnviron into the right and the left buffer.

To add MHooremanSetDiffEnviron, add the following in your vimrc file:

function! MHooremanSetDiffEnviron()
	set diff
	set scrollbind
	set scrollopt=ver,jump,hor
	set nowrap
	set fdm=diff
endfunction
:command! MHooremanSetDiffEnviron call MHooremanSetDiffEnviron()

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1330: Easily open and close folds
http://vim.sourceforge.net/tip_view.php?tip_id=

If you're finding that 'zo' and 'zc' are hard to type or remember, you could use <spacebar> and <backspace> to open and close folds:

nnoremap <space> zo
nnoremap <backspace> zc

Or, you could just use the <spacebar> to do both:
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1323: Faster keyboard layout - reverse the number row keys
http://vim.sourceforge.net/tip_view.php?tip_id=

In many languages you will use '!@#$%^&*()_' far more often than you use '1234567890-' so you will find yourself pressing SHIFT quite often, but this is not necessary.  You can reverse the function of the number row keys so that typing a number key gives you the symbol instead of the number, and SHIFT-Number-Key can be used to type the number.  This will save you alot of time leaning on the SHIFT key, especially for '(' and ')' and '_', which are more common than their non-SHIFT characters '9' and '0' and '-'.

Just add these commands to your .vimrc or _vimrc file:

  " map each number to its shift-key character
  inoremap 1 !
  inoremap 2 @
  inoremap 3 #
  inoremap 4 $
  inoremap 5 %
  inoremap 6 ^
  inoremap 7 &
  inoremap 8 *
  inoremap 9 (
  inoremap 0 )
  inoremap - _
  " and then the opposite
  inoremap ! 1
  inoremap @ 2
  inoremap # 3
  inoremap $ 4
  inoremap % 5
  inoremap ^ 6
  inoremap & 7
  inoremap * 8
  inoremap ( 9
  inoremap ) 0
  inoremap _ -
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1321: "%" doesn't work in C# for #region and #endregion
http://vim.sourceforge.net/tip_view.php?tip_id=

How to fold the following region

#region
...
#endregion

with the keystroke zf% ?

Just add the following line in your cs.vim file placed in syntax folder beneath your vimruntime path.

let b:match_words = '\s*#\s*region.*$:\s*#\s*endregion

It works even if the cursor is not on the "#region" keyword.

For more help please refer to :help matchpairs

Thanks.
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1262: git grep
http://vim.sourceforge.net/tip_view.php?tip_id=

This adds ":G <pattern>" command which runs "git grep <pattern>".

fun GitGrep(...)
        let save = &grepprg
        set grepprg=git\ grep\ -n\ $*
        let s = 'grep'
        for i in a:000
                let s = s . ' ' . i
        endfor
        exe s
        let &grepprg = save
endfun
command -nargs=? G call GitGrep(<f-args>)

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1354: Online documentation for word under cursor
http://vim.sourceforge.net/tip_view.php?tip_id=

If you're like me and are often referring to online documentation for a language or technology while editing source from Vim, you may find this tip helpful.  Slip the following function and mapping into your vimrc file, and then simply press <M-d> when the cursor is over a documented language keyword/class name to open your browser to the online documentation.  This script is somewhat like a generalization of the "K" command, where the keyword can be embedded anywhere in the command string.  My inspiration came from Firefox's "Quick Searches" bookmarks, as well as the Firefox DictionarySearch extension, both of which are very handy.  

The script here is configured for C++/Qt (keywords are Qt class names), Ruby (keywords are Ruby class names), and Perl (keywords are Perl functions), but it should be easy to figure out how to add your favorite online doc page for a given file type.  Any online doc page will work, as long as the documentation's URL scheme contains the keyword.  You will of course need to modify the script to correctly refer to your browser's executable. 

''""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OnlineDoc()
    if &ft =~ "cpp"
        let s:urlTemplate = "http://doc.trolltech.com/4.1/%.html"
    elseif &ft =~ "ruby"
        let s:urlTemplate = "http://www.ruby-doc.org/core/classes/%.html"
    elseif &ft =~ "perl"
        let s:urlTemplate = "http://perldoc.perl.org/functions/%.html "
    else
        return
    endif

    let s:browser = "\"D:\\Applications\\Mozilla Firefox\\firefox.exe\""
    let s:wordUnderCursor = expand("<cword>")
    let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")

    let s:cmd = "silent !start " . s:browser . " " . s:url
    execute  s:cmd
endfunction

" online doc search
map <silent> <M-d> :call OnlineDoc()<CR>
''""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-AAA---------------------------------------------------------------------------------------------
VimTip	{{{1 1365: Series of high quality VIM tips
http://vim.sourceforge.net/tip_view.php?tip_id=

Some time ago I have created a series of VIM tips and I would like to share them with the community.
They are detailed (with graphics) and show some of the advance features of VIM.

Check them out:

Workspace efficiency - Vim tip 1 of 3:
http://amix.dk/blog/viewEntry/159

Search don't scroll - Vim tip 2 of 3:
http://amix.dk/blog/viewEntry/160

Taming your Vim config - Vim tip 3 of 3:
http://amix.dk/blog/viewEntry/162

As a bonus people should check out my 800 lines long vimrc (almost everything is commented):
http://amix.dk/vim/vimrc.html


"AAA----------------------------------------------------------------------------------------------

VimTip	{{{1 1379: [for script writers] make echo seen when it would otherwise disappear and go unseen
http://vim.sourceforge.net/tip_view.php?tip_id=

Sometimes echo from a mapping disappears and is not seen (every script writer knows this problem).
This weird trick, PersistentEcho(), echoes the messages that will not disappear that easily. 
This is really intrusive and weird trick. Please do not use for external scripts (since it modifies &updatetime). For your internal consumption only.

" PersistentEcho() - super-sticky echo message.
" PersistentEcho() echoes message that refuses 
" to disappear that simply. This is really weird intrusive trick, but sometimes
" echo from a script disappears unexplainably no matter what other solution I tried.
" Don't use this in external scripts please; this is for your internal uses only.
func! PersistentEcho(msg)
   echo a:msg
   let g:PersistentEcho=a:msg
endfun
let g:PersistentEcho=''
if &ut>200|let &ut=200|endif
au CursorHold * if PersistentEcho!=''|echo PersistentEcho|let PersistentEcho=''|endif
"AAA----------------------------------------------------------------------------------
VimTip	{{{1 1381: hightlight a kind of special filetype docs in vim
http://vim.sourceforge.net/tip_view.php?tip_id=


suppose the filetype is en. Then, write a file
~/.vim/syntax/en.vim with contents as follows:
syn region enConstant start=/</hs=e+1 end=/>/he=s-1
syn region enType start=/`/hs=e+1 end=/`/he=s-1
syn region enString start=/|/hs=e+1 end=/|/he=s-1
syn region enTodo start=/@/hs=e+1 end=/@/he=s-1
syn sync minlines=10
syn case match

hi def link enIdentifier Identifier
hi def link enString String
hi def link enType Type
hi def link enUnderlined Underlined
let b:current_syntax = "en"
----------- end of en.vim ---------------

we also need another file
~/.vim/filetype.vim :

augroup filetypedetect
au BufNewFile,BufRead *.en setf en
augroup END
----------- end of filetype.vim ---------


"AAA-----------------------------------------------------------------------------------------------------

VimTip	{{{1 1386: Make Vim completion popup menu work just like in an IDE
http://vim.sourceforge.net/tip_view.php?tip_id=

In most IDEs, you normally type some code, press ctrl-space for a completion popup menu, type some more characters to select the menu item you want, then hit enter to insert that completion into the code. With Vim's initial popup menu settings, the behavior of the popup menu is a little less pleasant (for some people).

The first step to "improve" the menu behavior is to execute this command:
	:set completeopt=longest,menuone

The above command will change the 'completeopt' option so that Vim's popup menu doesn't select the first completion item, but rather just inserts the longest common text of all matches; and the menu will come up even if there's only one match. (The "longest" setting is responsible for the former effect and the "menuone" is responsible for the latter.)

The next enhancement is the following mapping:
	:inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"

The above mapping will change the behavior of the "<enter>" key when the popup menu is visible. In that case the "<enter>" key will simply select the highlighted menu item, just as the "ctrl-y" key does.

** These two mappings are probably the most rare, yet most valuable: **
	:inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
	:inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

In the above mappings, the first will make "ctrl-n" work the way it normally does; however, when the menu appears, the "<down>" key will be simulated. What this accomplishes is it keeps a menu item always highlighted... this way you can keep typing characters to narrow the matches, and the nearest match will be selected so that you can hit enter at any time to insert it. In the above mappings, the second one is a little more exotic: it simulates "ctrl-x, ctrl-o" to bring up the omni completion menu, then it simulates "ctrl-n, ctrl-p" to remove the "longest" common text, and finally it simulates "<down>" again to keep a match highlighted.

Let this tip be a reminder that the possibilities in Vim are endless.




VimTip	{{{1 1413: Make tar of all files in vim buffer
The following command will make a tar file including path information of all files
in the current vim buffer.  If you wish to omit paths, leave out the `:p'.

:silent bufdo tar -rvf archive.tar %:p

I use it to copy projects, (where all files are open in split screen), from one machine to another.

"zzzX:w
(2) Here are some script I recommends:
Project-1.4.1
TagList-4.2
MiniBufExpl-6.3.2
ShowMarks-2.2
OmniCppComplete-0.4
CRefVim-1.0.4
exUtility-4.1.0

" --------------------
"  ShowMarks
" --------------------
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue                      
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen


" --------------------
" Project
" --------------------
map <A-S-p> :Project<CR>
map <A-S-o> :Project<CR>:redraw<CR>/
nmap <silent> <F3> <Plug>ToggleProject
let g:proj_window_width = 30
let g:proj_window_increment = 50

" --------------------
" exEnvironmentSetting
" --------------------
function g:exES_UpdateEnvironment()
    if exists( 'g:exES_PWD' )
        silent exec 'cd ' . g:exES_PWD
    endif
    if exists( 'g:exES_Tag' )
        let &tags = &tags . ',' . g:exES_Tag
    endif
    if exists( 'g:exES_Project' )
        silent exec 'Project ' . g:exES_Project
    endif
endfunction

" --------------------
" TagList
" --------------------
" F4:  Switch on/off TagList
nnoremap <silent> <F4> :TlistToggle<CR>

" TagListTagName  - Used for tag names
highlight MyTagListTagName gui=bold guifg=Black guibg=Orange 
" TagListTagScope - Used for tag scope
highlight MyTagListTagScope gui=NONE guifg=Blue 
" TagListTitle    - Used for tag titles
highlight MyTagListTitle gui=bold guifg=DarkRed guibg=LightGray 
" TagListComment  - Used for comments
highlight MyTagListComment guifg=DarkGreen 
" TagListFileName - Used for filenames
highlight MyTagListFileName gui=bold guifg=Black guibg=LightBlue

"let Tlist_Ctags_Cmd = $VIM.'/vimfiles/ctags.exe' " location of ctags tool 
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself 
let Tlist_Use_Right_Window = 1 " split to the right side of the screen 
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Close_On_Select = 1 " Close the taglist window when a file or tag is selected.
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 40
" let Tlist_Ctags_Cmd = 'ctags --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++'
" very slow, so I disable this
" let Tlist_Process_File_Always = 1 " To use the :TlistShowTag and the :TlistShowPrototype commands without the taglist window and the taglist menu, you should set this variable to 1.
":TlistShowPrototype [filename] [linenumber]

" --------------------
" MiniBufExpl
" --------------------
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines) 
let g:miniBufExplModSelTarget = 1 " If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer. 
let g:miniBufExplMaxSize = 1 " <max lines: defualt 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers. 

"let g:miniBufExplForceSyntaxEnable = 1 " There is a VIM bug that can cause buffers to show up without their highlighting. The following setting will cause MBE to
"let g:miniBufExplorerMoreThanOne = 1 " Setting this to 0 will cause the MBE window to be loaded even
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplMapWindowNavArrows = 1

"for buffers that have NOT CHANGED and are NOT VISIBLE.
highlight MBENormal guibg=LightGray guifg=DarkGray
" for buffers that HAVE CHANGED and are NOT VISIBLE
highlight MBEChanged guibg=Red guifg=DarkRed
" buffers that have NOT CHANGED and are VISIBLE
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guibg=Gray guifg=Black
" buffers that have CHANGED and are VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guibg=DarkRed guifg=Black

"AAA-ZZZ---------------------------------------------------------------------------------------------"
" --------------------
" OmniCppComplete
" --------------------
" set Ctrl+j in insert mode, like VS.Net
imap <C-j> <C-X><C-O>
" :inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>" 

" set completeopt as don't show menu and preview
set completeopt=menuone

" Popup menu hightLight Group
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black

" use global scope search
let OmniCpp_GlobalScopeSearch = 1

" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 1

" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1

" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0

" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1

" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1

" This option can be use if you don't want to parse using namespace declarations in included files and want to add namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]

" Complete Behaviour
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0

" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can change this behaviour with the OmniCpp_SelectFirstItem option.
let OmniCpp_SelectFirstItem = 0

After setting this, now you can really using vim as an IDE like editor.
I usually like to create project use exUtility, use "gvim project_name.vimenvironment"
now you may find life changed. 
you can browse project file by Project-plugin
you can global search and edit them by exUtility-plugin
you can jump tag and track code by exUtility-plugin
you can analysis code by taglist-plugin
you can choose buffer by minibuffer-plugin
you can set clear mark by showmark-plugin.
you can.....

Except the compile and debug :(
"AAA----------------------------------------------------------------------------------------------"
In order to monitor the options setting, I display changed values in &statusline.
(The following code is based on some tip by somebody else or a vimrc
I found years ago on the web. Don't know who originally came up with this.)

set statusline=%1*[%{winnr()}:%02n]%*\ %2t\ %(%M%R%H%W%k%)\ %=%{TmlStatusline()}\ %3*<%l,%c%V,%p%%>%*

fu! TmlStatusline()
    let opt = "<". &syntax ."/". &fileformat .">"

    if !&backup     | let opt=opt." no-bak" |endif
    if !&et         | let opt=opt." no-et"  |endif
    if &list        | let opt=opt." list"   |endif
    if &paste       | let opt=opt." paste"  | endif
    if !&expandtab  | let opt=opt." tab"    | endif

    if &ts != g:ts_default | let opt=opt.' ts='.&ts    | endif
    if &sw != g:sw_default | let opt=opt.' sw='.&sw | endif
    if &tw != g:tw_default          | let opt=opt.' tw='.&tw         | endif
    if &wm != g:wm_default | let opt=opt.' wm='.&wm | endif
    if &enc != g:enc_default     | let opt=opt.' enc='.&enc       | endif
    if &ve != g:ve_default                 | let opt=opt.' ve='. &ve        | endif
    if &fo != g:fo_default                 | let opt=opt.' fo='. &fo        | endif
    if &cpo != g:cpo_default               | let opt=opt.' cpo='. &cpo      | endif
    if &bin                         | let opt=opt.' [bin]'           | endif
    if &foldlevel != s:foldlevel    | let opt=opt.' F'.&foldlevel    | endif
    
    let opt=opt." | ".strftime("%d-%b-%Y %H:%M")
    
    return opt
endf

It could have been this one by Thomas Bader:
http://www.trash.net/~thomasb/files/vim/dotvimrc.html
"AAA----------------------------------------------------------------------------------------------"
2: Open it and apply foldmarks. 
	:e ~/.vim/vimtips.txt
	:%s/\(^VimTip\)/\1\t{{{1/g
	:set foldmethod=marker
"AAA----------------------------------------------------------------------------------------------
???cyou can choose buffer by minibuffer-plugin
