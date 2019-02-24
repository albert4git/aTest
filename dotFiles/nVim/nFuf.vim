You can launch FuzzyFinder by the following commands:

         Command           Mode ~
        |:FufBuffer|       - Buffer mode (|fuf-buffer-mode|)
        |:FufFile|         - File mode (|fuf-file-mode|)
        |:FufCoverageFile| - Coverage-File mode (|fuf-coveragefile-mode|)
        |:FufDir|          - Directory mode (|fuf-dir-mode|)
        |:FufMruFile|      - MRU-File mode (|fuf-mrufile-mode|)
        |:FufMruCmd|       - MRU-Command mode (|fuf-mrucmd-mode|)
        |:FufBookmarkFile| - Bookmark-File mode (|fuf-bookmarkfile-mode|)
        |:FufBookmarkDir|  - Bookmark-Dir mode (|fuf-bookmarkdir-mode|)
        |:FufTag|          - Tag mode (|fuf-tag-mode|)
        |:FufBufferTag|    - Buffer-Tag mode (|fuf-buffertag-mode|)
        |:FufTaggedFile|   - Tagged-File mode (|fuf-taggedfile-mode|)
        |:FufJumpList|     - Jump-List mode (|fuf-jumplist-mode|)
        |:FufChangeList|   - Change-List mode (|fuf-changelist-mode|)
        |:FufQuickfix|     - Quickfix mode (|fuf-quickfix-mode|)
        |:FufLine|         - Line mode (|fuf-line-mode|)
        |:FufHelp|         - Help mode (|fuf-help-mode|)

It is recommended to map these commands.

These commands open 1-line buffer to enter search pattern and start insert
mode.

FuzzyFinder searchs for matching items with an entered pattern and shows them
in a completion menu. For more details on pattern matching, see
|fuf-search-patterns|.

If there are a lot of matching items, FuzzyFinder limits the number of
enumerating items (|g:fuf_enumeratingLimit|) to speed up a response time, and
highlights the pattern with "Error" group.

The first item in the completion menu will be selected automatically.

Typing <C-w> deletes one block of an entered pattern before the cursor, like a
directory name.

with <C-s> (|g:fuf_keyPrevPattern|) and <C-^> (|g:fuf_keyNextPattern|), You
can recall patterns which have been entered before from history.

You can open a selected item in various ways:

        <CR>  (|g:fuf_keyOpen|)        - opens in a previous window.
        <C-j> (|g:fuf_keyOpenSplit|)   - opens in a split window.
        <C-k> (|g:fuf_keyOpenVsplit|)  - opens in a vertical-split window.
        <C-l> (|g:fuf_keyOpenTabpage|) - opens in a new tab page.

To cancel and return to previous window, just leave Insert mode.

With <C-\><C-\> (|g:fuf_keySwitchMatching|), You can switch search method
between fuzzy matching and partial matching.

With <C-t> (|g:fuf_keyNextMode|) and <C-y> (|g:fuf_keyPrevMode|), You can
switch current mode without leaving Insert mode .

You can preview selected item with <C-@> (|g:fuf_keyPreview|) in some modes.
Repeating the key on the same item shows another information. The height
of command-line area is changed to |g:fuf_previewHeight| when you launch a
mode supporting preview. This feature is available when |g:fuf_previewHeight|
is not 0.


==============================================================================
MODES                                                              *fuf-modes*

                                                             *fuf-buffer-mode*
Buffer mode ~

This mode provides an interface to select a buffer from a list of existing
buffers and open it.

Press <C-]> (|g:fuf_buffer_keyDelete|) in this mode and selected buffer will
be deleted.

                                                               *fuf-file-mode*
File mode ~

This mode provides an interface to search a file tree for a file and open it.

                                                       *fuf-coveragefile-mode*
Coverage-File mode ~
