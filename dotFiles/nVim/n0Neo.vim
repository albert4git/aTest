        "xvim-start
        " clang_complete {{{ use of clang to complete in C/C++.
            " :h clang_complete.txt
            let g:clang_auto_select = 0 " 0/1/2 auto select first entry in popup menu
            " disable with 0 to solve neocomplcache problem
            let g:clang_complete_auto = 1 " auto complete after -> . ::
            let g:clang_complete_copen = 1 " 1: open quickfix window on error
            let g:clang_hl_errors = 1 " highlight warnings and errors
            let g:clang_periodic_quickfix = 0 " periodically update quickfix
                " you can use g:ClangUpdateQuickFix() with a mapping to do this
            let g:clang_snippets = 1
            " clang_complete, snipmate, ultisnips
            let g:clang_snippets_engine = "ultisnips"
            let g:clang_conceal_snippets = 1
            let g:clang_trailing_placeholder = 0 " for clang_complete snippet engine
            let g:clang_close_preview = 0 " auto close preview window after completion
            let g:clang_exec = "clang" " name or path of clang executable.
            let g:clang_user_options =
                        \ '-std=gnu99' .
                        \ '-stdlib=libc' .
                        \ '-I /usr/include'
            " let g:clang_user_options = '-std=gnu++0x -include malloc.h -fms-extensions -fgnu-runtime'
            " let g:clang_user_options = '-std=c++11 -stdlib=libc++'
            let g:clang_auto_user_options = "path, .clang_complete, clang"
            let g:clang_use_library = 1
            let g:clang_library_path = "/usr/lib/"
            let g:clang_sort_algo = "priority"
            let g:clang_complete_macros = 1
            let g:clang_complete_patterns = 1
        " }}}

        "xvim-start
        " neocomplcache-clang {{{ clang_complete for neocomplcache.
            " Require: clang_complete
                " clang.so, clang.dll, libclang.dylib
            let g:neocomplcache_clang_use_library = 1 " use clang library
            let g:neocomplcache_clang_library_path = '/usr/lib/'
            let g:neocomplcache_clang_executable_path = '/usr/bin/clang'
            let g:neocomplcache_clang_macros = 1 " -code-completion-macros option
            let g:neocomplcache_clang_patterns = 1 " -code-completion-patterns option
            let g:neocomplcache_clang_auto_options = "path, .clang_complete, clang"
            let g:neocomplcache_clang_user_options = '-std=gnu99 -stdlib=libc'
            " let g:neocomplcache_clang_user_options = '-std=c++11 -stdlib=libc++'
            let g:neocomplcache_clang_debug = 0 " enable debug message.
        " }}}



        "Nlpumvisible() ? "\" : "\ote: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
        " Di"pumvisible() ? "\" : "\sable AutoComplPop."pumvisible() ? "\" : "\"pumvisible() ? "\" :
        " "\"pumvisible() ? "\" : "\
        let g:acp_enableAtStartup = "pumvisible() ? "\" : "\0"pumvisible() ? "\" : "\
        " Set minimum syntax keyword length."pumvisible() ? "\" : "\
        let g:neocomplete#sources#syntax#min_keyword_length = 3"

        " Define dictionary.
        let g:neocomplete#sources#dictionary#dictionaries = {
                                \ 'default' : '',
                                \ 'vimshell' : $HOME.'/.vimshell_hist',
                                \ 'scheme' : $HOME.'/.gosh_completions'

                                \ }

        " Define keyword.
        if !exists('g:neocomplete#keyword_patterns')
                let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'


        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplete#undo_completion()
        inoremap <expr><C-l>     neocomplete#complete_common_string()

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
                return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
                " For no inserting <CR> key.
                "return pumvisible() ? "\<C-y>" : "\<CR>"
        endfunction
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

        "-Close popup by <Space>.
        "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

        "-AutoComplPop like behavior.
        "let g:neocomplete#enable_auto_select = 1

        "-Shell like behavior(not recommended).
        "set completeopt+=longest
        "let g:neocomplete#enable_auto_select = 1
        "let g:neocomplete#disable_auto_complete = 1
        "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"


        
        ""-Enable-heavy-omni-completion-------------------------------------
        " if !exists('g:neocomplete#sources#omni#input_patterns')
        "         let g:neocomplete#sources#omni#input_patterns = {}
        " endif
        ""-----------------------------------------------------------------------------------------
        "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
        ""-----------------------------------------------------------------------------------------

        " For perlomni.vim setting.
        " https://github.com/c9s/perlomni.vim
        " let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
