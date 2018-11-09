"AAA----------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------
cabbrev split vsplit
cabbrev hsplit split
cabbrev sta vertical sta
cabbrev help vertical help
cabbrev new vnew
cabbrev right botright

; A more heavyweight solution for ^W^]
function! ToggleSplit (dir)
    let currFname = bufname ("%")
    let old = winnr ()

    " Window navigation to ensure the correct window is 'last'.
    if (a:dir == "u")
        wincmd k
        let back="j"
    elseif (a:dir == "d")
        wincmd j
        let back="k"
    elseif (a:dir == "l") 
        wincmd h
        let back="l"
    elseif (a:dir == "r")
        wincmd l
        let back="h"
    endif

    if (winnr () == old)
        echo "Ouch"
        return
    endif

    exec "wincmd " . back

    quit

    if (back == "j" || back == "k")
        let orientation = "vsplit"
    else
        let orientation = "split"
    endif

    if (back == "j" || back == "l")
        let dir = "below"
    else
        let dir = "above"
    endif

    exec dir . " " . orientation " " . currFname
endfunction
noremap ^W^] ^W^]:silent call ToggleSplit ("d")<CR>

; Optional.
set splitright
; In which case the above mapping becomes:
noremap ^W^] :set splitbelow<CR>^W^]:silent call ToggleSplit ("u")<CR>:set nosplitbelow<CR>
; Or you could just
set splitbelow
; :-)

; Very elegant and almost perfect, but it screws up if you want to run a command with ranges :-)
;noremap : :vertical<Space>
"AAA----------------------------------------------------------------------------------------------
the syntax is as follows:

VimTip	{{{1 331: modline magic...
// vim:set ts=4 sw=4 nowrap:
or
/* vim:noai:ts=2:sw=4: */
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 332: make footnotes in vim
http://vim.sourceforge.net/tip_view.php?tip_id=

I found at
http://groups.google.com/groups?q=vim+changing+shell+to+zsh&hl=en&lr=&ie=UTF-8&selm=S_Rh9.716%24a5.124150%40news.uchicago.edu&rnum=4
a macro to insert footnotes in vim, but it doesn't work as of vim6.0. so i
wrote my own; this macro requires two differents shortcuts, one for entering
the first footnote, the other one for all subsequent footnotes.

when you hit "K0" (first footnote) or "KK" (all other footnotes) in normal mode, your cursor is positionned at the end of the document, in the footnote & in insert mode. The "a" bookmark is set to the place where you entered the footnote in the text. so a "`a" will bring you back to the location of the footnote in the text.

" for now requires entering K0 for the first footnote and then KK
nmap K0 i[0]<esc>maG$i<end><enter>[0] nmap KK
maG$?\[[0-9]*\]<enter>yt]G$i<end><enter><esc>p<C-a>i<end>]<esc>`aP<C-a><right>i]<esc>maG$i<end><end>

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 410: Allow Inform header files to be distinguished from C headers
http://vim.sourceforge.net/tip_view.php?tip_id=

Inform is an Interactive Fiction authoring language.  It's header files often
use a '.h' extension, which causes VIM to think they are C files, or do not
have any extension at all, leaving VIM unable to determine what kind of file
they are.  This is irritating to Inform developers using VIM with syntax
highlighting.
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 765: Complete from filetype syntax file
http://vim.sourceforge.net/tip_view.php?tip_id=

I discover nice way to handle completetion from syntax file:

autocmd FileType *  execute "setlocal complete+="."k/usr/share/vim/vim62/syntax/".getbufvar("%","current_syntax").".vim"

Of course substitute "/usr/share/vim/vim62/syntax/" with out path...
Bad of this trick is no ability to handle "-" chars (eg. in XSL) in completetion and 
of course complete Vim commands from Syntax file too :(

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 767: multiple commands at once
you can easily execute more then one command by placing a | between two commands. 

e.g. argdo %s/foo/bar/gc | w 

by adding | w in tyhe above example the multiple find and replace command
doesn't get interupted because the last edited file isn't saved.

"AAA----------------------------------------------------------------------------------------------
You can use this to toggle between normal and insert mode using the same keystrokes for either.

map <silent> ti :let &insertmode=1-&insertmode<CR>
imap <silent> ti <Esc>:let &insertmode=1-&insertmode<CR>

map <silent> ta :let &insertmode=1-&insertmode ^V| if &insertmode ^V| :startinsert! ^V| endif<CR>
imap <silent> ta <Esc>:let &insertmode=1-&insertmode ^V| if &insertmode ^V| :startinsert! ^V| endif<CR>

The difference between ti and ta is the former toggles inserting at the cursor
position while the latter toggles inserting at the end of the line.
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 775: Remapping Caps to Shift
Just put this in a file in your home directory called .Xmodmap
remove lock = Caps_Lock
keycode 66 = Shift_R
remove shift = Shift_R
add shift = Shift_R
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 799: Searching for files
http://vim.sourceforge.net/tip_view.php?tip_id=

You can add the following to you .vimrc file:

" find files
fun! FindFiles()
  let $filename =  input("Enter file name to find: ")
  let $error_file = $HOME."/.findfile.output"
  silent! exe "!find . -iname \"".$filename."\" \| xargs file \| perl -pe 's/:/:1:/' > ".$error_file
  cfile $error_file
  copen
  redraw!
endfun
nmap \f :call FindFiles()<CR>

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 801: Folding of (gnu)make output
http://vim.sourceforge.net/tip_view.php?tip_id=

I regularly use the compiler output window of the QuickFix feature (see help on
'quickfix' and 'copen') to navigate the compiler output. Working on a largish
software system with multiple directories with subdirectories in them, the list
can get quite long. I use the following entries in my .vimrc to automatically
fold on each subdirectory, and open folds containing errors (the string
'error:'). Aditionally 'zw' open also the folds containing the string
'warning:', while 'zq' switches back to the original.

"Folding of (gnu)make output
au BufReadPost quickfix setlocal foldmethod=marker
au BufReadPost quickfix setlocal foldmarker=Entering\ directory,Leaving\ directory
au BufReadPost quickfix map <buffer> <silent> zq zM:g/error:/normal zv<cr>
au BufReadPost quickfix map <buffer> <silent> zw zq:g/warning:/normal zv<cr>
au BufReadPost quickfix normal zq
"AAA----------------------------------------------------------------------------------------------
" open search result in a new window (the comment)
map zm :let @/=expand("<cword>") <BAR> split <BAR> execute 'normal n'<CR>
"AAA----------------------------------------------------------------------------------------------
" Font must be set in .gvimrc
let in_diff_mode = 0
windo let in_diff_mode = in_diff_mode + &l:diff
    set guifont=Lucida_Console:h15:cDEFAULT

    " In diff mode
    if in_diff_mode == 1
        set guifont=isi_ansi:h14:cDEFAULT
    endif

unlet in_diff_mode

"AAA----------------------------------------------------------------------------------------------
After some time using mini buffer explorer
(http://www.vim.org/scripts/script.php?script_id=159), here is the way for
moving between buffers using mouse (thus GVim only) and minibufexpl I feel
comfortable with (Who knows you might feel the same :)
"AAA----------------------------------------------------------------------------------------------
func CheckSwap()
    swapname
    if v:statusmsg =~ '\.sw[^p]$'
	set ro
    endif
endfunc

if &swf
    set shm+=A
    au BufReadPre * call CheckSwap()
endif
"AAA----------------------------------------------------------------------------------------------
$VIM/vimfiles/plugin/matchit.vim:
----- start
	runtime! macros/matchit.vim
	split $VIMRUNTIME/macros/matchit.txt
	if has("unix")
		saveas! ~/.vim/doc/matchit.txt
		helptags ~/.vim/doc
	else
		saveas! ~/vimfiles/doc/matchit.txt
		helptags ~/vimfiles/doc
	endif
	close
----- end

see
	:help $VIM
	:help $VIMRUNTIME
	:help v:version
	:help matchit-install
	:help :helptags

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 853: Write a dated backup of the current file.
http://vim.sourceforge.net/tip_view.php?tip_id=


Put this into your vimrc and press \ba while in normal mode, and the current
file will be backed up.

" A mapping to make a backup of the current file.
fun! WriteBackup()
        let fname = expand("%:p") . "__" . strftime("%Y_%m_%d_%H.%M.%S")
        silent exe ":w " . fname
        echo "Wrote " . fname
endfun
nnoremap <Leader>ba :call WriteBackup()<CR>
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 862: how to toggle between all vertical and all horizontal window layout
http://vim.sourceforge.net/tip_view.php?tip_id=

How to change from a horizontal list to a vertical list of windows, and vice versa:

---------------------------
horizontal list of windows
to vertical list of windows
---------------------------
    W|W|W
to
    W
    W  
    W

    :windo wincmd K

----------------------------
vertical list of windows
to horizonal list of windows
----------------------------
    W
    W  
    W
to
    W|W|W

  :windo wincmd H

This tip was written in response to a request in comp.editors and now shared in the vim-tip database.

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 891: Copy (parts of) filename to clipboar
http://vim.sourceforge.net/tip_view.php?tip_id=

I often need the name and/or directory of the file I'm workin on in another (windows-)application.

Therefore I've added to menu.vim:

:amenu 20.351 &Edit.Copy\ fName :let @*=expand("%:t")<CR>
:amenu 20.352 &Edit.Copy\ fPath :let @*=expand("%:p:h")<CR>
:amenu 20.353 &Edit.Copy\ rName :let @*=expand("%:.")<CR>

This will copy
fName: Onle the filename (without path)
fPath: Only the path
rName: path+filename relative to current directory


"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 892: Incremental Auto-Backup
http://vim.sourceforge.net/tip_view.php?tip_id=

Hello Everyone.

I was wondering how I could make an automatic backup of my edited files. 
I added the following to my _vimrc:

[snip]
set backupdir=c:\temp\vim_backup
let myvar = strftime("(%y%m%d)[%Hh%M]")
let myvar = "set backupext=_". myvar
execute myvar 
[snap]
"AAA----------------------------------------------------------------------------------------------
Vim can remember the list of your opened buffers even after you close vim.

In vim, or .vimrc do:

:exec 'set viminfo=%,' . &viminfo
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 927: A better autowrite?

map <leader>aw :call Myautowrite()<CR>

function! Myautowrite()
    if ( !exists( "g:myautowrite" ) )
        let g:myautowrite = 0
    endif

    if ( g:myautowrite == 0 )
        let g:myautowrite = 1

        exec "aug myautowrite"
        exec "au BufLeave * silent! update"
        exec "au FocusLost * silent! update"
        exec "aug end"
        exec "echo 'Auto-update-all is ON'"
    else
        let g:myautowrite = 0

        exec "aug myautowrite"
        exec "au!"
        exec "aug end"
        exec "echo 'Auto-update-all is OFF'"
    endif

endfunction
"AAA----------------------------------------------------------------------------------------------
        " Returns either the contents of a fold or spelling suggestions.
        function! BalloonExpr()
                let foldStart = foldclosed(v:beval_lnum )
                let foldEnd   = foldclosedend(v:beval_lnum)

                let lines = []

                " If we're not in a fold...
                if foldStart < 0
                        " If 'spell' is on and the word pointed to is incorrectly spelled, the tool tip will contain a few suggestions.
                        let lines = spellsuggest( spellbadword( v:beval_text )[ 0 ], 5, 0 )
                else
                        let numLines = foldEnd - foldStart + 1
                        " Up to 31 lines get shown okay; beyond that, only 30 lines are shown with ellipsis in between to indicate too much.
                        " The reason why 31 get shown okay is that 30 lines plus one of ellipsis is 31 anyway...
                        if ( numLines > 31 )
                                let lines = getline( foldStart, foldStart + 10 )
                                let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
                                let lines += getline( foldEnd - 10, foldEnd )
                        else
                                let lines = getline( foldStart, foldEnd )
                        endif
                endif

                return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
        endfunction
        set balloonexpr=BalloonExpr()
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 971: Substitute with incrementing numbers
http://vim.sourceforge.net/tip_view.php?tip_id=

Say you have a document:

    foo bar
    bar foo
    bar
    foo

and you want to replace the first foo with blah_1, the second with blah_2, the third with blah_3 and so on. There are a number of options. The most obvious is:

    :let i=1 | g//s/foo/\="blah_".i/ | let i = i + 1

This only works if foo only occurs at most once per line. Changing to a global substitute doesn't help, as i will only be incremented once per matching line. The solution is to use setreg():

    :let @a=1 | %s/foo/\="blah_".@a.(setreg('a',@a+1)?'':'')/g

Unfortunately, setreg returns 0 rather than the value of the register it set, so we need to use a ?: block to eliminate this. Another option, which is only available in vim7:

    :let i=[] | %s/foo/\="blah_".len(add(i,''))/g

This uses a growing list rather than a number.
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1002: Reverse lines in a file using !tac

Select a block visually and filter it through the unix command "tac" with ":!tac" to reverse the selected lines.
of array definitions or in conjunction with reversing a previously ":!sort"-ed
"tac" is "cat" reversed.

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1004: Optionally open matching or selected tag in full height vertical window
http://vim.sourceforge.net/tip_view.php?tip_id=

First tip from me... after becoming a vim convert a while ago, I finally got around to trying to mangle tags in a way a like -- I prefer to have a full height window off to the right, most of the time. This script and mappings give both

" preview window... to get it to open vert right, or horiz as desired
function PreviewTag(top)
	"by MW
	set previewheight=25
	exe "silent! pclose"
	if &previewwindow			" don't do this in the preview window
		return
	endif
	let w = expand("<cword>")		" get the word under cursor
	exe "ptjump " . w
	" if any non False arg, open in simple horiz window so simply return
	if a:top
		return
	endif
	" otherwise, make it vertical
	exe "silent! wincmd P"
	if &previewwindow		" if we really get there...
		if has("folding")
			silent! .foldopen		" don't want a closed fold
		endif
		wincmd L " move preview window to the left
		wincmd p " back to caller
		if !&previewwindow	" got back
			wincmd _		
                       " make caller full size (I use minibufexplorer and for some reason
                       " the window is altered by the preview window split and manipulation
                       " so wincmd _ sets it back... your mileage may vary
		endif
	endif
endfunction

" right hand window full height preview window
inoremap <C-]> <ESC>:call PreviewTag(0)<CR>
nnoremap <C-]> :call PreviewTag(0)<CR>
" simple "above the caller" preview window,
nnoremap <M-]> :call PreviewTag(1)<CR>
inoremap <M-]> <ESC>:call PreviewTag(1)<CR>
" close preview
noremap <M-[> <ESC>:pc<CR>
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1021: Use glimpse from within vim
http://vim.sourceforge.net/tip_view.php?tip_id=

To use glimpse to search your files instead of grep -r, you can use these mappings:

set grepformat+=%f:\ %l:%m
set grepprg=glimpse\ -nyH\ $HOME/indexdir\ $*
nnoremap <silent> \g :grep <cword><CR>:cwindow<CR>
nnoremap <silent> \G :!glimpseindex -F -H $HOME/indexdir -b ${PWD}<CR>

You must:
1. have glimpse installed on your system. (see webglimpse.net)
2. Precompile an index with glimpseindex. The mapping above lets glimpseindex decide which files to scan and puts the index in $HOME/indexdir. You can change that if you like.
3. Grep away using the mapping above or, alternatively:
:grep pattern

Searches are blinding fast with even large projects. By using the grepprg option, you get the benefit of using the quickfix window to browse through your search results.

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1033: Toggling yes<->no
http://vim.sourceforge.net/tip_view.php?tip_id=

I'm bored of retyping things like 'ciwyes<Esc>' all the time when editing config files. So I define:

function s:ToggleYesNo()
  let w=expand("<cword>")
  if     w=="yes"    | let w="no"
  elseif w=="no"     | let w="yes"
  elseif w=="on"     | let w="off"
  elseif w=="off"    | let w="on"
  elseif w=="manual" | let w="auto"
  elseif w=="auto"   | let w="manual"
  else               | let w=""
  endif
  if w!=""
    exec "normal! \"_ciw\<C-R>=w\<cr>\<Esc>b"
  endif
endfunc
nnoremap gy  :call <SID>ToggleYesNo()<cr>
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1040: Good leading and trailing whitespace highlighting
http://vim.sourceforge.net/tip_view.php?tip_id=

highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen
match WhiteSpaceEOL /^\s*\ \s*\|\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /^\s*\ \s*\|\s\+$/
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1042: use maven with quickfix
http://vim.sourceforge.net/tip_view.php?tip_id=

Using maven with quickfix is pretty simple, just add:

compiler ant
set makeprg=maven\ -q\ -f\ project.xml\ jar:install

to your .vimrc. I use the jar:install goal but java:compile will suffice.


"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1045: great wildmode/wildmenu and console mouse
http://vim.sourceforge.net/tip_view.php?tip_id=

set wildmenu
set wildmode=list:longest,full

Put those two in your .vimrc, and you'll enjoy the greatest wildmode that isn't
fully documented in the vim help. "set wildmenu" first enables a menu at the
bottom of the vim/gvim window. The meaning of "list:longest,full" is so that
when you do completion in the command line via tab, these events will happen:

1. (on the first tab) a list of completions will be shown and the command will
be completed to the longest common command.
2. (on second tab) the wildmenu will show up with all the completions that were listed before.

To test it out, type ":spe" and then hit tab once to see 1 and hit tab again to see 2.

set mouse=a

Put that line in your .vimrc to enable full mouse support in the console. This
way you won't have to wait for gvim's excessively long startup (1.5 secs) and
just run vim in an xterm, having full mouse/scrollwheel support.


With both the above features, vim in the console is practically just as good as
gvim. (":emenu" command could be used to access the gvim menus)
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1046: Whitespace hungry backspace/delete
http://vim.sourceforge.net/tip_view.php?tip_id=

I saw a tip the other that came close, and I was intrigued.  So I think I
figured out good whitespace hungry delete.

imap <bs> <esc>d?\S?e1<cr>i

In short, it deletes from the cursor position backwards in the file until it
finds the first non-whitespace character and then changes the match end offset
to avoid deleting that non-whitespace char.  Let me know what you think.


"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1048: add classname based on filename while in input mode
http://vim.sourceforge.net/tip_view.php?tip_id=

I often copy or rename java files and then go in and have to change the name of
the class to match the filename (minus the path to the file and the .java
extension).  To do this I added an abbreviation.  I chose ,f as the
abbreviation, but you can use anything.  To try this out put the following
lines in your _vimrc or just run it at the : prompt to play with it.

" classname (the filename minus the path and extension)
iab <unique> ,f <c-r>=fnamemodify(getreg('%'), ':r')<cr>

<c-r>= is Control-R followed by the equal sign.  This is very useful in input mode.
getreg() gets the contents of the % register which has the filename
(which may or may not have the full path depending on how you loaded the file). 
:r is is a filename modifier that removes the path and the extension
(:help filename-modifiers for more info).

I believe this may work in older versions of Vim, but I use it in 6.3 and 6.4.
"AAA----------------------------------------------------------------------------------------------

VimTip	{{{1 1050: Join Up
http://vim.sourceforge.net/tip_view.php?tip_id=

Let's say you have some C or Java that looks like this:

// get the age of the person
age = person.getAge();

If you want to compact your code a bit you might want to stick the comment at
the end of the statement instead of on its own line.  Essentially you want to
"join up":

"CrossJoinUp"
<map> <CS-j> ddpkJk

Used on the example above, you will now have:

age = person.getAge(); // get the age of the person

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1052: Autoselect the right compiler using the filetype
http://vim.sourceforge.net/tip_view.php?tip_id=

Every time you edit a file you have to set the right type of compiler for this
file, one solution is to edit the file for your language in ftplugin and add a
compiler statement. But there's an easier solution. Why not use the name of the
type of file to set the right compiler on-the-fly and each time a file is open
? It's as simple as this :

Modify your vimrc and add this line :

au BufRead * try | execute "compiler ".&filetype | catch /./ | endtry

This runs a the compiler command each and every time a file is open and set the
compiler to the filetype which was determined by the file type scripts. If
there's no compiler for the filetype you're editing it just fails silently and
does not show the list of available compilers

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1053: Lookup word in dict
http://vim.sourceforge.net/tip_view.php?tip_id=

Hi,

put this in your vimrc to lookup the inner or selected word in dict. Please
adjust latin1 to your encoding.

nnoremap ,l mayiw`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>
vnoremap ,l may`a:exe "!dict -P - $(echo " . @" . "\| recode latin1..utf-8)"<CR>

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1058: Selecting changes in diff mode
http://vim.sourceforge.net/tip_view.php?tip_id=

Assumption: 2-window vertical diff mode

The idea: Use c] and c[ to go to a specific change. Then use M-, and M-. to
patch using the version on the left or right respectively. The cursor is then
positioned in the file that changed for ease of saving, etc.

I find this more intuitive than using diffput and diffget because I no longer
need to remember which window the cursor is in.

The code:
function! DiffTake(dir, oppdir)
    let l:old = winnr()
    exec "wincmd ".a:dir
    " Assumption: just 2 windows side by side.
    if (winnr() == l:old)
        diffput
        exec "wincmd ".a:oppdir
    else
        wincmd p
        diffget
    endif
endfunction

function! SetupDiffMappings()
    if &diff
        map <Esc>, :call DiffTake("h", "l")<CR>
        map <Esc>. :call DiffTake("l", "h")<CR>
    endif
endfunction

" vim -d
call SetupDiffMappings()
" Entering diff mode from within vim - diffsplit, etc.
autocmd FilterWritePost * call SetupDiffMappings()

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1078: Best way to close (delete) buffer without closing its window
http://vim.sourceforge.net/tip_view.php?tip_id=

"delete the buffer; keep windows
function Kwbd(kwbdStage)
	if(a:kwbdStage == 1)
		let g:kwbdBufNum = bufnr("%")
		let g:kwbdWinNum = winnr()
		windo call Kwbd(2)
		execute "bd! " . g:kwbdBufNum
		execute "normal " . g:kwbdWinNum . ""
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

-- That's a very simple function I wrote to enable someone to close the current
buffer (like :bd) yet not close any associated windows with that buffer. I
haven't seen anything easier and/or simpler than this. To use this function,
just do :call Kwbd(1)

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1129: getting alt key to work in terminals
http://vim.sourceforge.net/tip_view.php?tip_id=

xterm, by default, sets eightBitInput to true, meaning that the eighth bit is
set for metacharacters (combinations with the Alt key, for instance). Not all
terminals have this feature enabled by default, and therefore work differently
(they send an ESC before the character key).

So for the xterm, with enables the eight bit, you can just do something like, map <m-a> ggVG
However, with the terminal that's in 7 bit mode, you have to do this:
set <m-a> = ^[a
map <m-a> ggVG
"the ^[ is an ESC char that comes before the 'a'

My tip is to just set all terminals to work in 8 bit mode.
Here are two examples:
Eterm -8
rxvt --meta8

"AAA----------------------------------------------------------------------------------------------
" Works just like the Vim 7 sort(), optionally taking in a comprator (just like the original), except that duplicate
" entries will be removed.
function! SortUnique( list, ... )
  let dictionary = {}

  for i in a:list
    execute "let dictionary[ '" . i . "' ] = ''"
  endfor

  let result = []

  if ( exists( 'a:1' ) )
    let result = sort( keys( dictionary ), a:1 )
  else
    let result = sort( keys( dictionary ) )
  endif

  return result
endfunction

Call it just like you would sort().  Note that because it removes duplicate entries, the return List isn't necessarily going to be the same size as the original.  Furthermore, unlike sort(), this can't do things in place.  To replace the original List, do this:

let theList = SortUnique( theList )

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1149: Using balloonexpr effectively
http://vim.sourceforge.net/tip_view.php?tip_id=

This is another Vim 7 tip, the initial idea for which I got from a suggestion
in an email from the Vim list (sincere apologies for not remembering who).

Vim 7 allows the use of an option call 'balloonexpr', which basically calls a
function and displays the return value in a tooltip whenever the mouse cursor
is at rest over a piece of text for a short period of time.  Thus, we have:

" Returns either the contents of a fold or spelling suggestions.
function! BalloonExpr()
  let foldStart = foldclosed(v:beval_lnum )
  let foldEnd   = foldclosedend(v:beval_lnum)

  let lines = []

  " If we're not in a fold...
  if foldStart < 0
    " If 'spell' is on and the word pointed to is incorrectly spelled, the tool tip will contain a few suggestions.
    let lines = spellsuggest( spellbadword( v:beval_text )[ 0 ], 5, 0 )
  else
    let numLines = foldEnd - foldStart + 1

    " Up to 31 lines get shown okay; beyond that, only 30 lines are shown with ellipsis in between to indicate too much.
    " The reason why 31 get shown okay is that 30 lines plus one of ellipsis is 31 anyway...
    if ( numLines > 31 )
      let lines = getline( foldStart, foldStart + 14 )
      let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
      let lines += getline( foldEnd - 14, foldEnd )
    else
      let lines = getline( foldStart, foldEnd )
    endif
  endif

  return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
endfunction

set balloonexpr=BalloonExpr()

Now, if the mouse is hovering on a fold, this will show the contents of the
fold in the tooltip.  If the number of folded lines is too big, it will display
the first and last 15 lines only, with a comment in between indicating the
number of lines that it ate.

If, however, the cursor is on a misspelled word (only works if 'spell' --
another Vim 7 feature -- is set), then the tooltip will instead display a small
set of suggestions for correction.

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1160: Auto Save files when focus is lost.
http://vim.sourceforge.net/tip_view.php?tip_id=

This tip is a time saver, when in one gvim window you are editing some
source files and in other windows you are compiling/debugging
the same source. Especially useful with window AutoRaise feature.

Enable it with
call Mosh_FocusLost_SaveFiles()
function! Mosh_FocusLost_SaveFiles()
    :exe ":au FocusLost" expand("%") ":wa"
endfunction

then whenever the mouse leaves the gvim window, the
edited file will be saved to disk.

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1173: Spelling suggestions anywhere, even in console mode
http://vim.sourceforge.net/tip_view.php?tip_id=

A little while ago, I tried out all the spelling plug-ins for vim because
I was doing a bit of a project and needed to make sure it was all
beautifully spelled.  One function that I found really lacking in the
various spelling plug-ins was the ability to make suggestions on the
current word.  Some of them allowed this facility but there were
restrictions, such as only being able to use it in graphical mode and only being
able to use it on certain types of files.  I wanted something that would
work anywhere, whether in some code, in a text doc and that would work
in console mode.  I also wanted to see how easily I could in-line some
perl into a vim script to perform some function on it.  The answer to
that was that it's not impossible, but it's a bit ugly! 

Anyway, here's the function I created.  I use it all the time now so I
hope you get some use out of it too.

----------------------------------------------------------------------------------
" F7 Will give some spelling suggestions for the current word in any mode
nmap <F7> \ss
vmap <F7> <C-C> \ss
omap <F7> \ss
map! <F7> <C-C> \ss
noremap <silent> \ss :call SuggestWord()<return>

"Make some spelling suggestions for the current word, and allow you to change it for the word you prefer
"Requires ispell and perl
"By Ben Staniford: http://www.staniford.net
function! SuggestWord () 
	let rw = tempname()
	let oldspelling = expand("<cword>")

	"Run ispell on the word under the cursor and prompt us for a choice, then save it to a temp file
	exe '!echo -n '.oldspelling.' | ispell -a -S | perl -e '."\x27".'print "\n\n\n";'.
		\ 'while(<>) {if(/.*:\s(.*$)/){$m=1;@a=split ", ",$1;print "Suggestions: [CTL-C to abort]\n";'.
		\ 'for (@a) {print ++$i.")$_  "} print "\n>"; open (I, "/dev/tty"); $b=<I>; open(RW,">'.rw.'");'.
		\ 'print RW "$a[$b-1]";}}if($m\!=1){print "No Suggestions\n"}'."\x27"

	"If the user selected a word and it was saved, read it now
	if filereadable(rw)
		exe 'read ! cat '.rw
		exe "normal \"adw"
		exe "normal ddk"
		exe "normal /".oldspelling."\<CR>"
		exe "normal cw"
		"Print the word slightly differently if we're at the beginning of a line
		if (wincol() == 1) 
			exe "normal \"aP"
		else
			exe "normal \"ap"
		endif
	endif

endfunction "SuggestWord()

----------------------------------------------------------------------------------

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1194: Make ]z navigate to the next open fold
http://vim.sourceforge.net/tip_view.php?tip_id=

I think it makes more sense for ]z and [z to navigate to the next/previous open
fold, so I added the following to my .vimrc file:

function! GoToOpenFold(direction)
    let start = line('.')
    if (a:direction == "next")
        while (foldclosed(start) != -1)
            let start = start + 1
        endwhile
    else
        while (foldclosed(start) != -1)
            let start = start - 1
        endwhile
    endif
    call cursor(start, 0)
endfunction

nmap ]z :cal GoToOpenFold("next")
nmap [z :cal GoToOpenFold("prev")

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1202: Go away and come back
http://vim.sourceforge.net/tip_view.php?tip_id=

Like 3 years ago I used to work in program KDevelop and alike. One nice feature
that I liked was that I had usually opened more files of one project and when I
quit kdevelop and then went back all the files were loaded back again. Using
Vim script this can be done in Vim too.

The following script will save plenty of settings (see :h mksession) on vim
exit and loads these settings when you enter vim again. The settings are
associated (by this script) to the directory from where you've started vim.
That is, for example you start vim from directory /home/mynick/project/foo,
edit multiple buffers and then exit without closing these buffers, later when
you want to continue this work, you go to the same directory, run vim and all
the buffers, mappings and other settings will be loaded back as when you've
left.

To run it, just paste following script to ~/.vimrc file:

######################################################

function! MakeSession()
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
    let b:filename = b:sessiondir . '/session.vim'
    exe "mksession! " . b:filename
endfunction

function! LoadSession()
    let b:sessiondir  = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
        exe 'source ' b:sessionfile
    else
        echo "No session loaded."
    endif
endfunction

au VimEnter * :call LoadSession()
au VimLeave * :call MakeSession()

######################################################
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1214: Recursive vimgrep
http://vim.sourceforge.net/tip_view.php?tip_id=
It doesn't suggest this in the help for "vimgrep" directly, but 
:vimgrep **
will search recursively.

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1259: Edit java's jar, war, ear, sar, rar files
http://vim.sourceforge.net/tip_view.php?tip_id=

Jar files are really just zip files, and you can browse them from within vim simply by treating them the same as vim treats zip files (note to the vim maintainers: can we add these to the default distribution?)
If you want to figure out how to do this yourself, simply read this section of the help docs:  http://vimdoc.sourceforge.net/htmldoc/filetype.html#new-filetype and read zipPlugin.vim in your runtime/plugins directory.
For those who are impatient, the skinny version is to place the following text into a file named ~/.vim/ftdetect/jar.vim (if you're on unix):

######################## FILE START ##################### 
au BufReadCmd   *.jar,*.war,*.ear,*.sar,*.rar        call zip#Browse(expand("<amatch>"))
######################## FILE END ##################### 
That's it!  If you vim a jar file now, you'll be able to browse it.

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

" Use up/down arrow and PageUp/Down keys to scroll through the popup menu. The
" word in text will change as you scroll through. Press Enter to accept the
" selected word. Hit Esc to cancel completion and go back to the original word.

For those of you who prefer Esc to work like Enter, you can use this:

  inoremap <silent><Esc>      <C-r>=pumvisible()?"\<lt>C-y>":"\<lt>Esc>"<CR>

"AAA----------------------------------------------------------------------------------------------

VimTip	{{{1 1268: copy and paste between sessions using a temporary file
http://vim.sourceforge.net/tip_view.php?tip_id=

Sometimes I need to copy and paste stuff between vim sessions. There are some proposals on how to do this with the clipboard, but here is an alternative (should work for any OS):

- Hit Ctrl+C to copy the current line or current visual selection. (actually it will be saved to the file ~/.vbuf)
- Hit Ctrl+V to paste the contents of the previous copy action.
These mappings work in "normal" and "visual" mode.

"custom copy'n'paste
"copy the current visual selection to ~/.vbuf
vmap <C-c> :w! ~/.vbuf<CR>
"copy the current line to the buffer file if no visual selection
nmap <C-c> :.w! ~/.vbuf<CR>
"paste the contents of the buffer file
nmap <C-v> :r ~/.vbuf<CR>
"AAA----------------------------------------------------------------------------------------------
2b. Mapping "fast" keycodes
===========================

As mentioned in section 1c, the Ctrl-Shift-Down_arrow keycode cannot be set in
the same way as the Shift-Down_arrow keycode because it is not a listed Vim
keycode. One way to get around that is to do the following:

  :map <Esc>[1;6B <C-S-Down>
"AAA----------------------------------------------------------------------------------------------
function! ShowWhitespace()
    " show tabs and whitespace at eol
    let b:showWS = 1
    syntax match Tabs "\t" containedin=ALL
    syntax match LineEndWS "\s\+$" containedin=ALL
    echo "show Whitespace"
endfunction

function! HideWhitespace()
    " hide tabs and whitespace at eol
    let b:showWS = 0
    syntax clear Tabs
    syntax clear LineEndWS
    echo "hide Whitespace"
endfunction

function! ToggleShowWhitespace()
    if !exists('b:showWS')
        let b:showWS = 0
    endif

    " toggle variable
    let b:showWS = !b:showWS

    if b:showWS == 1
        call ShowWhitespace()
    else
        call HideWhitespace()
    endif
endfunction
------------------------------------------------
You will also need some highlighting:

highlight Tabs term=standout cterm=standout gui=standout
highlight link LineEndWS Error

And some mappings (or autocommands):
nmap <Leader>ws :call ToggleShowWhitespace()<CR>
if has("autocmd")
    au VimEnter,BufRead  *   silent call ShowWhitespace()
endif
"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1279: Highlight current line in Insert Mode using "cursorline"
http://vim.sourceforge.net/tip_view.php?tip_id=

with the following code you can hightlight (using "cursorline") the current
line in insert mode. Hightlight  disappears in normal mode:

function! s:EnterInsert()
  set cul
endfunction

function! s:LeaveInsert()
  set nocul                     
endfunction

autocmd InsertLeave * call s:LeaveInsert()
autocmd InsertEnter * call s:EnterInsert()

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1285: change behaviour of builtin commands like :e using special case of cabbrev
http://vim.sourceforge.net/tip_view.php?tip_id=

Sometimes you want to change behaviour or builtin command like :e.
The closest thing to doing this is to define your own command, let it be :E,
and refirect :e to :E using following abbreviation:

       cabbrev e <c-R>=(getcmdtype()==':' && getcmdpos()==1 ? 'E' : 'e')<cr>

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1287: Statusline color changes depending on current mode (insert mode vs normal mode)
http://vim.sourceforge.net/tip_view.php?tip_id=
The color codes below are Green in normal mode, and  Magenta 
in insert mode. If you like other colors, just change them.


set laststatus=2
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

"AAA----------------------------------------------------------------------------------------------
" WideMsg() prints [long] message up to (&columns-1) length
" guaranteed without "Press Enter" prompt.
function! WideMsg(msg)
    let x=&ruler | let y=&showcmd
    set noruler noshowcmd
    redraw
    echo a:msg
    let &ruler=x | let &showcmd=y
endfun

" to test
:set ruler showcmd
:call WideMsg(repeat('x',&co-1))

"AAA----------------------------------------------------------------------------------------------
VimTipV	{{{1 1319: Automatica tags generation
http://vim.sourceforge.net/tip_view.php?tip_id=

You have an number sequence like:

 1 12 3 13 11 55 67
 1 12 3 13 11 55 67
 1 12 3 13 11 55 67
 1 12 3 13 11 55 67
 1 12 3 13 11 55 67

for generate tags html <td>1</td>

     :%s/\(\s\+\)\(\d\+\)/<td>\2<\/td>/g

result:

<td>1</td><td>12</td><td>3</td><td>13</td><td>11</td><td>55</td><td>67</td>
<td>1</td><td>12</td><td>3</td><td>13</td><td>11</td><td>55</td><td>67</td>
<td>1</td><td>12</td><td>3</td><td>13</td><td>11</td><td>55</td><td>67</td>
<td>1</td><td>12</td><td>3</td><td>13</td><td>11</td><td>55</td><td>67</td>
<td>1</td><td>12</td><td>3</td><td>13</td><td>11</td><td>55</td><td>67</td>

For generate words like:
<td>uma</td><td>por??o</td><td>de</td><td>palavras</td><td>para</td><td>testes</td><td>deve</td>
<td>ser</td><td>digitada</td><td>ap?s</td><td>isto</td><td>coloque</td><td>espa?o</td><td>no</td> 
<td>inicio</td><td>de</td><td>cada</td><td>linha</td>

:%s/^/ /g
:%s/\(\s\+\)\(\S\+\)/<td>\2<\/td>/g

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1316: Easy visual commenting - Navigating visual selections with '< and '>
http://vim.sourceforge.net/tip_view.php?tip_id=

By using '< and '>, you can jump to the start and end, respectively, of the most recent visual selection.  This is a great and simple way to comment out a block of visually selected code:

vmap ,/ '><ESC>o*/<ESC>'<O/*<ESC>

This works because even after you <ESC> out of visual mode, '< and '> (presumably) remember where the most recent visual selection began and ended.  Actually, this doesn't always work.  Curly braces seem to confuse Vim when I do it that way, so here's an alternate way with marks (note: this will overwrite mark ')

vmap ,/ '<m''><ESC>o*/<ESC>''O/*<ESC>

Now, uncommenting is as easy as deleting the two lines that the /* */s are on.  Or you can use this: (note: this will produce unexpected results if your /* */s aren't on their own lines!)

vmap ,u ?\/*dd/*\/dd:nohl<CR>

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1305: Define your own colours in gvim.
http://vim.sourceforge.net/tip_view.php?tip_id=

If you spend all your time in gvim, you want sober colours soothing to your eyes.
Instead of copying someone's gaudy color scheme, fine tune it your own settings.

Put this function in say ~/showcolors.vim, 
then edit the rgb colors in hex below and press <A-x> to update and see the results.
Below are (3 dark, 3 pastel) * (red,blue,green, yellow) colour definitions to get you started.
Needs vim70 with python to generate syntax on the fly.

function! Mosh_Show_Colors()
    :syn off
:py << EOF
import vim,re
for line in vim.current.buffer[:]:
    result = re.match('^\s*:?hi\w*\s*(\w+)',line)
    if result:
        kw = result.group(1)
        syn = ("syn keyword %s %s") % (kw, kw)
        #print syn
        vim.command( syn )
EOF
   :map  <A-x>  :call Mosh_Show_Colors()<CR>:exe getline('.')<CR>
   :hi Red1d  guifg=#8f0000 
   :hi Red2d  guifg=#702020 
   :hi Red3d  guifg=#500707 
   :hi Red1p  guifg=#fa4740 
   :hi Red2p  guifg=#f08787 
   :hi Red3p  guifg=#f0a787 

   :hi Blue1d guifg=#1010f0 
   :hi Blue2d guifg=#101090 
   :hi Blue3d guifg=#103050 
   :hi Blue1p guifg=#8080f0 
   :hi Blue2p guifg=#a080f0 
   :hi Blue3p guifg=#70a0f0 

   :hi Green1d guifg=#01a001 
   :hi Green2d guifg=#017001 
   :hi Green3d guifg=#015001 
   :hi Green1p guifg=#a0f0a0 
   :hi Green2p guifg=#c0ffa0 
   :hi Green3p guifg=#c0f010 

   :hi Yellow1p guifg=#f0f000
   :hi Yellow2p guifg=#fafa0a
   :hi Yellow3p guifg=#fdda0a
   :hi Yellow1d guifg=#adaa0a
   :hi Yellow2d guifg=#8a8a01
   :hi Yellow3d guifg=#4a4a01
   
endfunc   

 :call Mosh_Show_Colors()

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1244: preview interpreter's output
http://vim.sourceforge.net/tip_view.php?tip_id=

This will come in handy for those of you who script in an interpreted language.
If you ever wanted to just run parts of your script and check the output without manipulating your code, read on!
The output of your whole script or your snippets will be shown in a so called "preview window" (:he 'preview)

In my case I used ruby and mapped the commands to f7.
I just select the stuff I want to run and press f7 et voila!
The output is shown in a new window!
The next time I press f7 the window will be closed and replaced.

Have fun!

vimrc
----8<----
"save code, run ruby, show output in preview window
function! Ruby_eval_vsplit() range
  let src = tempname()
  let dst = tempname()
  execute ": " . a:firstline . "," . a:lastline . "w " . src
  execute ":silent ! ruby " . src . " > " . dst . " 2>&1 "
  execute ":pclose!"
  execute ":redraw!"
  execute ":vsplit"
  execute "normal \<C-W>l"
  execute ":e! " . dst
  execute ":set pvw"
  execute "normal \<C-W>h"
endfunction
 
vmap <silent> <F7> :call Ruby_eval_vsplit()<cr>
nmap <silent> <F7> mzggVG<F7>`z
imap <silent> <F7> <ESC><F7>a
map  <silent> <S-F7> <C-W>l:bw<cr>
imap <silent> <S-F7> <ESC><S-F7>a

"AAA----------------------------------------------------------------------------------------------
VimTip	{{{1 1246: VIM at Wikibooks
http://vim.sourceforge.net/tip_view.php?tip_id=

Over at Wikibooks a new vim book [1] is in the making:

http://en.wikibooks.org/wiki/Learning_vi:Vim

If you allways had the urge to be an author and know a bit of vim that this is the platform for you to fullfill your authoring dreams.

Martin

"AAA----------------------------------------------------------------------------------------------


VimTip	{{{1 1251: AES256 Encryption in vim done easy.
http://vim.sourceforge.net/tip_view.php?tip_id=

1. install base64 (http://www.fourmilab.ch/webtools/base64/) and aespipe (http://www.fourmilab.ch/webtools/base64/)
2. create a second config file named ~/.cvimrc and put the following in it:

##########cvimrc start###########
set secure
set viminfo=
set noswapfile
set nobackup
set nowritebackup
set history=0

function Scramble()
                %!base64 -e | aespipe -e aes256 -T | base64 -e
endfunction

function Unscramble()
                %!base64 -d | aespipe -e aes256 -d | base64 -d
endfunction

map <silent> <F7> :call Scramble()<Esc>
map <silent> <F8> :call Unscramble()<Esc>
##########cvimrc end###########

3. create a shell script named cvim (copy it to /usr/bin) and put in:

##########cvim start###########
#!/bin/sh
vim -S $HOME/.cvimrc "$@"
exit 0
##########cvim end###########

4. make the new script executeable by typing: $ chmod 750 /usr/bin/cvim
(must be root or else use ~/bin/ instead of /usr/bin instead)

Now you can edit a file with: $ cvim new_textfile
Type in whatever you like to.
Press F7 Key and type password twice,
then the content of the file will be encrypted.
To decrypt press F8 and type password again.

Never save the file while you can see the plain text,
before saving (:w) you should encrypt it first, otherwise
there will be traces of the plaintext file on your harddisk.

Have fun.

NOTE:
If somebody ever finds out how to realize the same thing
without "base64" and "aespipe" please post a new tip.
I have tried "openssl base64 (-d)" and "openssl enc
-aes-256-cbc (-d)" instead of the two programs above,
but i always got errors (bad decrypt and so on).
(yes, i know about gnupg.vim and no, i do not use gpg ;-) )
