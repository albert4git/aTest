
"AAA----------------------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------------------
The use of star as in vimtip#1 and vimtip#5 is great, here is how to use this type of search accross a 
whole directory:
Just add the mappings (or choose different letter combinations):
map gr :grep <cword> *<cr>   
map gr :grep <cword> %:p:h/*<cr>   
map gR :grep \b<cword>\b *<cr>
map GR :grep \b<cword>\b %:p:h/*<cr>


mapping one will search for the word under the cursor (like g*) in any of the files in the current directory 
mapping two will search for the word under the cursor (like g*) in any of the files in the same directoryr
as the current file

mapping three will search for the word under the cursor by itself (i.e. surrounded by word boundary like *)r
in any of the files in the current directory

mapping four will search for the word under the cursor by itself (i.e. surrounded by word boundary like *)
in any of the files in the same directory as the current file
"AAA----------------------------------------------------------------------------------------------
"word bracketing" only for surrounding the word right behind the cursor in insert mode with **. 
"I use the following macro to "emphasize" the word i just typed,
	:imap _* <Esc>bi*<Esc>ea*<Space>
"AAA----------------------------------------------------------------------------------------------
	:inoremap ( ()<ESC>i
I use the following macro, which brackets previously visually selected text.
I mapped it with _(.

	:vnoremap _( <ESC>`>a)<ESC>`<i(<ESC>
"AAA----------------------------------------------------------------------------------------------

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 154: Mappings to facilitate the creation of text
"To allow overriding the Alt key
set winaltkeys=no  
"To enable viewing messages from commands issued using the mappings presented here 
set cmdheight=2    

"The fundamental mapping that makes full-screen editing possible
imap <A-o>  <C-o>
imap <A-;>  <C-o>:

"Basic motions
imap <A-h>  <Left>
imap <A-j>  <Down>
imap <A-k>  <Up>
imap <A-l>  <Right>
imap <A-f>  <PageDown>
imap <A-b>  <PageUp>
imap <A-^>  <Home>
imap <A-$>  <End>

"Numbers for repeats
imap <A-1>  <C-o>1
imap <A-2>  <C-o>2
imap <A-3>  <C-o>3
imap <A-4>  <C-o>4
imap <A-5>  <C-o>5
imap <A-6>  <C-o>6
imap <A-7>  <C-o>7
imap <A-8>  <C-o>8
imap <A-9>  <C-o>9

"Basic searches
imap <A-/>  <C-o>/
imap <A-*>  <C-o>*
imap <A-#>  <C-o>#
imap <A-n>  <C-o>n
imap <A-N>  <C-o>N

"Deleting
imap <A-x>  <C-o>x
imap <A-d>  <C-o>d
imap <A-D>  <C-o>D

"Yanking and putting
imap <A-y>  <C-o>y
imap <A-Y>  <C-o>Y
imap <A-p>  <C-o>p
imap <A-P>  <C-o>P

"Common prefixes:  marking, matching etc.
imap <A-~>  <C-o>~
imap <A-m>  <C-o>m
imap <A-`>  <C-o>`
imap <A-">  <C-o>"
imap <A-%>  <C-o>%
imap <A-h>  <C-o>:h
imap <A-s>  <C-o>:s

"Interacting with the 'outside'
imap <A-!>  <C-o>:!
imap <A-w>  <C-o>:w<CR>
imap <A-e>  <C-o>:e

"Other commands
imap <A-u>  <C-o>u
imap <A-.>  <C-o>.
"AAA----------------------------------------------------------------------------------------------
These are some maps i use for C programming.

map ' `
map <C-f> :w<C-m>:!make<C-m>
map <M-]> <C-]>                                         Tags
map <M-[> <C-t>                                          Tags
map <M-u> :!ctags -R *<C-m>                                          Build Tags
map <M-c> I/*<Esc>A*/<Esc>                                          Comment current line
map <M-d> ^xx$xx                                          Delete comment for a single line
map <M-l> [{zf%                                          Fold upto the enclosing brace level
map <M-o> zo                                           open fold
map <M-i> zc                                          close fold
map <M-.> :cn<C-m>                                          Go to next error in list
map <M-,> :cp<C-m>                                          previous error in list

imap <Tab> <C-p>                                                  Complete word
inoremap <S-Tab> <Tab>                                                  Tab
inoremap { <CR>{<CR>                                                  Brace and line
inoremap } <CR>}                                                  brace and line. saves one enter stroke



imap <M-j> <Esc>                                                  Escape. Don't want to move my hand to esc key.
imap <M-k> <C-y>                                                  Copy line from above.
imap <M-q> /*  */<Esc>hhi                                        Comment selected lines

noremap <M-r> ddko{<C-m>}<Esc>kpko             Convert a simple statement to a compound statement. And place cursor above prev line.
noremap <M-k> ddko{<C-m>}<Esc>kpo             Same as above but place cursor below old line.

vnoremap <M-j> <Esc>                   
vnoremap <M-c> di/*<C-m>/<C-m><Esc>kkp           Commented selected text



nmap <M-n> :noh<CR>                       No hilight


"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 625: Typing print statements faster and more ergonomically (esp in C++)
http://vim.sourceforge.net/tip_view.php?tip_id=

Guess what the most common word is in the C++ language? I wager it is 'cout'.

Interactive debuggers and logging libraries are all very well, but most of us
still have in our debugging toolboxes the technique of adding short-lived
statements to our programs whose only purpose is to help us figure out the bug
currently occupying us by printing the value of a variable. If you find
yourself often typing such statements they are worth optimizing for.

For example, strings in most languages are surrounded by double quotes which
require an extra motion and keystroke for the left shift key. With my coding
style I multiply that motion towards the shift key by 4-6 times per print
statement and 10-100 print statements everyday. The result is to significant
slow me down and bring me closer to the Home for the Aged Wrist. The analogous
cout statement in c++ is even more egregious in this regard. Consider
statements like the following that I frequently find myself typing:

cout << "AAA: " << someVarName << ": " << someOtherVarName << "\n" ;

That's *12* times my left hand moves towards the shift key for *one* statement!
Unacceptable. My solution is to remap keys to interchange '<' and ',' as well
as double quotes and single quotes. Rather than force myself to learn a new
keyboard mapping within vim I cause the mappings to trigger in a
context-sensitive mannter, within only a cout statement, from the time I type
'cout' to the time I type the ';' in the end.

Here's my code fragment to do this:
function! CppSetupCout ()
    inoremap , <Space><<
    inoremap < ,
    inoremap ' "
    inoremap " '
    imap ; <Esc>:call CppResetCout ()<CR>a;
    map <Esc>, :call CppResetCout ()<CR>
    imap <Esc>, <C-o>:call CppResetCout ()<CR>
endf
function! CppResetCout ()
    iunmap ,
    iunmap <
    iunmap '
    iunmap "
    iunmap ;
    imap <Esc>, <C-o>:call CppSetupCout ()<CR>
    map <Esc>, :call CppSetupCout ()<CR>
endfunction

function! AuCpp ()
    inoremap cout <End><Esc>:call CppSetupCout ()<CR>acout <<
    imap <Esc>, <C-o>:call CppSetupCout ()<CR>
    map <Esc>, :call CppSetupCout ()<CR>
endfunction

autocmd FileType cpp call AuCpp()

Notice that I use <Esc>, (or Alt-,) to quickly toggle these mappings on or off in other situations.

For some other languages it's prob sufficient to simply switch single- and double-quotes. Java might call for switching '+' and '=' within system.out.println. Come to think of it:

autocmd FileType java iabbrev sop system.out.println

You get the idea.
"AAA----------------------------------------------------------------------------------------------
here is the stuff I put in my ~/.vimrc file 
<pre>
:imap ( ()<Left>
:imap [ []<Left>
:imap " <C-V>"<C-V>"<left>
</pre>
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 842: c/c++ function abbreviations
" Help delete character if it is 'empty space'
"  stolen from vim manual
function! Eatchar()
  let c = nr2char(getchar())
  return (c =~ '\s') ? '' : c
endfunction

" Replace abbreviation if we're not in comment or other unwanted places
"  stolen from Luc Hermitte's excellent http://hermitte.free.fr/vim/
function! MapNoContext(key, seq)
  let syn = synIDattr(synID(line('.'),col('.')-1,1),'name')
  if syn =~? 'comment\|string\|character\|doxygen'
    return a:key
  else
    exe 'return "' .
      \   substitute( a:seq, '\\<\(.\{-}\)\\>', '"."\\<\1>"."', 'g' ) .  '"'
  endif
endfunction

" Create abbreviation suitable for MapNoContext
function! Iab (ab, full)
  exe "iab <silent> <buffer> ".a:ab." <C-R>=MapNoContext('".
    \  a:ab."', '".escape (a:full.'<C-R>=Eatchar()<CR>', '<>\"').
    \"')<CR>"
endfunction

call Iab('#d', '#define ')
call Iab('#i', '#include <><Left>')
call Iab('#I', '#include ""<Left>')
call Iab('printf', 'printf ("\n");<C-O>?\<CR>')
call Iab('if', 'if ()<CR>{<CR>}<Left><C-O>?)<CR>')
call Iab('for', 'for (;;)<CR>{<CR>}<C-O>?;;<CR>')
call Iab('while', 'while ()<CR>{<CR>}<C-O>?)<CR>')
call Iab('else', 'else<CR>{<CR>x;<CR>}<C-O>?x;<CR><Del><Del>')
call Iab('ifelse', 'if ()<CR>{<CR>}<CR>else<CR>{<CR>}<C-O>?)<CR>')
call Iab('intmain', 'int<CR>main (int argc, char **argv)<CR>'.
       \'{<CR>x;<CR>return 0;<CR>}<CR><C-O>?x;<CR><Del><Del>')
"AAA----------------------------------------------------------------------------------------------
You can move the cursor by screen lines with gj and gk. Here are a few
nifty mappings for that:

:noremap <Up> gk
:noremap! <Up> <C-O>gk
:noremap <Down> gj
:noremap! <Down> <C-O>gj
" the following are optional, to move by file lines using Alt-arrows
:noremap! <M-Up> <Up>
:noremap! <M-Down> <Down>
:noremap <M-Up> k
:noremap <M-Down> j
"AAA--------------------------------------------------------------------------------------------------------------------
"AAA--------------------------------------------------------------------------------------------------------------------
:map   <F7>  :w !xclip<CR><CR>
:vmap  <F7>  "*y
:map <S-F7>  :r!xclip -o<CR>

so with F7 copy all current buffer to clipboard, or a selection.
with shift-F7, paste all clipboard contents.
"AAA--------------------------------------------------------------------------------------------------------------------
VimTip	{{{1 967: fast access to the first nine buffers
http://vim.sourceforge.net/tip_view.php?tip_id=

I offten edit more then one file and i do alot of switching between them.
<ESC>:bX - is not so fast. Prev/Next feature (and mapping) is slow too.
I use Alt X to switch between buffers (X - # of buffer).

:map <M-1> :confirm :b1 <CR>
:map <M-2> :confirm :b2 <CR>
...
:map <M-9> :confirm :b9 <CR>
:map <F3> :confirm :ls <CR>
"AAA--------------------------------------------------------------------------------------------------------------------
:map gn :set nu^M
:map gN :set nonu^M
:map gn :set invnu^M
alacrity.  The following macro will filter a sequence of lines from the
"n" mark to the current one through the UNIX nl (number lines) filter.
:map g# :'n,. !nl^M
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1011: mappings and commands for visual mode + some bonus mappings to quickly copy and paste
First of all 'gv' reselect the previous visual area.
prepare a :command on the previous visual selected area ('<,'> is not very fast to type...)
map <M-:> :'<,'>
copy the word under cursor in the clipboard
nnoremap <F4> "+yiw
copy the visual selected area in the clipboard (very easy)
vnoremap <F4> "+y
replace the word under cursor with the content of the clipboard
nnoremap <F5> viw"+p
replace the visual selected area with the content of the clipboard
nnoremap <F5> "+p
prepare the :command to replace the word under cursor
nnoremap <S-F4> "+yiw:%s/\<<C-r>+\>/<C-r>+/gc<LEFT><LEFT><LEFT>
prepare the :command to replace the selected area
vnoremap <S-F4> "+y:%s/\<<C-r>+\>/<C-r>+/gc<LEFT><LEFT><LEFT>
puts "" around the word under cursor
nnoremap <M-"> ciw"<C-r>+"<esc>
puts "" around the visual selected area
vnoremap <M-"> c"<C-r>+"<esc>

"AAA----------------------------------------------------------------------------------------------
=========================
"place in vimrc file

"word selection
nmap <C-S-Left>  vbge<Space>
nmap <C-S-Right> vew<BS>
imap <C-S-Left>  _<Esc>mz"_xv`z<BS>obge<Space>
imap <C-S-Right> _<Esc>my"_xi<S-Right><C-o><BS>_<Esc>mz"_xv`yo`z
vmap <C-S-Left>  bge<Space>
vmap <C-S-Right> ew<BS>

"down/up selection
nmap <C-S-Down>  v<Down>
nmap <C-S-Up>    v<Up>
imap <C-S-Down>  _<Esc>mz"_xv`zo`z<Down><Right><BS><BS>
imap <C-S-Up>    _<Esc>mz"_xv`z<Up>o`z<BS>o
vmap <C-S-Down>  <Down>
vmap <C-S-Up>    <Up>

"home/end selection
nmap <C-S-Home> v<Home>
nmap <C-S-End>  v<End>
imap <C-S-Home> _<Esc>mz"_s<C-o><Left><C-o>`z<Esc>v<Home>
imap <C-S-End>  _<Esc>mz"_xv`zo<End>

"half page down/up selection
nmap <C-S-PageDown> v<End><C-d><End>
nmap <C-S-PageUp>   v<Home><C-u>
imap <C-S-PageDown> _<Esc>mz"_xv`zo<End><C-d><End>
imap <C-S-PageUp>   _<Esc>mz"_xv`z<BS>o<Home><C-u>
vmap <C-S-PageDown> <End><C-d><End>
vmap <C-S-PageUp>   <Home><C-u>

"word deletion
imap <C-BS>  <C-w>
imap <C-Del> _<Esc>mzew<BS>i<Del><Esc>v`z"_c
=========================
"AAA----------------------------------------------------------------------------------
VimTip	{{{1 901: Text objects for strings in vim 6.x
http://vim.sourceforge.net/tip_view.php?tip_id=

This little function adds support for common operations on string text objects like

di" Delete Inner String
ca' Change A String

and so on. Strings have to be on one line. See :help text-objects for a description of other predefined text objects.

function! JHStringObject(cmd,delim,mode)
    if a:mode == 'i'
        let c = 'normal T' . a:delim . a:cmd . 't' . a:delim
    elseif a:mode == 'a'
        let c = 'normal F' . a:delim . a:cmd . 'f' . a:delim
    endif
    execute c
    if a:cmd == 'c'
        normal l
        startinsert
    endif
endfunction

nnoremap di" :call JHStringObject('d','"','i')<CR>
nnoremap di' :call JHStringObject('d',"'",'i')<CR>
nnoremap da" :call JHStringObject('d','"','a')<CR>
nnoremap da' :call JHStringObject('d',"'",'a')<CR>
nnoremap ci" :call JHStringObject('c','"','i')<CR>
nnoremap ci' :call JHStringObject('c',"'",'i')<CR>
nnoremap ca" :call JHStringObject('c','"','a')<CR>
nnoremap ca' :call JHStringObject('c',"'",'a')<CR>
nnoremap yi" :call JHStringObject('y','"','i')<CR>
nnoremap yi' :call JHStringObject('y',"'",'i')<CR>
nnoremap ya" :call JHStringObject('y','"','a')<CR>
nnoremap ya' :call JHStringObject('y',"'",'a')<CR>


"AAA----------------------------------------------------------------------------------
"In my Python or Ruby scripts, the first line is always a shebang line. I create it automatically using

augroup Shebang
  autocmd BufNewFile *.py  0put =\"#!/usr/bin/env python\<nl># -*- coding: iso-8859-15 -*-\<nl>\"|$
  autocmd BufNewFile *.rb  0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
  autocmd BufNewFile *.\(cc\|hh\)  0put =\"//\<nl>//  \".expand(\"<afile>:t\").\"  --  \<nl>//\<nl>\"|2|start!
augroup END
"AAA----------------------------------------------------------------------------------

VimTip	{{{1 885: Switching between different statuslines
http://vim.sourceforge.net/tip_view.php?tip_id=

The code between "---cut---" signs is a nice piece
of my ~/.vimrc which I really likes. It allows me to switch
between several different statuslines by pressing F3 key (in
normal Vim mode).

---cut---
"Theese three functions are just for example.
"It might be that these three functions are irrelevant
"in example statuslines, but they demonstrate that
"functions can be used in statusline too...

fu! Percent()
  let byte = line2byte( line( "." ) ) + col( "." ) - 1
  let size = (line2byte( line( "$" ) + 1 ) - 1)
  return (byte * 100) / size
endf

fu! FileEncoding()
  if &fileencoding == ''
    return "is not set"
  else
    return &fenc
  endif
endf

fu! GlobalEncoding()
  if &fileencoding == ''
    return "is not set"
  else
    return &enc
  endif
endf

"And now the magical stuff!
"We define some statuslines at first...

let g:StatusLines{0}='[%1*%n%*]%= [%2*%03bD%* | %2*%5(0x%02BH%)%*] [%8oC=%1*%3{Percent()}%%%*] [%8c] : [%8l/%8L = %1*%3p%%%*]'
let g:StatusLines{1}='[%1*%n%*]%= [%1*GENC%* %10(%{GlobalEncoding()}%)] [%1*FENC%* %10(%{FileEncoding()}%)]'
let g:StatusLines{2}='[%1*%n%*]%= [%1*%F%*]'
let g:StatusLinesCurrent=-1

"And we map switching on some unused key...

map <F3> :call ToggleStatusLine()<CR>

"Function that switch between several statuslines
"Made by M.W. from IRC#vim (many thanks for it)...

fu! ToggleStatusLine()
  let g:StatusLinesCurrent=g:StatusLinesCurrent+1
  if (!exists("g:StatusLines" . g:StatusLinesCurrent))
    let g:StatusLinesCurrent=0
  endif
  let &statusline=g:StatusLines{g:StatusLinesCurrent}
endf

"We use the first one as default...

call ToggleStatusLine()

"Because I used some highlighting in the example statuslines
"I put some highlighting definitions here too...

"The colours of statusline itself...

hi statusline term=inverse,bold cterm=inverse,bold ctermfg=darkred ctermbg=white
hi statuslinenc term=inverse,bold cterm=inverse,bold ctermfg=gray ctermbg=black

"Some other colours used in statuslines...

hi User1 term=inverse,bold cterm=inverse,bold ctermfg=darkred ctermbg=yellow
hi User2 term=inverse,bold cterm=inverse,bold ctermfg=darkred ctermbg=cyan
---cut---

I think that this tip should be very useful if you need
so much information that is unable to be fit in a single statusline...

Enjoy.

-- 
Matous Jan Fialka [ http://vcp.ligatura.org/ ]

"AAA----------------------------------------------------------------------------------
VimTip	{{{1 649: expand existing abbreviation
http://vim.sourceforge.net/tip_view.php?tip_id=

This mapping expands existing abbreviation 

map <C-X><C-X> diw:exe "normal i".@"<cr>

"AAA----------------------------------------------------------------------------------

VimTip	{{{1 650: abbreviation that prompts whether to expand it or not
http://vim.sourceforge.net/tip_view.php?tip_id=

You can define abbreviation in such a way that it will ask whether to expand it
or not. The trick is to define it as insert-mode mapping with special body, not
as abbreviation. Here is how to define it:

   function! MyExpand(abbr,expansion)
     let answer=confirm("Expand '".a:abbr."' [y] ", "&Yes\n&No")
     if answer==2
        exec "normal! a".a:abbr
     else
         exec "normal! a".a:expansion
     endif
   endfunction

imap ABC <esc>:call AskExpand("ABC","...expansion for ABC ...")<cr>a
imap XYZ <esc>:call AskExpand("XYZ","...expansion for XYZ ...")<cr>a

"AAA----------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------
