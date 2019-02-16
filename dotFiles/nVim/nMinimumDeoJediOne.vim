let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" let g:deoplete#sources#jedi#extra_path = $PYTHONPATH

call plug#begin('~/.config/nvim/plugged/')
        Plug 'junegunn/fzf'
        Plug 'alok/notational-fzf-vim'
        "USA FIRST
        let g:nv_search_paths = ['~/git/aTest/dotFiles/', '~/git/aTest/pyLabGitPdbPythonMode27' ]

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

        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'zchee/deoplete-jedi'
        Plug 'davidhalter/jedi-vim'

        Plug 'autozimu/LanguageClient-neovim', {
                                \ 'branch': 'next',
                                \ 'do': 'bash install.sh',
                                \ }

        " (Optional) Multi-entry selection UI.

        Plug 'junegunn/fzf'
        Plug 'alok/notational-fzf-vim'
        "USA FIRST
        let g:nv_search_paths = ['~/git/aTest/dotFiles/', '~/git/aTest/pyLabGitPdbPythonMode27' ]

        
call plug#end()

        let g:deoplete#enable_at_startup = 0
        let g:deoplete#enable_at_startup = 1
        call deoplete#custom#buffer_option('require_same_filetype', v:false)

        "--------------------------------------------------------------------------------
        call deoplete#custom#source('padawan',       'rank', 660)
        call deoplete#custom#source('go',            'rank', 650)
        call deoplete#custom#source('vim',           'rank', 640)
        call deoplete#custom#source('flow',          'rank', 630)
        call deoplete#custom#source('TernJS',        'rank', 620)
        call deoplete#custom#source('jedi',          'rank', 610)
        call deoplete#custom#source('LanguageClient','rank', 600)
        call deoplete#custom#source('tag',           'rank', 550)
        call deoplete#custom#source('omni',          'rank', 500)
        call deoplete#custom#source('neosnippet',    'rank', 510)
        call deoplete#custom#source('member',        'rank', 500)
        call deoplete#custom#source('file_include',  'rank', 420)
        call deoplete#custom#source('file',          'rank', 410)
        call deoplete#custom#source('around',        'rank', 330)
        call deoplete#custom#source('buffer',        'rank', 320)
        call deoplete#custom#source('dictionary',    'rank', 310)
        call deoplete#custom#source('tmux-complete', 'rank', 300)
        call deoplete#custom#source('syntax', 'rank', 200)
        "--------------------------------------------------------------------------------
        call deoplete#custom#source('LanguageClient','mark', 'ℰ')
        call deoplete#custom#source('omni',          'mark', '⌾')
        call deoplete#custom#source('flow',          'mark', '⌁')
        call deoplete#custom#source('TernJS',        'mark', '⌁')
        call deoplete#custom#source('go',            'mark', '⌁')
        call deoplete#custom#source('jedi',          'mark', '⌁')
        call deoplete#custom#source('vim',           'mark', '⌁')
        call deoplete#custom#source('ultisnips',     'mark', '⌘')
        call deoplete#custom#source('around',        'mark', '↻')
        call deoplete#custom#source('buffer',        'mark', 'ℬ')
        call deoplete#custom#source('tmux-complete', 'mark', '⊶')
        call deoplete#custom#source('syntax',        'mark', '♯')
        call deoplete#custom#source('member',        'mark', '.')

        set completeopt-=preview  "close show_docstring
        let g:min_pattern_length=2
        let g:deoplete#auto_complete_delay=0
        let g:auto_refresh_delay=0
        
        " Plugin key-mappings.
        inoremap <expr><C-g>     deoplete#undo_completion()
        inoremap <expr><C-l>     deoplete#refresh()
        inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"

"------------------------------------------------------------------------- 
        call deoplete#enable_logging('DEBUG', 'deoplete.log')
        call deoplete#custom#source('jedi', 'is_debug_enabled', 1)
"------------------------------------------------------------------------- 

        let g:jedi#use_splits_not_buffers = "left"
        let g:jedi#popup_on_dot = 0
"------------------------------------------------------------------------- 
        let g:jedi#goto_command = "<leader>d"
        let g:jedi#goto_assignments_command = "<leader>g"
        let g:jedi#goto_definitions_command = ""
        let g:jedi#documentation_command = "M"
        let g:jedi#usages_command = "<leader>n"
        let g:jedi#rename_command = "<leader>r"
        let g:jedi#completions_command = "<C-z>"
        "let g:jedi#completions_command = "<C-Space>"
        let g:jedi#popup_on_dot = 1
        let g:jedi#completions_enabled = 1
        let g:jedi#popup_select_first = 1
        let g:jedi#show_call_signatures = "1"
        let g:jedi#goto_command = "gt"
        let g:jedi#auto_close_doc = 0  " close preview window after completion

        " Enable omni completion.
        autocmd! FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd! FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd! FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd! FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd! FileType python setlocal omnifunc=jedi#completions
        autocmd! FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd! FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd! FileType haskell setlocal omnifunc=necoghc#omnifunc

        " jedi-vim {{{2
                autocmd FileType python setlocal omnifunc=jedi#completions
                        let g:jedi#completions_enabled = 0
                        let g:jedi#auto_vim_configuration = 0
                        " for NeoComplete {{{3
                        if !exists('g:neocomplete#force_omni_input_patterns')
                                let g:neocomplete#force_omni_input_patterns = {}
                        endif
                let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
        " }}}

"------------------------------------------------------------------------- 
        let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
        \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
        \ 'python': ['/usr/local/bin/pyls'],
        \ }

        let g:LanguageClient_serverCommands.python = ['pyls']
"------------------------------------------------------------------------- 
        " set deoplete sources
        let g:deoplete#sources = {}
        let g:deoplete#sources.python = ['LanguageClient']
        let g:deoplete#sources.python3 = ['LanguageClient']
        let g:deoplete#sources.vim = ['vim']
        "let g:deoplete#sources.cpp = ['LanguageClient']
        "let g:deoplete#sources.ruby = ['LanguageClient']
        "let g:deoplete#sources.c = ['LanguageClient']
"------------------------------------------------------------------------- 

