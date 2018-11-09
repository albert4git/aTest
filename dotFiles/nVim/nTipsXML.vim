"AAA----------------------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------"
1. In the command Mode, Go to the beginning of the first mark (lets say line 50).
2. Type: mk
3. Go to the end of your selection (lets say 100), using j's or Ctrl -F or anything. You don't need to count the lines.
4. Type: "ay'k (i.e. Double Quotes, <reg name from a-z>, <y-yank or d-delete>, single quote, k
5. The above command copies those lines into register a.
6. If you do "ad'k , it will delete them from the current location and copies them into register a.
7. You can paste those lines wherever you want just as you print from registers, i.e. "ap
"AAA----------------------------------------------------------------------------------------------"

VimTip	{{{1 346: Wrap text in HTML/XML tags after prompting for the tag name
http://vim.sourceforge.net/tip_view.php?tip_id=


Someone else posted this sometime ago on this mailing list, I have enhanced it slightly and made a tip out of it.
I thought it was pretty clever and very generic.

If you have a block of text and you want to wrap it in <TAG_NAME>...</TAG_NAME> then this function will prompt you for the tag name and wrap the text.

If there is no text VISUALLY selected, it will wrap the current word in the tag, otherwise it will wrap the visually selected text.

It will also strip off any leading spaces.
For the end tag, it will use the first word of the tag only.

Consider an ANT build file, which has tags like this:
<target name="init">
...
</target>

When prompted for the tag you would enter:
target name="init"

And it will wrap the text in:
<target name="init">
...
</target>


" Tag Select/Wrapper
" These mappings and TagSelection function will allow you to place " an XML tag around either the current word, or the current selected " text 
nmap <Leader>t viw<Leader>t 
vnoremap <Leader>t <Esc>:call TagSelection()<CR>

nmap <Leader>t viw<Leader>t
vnoremap <Leader>t <Esc>:call TagSelection()<CR>

function! TagSelection()
  let l:tag = input("Tag name? ")
  " exec "normal `>a</" . l:tag . ">\e"
  " Strip off all but the first work in the tag for the end tag
  exec "normal `>a</" . 
              \ substitute( l:tag, '[ \t"]*\(\<\w*\>\).*', '\1>\e', "" )
  exec "normal `<i" 
              \ substitute( l:tag, '[ \t"]*\(\<.*\)', '<\1>\e', "" )
endfunction


