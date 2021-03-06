let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" let g:deoplete#sources#jedi#extra_path = $PYTHONPATH

call plug#begin('~/.config/nvim/plugged/')
        Plug 'tyru/capture.vim'
        Plug 'thinca/vim-quickrun'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
                let g:airline_theme='light'
                set showmode                "-Display the current mode
                set showcmd                 "-Show partial commands in status line 
                "--------------------------------------------------------------------------
                let g:airline_section_c = '%{strftime("%Y %b %d %X")}'
                let g:airline#extensions#tabline#enabled = 2
                let g:airline#extensions#tabline#buffer_min_count = 1
                "-----------------------------------------------------------
                let g:airline#extensions#syntastic#enabled = 1
                let g:airline#extensions#branch#enabled = 1
                "-----------------------------------------------------------
                if !exists('g:airline_symbols')
                        let g:airline_symbols = {}
                endif
                "--------------------------------------------------------------------------
                hi statusline ctermbg=10 ctermfg=Black  cterm=bold
                hi StatusLineNC  ctermbg=5 ctermfg=0 cterm=NONE

        Plug 'Yggdroot/indentLine'
                let g:indentLine_enabled = 1
                let g:indentLine_noConcealCursor='nc'
                let g:indentLine_color_term = 10
                "let g:indentLine_setConceal = 0
                "let g:indentLine_bgcolor_term = 202


        Plug 'Shougo/neocomplete.vim'

call plug#end()

        " Required for operations modifying multiple buffers like rename.
        set hidden
        "" neocomplete
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_ignore_case = 1
        let g:neocomplete#enable_smart_case = 1
        if !exists('g:neocomplete#keyword_patterns')
                let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns._ = '\h\w*'
        """
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

        " Enable heavy omni completion.
        if !exists('g:neocomplete#sources#omni#input_patterns')
                let g:neocomplete#sources#omni#input_patterns = {}
        endif
        if !exists('g:neocomplete#force_omni_input_patterns')
                let g:neocomplete#force_omni_input_patterns = {}
        endif

        "===SetPLAY7===============================================================================
        let g:ycm_filetype_blacklist = {
                                \ 'tagbar': 1,
                                \ 'qf': 1,
                                \ 'notes': 1,
                                \ 'markdown': 1,
                                \ 'unite': 1,
                                \ 'text': 1,
                                \ 'vimwiki': 1,
                                \ 'pandoc': 1,
                                \ 'infolog': 1,
                                \ 'mail': 1
                                \}

        "let g:ycm_complete_in_comments=1
        "" load ycm conf by default
        let g:ycm_confirm_extra_conf=0
        "" turn on tag completion
        let g:ycm_collect_identifiers_from_tags_files=1
        "" start completion from the first character
        let g:ycm_min_num_of_chars_for_completion=3
        "" don't cache completion items
        let g:ycm_cache_omnifunc=0
        "" complete syntax keywords
        let g:ycm_seed_identifiers_with_syntax=1
        "------------------------------------------------------------------------------------------
        "noYet- let g:ycm_show_diagnostics_ui = 1
        "let g:ycm_enable_diagnostic_highlighting = 1
        "------------------------------------------------------------------------------------------
        "map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_error_symbol = 'x>'
        let g:ycm_warning_symbol = 'w>'
        let g:ycm_enable_diagnostic_signs = 1
        let g:ycm_add_preview_to_completeopt = 1
        let g:ycm_use_ultisnips_completer = 1
        let g:ycm_autoclose_preview_window_after_insertion = 1
        let g:ycm_key_detailed_diagnostics = '<leader>d'
        let g:ycm_key_invoke_completion = '<C-Space>'
        let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
        let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
        let g:ycm_key_list_stop_completion = ['<C-3>']
        "used <C-Y>
        map <C-;> :YcmCompleter GoToImprecise<CR>
        " let g:ycm_autoclose_preview_window_after_insertion = 0
        " let g:ycm_autoclose_preview_window_after_completion = 0
        "===SetPLAY7===============================================================================
        "===SetPLAY8===============================================================================
        " let g:ycm_semantic_triggers =  {
        "                         \   'c': ['->', '.'],
        "                         \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
        "                         \            're!\[.*\]\s'],
        "                         \   'ocaml': ['.', '#'],
        "                         \   'cpp,cuda,objcpp': ['->', '.', '::'],
        "                         \   'perl': ['->'],
        "                         \   'php': ['->', '::'],
        "                         \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
        "                         \   'ruby,rust': ['.', '::'],
        "                         \   'lua': ['.', ':'],
        "                         \   'erlang': [':'],
        "                         \ }
        "------------------------------------------------------------------------------------------
        " automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
