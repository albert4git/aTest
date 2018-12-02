
The plugin adds a `:Qdo` command, which executes a command once for each file in the quickfix list.

Usage example:

    :GitGrep foo.*bar
    :Qdo %s/foo.*bar/baz/g | update

This will replace text and save the buffers for each file found by GitGrep in the previous search.

## Qargs command

The plugin also adds a `:Qargs` command, which populates the argument list from the files in the quickfix list.
Each file is only added once, even if there are multiple lines for the same file in the quickfix list.

Usage example:

    :args *.txt
    :vimgrep /foo/g ##
    :Qargs
    :argdo %s/foo/bar/ge
    :argdo update

"------------------------------------------------------------------------------------------

:h vim-qf
    |:Keep| ....................................... :K
    |:Reject| ..................................... :Rej
    |:Restore| .................................... :Res
    |:Doline| ..................................... :Dol
    |:Dofile| ..................................... :Dof
    |:SaveList| ................................... :SaveList
    |:SaveListAdd| ................................ :SaveListA
    |:LoadList| ................................... :LoadList
    |:LoadListAdd| ................................ :LoadListA
    |:ListLists| .................................. :ListL
    |:RemoveList| ................................. :Rem
