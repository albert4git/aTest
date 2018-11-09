
VimTip	{{{1 83: how to indent (useful for source code)
http://vim.sourceforge.net/tip_view.php?tip_id=

Here is the most useful vim command that I know of and I'm surprised that it's not yet in the tips list.

I use the indent features of vim all the time. Basically, it lets you indent your source code.

SETUP: To make indentation work nicely I have the following in my .vimrc file:
set et
set sw=4
set smarttab

these make vim behave nicely when indenting, giving 4 spaces (not tabs) for each "tabstop".

HOW TO USE:
in command mode, == will indent the current line
selecting a range of lines (with shift-v) then == will indent your selection
typing a number then == will indent that many lines, starting from your cursor
(you get the idea, there are many other things you can do to select a range of lines)

Tell me that isn't great?

"----------------------------------------------------------------------------------

VimTip	{{{1 112: Back and forth between indented lines again

Paul Wright posted a tip which explained how to jump back and forth between
lines with the same indentation level. I do this a lot, so I came up with this
slightly more comprehensive solution.

The example mappings below work as follows:

					[l and ]l jump to the previous or the next line with the same indentation level as the one you're currently on.
					[L and ]L jump to the previous or the next line with an indentation level lower than the line you're currently on.

			These movements also work in visual mode and (only as of one of the 6.0 alpha versions) in operator pending mode, meaning that you can do a d]l. The motion is specified as being exclusive when in operator pending mode.

			When might you use this? If you're writing programs in Python, Haskell, or editing XML files, they will be very useful. E.g. in XML you can jump to the outer enclosing tag, or the next matching tag. I use it for practically anything I edit, so it's not limited to this.



"
" NextIndent()
"
" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool):   true:  Motion is exclusive
"                     false: Motion is inclusive
" fwd (bool):         true:  Go to next line
"                     false: Go to previous line
" lowerlevel (bool):  true:  Go to line with lower indentation level
"                     false: Go to line with the same indentation level
" skipblanks (bool):  true:  Skip blank lines
"                     false: Don't skip blank lines

function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
	let line = line('.')
	let column = col('.')
	let lastline = line('$')
	let indent = indent(line)
	let stepvalue = a:fwd ? 1 : -1

	while (line > 0 && line <= lastline)
		let line = line + stepvalue
		if (	! a:lowerlevel && indent(line) == indent ||
				\ a:lowerlevel && indent(line) < indent)
			if (! a:skipblanks || strlen(getline(line)) > 0)
				if (a:exclusive)
					let line = line - stepvalue
				endif
				exe line
				exe "normal " column . "|"
				return
			endif
		endif
	endwhile
endfunc


" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<cr>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<cr>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<cr>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<cr>
vnoremap <silent> [l <esc>:call NextIndent(0, 0, 0, 1)<cr>m'gv''
vnoremap <silent> ]l <esc>:call NextIndent(0, 1, 0, 1)<cr>m'gv''
vnoremap <silent> [L <esc>:call NextIndent(0, 0, 1, 1)<cr>m'gv''
vnoremap <silent> ]L <esc>:call NextIndent(0, 1, 1, 1)<cr>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<cr>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<cr>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<cr>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<cr>

