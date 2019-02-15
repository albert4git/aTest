" Plug 'xolox/vim-easytags'
"        let g:easytags_file = '~/.nvimtags'
"        let g:easytags_auto_highlight = 1
"        let g:easytags_syntax_keyword = 'always'
"        let g:easytags_events = ['BufWritePost']
"        let g:easytags_async = 1
"        let g:easytags_file = '~/.vim/.vimtags'
"        "------------------------------------------------------
"        let g:easytags_languages = {
"        \   'haskell': {
"        \       'cmd': '~/.cabal/bin/lushtags',
"        \       'args': [],
"        \       'fileoutput_opt': '-f',
"        \       'stdout_opt': '-f-',
"        \       'recurse_flag': '-R'
"        \   }
"        \}
"        "------------------------------------------------------
"        "let g:easytags_events = ['BufReadPost', 'BufWritePost']
"        let g:easytags_resolve_links = 1
"        " let g:easytags_dynamic_files = 2
"        " let g:easytags_suppress_ctags_warning = 1
"        " Prevent automatic ctag updates
"        let g:easytags_auto_update = 0
"        let g:easytags_auto_highlight = 0
"        let g:easytags_on_cursorhold = 0
"        " Scan recursively, not just current file
"        let g:easytags_autorecurse = 1
"        " Follow symbolic links
"        let g:easytags_resolve_links = 1
"        " Close tagbar after jumping to a tag
"        let g:tagbar_autoclose = 1
"        My current easytags config:
"        set cpoptions+=d
"        let g:easytags_async = 1⋅
"        let g:easytags_dynamic_files = 2 " create and use local tag files instead of global one
"        let g:easytags_events = ['BufReadPost', 'BufWritePost'] " Update tags on read and save only
"        let g:easyt
" nmap <F3>  :sp tags<CR>:%s/^\([^	:]*:\)\=\([^	]*\).*/syntax keyword Tag \2/<CR>:wq! htags.vim<CR>/^<CR><F4>
" nmap <F4>  :so htags.vim<CR>
" highlight ShowMatches ctermbg=240 
" au! VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=16
" au! Cursorhold * exe 'match ShowMatches /\v%(%#\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*%#\})/'


"-AAA15-Plug1Start--------------------------------------------------------------------------------------------------{{{
call plug#begin('~/.config/nvim/plugged/')
        "------------------------------------------------------------------------- 
        Plug 'google/vim-codefmt'
                augroup autoformat_settings
                        autocmd FileType bzl AutoFormatBuffer buildifier
                        autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
                        autocmd FileType dart AutoFormatBuffer dartfmt
                        autocmd FileType go AutoFormatBuffer gofmt
                        autocmd FileType gn AutoFormatBuffer gn
                        autocmd FileType html,css,json AutoFormatBuffer js-beautify
                        autocmd FileType java AutoFormatBuffer google-java-format
                        autocmd FileType python AutoFormatBuffer yapf
                        " Alternative: autocmd FileType python AutoFormatBuffer autopep8
                augroup END
        "------------------------------------------------------------------------- 
        Plug 'google/vim-maktaba'
        "-Strongly recommended: easy configuration of maktaba plugins.
        Plug 'google/vim-glaive'
                let g:myplugin_enablefeature = 1
                let g:myplugin_defaultdir = $HOME
                let g:myplugin_weirdmode = 'm'

        Plug 'google/vim-syncopate'
        "-------------------------------------------------------------------------
        Plug 'AndrewRadev/switch.vim'
                let g:switch_mapping = "-"
                let g:switch_custom_definitions =
                                \ [
                                        \ ['true', 'false'], ['True', 'False'], ['TRUE', 'FALSE'],
                                        \ ['yes', 'no'], ['Yes', 'No'], ['YES', 'NO'],
                                        \ ['on', 'off'], ['On', 'Off'], ['ON', 'OFF'],
                                        \ ['up', 'down'], ['Up', 'Down'] ,['UP', 'DOWN'],
                                        \ ['set', 'unset'],
                                        \ ['is', 'isnot'] ,
                                        \ ['==', '!='] , ['<', '>'], ['<=', '>='], ['=~', '!~'],
                                        \ ['enable', 'disable'], ['Enable', 'Disable'],
                                        \ ['enabled', 'disabled'], ['Enabled', 'Disabled'],
                                        \ ['maximum', 'minimum'], ['Maximum', 'Minimum'],
                                        \ ['maximal', 'minimal'], ['Maximal', 'Minimal'],
                                        \ ['upper', 'lower'], ['Upper', 'Lower'],
                                        \ ['top', 'bottom'], ['Top', 'Bottom'],
                                        \ ['above', 'below'], ['Above', 'Below'],
                                        \ ['forward', 'backward'], ['Forward', 'Backward'],
                                        \ ['right', 'middle', 'left'], ['Right', 'Middle', 'Left'],
                                        \ ['next', 'previous'], ['Next', 'Previous'],
                                        \ ['first', 'last'], ['First', 'Last'],
                                        \ ['before', 'after'], ['Before', 'After'],
                                        \ ['more', 'less'], ['More', 'Less'],
                                        \ ['fast', 'slow'], ['Fast', 'Slow'],
                                        \ ['green', 'yellow', 'red'],
                                        \ ['one', 'two', 'three']
                                \ ]
                "--------------------------------------------------------------------------
                        let b:switch_custom_definitions = [
                                                \   {
                                                \     '\<[a-z0-9]\+_\k\+\>': {
                                                \       '_\(.\)': '\U\1'
                                                \     },
                                                \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
                                                \       '\([A-Z]\)': '_\l\1'
                                                \     },
                                                \   }
                                                \ ]
        "--------------------------------------------------------------------------------- 
        Plug 'brookhong/cscope.vim'
                nnoremap ff :call CscopeFindInteractive(expand('<cword>'))<CR>
        Plug 'unblevable/quick-scope'
                "let g:qs_enable=0
                augroup qs_colors
                        autocmd!
                        autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=10 cterm=underline
                        autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=50 cterm=underline
                augroup END
        "--------------------------------------
        " Plug 'flazz/vim-colorschemes'
        " Plug 'rafi/awesome-vim-colorschemes'
        "--------------------------------------
        "--------------------------------------
        Plug 'MattesGroeger/vim-bookmarks'
                "-AAA-------------------------------------------------------------------{{{
                let g:bookmark_no_default_key_mappings = 1
                function! BookmarkMapKeys()
                        nmap mm :BookmarkToggle<CR>
                        nmap mi :BookmarkAnnotate<CR>
                        nmap mn :BookmarkNext<CR>
                        nmap mp :BookmarkPrev<CR>
                        nmap ma :BookmarkShowAll<CR>
                        nmap mc :BookmarkClear<CR>
                        nmap mx :BookmarkClearAll<CR>
                        nmap mkk :BookmarkMoveUp
                        nmap mjj :BookmarkMoveDown
                endfunction
                "------------------------------------------------------
                autocmd! BufEnter * :call BookmarkMapKeys()
                highlight BookmarkSign ctermbg=9 ctermfg=1
                highlight BookmarkLine ctermbg=9 ctermfg=1
                highlight BookmarkAnnotationLine ctermbg=9 ctermfg=1
                highlight BookmarkAnnotationSign ctermbg=9 ctermfg=1
                "------------------------------------------------------
                let g:bookmark_auto_close = 1
                let g:bookmark_highlight_lines = 1          
                let g:bookmark_show_warning = 0           
                let g:bookmark_show_toggle_warning = 0      
                let g:bookmark_sign = '♥'
                let g:bookmark_highlight_lines = 1
                let g:bookmark_save_per_working_dir = 1
                let g:bookmark_auto_save = 1
                let g:bookmark_save_per_working_dir = 1  
                "------------------------------------------------------
                "let g:bookmark_manage_per_buffer = 1`        
                "let g:bookmark_auto_save_file = '/bookmarks'`
                " |------------------------------------------|-------------|------------------------------|
                " | Add/remove bookmark at current line      | `mm`        | `:BookmarkToggle`            |
                " | Add/edit/remove annotation at current li | `mi`        | `:BookmarkAnnotate <TEXT>`   |
                " | Jump to next bookmark in buffer          | `mn`        | `:BookmarkNext`              |
                " | Jump to previous bookmark in buffer      | `mp`        | `:BookmarkPrev`              |
                " | Show all bookmarks (toggle)              | `ma`        | `:BookmarkShowAll`           |
                " | Clear bookmarks in current buffer only   | `mc`        | `:BookmarkClear`             |
                " | Clear bookmarks in all buffers           | `mx`        | `:BookmarkClearAll`          |
                " | Move up bookmark at current line         | `[count]mkk`| `:BookmarkMoveUp [<COUNT>]`  |
                " | Move down bookmark at current line       | `[count]mjj`| `:BookmarkMoveDown [<COUNT>]`|
                " | Move bookmark at current line to another | `[count]mg` | `:BookmarkMoveToLine <LINE>` |
                " | Save all bookmarks to a file             |             | `:BookmarkSave <FILE_PATH>`  |
                " | Load bookmarks from a file               |             | `:BookmarkLoad <FILE_PATH>`  |
                " |------------------------------------------|-------------|------------------------------|
                "-AAE-}}}
        "------------------------------------------------------------------------------------------
        "------------------------------------------------------------------------------------------
        "------------------------ repl --REPL--------------------------------------------- 
        Plug 'jalvesaq/vimcmdline'
                " vimcmdline mappings
                let cmdline_map_start          = '<LocalLeader>s'
                let cmdline_map_send           = '<Space>'
                let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
                let cmdline_map_source_fun     = '<LocalLeader>f'
                let cmdline_map_send_paragraph = '<LocalLeader>p'
                let cmdline_map_send_block     = '<LocalLeader>b'
                let cmdline_map_quit           = '<LocalLeader>q'
                " vimcmdline options
                let cmdline_vsplit      = 1      " Split the window vertically
                let cmdline_esc_term    = 1      " Remap <Esc> to :stopinsert in Neovim's terminal
                let cmdline_in_buffer   = 1      " Start the interpreter in a Neovim's terminal
                let cmdline_term_height = 15     " Initial height of interpreter window or pane
                let cmdline_term_width  = 80     " Initial width of interpreter window or pane
                let cmdline_tmp_dir     = '/tmp' " Temporary directory to save files
                let cmdline_outhl       = 1      " Syntax highlight the output
                let cmdline_auto_scroll = 1      " Keep the cursor at the end of terminal (nvim)
                let cmdline_app         = {}
                " let cmdline_app['python'] = 'ptipython3'
                " let cmdline_app['ruby']   = 'pry'
                " let cmdline_app['sh']     = 'bash'
                if has('gui_running') || &termguicolors
                    let cmdline_color_input    = '#9e9e9e'
                    let cmdline_color_normal   = '#00afff'
                    let cmdline_color_number   = '#00ffff'
                    let cmdline_color_integer  = '#00ffff'
                    let cmdline_color_float    = '#00ffff'
                elseif &t_Co == 256
                    let cmdline_color_input    = 247
                    let cmdline_color_normal   =  39
                    let cmdline_color_number   =  51
                    let cmdline_color_integer  =  51
                    let cmdline_color_float    =  51
                    let cmdline_color_complex  =  51
                    let cmdline_color_negnum   = 183
                    let cmdline_color_negfloat = 183
                    let cmdline_color_date     =  43
                    let cmdline_color_true     =  78
                    let cmdline_color_false    = 203
                    let cmdline_color_inf      =  39
                    let cmdline_color_constant =  75
                    let cmdline_color_string   =  79
                    let cmdline_color_stderr   =  33
                    let cmdline_color_error    =  15
                    let cmdline_color_warn     =   1
                    let cmdline_color_index    = 186
                endif
        "--------------------------------------
        "----SEARCH-search--POISK-poisk-SUCHE--suche------------------------------------------------ 
        Plug 'vim-scripts/Lynx-Offline-Documentation-Browser'
        Plug 'rhysd/open-pdf.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'godlygeek/tabular'
                " Tabularize {
                nmap <Leader>a& :Tabularize /&<CR>
                vmap <Leader>a& :Tabularize /&<CR>
                nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
                vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
                nmap <Leader>a=> :Tabularize /=><CR>
                vmap <Leader>a=> :Tabularize /=><CR>
                nmap <Leader>a: :Tabularize /:<CR>
                vmap <Leader>a: :Tabularize /:<CR>
                nmap <Leader>a:: :Tabularize /:\zs<CR>
                vmap <Leader>a:: :Tabularize /:\zs<CR>
                nmap <Leader>a, :Tabularize /,<CR>
                vmap <Leader>a, :Tabularize /,<CR>
                nmap <Leader>a,, :Tabularize /,\zs<CR>
                vmap <Leader>a,, :Tabularize /,\zs<CR>
                nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
                vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
                " }
        "--------------------------------------------------------------------------------- 
                " abc,def,ghi , some , shrt 
                " a,b,c
        "--------------------------------------------------------------------------------- 
        Plug 'dhruvasagar/vim-table-mode'
                let g:table_mode_corner_corner='+'
                let g:table_mode_header_fillchar='='
                " :TableModeToggle
                " +-------+---------+--------+
                " | hallo | albert  | montag |
                " +=======+=========+========+
                " | isr   | student | id     |
                " +-------+---------+--------+
        "------------------------------------------------------------------------------------------ 
        "-------------------------------------------------------------------------
        Plug 'francoiscabrol/ranger.vim'
        "        let g:NERDTreeHijackNetrw = 0 
        "        let g:ranger_replace_netrw = 1 
        "        let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
                 noremap <leader>r :Ranger<CR>
        "--------------------------------------------------------------------------------- 
        "Plug 'wsdjeg/JavaUnit.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'vim-scripts/javaDoc.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'guns/xterm-color-table.vim'
        "--------------------------------------------------------------------------------- 
        "------------------------------------------------------------------------------------------ 
        "------------------------------------------------------------------------------------------ 
        "------------------------------------------------------------------------------------------ 

call plug#end()
"-5plug1Stop-}}}
