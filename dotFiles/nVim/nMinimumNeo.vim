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
