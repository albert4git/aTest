""-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-NeoVim-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-

 *[b*     |:bprevious|
 *]b*     |:bnext|
 *[B*     |:bfirst|
 *]B*     |:blast|
 *[l*     |:lprevious|
 *]l*     |:lnext|
 *[L*     |:lfirst|
 *]L*     |:llast|
 *[<C-L>* |:lpfile|
 *]<C-L>* |:lnfile|
 *[q*     |:cprevious|
 *]q*     |:cnext|
 *[Q*     |:cfirst|
 *]Q*     |:clast|

"-------------------------------------------------------------------------------------------------------------------
   [vif]   -Visually select the code Inside a Function.
   [daf]   -Delete A Function, and
   '-viq-' -QUTES-
   '-cq-'  -QUTES-
   '-dq-'  -QUTES-
   '-yq-'  -QUTES-
   `vgb`   -Select last pasted text.
   `=gb`   -Re-indent last pasted text.
   `dgb`   -Delete last pasted text.
   `gcgb`  -Comment last pasted text
"-------------------------------------------------------------------------------------------------------------------

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

"-------------------------------------------------------------------------------------------------------------------

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

"-------------------------------------------------------------------------------------------------------------------
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
" --------------------------------------------------------------------------------------------------------------
" | Command           | List                                                                    |
" --------------------------------------------------------------------------------------------------------------
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
"-------------------------------------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------------------------------------


"-------------------------------------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------------------------------------
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
"-------------------------------------------------------------------------------------------------------------------
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
"-------------------------------------------------------------------------------------------------------------------
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
"-------------------------------------------------------------------------------------------------------------------
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
"-------------------------------------------------------------------------------------------------------------------
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
" --------------------------------------------------------------------------------------------------------------
" | Command           | List                                                                    |
" --------------------------------------------------------------------------------------------------------------
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
"--------------------------------------------------------------------------------------------------------------
