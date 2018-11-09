VimTip	{{{1 318: Extended Bracket and Parenthesis + extras for perl
http://vim.sourceforge.net/tip_view.php?tip_id=

This is an extension of vimtip #153
I found this tip useful, but the jump seemed out of place for me, I couldn't enter just one ' or ", and so I created an improvement
Basically, I set it up so that when you're in perl and have a non keyword charcter, (except for @, $ and % for perl) and you type a { you get:
{
       | <- cursor
}
Where as, when I have a keyword I get:
word{}
With the cursor in the middle, for hashes in perl.  I can jump out of any block, except the "" or '' blocks, by typing their closing charcter.  So } jumps me out past the next } in the file.

Warning, this search may wrap around.

Finally, I made it so that, using the alt key, 
<Alt-'> inserts a '
<Alt-/> inserts a "
<Alt-[> inserts a [
<Alt-]> inserts a ]
<Alt--> inserts a {
<Alt-=> inserts a }
<Alt-,> inserts a <
<Alt-.> inserts a >

"########################################
" File -		matchMe.vim
" Date -		Wednesday, August 21, 2002
"########################################

" This code fixes my problem with 
" does the one format for perl and still keeps hashes
function! InsertBrackets()
	let fileType = &ft

	if fileType == 'perl'
		let col = col('.') - 1
		if !col || getline('.')[col - 1] !~ '\k' && getline('.')[col - 1] !~ '\$' && getline('.')[col - 1] !~ '@' && getline('.')[col - 1] !~ '%'  && getline('.')[col - 1] !~ '#'  
			return "{\<cr>\<bs>}\<esc>ko"
		else
			return "{}\<esc>i\<c-o>:echo \<cr>"
		endif
	else
		return "{\<cr>\<bs>}\<esc>ko"
	endif
endfunction

" This code jumps out of the brackets
function! JumpNext(normChar)
	let ret = "\<space>\<esc>ma\<left>/\\".a:normChar."\<cr>mb`ai\<del>\<esc>`bi\<right>"
	return ret
endfunction

" mappings
inoremap " ""<esc>i<c-o>:echo <cr>
inoremap ' ''<esc>i<c-o>:echo <cr>
inoremap < <><esc>i<c-o>:echo <cr>
inoremap ( ()<esc>i<c-o>:echo <cr>
inoremap [ []<esc>i<c-o>:echo <cr>
inoremap { <c-r>=InsertBrackets ()<cr>
inoremap > <c-r>=JumpNext(">")<cr>
inoremap ) <c-r>=JumpNext(")")<cr>
inoremap ] <c-r>=JumpNext("]")<cr>
inoremap } <c-r>=JumpNext("}")<cr>
inoremap <m-[> [
inoremap <m-]> ]
inoremap <m-/> "
inoremap <m--> {
inoremap <m-=> }
inoremap <m-,> <
inoremap <m-.> >
inoremap <m-'> '


