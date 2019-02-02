
pip install rope ropevim takes care of the first one while for the second you will need to create a separate mapping according to your taste in keystrokes! Now the key to the whole puzzle: 

" Rope AutoComplete
let ropevim_vim_completion = 1
let ropevim_extended_complete = 1
let g:ropevim_autoimport_modules = ["os.*","traceback","django.*", "xml.etree"]
imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>


        let g:pymode = 1
        "---PyMode------------------------------------------------------------------------ 
        Plug 'python-mode/python-mode', { 'branch': 'develop' }
        "---PyMode------------------------------------------------------------------------ 
                "*:PymodeRun* -- Run current buffer or selection
                let g:pymode_run = 1
                let g:pymode_run_bind = '<leader>1'
                "------------------------------------------------- 
                let g:pymode_breakpoint = 1
                let g:pymode_breakpoint_bind = '<leader>2'
                let g:pymode_breakpoint_bind = '<C-2>'
                "let g:pymode_breakpoint_cmd = ''
                "======================================================
                "let g:pymode_rope_autoimport = 0
                let g:pymode_doc = 1
                let g:pymode_doc_bind = 'M'
                "------------------------------------------------------
                let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
                let g:pymode_lint_on_fly = 1
                let g:pymode_lint_message = 1
                let g:pymode_lint_ignore = ["E501", "W",]
                let g:pymode_lint_select = ["E501", "W0011", "W430"]
                let g:pymode_lint_sort = ['E', 'C', 'I']
                "------------------------------------------------------
                let g:pymode_lint_todo_symbol = 'WW'
                let g:pymode_lint_comment_symbol = 'CC'
                let g:pymode_lint_visual_symbol = 'RR'
                let g:pymode_lint_error_symbol = 'EE'
                let g:pymode_lint_info_symbol = 'II'
                let g:pymode_lint_pyflakes_symbol = 'FF'

                "--------------------------------------------------------------------------
                "%!python -c "for i in xrange(25): print 6*i"
                ".!python -c "print 'hello'"
                " nnoremap <F9> :echo system('python2 "' . expand('%') . '"')<cr>
                " nnoremap <F10> :echo system('python3 "' . expand('%') . '"')<cr>
                "autocmd FileType python map <buffer> <S-e> :w<CR>:!/usr/bin/env python %<CR>

                " Strip REPL-session marks from just-pasted text
                "au FileType python nnoremap <localleader>s mz`[v`]:v/\v^(\>\>\>\|[.][.][.])/d<cr>gv:s/\v^(\>\>\> \|[.][.][.] \|[.][.][.]$)//<cr>:noh<cr>`z
                " Set up some basic neorepl mappings.
                " key  desc                   mnemonic
                " \o - connect neorepl        [o]pen repl
                " \l - send current line      [l]ine
                " \p - send current paragraph [p]aragraph
                " \e - send top-level hunk    [e]val
                " \e - send selected hunk     [e]val
                " \r - send entire file       [r]eload file
                " \c - send ctrl-l            [c]lear
                " au FileType python nnoremap <buffer> <silent> <localleader>o :call OpenPythonRepl()<cr>
                " au FileType python nnoremap <buffer> <silent> <localleader>l :call SendPythonLine()<cr>
                " au FileType python nnoremap <buffer> <silent> <localleader>p :call SendPythonParagraph()<cr>
                " au FileType python nnoremap <buffer> <silent> <localleader>e :call SendPythonTopLevelHunk()<cr>
                " au FileType python vnoremap <buffer> <silent> <localleader>e :<c-u>call SendPythonSelection()<cr>
                " au FileType python nnoremap <buffer> <silent> <localleader>r :call SendPythonBuffer()<cr>
                " au FileType python nnoremap <buffer> <silent> <localleader>c :call NeoReplSendRaw("")<cr>



                let g:pymode_rope_vim_completion = 1
                let g:pymode_rope_completion = 1
                let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]

                "let g:pymode_rope_always_show_complete_menu = 1
                "let g:pymode_rope_completion_bind = '<C-g>'
                "let g:pymode_rope_show_doc_bind = '<M-g>'
                "let g:pymode_rope_rename_bind = '<C-c>rr'
                "let g:pymode_rope_complete_on_dot = 1

                "" Python-Mode {{{
                "        let g:pymode_doc = 1
                "        let g:pymode_doc_bind = 'M'
                "        let g:pydoc = 'pydoc'
                "        let g:pymode_syntax = 1
                "        let g:pymode_syntax_all = 0
                "        let g:pymode_syntax_builtin_objs = 1
                "        let g:pymode_syntax_print_as_function = 0
                "        let g:pymode_syntax_space_errors = 0
                "        let g:pymode_run = 0
                "        let g:pymode_lint = 0
                "        let g:pymode_breakpoint = 0
                "        let g:pymode_utils_whitespaces = 0
                "        let g:pymode_virtualenv = 0
                "        let g:pymode_folding = 0

                "        let g:pymode_options_indent = 0
                "        let g:pymode_options_fold = 0
                "        let g:pymode_options_other = 0
                "        let g:pymode_options = 0

                "        let g:pymode_rope = 0
                "        let g:pymode_rope_global_prefix = "<localleader>R"
                "        let g:pymode_rope_local_prefix = "<localleader>r"
                "        let g:pymode_rope_auto_project = 1
                "        let g:pymode_rope_enable_autoimport = 0
                "        let g:pymode_rope_autoimport_generate = 1
                "        let g:pymode_rope_autoimport_underlineds = 0
                "        let g:pymode_rope_codeassist_maxfixes = 10
                "        let g:pymode_rope_sorted_completions = 1
                "        let g:pymode_rope_extended_complete = 1
                "        let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]
                "        let g:pymode_rope_confirm_saving = 1
                "        let g:pymode_rope_vim_completion = 1
                "        let g:pymode_rope_guess_project = 1
                "        let g:pymode_rope_goto_def_newwin = 0
                "        let g:pymode_rope_always_show_complete_menu = 0
                ""-END-pyMode-}}}

                "----------------------------------------------------------------------------------
                " Folding for Python (uses syntax/python.vim for fold definitions)
                "autocmd filetype python,rst setlocal nofoldenable
                "autocmd filetype python setlocal foldmethod=expr


                " Run a quick static syntax check every time we save a Python file
                "autocmd! BufWritePost *.py call Flake8()

                " defer to isort for sorting python imports (instead of using unix sort)
                "autocmd! filetype python nnoremap <leader>s mx:%!isort -<cr>`x:redraw!<cr>
                "--------------------------------------------------------------------------

