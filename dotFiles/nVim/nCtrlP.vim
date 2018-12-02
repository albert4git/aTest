
        MAPPINGS                                                       *ctrlp-mappings*

        *'ctrlp-<c-p>'*
        <c-p>
        Default |Normal| mode mapping to open the CtrlP prompt in find file mode.

        ----------------------------------------
        Once inside the prompt:~

        <c-d>
        Toggle between full-path search and filename only search.
        Note: in filename mode, the prompt's base is '>d>' instead of '>>>'
        <c-r>                                                    *'ctrlp-fullregexp'*
        Toggle between the string mode and full regexp mode.
        Note: in full regexp mode, the prompt's base is 'r>>' instead of '>>>'
        See also: |input-formats| (guide) and |g:ctrlp_regexp_search| (option).
        <c-f>, 'forward'
        <c-up>
        Scroll to the 'next' search mode in the sequence.
        <c-b>, 'backward'
        <c-down>
        Scroll to the 'previous' search mode in the sequence.
        <tab>                                                *'ctrlp-autocompletion'*
        Auto-complete directory names under the current working directory inside
        the prompt.
        <s-tab>
        Toggle the focus between the match window and the prompt.
        <esc>,
        <c-c>,
        <c-g>
        Exit CtrlP.

        Moving:~
        <c-j>,
        <down>
        Move selection down.
        <c-k>,
        <up>
        Move selection up.
        <c-a>
        Move the cursor to the 'start' of the prompt.
        <c-e>
        Move the cursor to the 'end' of the prompt.
        <c-h>,
        <left>,
        <c-^>
        Move the cursor one character to the 'left'.
        <c-l>,
        <right>
        Move the cursor one character to the 'right'.

        Editing:~
        <c-]>,
        <bs>
        Delete the preceding character.
        <del>
        Delete the current character.
        <c-w>
        Delete a preceding inner word.
        <c-u>
        Clear the input field.

        Browsing input history:~
        <c-n>
        Next string in the prompt's history.
        <c-p>
        Previous string in the prompt's history.

        Opening/Creating a file:~
        <cr>
        Open the selected file in the 'current' window if possible.
        <c-t>
        Open the selected file in a new 'tab'.
        <c-v>
        Open the selected file in a 'vertical' split.
        <c-x>,
        <c-cr>,
        <c-s>
        Open the selected file in a 'horizontal' split.
        <c-y>
        Create a new file and its parent directories.

        Opening multiple files:~
        <c-z>
        - Mark/unmark a file to be opened with <c-o>.
        - Mark/unmark a file to create a new file in its directory using <c-y>.

        <c-o>
        - Open files marked by <c-z>.
        - When no file has been marked by <c-z>, open a console dialog with the
        following options:

        Open the selected file:
        t - in a tab page.
        v - in a vertical split.
        h - in a horizontal split.
        r - in the current window.
        i - as a hidden buffer.
        x - (optional) with the function defined in |g:ctrlp_open_func|.

        Other options (not shown):
        a - mark all files in the match window.
        d - change CtrlP's local working directory to the selected file's
        directory and switch to find file mode.

        Function keys:~

        <F5>
        - Refresh the match window and purge the cache for the current directory.
        - Remove deleted files from the MRU list.

        <F7>
        MRU mode:
        - Wipe the list.
        - Delete entries marked by <c-z>.
        Buffer mode:
        - Delete entry under the cursor or delete multiple entries marked by <c-z>.

        Pasting:~
        <Insert>,                                                   *'ctrlp-pasting'*
        <MiddleMouse>
        Paste the clipboard content into the prompt.

        <c-\>
        Open a console dialog to paste <cword>, <cfile>, the content of the search
        register, the last visual selection, the clipboard or any register into the
        prompt.

        Choose your own mappings with |g:ctrlp_prompt_mappings|.
        "------------------------------------------------------------------------------------------
        let g:ctrlp_prompt_mappings = {
              \ 'PrtBS()':              ['<bs>', '<c-]>'],
              \ 'PrtDelete()':          ['<del>'],
              \ 'PrtDeleteWord()':      ['<c-w>'],
              \ 'PrtClear()':           ['<c-u>'],
              \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
              \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
              \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
              \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
              \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
              \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
              \ 'PrtHistory(-1)':       ['<c-n>'],
              \ 'PrtHistory(1)':        ['<c-p>'],
              \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
              \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
              \ 'AcceptSelection("t")': ['<c-t>'],
              \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
              \ 'ToggleFocus()':        ['<s-tab>'],
              \ 'ToggleRegex()':        ['<c-r>'],
              \ 'ToggleByFname()':      ['<c-d>'],
              \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
              \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
              \ 'PrtExpandDir()':       ['<tab>'],
              \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
              \ 'PrtInsert()':          ['<c-\>'],
              \ 'PrtCurStart()':        ['<c-a>'],
              \ 'PrtCurEnd()':          ['<c-e>'],
              \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
              \ 'PrtCurRight()':        ['<c-l>', '<right>'],
              \ 'PrtClearCache()':      ['<F5>'],
              \ 'PrtDeleteEnt()':       ['<F7>'],
              \ 'CreateNewFile()':      ['<c-y>'],
              \ 'MarkToOpen()':         ['<c-z>'],
              \ 'OpenMulti()':          ['<c-o>'],
              \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
              \ }

        Available extensions:~

        *:CtrlPTag*
        * Tag mode:~
        - Name: 'tag'
        - Command: ":CtrlPTag"
        - Search for a tag within a generated central tags file, and jump to the
        definition. Use the Vim's option |'tags'| to specify the names and the
        locations of the tags file(s).
        E.g. set tags+=doc/tags

        *:CtrlPBufTag*
        *:CtrlPBufTagAll*
        * Buffer Tag mode:~
        - Name: 'buffertag'
        - Commands: ":CtrlPBufTag [buffer]",
        ":CtrlPBufTagAll".
        - Search for a tag within the current buffer or all listed buffers and jump
        to the definition. Requires |exuberant_ctags| or compatible programs.

        *:CtrlPQuickfix*
        * Quickfix mode:~
        - Name: 'quickfix'
        - Command: ":CtrlPQuickfix"
        - Search for an entry in the current quickfix errors and jump to it.

        *:CtrlPDir*
        * Directory mode:~
        - Name: 'dir'
        - Command: ":CtrlPDir [starting-directory]"
        - Search for a directory and change the working directory to it.
        - Mappings:
        + <cr> change the local working directory for CtrlP and keep it open.
        + <c-t> change the global working directory (exit).
        + <c-v> change the local working directory for the current window (exit).
        + <c-x> change the global working directory to CtrlP's current local
        working directory (exit).

        *:CtrlPRTS*
        * Runtime script mode:~
        - Name: 'rtscript'
        - Command: ":CtrlPRTS"
        - Search for files (vimscripts, docs, snippets...) in runtimepath.

        *:CtrlPUndo*
        * Undo mode:~
        - Name: 'undo'
        - Command: ":CtrlPUndo"
        - Browse undo history.

        *:CtrlPLine*
        * Line mode:~
        - Name: 'line'
        - Command: ":CtrlPLine [buffer]"
        - Search for a line in all listed buffers or in the specified [buffer].

        *:CtrlPChange*
        *:CtrlPChangeAll*
        * Change list mode:~
        - Name: 'changes'
        - Commands: ":CtrlPChange [buffer]",
        ":CtrlPChangeAll".
        - Search for and jump to a recent change in the current buffer or in all
        listed buffers.

        *:CtrlPMixed*
        * Mixed mode:~
        - Name: 'mixed'
        - Command: ":CtrlPMixed"
        - Search in files, buffers and MRU files at the same time.

        *:CtrlPBookmarkDir*
        *:CtrlPBookmarkDirAdd*
        * BookmarkDir mode:~
        - Name: 'bookmarkdir'
        - Commands: ":CtrlPBookmarkDir",
        ":CtrlPBookmarkDirAdd  [directory] [TITLE]".
        ":CtrlPBookmarkDirAdd! [directory] [TITLE]".

        - Search for a bookmarked directory and change the working directory to it.
        - Add either the dir [directory], if supplied, or otherwise ask for it,
        under the title given by either [TITLE], if supplied, or otherwise ask for
        it, to the CtrlPBookmarkDir list.
        - Add either the dir [directory], if supplied, or otherwise the current
        work dir ( [CWD] ) under the title given by either [TITLE], if supplied,
        or otherwise [CWD] to the CtrlPBookmarkDir list.

        The last command can be used to add all recently used work dirs to the
        CtrlPBookmarkDir list by an autocommand like

        >
        augroup CtrlPDirMRU
          autocmd!
          autocmd FileType * if &modifiable | execute 'silent CtrlPBookmarkDirAdd! %:p:h' | endif
        augroup END
        <

        - Mappings:
        + <cr> change the local working directory for CtrlP, keep it open and
        switch to find file mode.
        + <c-x> change the global working directory (exit).
        + <c-v> change the local working directory for the current window (exit).
        + <F7>
        - Wipe bookmark list.
        - Delete entries marked by <c-z>.

        *ctrlp-autoignore-extension*
        * Autoignore mode:~
        - Name: 'autoignore'

        - doesn't add new commands. It adds support for per-project
        ignore patterns (as per |ctrlp_custom_ignore|) via a `.ctrlpignore` file
        at the root of the project. It's basically like a `.gitignore` or
        `.hgignore` for CtrlP.

        Note: auto-ignore won't work when |g:ctrlp_user_command| is used.

        Note: `.ctrlpignore` will be added to the root markers (see
        |g:ctrlp_root_markers|).

        - Ignore file syntax:
        Empty lines, and lines starting with `#` (comments) are ignored.

        Other lines are treated like regular expression patterns. See *string-match*
        for how patterns are used. Anything that matches any of the patterns will be
          ignored from CtrlP's search results.

          Example:

                \.tmp$
        ^generated/
        local\.cfg

        Note: patterns should use forward slashes, even on Windows.

        You can also switch to a glob-like syntax like this:

        syntax:wildignore
        *.tar.gz
        *.tmp

        This will temporarily add each pattern to |'wildignore'| for the
        duration of the file scan, and remove them at the end.

        You can switch back to the default regular-expression-based patterns by
        writing:

        syntax:regexp

        You can also specify a match on only a given type of item:

        dir:build
        file:foo\.txt

        This will only ignore directories with "build" in them, and files with
        "foo.txt" in them. Not files with "build" in them or vice-versa.

        Note: to ignore a root directory "build", and not _any_ directory with
        "build" in it, you can root the regex: ^build$

        - FAQ:
        Q: Why can't CtrlP support `.gitignore` or `.hgignore` natively?

        A: Those files look at first like they may contain all the patterns
        you'd want to exclude from CtrlP already. However, more often than not,
        there are some differences. Those files list patterns that should not be
        included in source-control. This includes things you want to ignore, but
        also things you may not want to: local settings, external packages and
        dependencies, etc. The author felt the trouble of supporting various
        syntaxes was too much compared to just copy/pasting a few lines. Feel
        free to contribute a patch if you disagree :)

        Q: I enabled |ctrlp-autoignore-extension|, or edited `.ctrlpignore`, but
        none of the new patterns are working. What did I do wrong?

        A: Probably nothing! CtrlP can cache search results for faster response
        times. You can hit <F5> to force it to refresh. This will use the newer
        ignore patterns if the `.ctrlpignore` file has changed, too.
