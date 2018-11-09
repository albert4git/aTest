"AAA----------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
" F7 Will give some spelling suggestions for the current word in any mode
nmap <F7> \ss
vmap <F7> <C-C> \ss
omap <F7> \ss
map! <F7> <C-C> \ss
noremap <silent> \ss :call SuggestWord()<return>

"Make some spelling suggestions for the current word, and allow you to change
"it for the word you prefer Requires ispell and perl By Ben Staniford:

function! SuggestWord () let rw = tempname() let oldspelling =
  expand("<cword>")

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

"AAA----------------------------------------------------------------------------------
VimTip	{{{1 91: Dictionary completions
http://vim.sourceforge.net/tip_view.php?tip_id=

This tip will will explain how to use the dictionary completion facilities provided by vim.  This can be useful if you use vim to type your email, edit code, etc.  

Dictionary completion is one of many search facilites provided by Insert mode completion.  It allows the user to get a list of keywords, based off of the current word at the cursor.  This is useful if you are typing a long word (e.g. acknowledgeable) and don't want to finish typing or don't remember the spelling.

To start, we must first tell vim where our dictionary is located.  This is done via the 'dictionary'  option.  Below is an example.  Your location may vary.  See :help 'dictionary'  for hints as to where you should look.

	:set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

Now, to use this list we have to enter insert mode completion.  This is done by hitting CTRL-X while in insert mode.  Next, you have to specify what you want to complete.  For dictionaries use CTRL-K.  Once in this mode the keys CTRL-N and CTRL-P will cycle through the matches.  So, to complete the word "acknowledgeable" I would do the following in insert mode:

	acknow<CTRL-X><CTRL-K><CTRL-N>

It can be cumbersome to type CTRL-X CTRL-K for many different completions.  So, vim gives us a shortcut.  While in insert mode CTRL-N and CTRL-P will cycle through a predetermined set of completion sources.  By default, dictionary completion is not a part of this set.  This set is defined by the 'complete' option.  Therefore, we must add dictionary to this as shown below:

	:set complete-=k complete+=k

Now, while in insert mode we can type the following to complete our example:

	acknow<CTRL-N><CTRL-N>

This shortcut may not save a whole lot of typing.  However, I find that it requires less hand movement to only worry myself with two key combinations, rather than 4.

I find that the completion facilites provided by vim save me a *HUGE* amount of typing.  These savings can be realized in only a short amount of time if you are editing some code with functions and variables that have long names with underscores in them.

For more help:
	help ins-completion
	help compl-dictionary
	help 'complete'
	help 'dictionary'
	help :set+=


"AAA----------------------------------------------------------------------------------
VimTip	{{{1 152: Spelling checkers for: Dutch, English, German, Hungarian, and Yiddish
http://vim.sourceforge.net/tip_view.php?tip_id=

Under http://www.erols.com/astronaut/vim/index.html#vimlinks_scripts
are links to spelling checkers for Dutch, English, German, Hungarian,
and Yiddish, all based on the original engspchk.vim.  The spelling
checker provides as-you-type spell checking; with vim6.0 it will avoid
checking on partially typed words.

Provided are several maps:

  \et : add  word under cursor into database for just this file
  \es : save word under cursor into database (permanently)
  \en : move cursor to the next     spelling error
  \ep : move cursor to the previous spelling error
  \ea : look for alternative spellings of word under cursor

To use \ea you will need agrep:

  agrep source: ftp://sunsite.unc.edu/pub/Linux/utils/text/agrep-2.04.tar.Z
  agrep Win exe: http://www.tgries.de/agrep

To use the spell checkers just source it in:

  ex.  so engspchk.vim

To read more about it see

  http://www.erols.com/astronaut/vim/index.html#Spelling
"AAA----------------------------------------------------------------------------------
VimTip	{{{1 172: Using Ispell on a highlighted region
http://vim.sourceforge.net/tip_view.php?tip_id=

Suppose you would like to use Ispell to check a word or region that you've
visually highlighted.  The following macro will do the job.  Just type
Shift-Insert while in visual mode.

vnoremap <S-Insert> <C-C>`<v`>s<Space><Esc>mq:e ispell.tmp<CR>i<C-R>"<Esc>:w<CR>:! xterm -bg ivory -fn 10x20 -e ispell %<CR><CR>:e %<CR><CR>ggVG<Esc>`<v`>s<Esc>:bwipeout!<CR>:!rm ispell.tmp*<CR>`q"_s<C-R>"<Esc>

This is based on Chip Campbell's macro which uses Ispell on the whole file
(in normal mode).

noremap <S-Insert> :w<CR>:! xterm -bg ivory -fn 10x20 -e ispell %<CR><Space>:e %<CR><Space>

Carl Mueller

