Vim 7 will be introducing one of the most critical features: completion (intellisense).
"AAA--------------------------------------------------------------------------------------------------------------------

"AAA--------------------------------------------------------------------------------------------------------------------
"AAA--------------------------------------------------------------------------------------------------------------------

"AAA--------------------------------------------------------------------------------------------------------------------
" To define abbreviations, use the ab[breviate] command.

:ab rtfm read the fine manual  -  Whenever you type 'rtfm' followed by a <space> (or <esc> or <cr>) vim
                                  will expand this to 'read the fine manual'.

:ab                            -  list all defined abbreviations

:una[bbreviate] rtfm           -  remove 'rtfm' from the list of abbreviations

:abc[lear]                     -  remove all abbreviations

"AAA--------------------------------------------------------------------------------------------------------------------
VimTip	{{{1 42: Using marks
http://vim.sourceforge.net/tip_view.php?tip_id=

To mark one or more positions in a file, use the m[ark] command.

ma       -    set current cursor location as mark a
'a       -    jump to beginning of line of mark a
`a       -    jump to postition of mark a
d'a      -    delete from current line to line of mark a
d`a      -    delete from current cursor position to mark a
c'a      -    change text from current line to line of mark a
y`a      -    yank text to unnamed buffer from cursor to mark a
:marks   -    list all the current marks

NB: Lowercase marks (a-z) are valid within one file. Uppercase marks
(A-Z), also called file marks, are valid between files.


"AAA--------------------------------------------------------------------------------------------------------------------
:set textwidth=0 (If u want to set it yourself do :set textwidth=78.)
?text u want to format and type gq. Now specify the range, say $ to
format a large line.
"AAA--------------------------------------------------------------------------------------------------------------------
Have you ever been annoyed with that fact that :new opens buffer above current?
If yes, then try :below new.  You'll like it!
"AAA--------------------------------------------------------------------------------------------------------------------
This requires the tagselect.vim plugin (vimscript #1282), and its dependent
plugins (vimscript #171 and vimscript #197). The plugin allows you execute a
:tselect command and view the results in a new window. You can then use Vim's
"AAA--------------------------------------------------------------------------------------------------------------------
 how to copy all the buffer into clipboard?  That time I
 :%y+
"AAA--------------------------------------------------------------------------------------------------------------------
The last command entered at the ':' can be repeated with @:
and further repeats can be done with @@
Useful for commands like e.g. :bnext or :cNext.
"AAA--------------------------------------------------------------------------------------------------------------------
 This allows me to type :H<space>uganda to search for the word 'uganda' in all of the help files.

    cnoabbrev H helpgrep
 
"AAA--------------------------------------------------------------------------------------------------------------------
Instead of keeping 'zc' and 'zo' in your head, just use 'za' to toggle a fold open or closed.
"AAA--------------------------------------------------------------------------------------------------------------------
With "g;" you can step back to the previouse change in the list, typing "g," you step to the next change.
":changes" command.  This command prints all changes in the file. 
Type ":help changes" for more information.

"AAA--------------------------------------------------------------------------------------------------------------------
This trick allows to apply the range to any command that does not accept range directly:
    :n1,n2 g/^/ command
That is, you add g/^/ between the range and the command.

"AAA--------------------------------------------------------------------------------------------------------------------
Example: for each line longer than 80 chars, run that line thru the par text formatter.
     :g/.\{80,\}/  .!par w70

"AAA--------------------------------------------------------------------------------------------------------------------
Lookup lines NOT containing some word. For lines not containing "Warning" the pattern is:
/^\(.*Warning\)\@!.*$
  or
\v^(.*Warning)@!.*$

"AAA------------------------------------------------------------------------------------------------------------------
Quicker way to toggle the spellcheck funcitonality:
  :map <F5> :setlocal spell! spelllang=en_us<cr>
"AAA------------------------------------------------------------------------------------------------------------------
Vary Magic! For more information use ':help /\v'
"AAA------------------------------------------------------------------------------------------------------------------
If there is more than one match, it will present you selection:

:Find Makefile
1       ./src/Makefile
2       ./src/core/Makefile
3       ./src/api/Makefile
...
89      ./src/deelply/hidden/Makefile
90      ./Makefile
Which ? (CR=nothing)

You may also use wildchars (whatever find(1) knows)
:Find *stream*.c
1       ./src/core/i_stream.c
2       ./src/core/o_stream.c
3       ./src/core/streamio.c
Which ? (CR=nothing)

"AAA------------------------------------------------------------------------------------------------------------------

If you press: ctrl+[ it will put you in normal mode just like hitting esc.  
(  	previous sentence
)  	Next Sentence
d)  	Deletes upto the end of the current sentence.
d(  	If in middle of sentences deletes to the begining. OR if at the
d{ 
d} operations move over paragraphs.
[[ and ]] move over sections.

"AAA------------------------------------------------------------------------------------------------------------------
)   - jump forward one sentence
(   - jump backward one sentence
}   - jump forward one paragraph
{   - jump backward one paragraph
H   - jump to the top of the display       
M   - jump to the middle of the display   
L   - jump to the bottom of the display
'm  - jump to the beginning of the line of mark m
`m  - jump to the location of mark m
G   - jump to end of file
1G  - jump to beginning of file
50G - jump to line 50
''  - return to the line where the cursor was before the latest jump
``  - return to the cursor position before the latest jump (undo the jump).
%   - jump to corresponding item, e.g. from an open brace to its 

"AAA------------------------------------------------------------------------------------------------------------------"
  #  (where # is a number) following command n times...  
  :  go to ex-mode 
  )  next sentence 
  (  previous sentence 
  }  next paragraph 
  {  previous paragraph 
 ]]  next section 
 [[  previous section
  0  beginning of line 
  $  end of line 
  ^  first non-whitespace character
  +  first character of next line 
  -  first character of previous line 


"AAA-------------------------------------------------------------------------------------------------------------------

I really like the text-objects in Vim (:h text-objects), like ciw, or da>, but
I really wanted one that would work on quoted sentences.  Here's what I came up
with (add to your vimrc):

" Quote motions for operators: da" will delete a quoted string.
omap i" :normal vT"ot"<CR>
omap a" :normal vF"of"<CR>
omap i' :normal vT'ot'<CR>
omap a' :normal vF'of'<CR>

Now, with your cursor on the "a" of "you are here", you can type ci" and add
new text between the quotation marks!  Note that it doesn't work for visual
mode (vi" only puts you in visual mode).
"AAA-------------------------------------------------------------------------------------------------------------------

  = 1. Whole lines                                          i_CTRL-X_CTRL-L
  = 2. keywords in the current file                         i_CTRL-X_CTRL-N
  = 3. keywords in 'dictionary'                             i_CTRL-X_CTRL-K
  = 4. keywords in 'thesaurus', thesaurus-style             i_CTRL-X_CTRL-T

  = 5. keywords in the current and included files           i_CTRL-X_CTRL-I
  = 6. tags                                                 i_CTRL-X_CTRL-]
  = 7. file names                                           i_CTRL-X_CTRL-F
  = 8. definitions or macros                                i_CTRL-X_CTRL-D
  = 9. Vim command-line                                     i_CTRL-X_CTRL-V
  = 10. User defined completion                             i_CTRL-X_CTRL-U
  = 11. omni completion                                     i_CTRL-X_CTRL-O
  = 12. Spelling suggestions                                i_CTRL-X_s
  = 13. keywords in 'complete'                              i_CTRL-N

"AAA-------------------------------------------------------------------------------------------------------------------

 :Ack [options] {pattern} [{directories}]
 The quickfix results window is augmented with these convenience mappings:
     ?    a quick summary of these keys, repeat to close
     o    to open (same as Enter)
     O    to open and close the quickfix window
     go   to preview file, open but maintain focus on ack.vim results
     t    to open in new tab
     T    to open in new tab without moving to it
     h    to open in horizontal split
     H    to open in horizontal split, keeping focus on the results
     v    to open in vertical split
     gv   to open in vertical split, keeping focus on the results
     q    to close the quickfix window

"AAA-------------------------------------------------------------------------------------------------------------------
"
"   #### :Far {pattern} {replace-with} {file-mask} [params]
"   Find the text to replace.
"   #### :Farp [params]
"   Same as `Far`, but allows to enter {pattern}, {replace-with} and {file-mask}
"   one after the other.
"   #### :Fardo [params]
"   Runs the replacement task.
"   #### :Refar [params]
"   Change `Far`/`Farp` params.
"   #### :Farundo [params]
"   Undo last (or all) replacement(s).
"   #### :F {pattern} {file-mask} [params]
"   Find only.
"   #### Need help?
"   :help far.vim
"
"AAA-----------------------------------------------------------------------------------------------------------
" | Command           | List                                                                    |
"--------------------------------------------------------------------------------------------------------------
 | `Files [PATH]`    | Files (similar to `:FZF`)                                               |
 | `GFiles [OPTS]`   | Git files (`git ls-files`)                                              |
 | `GFiles?`         | Git files (`git status`)                                                |
 | `Buffers`         | Open buffers                                                            |
 | `Colors`          | Color schemes                                                           |
 | `Ag [PATTERN]`    | [ag][ag] search result (`ALT-A` to select all, `ALT-D` to deselect all) |
 | `Rg [PATTERN]`    | [rg][rg] search result (`ALT-A` to select all, `ALT-D` to deselect all) |
 | `Lines [QUERY]`   | Lines in loaded buffers                                                 |
 | `BLines [QUERY]`  | Lines in the current buffer                                             |
 | `Tags [QUERY]`    | Tags in the project (`ctags -R`)                                        |
 | `BTags [QUERY]`   | Tags in the current buffer                                              |
 | `Marks`           | Marks                                                                   |
 | `Windows`         | Windows                                                                 |
 | `Locate PATTERN`  | `locate` command output                                                 |
 | `History`         | `v:oldfiles` and open buffers                                           |
 | `History:`        | Command history                                                         |
 | `History/`        | Search history                                                          |
 | `Snippets`        | Snippets ([UltiSnips][us])                                              |
 | `Commits`         | Git commits (requires [fugitive.vim][f])                                |
 | `BCommits`        | Git commits for the current buffer                                      |
 | `Commands`        | Commands                                                                |
 | `Maps`            | Normal mode mappings                                                    |
 | `Helptags`        | Help tags <sup id="a1">[1](#helptags)</sup>                             |
 | `Filetypes`       | File types
"AAA-------------------------------------------------------------------------------------------------------------------
"
" *[b*     |:bprevious|
" *]b*     |:bnext|
" *[B*     |:bfirst|
" *]B*     |:blast|
" *[l*     |:lprevious|
" *]l*     |:lnext|
" *[L*     |:lfirst|
" *]L*     |:llast|
" *[<C-L>* |:lpfile|
" *]<C-L>* |:lnfile|
" *[q*     |:cprevious|
" *]q*     |:cnext|
" *[Q*     |:cfirst|
" *]Q*     |:clast|
"
"
"AAA-------------------------------------------------------------------------------------------------------------------
= is the formatting command, which has a default behavior of using Vim's internal formatting/indentation features.
i{ is a text object selection which selects a code block: vi{
combine the two, and you can format a code block by typing =i{
:h text-objects
"   [vif]   -Visually select the code Inside a Function.
"   [daf]   -Delete A Function, and
"  '-viq-'" -QUTES-"
"  '-cq-'"  -QUTES-"
"  '-dq-'"  -QUTES-"
"  '-yq-'"  -QUTES-"
"   `vgb`   -Select last pasted text.
"   `=gb`   -Re-indent last pasted text.
"   `dgb`   -Delete last pasted text.
"   `gcgb`  -Comment last pasted text
"AAA-------------------------------------------------------------------------------------------------------------------
"
"  = 1. Whole lines                                          i_CTRL-X_CTRL-L
"  = 2. keywords in the current file                         i_CTRL-X_CTRL-N
"  = 3. keywords in 'dictionary'                             i_CTRL-X_CTRL-K
"  = 4. keywords in 'thesaurus', thesaurus-style             i_CTRL-X_CTRL-T
"  = 5. keywords in the current and included files           i_CTRL-X_CTRL-I
"  = 6. tags                                                 i_CTRL-X_CTRL-]
"  = 7. file names                                           i_CTRL-X_CTRL-F
"  = 8. definitions or macros                                i_CTRL-X_CTRL-D
"  = 9. Vim command-line                                     i_CTRL-X_CTRL-V
"  = 10. User defined completion                             i_CTRL-X_CTRL-U
"  = 11. omni completion                                     i_CTRL-X_CTRL-O
"  = 12. Spelling suggestions                                i_CTRL-X_s
"  = 13. keywords in 'complete'                              i_CTRL-N
"
"AAA-------------------------------------------------------------------------------------------------------------------
"
" :Ack [options] {pattern} [{directories}]
" The quickfix results window is augmented with these convenience mappings:
"     ?    a quick summary of these keys, repeat to close
"     o    to open (same as Enter)
"     O    to open and close the quickfix window
"     go   to preview file, open but maintain focus on ack.vim results
"     t    to open in new tab
"     T    to open in new tab without moving to it
"     h    to open in horizontal split
"     H    to open in horizontal split, keeping focus on the results
"     v    to open in vertical split
"     gv   to open in vertical split, keeping focus on the results
"     q    to close the quickfix window
"
"AAA-------------------------------------------------------------------------------------------------------------------
"
"   #### :Far {pattern} {replace-with} {file-mask} [params]
"   Find the text to replace.
"   #### :Farp [params]
"   Same as `Far`, but allows to enter {pattern}, {replace-with} and {file-mask}
"   one after the other.
"   #### :Fardo [params]
"   Runs the replacement task.
"   #### :Refar [params]
"   Change `Far`/`Farp` params.
"   #### :Farundo [params]
"   Undo last (or all) replacement(s).
"   #### :F {pattern} {file-mask} [params]
"   Find only.
"   #### Need help?
"   :help far.vim
"
"AAA--------------------------------------------------------------------------------------------------------------
" | Command           | List                                                                    |
" ----------------------------------------------------------------------------------------------------------------
" | `Files [PATH]`    | Files (similar to `:FZF`)                                               |
" | `GFiles [OPTS]`   | Git files (`git ls-files`)                                              |
" | `GFiles?`         | Git files (`git status`)                                                |
" | `Buffers`         | Open buffers                                                            |
" | `Colors`          | Color schemes                                                           |
" | `Ag [PATTERN]`    | [ag][ag] search result (`ALT-A` to select all, `ALT-D` to deselect all) |
" | `Rg [PATTERN]`    | [rg][rg] search result (`ALT-A` to select all, `ALT-D` to deselect all) |
" | `Lines [QUERY]`   | Lines in loaded buffers                                                 |
" | `BLines [QUERY]`  | Lines in the current buffer                                             |
" | `Tags [QUERY]`    | Tags in the project (`ctags -R`)                                        |
" | `BTags [QUERY]`   | Tags in the current buffer                                              |
" | `Marks`           | Marks                                                                   |
" | `Windows`         | Windows                                                                 |
" | `Locate PATTERN`  | `locate` command output                                                 |
" | `History`         | `v:oldfiles` and open buffers                                           |
" | `History:`        | Command history                                                         |
" | `History/`        | Search history                                                          |
" | `Snippets`        | Snippets ([UltiSnips][us])                                              |
" | `Commits`         | Git commits (requires [fugitive.vim][f])                                |
" | `BCommits`        | Git commits for the current buffer                                      |
" | `Commands`        | Commands                                                                |
" | `Maps`            | Normal mode mappings                                                    |
" | `Helptags`        | Help tags <sup id="a1">[1](#helptags)</sup>                             |
" | `Filetypes`       | File types
"------------------------------------------------------------------------------------------------------------------
"nnoremap <C-h> :<C-u>help<Space>
"nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>
nnoremap <Space>w <C-w>
noremap ; :
noremap : ;
noremap j gj
noremap k gk

noremap gj j
noremap gk k
nnoremap <C-t> <Nop>
nnoremap <C-t>n :<C-u>tabnew<CR>
nnoremap <C-t>c :<C-u>tabclose<CR>
nnoremap <C-t>o :<C-u>tabonly<CR>
nnoremap <C-t>j :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 -1) % tabpagenr('$')<CR>
nnoremap <C-t>k gT
"nnoremap t <Nop>
        "------------------------------------
        " surround.vim
        "------------------------------------
        nmap ,( csw(
        nmap ,) csw)
        nmap ,{ csw{
        nmap ,} csw}
        nmap ,[ csw[
        nmap ,] csw]
        nmap ,' csw'
        nmap ," csw"
"----------------------------------------
" vim-git
"----------------------------------------
"{{{
"vim上からgitを使う 便利
nmap <Space>gd :GitDiff<CR>
nmap <Space>gB :GitBlame<CR>
nmap <Space>gb :Gitblanch<CR>
nmap <Space>gp :GitPush<CR>
nmap <Space>gD :GitDiff --cached<CR>
nmap <Space>gs :GitStatus<CR>
nmap <Space>gl :GitLog<CR>
nmap <Space>ga :GitAdd
nmap <Space>gA :GitAdd -A<CR>
nmap <Space>gm :GitCommit<CR>
nmap <Space>gM :GitCommit --amend<CR>
"}}}
