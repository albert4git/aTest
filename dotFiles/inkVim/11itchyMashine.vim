"-Session------------------------------------------------------------------------------------------
        set sessionoptions=buffers,curdir,folds,tabpages,winsize
        let s:sessiondir  = expand("~/.vim/sessions", 1)
        let s:sessionfile = expand(s:sessiondir . "/session.vim", 1)
        let s:sessionlock = expand(s:sessiondir . "/session.lock", 1)
"-surok----------------------------------------------------------------------------------------------------------------
        "Toggle line numbers
        nnoremap <LocalLeader>n :setlocal number!<cr>
        "Indent/dedent/autoindent what you just pasted.
        nnoremap <lt>> V`]<
        nnoremap ><lt> V`]>
        nnoremap =- V`]=
"-surok----------------------------------------------------------------------------------------------------------------
        "!" map <LocalLeader>s :source $MYVIMRC<CR>
        "!" map <LocalLeader>v :e $MYVIMRC<CR>
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        function! ScratchToggle()
                if exists("w:is_scratch_window")
                        unlet w:is_scratch_window
                        exec "q"
                else
                        exec "normal! :Scratch\<cr>\<C-W>L"
                        let w:is_scratch_window = 1
                endif
        endfunction
        "nnoremap <leader>s :ScratchToggle<cr>
        command! ScratchToggle call ScratchToggle()

        "-AAA7--Deoplete------------------------------------------------------------------------{{{
                let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-6.0/lib/libclang.so.1"
                let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
                let g:deoplete#sources#clang#sort_algo = 'priority' " alphabetical
                "-------------------------------------------------------------------------------
                let g:deoplete#enable_at_startup = 1
                call deoplete#custom#option('sources', {
                        \ 'tex' : ['buffer', 'dictionary', 'file', 'omni']
                        \})
                call deoplete#custom#source('omni', 'input_patterns', {
                        \ 'tex' : '\\(?:'
                        \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
                        \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                        \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
                        \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
                        \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
                        \ . '|\w*'
                        \ .')',
                        \}
                        \)
                "--------------------------------------------------------------------------------
                call deoplete#custom#option('refresh_always', v:true)
                let g:deoplete#enable_ignore_case = 1
                let g:deoplete#enable_smart_case = 1
                let g:deoplete#enable_camel_case = 1
                let g:deoplete#enable_refresh_always = 1
                let g:deoplete#max_abbr_width = 0
                let g:deoplete#max_menu_width = 0
                "--------------------------------------------------------------------------------
                let g:deoplete#sources#ternjs#timeout = 3
                let g:deoplete#sources#ternjs#types = 1
                let g:deoplete#sources#ternjs#docs = 1
                call deoplete#custom#source('_', 'min_pattern_length', 2)
                "--------------------------------------------------------------------------------
                let g:deoplete#skip_chars = ['(', ')', '<', '>']
                let g:deoplete#tag#cache_limit_size = 800000
                let g:deoplete#file#enable_buffer_path = 1
                "--------------------------------------------------------------------------------
                let g:deoplete#sources#jedi#statement_length = 30
                let g:deoplete#sources#jedi#show_docstring = 1
                let g:deoplete#sources#jedi#short_types = 1
                "--------------------------------------------------------------------------------
                call deoplete#custom#source('go',            'rank', 650)
                call deoplete#custom#source('vim',           'rank', 640)
                call deoplete#custom#source('flow',          'rank', 630)
                call deoplete#custom#source('TernJS',        'rank', 620)
                call deoplete#custom#source('jedi',          'rank', 610)
                call deoplete#custom#source('omni',          'rank', 600)
                call deoplete#custom#source('neosnippet',    'rank', 510)
                call deoplete#custom#source('member',        'rank', 500)
                call deoplete#custom#source('file_include',  'rank', 420)
                call deoplete#custom#source('file',          'rank', 410)
                call deoplete#custom#source('tag',           'rank', 400)
                call deoplete#custom#source('around',        'rank', 330)
                call deoplete#custom#source('buffer',        'rank', 320)
                call deoplete#custom#source('dictionary',    'rank', 310)
                call deoplete#custom#source('tmux-complete', 'rank', 300)
                call deoplete#custom#source('syntax', 'rank', 200)
                "--------------------------------------------------------------------------------
                call deoplete#custom#source('omni',          'mark', '⌾')
                call deoplete#custom#source('flow',          'mark', '⌁')
                call deoplete#custom#source('TernJS',        'mark', '⌁')
                call deoplete#custom#source('go',            'mark', '⌁')
                call deoplete#custom#source('jedi',          'mark', '⌁')
                call deoplete#custom#source('vim',           'mark', 'vi')
                call deoplete#custom#source('neosnippet',    'mark', '⌘')
                call deoplete#custom#source('tag',           'mark', '⌦')
                call deoplete#custom#source('around',        'mark', '↻')
                call deoplete#custom#source('buffer',        'mark', 'ℬ')
                call deoplete#custom#source('tmux-complete', 'mark', '⊶')
                call deoplete#custom#source('syntax',        'mark', '♯')
                call deoplete#custom#source('member', 'mark', '.')

        "-7-}}}

        "-AAA8--QuickRun--Compiler-CPP-Java--------------------------------------------------------{{{
                "-JAVA- https://github.com/Shougo/deoplete.nvim/issues/277
                "set makeprg =javac\ hello2W.java
                "----------------------------------------------------------------------------------
                let g:quickrun_known_file_types = {
                                        \"cpp": ["!g++ %", "./a.out"],
                                        \"c": ["!gcc %", "./a.out"],
                                        \"php": ["!php %"],
                                        \"vim": ["source %"],
                                        \"py": ["!python %"],
                                        \}
        "-8-}}}


        "-AAA10-Conflict-Markers--YankRing--ComplAllGUI--InsertLine-???-------------------------{{{
                "vim-flake8 default configuration
                        let g:flake8_show_in_gutter=1
                "-???-highlight conflict markers
                        match ErrorMsg '\v^[<\|=|>]{7}([^=].+)?$'
                "-???-shortcut to jump to next conflict marker-???-
                "Errors confclits
                        nnoremap <silent> <Leader>c /\v^[<\|=>]{7}([^=].+)?$<CR>
        "-10-}}}

"-surok----------------------------------------------------------------------------------------------------------------
        let g:SuperTabDefaultCompletionType = "<c-n>"
        let g:SuperTabContextDefaultCompletionType = "<c-n>"
"-surok----------------------------------------------------------------------------------------------------------------

        "flag = false
        let g:switch_mapping = "-"
"-surok----------------------------------------------------------------------------------------------------------------
        "-TOPModel-Qute:cq-dq-yq--il/al--Date:id/it---Indent:io----------------------------------
        " [daf] to Delete A Function, and
        " [vif] to Visually select the code Inside a Function.
        " [iF] to target just a function like [ip] For example,
        " ip selects the next path including the basename.
        " ap selects the next path not including the asename and
        " iP selects the previous path including the basename.
        " aP selects the previous path not including the basename and
        " /home/red/wimrc-3000.vim
        " gs   :Scratch in visual mode Scratch: `gS` clear Scratch: before
        " gag  :to search the selected text
        " -vio-"
        " -viO-"
        " -viq-"
        "'-cq-'"
        "'-cq-'"
        " -dq- "
        " -yq- "
        " al   to select the current line, and
        " il   to select the current line without indentation:
        "------------------------------------------------------------------------------------------
        " [ih]  for an inner hunk--???------------------------------------------
        " vgb   Select last pasted text.
        " vgb   Select last pasted text.
        " dgb   Delete last pasted text.
        " =gb   Re-indent last pasted text.
        " gcgb  ?Comment last pasted text
        " ad/id to select a date such as `2013-03-16`, and
        " at/it to select a time such as `22:04:21`:
        "-TOPModel-Qute:cq-dq-yq--il/al--Date:id/it---Indent:io----------------------------------
        "------------------------------------------------------------------------------------------
        " 14/09/18 14:13:00 
        " ad/id to select a date such as 2013-03-16, and define at/it to select a time such as 22:04:21:
        "------------------------------------------------------------------------------------------

        " * `as` - select ‘_around_’ sentence with trailing whitespace
        " * `is` - select ‘_inside_’ sentence without trailing whitespace
        " * `(` - move to start of previous sentence
        " * `)` - move to start of next sentence
        " this plugin adds:
        " ? `g)` - jump to end of current sentence
        " ? `g(` - jump to end of previous sentence

        " You can manipulate text just as with Vim’s original `as` and `is`
        " commands, such as 
        "  cis for change,
        " `vas` for visual selection,
        " `das` for deletion,
        " `yas` for yanking to clipboard, etc..

        " If you prefer to retain the native commands, you can assign other
        " key mappings via your `.vimrc`:
        " ```vim
        " let g:textobj#sentence#select = 's'
        " let g:textobj#sentence#move_p = '('
        " let g:textobj#sentence#move_n = ')'

"-surok----Nop Phython 2.6+--------------------------------------------------------------------------------------------
        " if ! exists('g:TagHighlightSettings')
        "         let g:TagHighlightSettings = {}
        " endif
        " let g:TagHighlightSettings['ForcedPythonVariant'] = 'if_pyth'
        " let g:TagHighlightSettings['CtagsExecutable'] = 'etags'
"--BBB------------------------------------------------------------------- 
if ! exists('g:TagHighlightSettings')
        let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['TagFileName'] = 'tags'
"------------------------------------------------------------------------ 
