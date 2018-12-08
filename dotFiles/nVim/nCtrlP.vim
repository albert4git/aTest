
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

        "----------------------------------------------------------------------------------

    " [ search: MRU, Text, Regex, ] {{{
        " CtrlP {{{ <C-P> :CtrlP to full path fuzzy(regex grep) file buffer and MRU.
            let g:loaded_ctrlp = 0 " =1 to disable plug completely.
            let g:ctrl_map = '<c-p>' " for normal mode press Ctrl-P.
            let g:ctrlp_cmd = 'CtrlP' " default command to use when pressing mapping.
            let g:ctrlp_by_filename = 0 " 1: search by filename (not full path)
            let g:ctrlp_regexp = 1 " 1: to set full regexp search as default.
            let g:ctrlp_match_window_bottom = 1 " window position
            let g:ctrlp_match_window_reversed = 1 " show matching in reverse order
            let g:ctrlp_max_height = 10
            let g:ctrlp_switch_buffer = 2 " when file opened, jump to (tag, buffer)
            let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
            let g:ctrlp_working_path_mode = 'rc'
            let g:ctrlp_root_markers = ['.git', '.hg', '.svn', '.bzr',]
            let g:ctrlp_use_caching = 1 " 0: disable per-session caching.
            let g:ctrlp_clear_cache_on_exit = 1
            let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
            let g:ctrlp_prompt_mappings = {
                        \ 'PrtBS()':              ['<bs>', '<c-]>'],
                        \ 'PrtDelete()':          ['<del>'],
                        \ 'PrtDeleteWord()':      ['<c-w>'],
                        \ 'PrtClear()':           ['<c-u>'],
                        \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
                        \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
                        \ 'PrtHistory(-1)':       ['<c-n>'],
                        \ 'PrtHistory(1)':        ['<c-p>'],
                        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
                        \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
                        \ 'AcceptSelection("t")': ['<c-t>', '<MiddleMouse>'],
                        \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
                        \ 'ToggleFocus()':        ['<s-tab>'],
                        \ 'ToggleRegex()':        ['<c-r>'],
                        \ 'ToggleByFname()':      ['<c-d>'],
                        \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
                        \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
                        \ 'PrtExpandDir()':       ['<tab>'],
                        \ 'PrtInsert("w")':       ['<F2>', '<insert>'],
                        \ 'PrtInsert("s")':       ['<F3>'],
                        \ 'PrtInsert("v")':       ['<F4>'],
                        \ 'PrtInsert("+")':       ['<F6>'],
                        \ 'PrtCurStart()':        ['<c-a>'],
                        \ 'PrtCurEnd()':          ['<c-e>'],
                        \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
                        \ 'PrtCurRight()':        ['<c-l>', '<right>'],
                        \ 'PrtClearCache()':      ['<F5>'],
                        \ 'PrtDeleteMRU()':       ['<F7>'],
                        \ 'CreateNewFile()':      ['<c-y>'],
                        \ 'MarkToOpen()':         ['<c-z>'],
                        \ 'OpenMulti()':          ['<c-o>'],
                        \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
                        \ }
                " in some terminal, <c-h> is <bs>, so use:
                    " \ 'PrtCurLeft()': ['<left>', '<c-^>']
            let g:ctrlp_mruf_max = 250
            let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux
            " let g:ctrlp_mruf_exclude = '^C:\\dev\\tmp\\.*' " Windows
            " let g:ctrlp_mruf_include = '\.py$\|\.rb$'
            let g:ctrlp_mruf_relative = 0 " 1: show only MRU files in current working dir
            let g:ctrlp_mruf_case_sensitive = 1 " avoid duplicate MRU entries.
            let g:ctrlp_dotfiles = 1 " =0 to don't scan for dotfiles and dotdirs.
            let g:ctrlp_custom_ignore = {
                        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                        \ 'file': '\.exe$\|\.so$\|\.dll$',
                        \ }
                        " \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            let g:ctrlp_max_files = 10000 " maximum number of files to scan, 0: no limit.
            let g:ctrlp_max_depth = 40 " maximum depth of a dir tree to recurse into.
                " specify external tool for listing files instead of Vim's globpath()
            "let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux
            "let g:ctrlp_user_command = 'find %s -type f | grep (?!tmp/.*)'
                " use grep to filter the result.
            " let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d' " Windows
            let g:ctrlp_max_history = &history " max of input strings CtrlP remember
                " 0: to disable prompt's history, <c-n>, <c-p> to browse.
            let g:ctrlp_open_new_file = 'v' " specify how newly file be opened when <c-y>
                " t: tab, h: horizontal split, v: vertical split, r: current window.
            let g:ctrlp_open_multiple_files = 'v' " open multiple files with <c-z>, <c-o>
            let g:ctrlp_arg_map = 0
                " 1: <c-o> <c-y> accept extra key as argument to override default
                " t, h, v, r, <esc>|<c-c> to go back to prompt.
            let g:ctrlp_follow_symlinks = 0 " 1: follow all symlinks indiscriminately.
            let g:ctrlp_lazy_update = 0 " only update match window after typing stopped
            let g:ctrlp_use_migemo = 0 " 1: use Migemo Pattern for Japanese filenames.
            let g:ctrlp_buftag_systemenc = &encoding
            " let g:ctrlp_buftag_ctags_bin = ''
            let g:ctrlp_default_input = 0 " seed the prompt with cur file's relat-path
            let g:ctrlp_match_func = {} " an external fuzzy matching function.
            let g:ctrlp_buffer_func = {} " after entering and before exiting buffer
            let g:ctrlp_mruf_default_order = 0 " show only MRU files in pwd
            let g:ctrlp_tabpage_position = 'ac'

            " statusline {{{
            " customize the statusline for CtrlP window.
            let g:ctrlp_status_func = {
                        \ 'main': 'Function_Name_1',
                        \ 'prog': 'Function_Name_2',
                        \ }

            " Arguments: focus, byfname, s:regexp, prv, item, nxt, marked
            " a:1 a:2 a:3 a:4 a:5 a:6 a:7
            "fu! CtrlP_Statusline_1(...)
                "let focus = '%#LineNr# '.a:1.' %*'
                "let byfname = '%#Character# '.a:2.' %*'
                "let regex = a:3 ? '%#LineNr# regex %*' : ''
                "let prv = ' <'.a:4.'>='
                "let item = '{%#Character# '.a:5.' %*}'
                "let nxt = '=<'.a:6.'>'
                "let marked = ' '.a:7.' '
                "let dir = ' %=%<%#LineNr# '.getcwd().' %*'
                "" Return the full statusline
                "retu focus.byfname.regex.prv.item.nxt.marked.dir
            "endf

            " Argument: len
            " a:1
            "fu! CtrlP_Statusline_2(...)
                "let len = '%#Function# '.a:1.' %*'
                "let dir = ' %=%<%#LineNr# '.getcwd().' %*'
                "" Return the full statusline
                "retu len.dir
            "endf
            " }}}

            " extensions {{{
            let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir',
                        \ 'rtscript']
                " the order of them in statusline when using <C-f>, <C-b>
            " }}}

            " file open funcs {{{
            let g:ctrlp_open_func = {
                        \ 'files'     : 'CtrlPHTMLOpenFunc',
                        \ 'buffers'   : 'Function_Name_2',
                        \ 'mru files' : 'Function_Name_3',
                        \ }

            fun! CtrlPHTMLOpenFunc(action, line)
                if a:action == 't' && fnamemodify(a:line, ':e') =~? '^html\?$'
                    let filename = fnameescape(fnamemodify(a:line, ':p'))
                    call ctrlp#exit()
                    silent! execute '!xdg-open' filename
                elseif a:action == 'x' && fnamemodify(a:line, ':e') !~? '^html\?$'
                    call feedkeys("\<c-o>")
                else
                    call call('ctrlp#acceptfile', [a:action, a:line])
                endif
            endf
            " }}}

            " [ mappings ] {{{
            " <c-p>     -- open CtrlP prompt. >>>
            " <c-r>     -- regexp mode. r>>
            " <c-d>     -- full-path or filename only search. >d>
            " <c-f>,<c-up>  -- scroll to next search mode.
            " <c-b>,<c-down> -- scroll to previous search mode.
            " <tab>     -- auto-complete dir names under current working dir.
            " <s-tab>   -- focus between the match window and the prompt.
            " <c-j>,<down>  -- move selection down.
            " <c-k>,<up>    -- move selection up.
            " <c-a>     -- move cursor to the start of the prompt.
            " <c-e>     -- move cursor to the end.
            " <c-h>,<left>,<c-^> -- move the cursor one char to the left.
            " <c-l>,<right>,     -- move the cursor one char to the right.
            " <c-]><bs> -- delete the preceding char.
            " <del>     -- delete the current char.
            " <c-w>     -- delete a preceding innder word.
            " <cr>      -- open selected file in active window.
            " <c-t>     -- open selected file in new tab after the last tabpage.
            " <c-v>     -- open selected file in vertical split.
            " <c-s>,<c-cr>,<c-x> -- open selected file in a horizontal split.
            " <c-y>     -- create a new file and its parent directories.
            " <c-n>     -- next string in the prompt's history.
            " <c-p>     -- previous string in the prompt's history.
            " <c-z>     -- mark/unmark a file to be opened with <c-o>. <c-y>
            " <c-o>     -- open files marked by <c-z>
            " <F5>      -- refresh window. and purge cache.
            " <F7>      -- wipe MRU list. delete MRU entries marked by <c-z>.
            " <insert>  -- ...
            " <esc>,<c-c>,<c-g> -- cancel. exit CtrlP.
            " }}}
        " }}}

        " Command-T {{{
            " <Leader>t provide fast, intuitive mechanism for opening files and buffers
            "nnoremap <silent> <Leader>t :CommandT<CR>
            "nnoremap <silent> <Leader>b :CommandTBuffer<CR>
            " <BS> <Del> -- delete
            " <Left> <C-h> -- move left.
            " <Right> <C-l> -- move right
            " <C-a> -- move to the start.
            " <C-e> -- move to the end.
            " <C-u> -- clear the contents of the prompt.
            " <Tab> -- switch focus between the file listing and prompt.
            " ---------------------------------------------------------
            "  <C-CR> <C-s> -- split open
            "  <C-v> -- vsplit
            "  <C-t> -- tab
            "  <C-j> <C-n> <Down> -- select next file in file listing.
            "  <C-k> <C-p> <Up> -- select previous file in file listing.
            "  <Esc> <C-c> -- cancel (dismisses file listing)
            let g:CommandTMaxFiles = 10000 " maximum number of files scan.
            let g:CommandTMaxDepth = 15
            let g:CommandTMaxCacheDirectories = 1 " 0: no limit.
            let g:CommandTMaxHeight = 15 " 0: as much as available space.
            let g:CommandTMinHeight = 0 " 0: single line.
            let g:CommandTAlwaysShowDotFiles = 0 " only if entered string contains a dot
            let g:CommandTNeverShowDotFiles = 0
            let g:CommandTScanDotDirectories = 0
            let g:CommandTMatchWindowAtTop = 0 " match window appear at bottom.
            let g:CommandTMatchWindowReverse = 1 " let the best match at bottom.
            let g:CommandTTageIncludeFilenames = 1 " include filenames when matches
            "let g:CommandTCancelMap='<C-x>'
            "let g:CommandTCancelMap=['<C-x>', '<C-c>'] " multiple alternative mapping.
        " }}}

        " Bundle 'FuzzyFinder'
            " buffer/file/command/tag/etc explorer with fuzzy matching.

        " asyncfinder {{{ asynchronous fuzzy file finder with Python threading module
            " Usage:
            " :AsyncFinder [-mode={mode}] [{pattern}]
            let g:asyncfinder_ignore_dirs = "['*.AppleDouble*','*.git*','*.hg*','*.bzr*',]"
            let g:asyncfinder_ignore_files = "['*.swp', '*~',]"
            let g:asyncfinder_initial_mode = "a" " a: all, b: buffer, f: files, m: mru.
            let g:asyncfinder_initial_pattern = "*"
            let g:asyncfinder_include_buffers = 1
            let g:asyncfinder_include_mru_files = 1
            let g:asyncfinder_edit_file_on_single_result = 1
        " }}}

        " EasyGrep {{{ make search and replace in files easy.
            " \vv: grep current word, \va: add to list,
            " \vr: replace, \vo: config options.
            " :GrepOptions, :Grep, :GrepAdd [-rRiIm],
            " :Replace [target] [replacement], :Replace /[target]/[re]/
            " :ReplaceUndo, :ResultListOpen
            let g:EasyGrepMode = 2 " 0 all file 1 opened buffer 2 track current extension
            let g:EasyGrepCommand = 0 " 0: vimgrep, 1: grep (follows grepprg).
            let g:EasyGrepRecursive = 1
            let g:EasyGrepIgnoreCase = 1
            let g:EasyGrepHidden = 0 " search hidden files
            let g:EasyGrepAllOptionsInExplorer = 1
            let g:EasyGrepWindow = 1 " 0: quickfix, 1: location list.
            let g:EasyGrepWindowPosition = "botright" " such as topleft, botright.
            let g:EasyGrepOpenWindowOnMatch = 1 " open window when has matches.
            let g:EasyGrepEveryMatch = 1 " multiple matches on same line as different
            let g:EasyGrepJumpToMatch = 1 " jump to first match.
            let g:EasyGrepSearchCurrentBufferDir = 1 " search current buffer's dir.
            " let g:EasyGrepInvertWholeWord =
                " 0: all files, 1: buffers, 2: associated extensions
            " let g:EasyGrepFileAssociations = '' " location of ext info file.
            let g:EasyGrepFileAssociationsInExplorer = 1 " show file associations list.
            let g:EasyGrepOptionPrefix='<leader>vy'
            let g:EasyGrepReplaceWindowMode = 0 " 0: new tab, 1: split, 2: autowriteall
            let g:EasyGrepReplaceAllPerFile = 1 " whether use 'a' (for all).
            let g:EasyGrepExtraWarnings = 1
        " }}}

        " Ack {{{ a front for the Perl module App::Ack to replace grep.
            " Usage:
            " - :Ack [options] {pattern} [{directory}]
            " QucikFix window keyboard shortcuts:
            " o, go, t, T, v, gv, q
            if !system("grep 'Ubuntu' /etc/issue") " Ubuntu ack-grep
                let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            endif
        " }}}

        " vim-unite-ack : ack source for unite.vim

        " buffers_search_and_replace {{{ powerful buffer(s) search & replace tool.
            " Usage:
            "   - [range]Bs[flag] <search regex>
            "   - flags:
            "       - c -- current buffer
            "       - e -- exclude
            "       - f --
        " }}}

        " SearchParty {{{
        " }}}

        " Area_search
            " Usage:
            " - :AreaSearch hello math world
            " - ,,n -- jump to next area matching the query.
    " }}}
