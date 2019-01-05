I use UltiSnips and YouCompleteMe to drastically speed up my typing in Vim. If you’re unfamiliar with either one:

    UltiSnips is a great snippet manager for Vim and an improvement over SnipMate.
    YouCompleteMe is a as-fast-as-you-can-type, fuzzy-code completion engine for Vim.

They both work great by themselves but making the two play well together requires a little more effort than just adding them to your plugin manager. After installing each one, we’ll need to change the way we interact with UltiSnips from Vim. From this Stack Overflow answer, add to your .vimrc:

" if you use Vundle, load plugins:
Bundle 'ervandew/supertab'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
 
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
 
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<cr>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

Now when you come to a word or snippet YouCompleteMe can complete, you’ll see the completion list and need to make a selection. To cycle through the list, I use Up and Down
which I have mapped to my Hyper key
like so:

Keymappings	
Hyper-K	Up
Hyper-J	Down
Hyper-L	Right
Hyper-H	Left

After coming to the desired selection, I’ll do one of two things depending on whether I’m selecting something from YouCompleteMe or UltiSnips:

    If selecting from YouCompleteMe, a space is typed and I’m on to my next word.
    If selecting an UltiSnips snippet, I use ⇥ to expand the snippet.
