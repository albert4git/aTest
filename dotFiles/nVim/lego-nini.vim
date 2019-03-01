                " :Keep                                                           "
                " :Reject                                                         "
                " :Restore                                                        "
                " :Doline s/^/--                                                  "
                " :SaveList                                                       "
                " :SaveList curlist                                               "
                " :SaveListAdd curlist                                            "
                " :LoadList curlist                                               "
                " :ListLists                                                      "
                "================================================================="
Plug 'xolox/vim-easytags'
       let g:easytags_file = '~/.nvimtags'
       let g:easytags_auto_highlight = 1
       let g:easytags_syntax_keyword = 'always'
       let g:easytags_events = ['BufWritePost']
       let g:easytags_async = 1
       let g:easytags_file = '~/.vim/.vimtags'
       "------------------------------------------------------
       let g:easytags_languages = {
       \   'haskell': {
       \       'cmd': '~/.cabal/bin/lushtags',
       \       'args': [],
       \       'fileoutput_opt': '-f',
       \       'stdout_opt': '-f-',
       \       'recurse_flag': '-R'
       \   }
       \}
       "------------------------------------------------------
       "let g:easytags_events = ['BufReadPost', 'BufWritePost']
       let g:easytags_resolve_links = 1
       " let g:easytags_dynamic_files = 2
       " let g:easytags_suppress_ctags_warning = 1
       " Prevent automatic ctag updates
       let g:easytags_auto_update = 0
       let g:easytags_auto_highlight = 0
       let g:easytags_on_cursorhold = 0
       " Scan recursively, not just current file
       let g:easytags_autorecurse = 1
       " Follow symbolic links
       let g:easytags_resolve_links = 1
       " Close tagbar after jumping to a tag
       let g:tagbar_autoclose = 1
       My current easytags config:
       set cpoptions+=d
       let g:easytags_async = 1⋅
       let g:easytags_dynamic_files = 2 " create and use local tag files instead of global one
       let g:easytags_events = ['BufReadPost', 'BufWritePost'] " Update tags on read and save only
       let g:easyt
nmap <F3>  :sp tags<CR>:%s/^\([^	:]*:\)\=\([^	]*\).*/syntax keyword Tag \2/<CR>:wq! htags.vim<CR>/^<CR><F4>
nmap <F4>  :so htags.vim<CR>
highlight ShowMatches ctermbg=240 
au! VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=16
au! Cursorhold * exe 'match ShowMatches /\v%(%#\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*%#\})/'


"-AAA15-Plug1Start--------------------------------------------------------------------------------------------------{{{
call plug#begin('~/.config/nvim/plugged/')
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
        "--------------------------------------

        "------------------------------------------------------------------------------------------
        "------------------------------------------------------------------------------------------
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
        Plug 'rhysd/open-pdf.vim'
        "------------------------------------------------------------------------------------------ 
        "Plug 'wsdjeg/JavaUnit.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'vim-scripts/javaDoc.vim'
        "------------------------------------------------------------------------------------------ 
        "------------------------------------------------------------------------------------------ 

call plug#end()
"-5plug1Stop-}}}
"-"-"-"-"-"--"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-NeoVimMix65FZF-NV-Unite"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"-"
" File: start1ninit19.vim
" Author: red
" Last Modified: 11 Feb 2019
"======================================================================================================================
        "--------------------------------------------------------------------------
        autocmd! filetype python setlocal formatoptions-=t " But disable autowrapping as it is super annoying
        "--------------------------------------------------------------------------
        " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set earlier, as it is important)
        autocmd! filetype python setlocal textwidth=149
        autocmd! filetype python match ErrorMsg '\%>120v.\+'

        " function! s:UsingPython3()
        "         if has('python3')
        "                 return 1
        "         endif
        "         return 0
        " endfunction

        " let s:using_python3 = s:UsingPython3()
        " let s:python_until_eof = s:using_python3 ? "python3 << EOF" : "python << EOF"
        " let s:python_command = s:using_python3 ? "py3 " : "py "

"-AAA15-Plug2Start---------------------------------------------------------------------------------------------{{{
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
        "----------------------------------------------------------------------------------- 
        "----------------------------------------------------------------------------------- 
        "----------------------------------------------------------------------------------- 
        "----------------------------------------------------------------------------------- 
        "----------------------------------------------------------------------------------
        Plug 'tpope/vim-sleuth'         " indet reight ?
call plug#end()
"-5plug2Stop-}}}

"-AAA3-Tag8------------------------------------------------------------------------------------------------{{{
        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
                let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
        set tags+=tags,./tags,../tags,../../tags,../../../tags,../../../../tags,~/.nvimtags


"-AAA3-Spell------------------------------------------------------------------------------------------------{{{
        "--------------------------------------------------------------------------------- 
        Plug 'vim-scripts/SpellCheck'
        "--------------------------------------------------------------------------------- 
        setlocal spell
        set nospell
        set spelllang=en_us
        set spellsuggest=best
        " set spelllang=de,tech_speak spell
        " set spellfile=~/.vim/spell/techspeak.utf-8.add
        " set spellfile=~/.vim/spell/en.utf-8.add           " 'zg': add, 'zw': remove.
        "------------------------------------------------------------------------------
        function! FixVimSpellcheck()
                if &spell
                        normal! 1z=
                else
                        set spell
                        normal! 1z=
                        set nospell
                endif
        endfunction
        nnoremap z= :call FixVimSpellcheck()<cr>
        "???, disable the zg (add to dictionary) shortcut
        nnoremap zg z=
        "------------------------------------------------------------------------------------------
        " error: zg, zG, zw, zW, zug, zuG, zuw,
        " zuW, z=, u
        " For z=, all identical misspellings in the buffer are
        " replaced with the chosen suggestion (via :spellrepall).
        "------------------------------------------------------------------------------------------
        " I use two languages: Lithuanian and English. But I also want to add
        " a special pseudo-language to contain identifiers extracted from tags
        " file (this will eliminate false hits like printf).
        " set spelllang=lt,en,fromtags
        " https://rtfb.lt/projects/vim-dox-spell/index.html
        "------------------------------------------------------------------------------------------
"-3--}}}

"-AAA3-UnPlug-nPlugStart------------------------------------------------------------------------------------{{{
call plug#begin()
        "--------------------------------------------------------------------------------- 
        "Plug 'Shougo/vimshell.vim'
        "--------------------------------------------------------------------------------- 
                ""???### Add helloworld to the runtime path. (Normally this would be done with another
                "" Plugin command, but helloworld doesn't have a repository of its own.)
                "call maktaba#plugin#Install(maktaba#path#Join([maktaba#Maktaba().location,
                "                        \ 'examples', 'helloworld']))
                ""-------------------------------------------
                "call glaive#Install()
                ""-------------------------------------------
                "" Configure helloworld using glaive.
                "Glaive helloworld plugin[mappings] name='Bram'
                "" Real world example: configure vim-codefmt
                "Glaive codefmt google_java_executable='java -jar /path/to/google-java-format.jar'
        "------------------------------------------------------------------------- 
        "------------------------------------------------------------------------- 
                " highlight default link TagbarHelp       Comment
                " highlight default link TagbarHelpKey    Identifier
                " highlight default link TagbarHelpTitle  PreProc
                " highlight default link TagbarKind       Identifier
                " highlight default link TagbarNestedKind TagbarKind
                " highlight default link TagbarScope      Title
                " highlight default link TagbarType       Type
                " highlight default link TagbarSignature  SpecialKey
                " highlight default link TagbarPseudoID   NonText
                " highlight default link TagbarFoldIcon   Statement
                " highlight default link TagbarHighlight  Search
        "--------------------------------------------------------------------------------- 
        "Plug 'xolox/vim-session'
        "        " Persist the options of the session plug-in using the session plug-in...
        "        let g:session_persist_globals = ['&sessionoptions']
        "        call add(g:session_persist_globals, 'g:session_autoload')
        "        call add(g:session_persist_globals, 'g:session_autosave')
        "        call add(g:session_persist_globals, 'g:session_default_to_last')
        "        call add(g:session_persist_globals, 'g:session_persist_globals')
        "        "let g:loaded_session = 1
        "        let g:session_autosave = 'yes'
        "------------------------------------------------------------------------------------------
        "-------------------------------------------------------------------------
        " Plug 'Shougo/vimfiler.vim'
        "         map fv :VimFiler<CR>
        "         map fd :VimFilerCurrentDir<CR>
        "------------------------------------------------------------------------------------------
        Plug 'haya14busa/vim-easyoperator-line'
                xmap <LocalLeader>l <Plug>(easyoperator-line-select)
        "--------------------------------------------------------------------------------- 
        Plug 'mattboehm/vim-accordion'
                let g:accordion_mode="v"
        "--------------------------------------------------------------------------------- 
        Plug 'echuraev/translate-shell.vim'
                let g:trans_directions_list = [
                                        \['en', 'de'],
                                        \['de', 'en'],
                                        \['en', 'ru'],
                                        \['ru', 'en'],
                                        \['en', 'ru', 'de'],
                                        \['', 'ru'],
                                        \['en', 'ja'],
                                        \['en', 'zh-CN'],
                                        \['en', 'zh-TW'],
                                        \['en', 'la'],
                                        \['en', 'es'],
                                        \['', ''],
                                        \]
                let g:trans_save_history = 1
        "--------------------------------------------------------------------------------- 
        "Plug 'vim-scripts/tinykeymap'
        "--------------------------------------------------------------------------------- 

        "--------------------------------------------------------------------------------- 
        " Plug 'vim-scripts/dbext.vim'
        " Plug 'NLKNguyen/pipe.vim' "required
        " Plug 'NLKNguyen/pipe-mysql.vim'
        " let g:pipemysql_login_info = [
        "                         \ {
        "                         \    'description' : 'my server 1',
        "                         \    'ssh_address' : 'root@server1',
        "                         \    'ssh_port' : '',
        "                         \    'mysql_hostname' : 'somehostname',
        "                         \    'mysql_username' : 'my_username',
        "                         \    'mysql_password' : 'my_password',
        "                         \    'mysql_database' : 'cs332h20'
        "                         \ },
        "                         \ {
        "                         \    'description' : 'my local',
        "                         \    'mysql_hostname' : 'localhost',
        "                         \    'mysql_username' : 'root',
        "                         \    'mysql_password' : 'mypass',
        "                         \ }
        "                         \ ]
        "--------------------------------------------------------------------------------- 
        "Plug 'kezhenxu94/vim-mysql-plugin'
        "Plug 'integralist/vim-mypy'
        "Plug 'leafOfTree/vim-imagine'
        "--------------------------------------------------------------------------------- 
        Plug 'alfredodeza/coveragepy.vim'
                ":Coveragepy report
                let g:coveragepy_uncovered_sign = '-'
       "---------------------------------------------------------------------------------- 
        " ci'q<<b>>({"  - 'change' insede "})</<b>>q'
        "-???- onoremap a i( , da ???-
        " vap / v2ap 
        " diw / daw 
        "----------------------------------------------------------------------------------
        " Maybe these mappings should be moved into FT_C() ?
        " Toggle between .c (.cc, .cpp) and .h                          
        " ToggleHeader defined inHOME/.vim/plugin/cpph.vim
        map       ,h          :call ToggleHeader()<CR>
        map       <C-F6>      ,h
        imap      <C-F6>      <C-O><C-F6>
        "----------------------------------------------------------------------------------
        " There's no way to close the quickfix window without jumping to it and :q or
        " whatever. That's bad. Let me close it from anywhere
        "----------------------------------------------------------------------------------
        "--------------------------------------------------------------------------------- 
        "Plug 'amiorin/vim-project'
        "----------------------------------------------------------------------------------
                " save the buffers for each file found by GitGrep in the previous search.
                " :GitGrep foo.*bar
                " :Qdo %s/foo.*bar/baz/g | update
        "-----------------------------------------------------------
                "read !date 
                "0read !date 
                "r find -mtime -8 | xargs grep vim
        "----------------------------------------------------------------------------------
        "Plug 'vim-scripts/ReplaceWithRegister'
        "-------------------------------------------------------------------------
        "-------------------------------------------------------------------------
        "Plug 'neomake/neomake'
        "Plug 'Rykka/trans.vim'
        Plug 'ron89/thesaurus_query.vim'
        "-TODO-
        "Plug 'roxma/nvim-completion-manager'
        "--------------------------------------------------------------------------------- 
        "Plug 'Shougo/neocomplete.vim'
        "--------------------------------------------------------------------------------- 
        "Plug 'vim-scripts/Vim-R-plugin'
        "Plug 'jalvesaq/Nvim-R'
        "let R_path = '/path/to/my/preferred/R/version/bin'
        ""<LocalLeader>rf command because the plugin was designed to
        "nmap <LocalLeader>; :RSend
        "nmap <LocalLeader>sr <Plug>RStart
        "imap <LocalLeader>sr <Plug>RStart
        "vmap <LocalLeader>sr <Plug>RStart
        "vmap <Leader>m <Plug>RDSendSelection
        "nmap <Leader>s <Plug>RDSendLine
        ":Rhelp topic

        "--------------------------------------------------------------------------------- 
        Plug 'Shougo/context_filetype.vim'
        "=================================================================================
        "--------------------------------------------------------------------------------- 
        "Plug 'auwsmit/vim-hydra'
        "--------------------------------------------------------------------------------- 
        Plug 'gotcha/vimpdb'
        "--------------------------------------------------------------------------------- 
        Plug 'vim-vdebug/vdebug'
                " <F5>: start/run (to next breakpoint/end of script)
                " <F2>: step over
                " <F3>: step into
                " <F4>: step out
                " <F6>: stop debugging (kills script)
                " <F7>: detach script from debugger
                " <F9>: run to cursor
                " <F10>: toggle line breakpoint
                " <F11>: show context variables (e.g. after "eval")
                " <F12>: evaluate variable under cursor
                " :Breakpoint <type> <args>: set a breakpoint of any type (see :help VdebugBreakpoints)
                " :VdebugEval <code>: evaluate some code and display the result
                " <Leader>e: evaluate the expression under visual highlight and display the result
        "--------------------------------------------------------------------------------- 
        "Plug 'ashisha/image.vim'
        "Plug 'rbgrouleff/bclose.vim'
        "-------------------------------------------------------------------------
        "-------------------------------------------------------------------------
        Plug 'artur-shaik/vim-javacomplete2'
                imap <F3> <Plug>(JavaComplete-Imports-RemoveUnused)
                " nmap <F4> <Plug>(JavaComplete-Imports-Add)
                " nmap <F5> <Plug>(JavaComplete-Imports-AddMissing)
                " nmap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)
        "--------------------------------------------------------------------------------- 
        " :setlocal omnifunc=javacomplete#Complete
        " :setlocal completefunc=javacomplete#CompleteParamsInfo
        " if has("autocmd")
        " autocmd Filetype java setlocal omnifunc=javacomplete#Complete
        " autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
        " endif
        " let g:user_emmet_settings = {
        "                         \  'php' : {
        "                         \    'extends' : 'html',
        "                         \    'filters' : 'c',
        "                         \  },
        "                         \  'xml' : {
        "                         \    'extends' : 'html',
        "                         \  },
        "                         \  'haml' : {
        "                         \    'extends' : 'html',
        "                         \  },
        "                         \}
        " let g:user_emmet_expandabbr_key = '<c-e>'
        " let g:use_emmet_complete_tag = 1
        "--------------------------------------------------------------------------------- 
        "Plug 'godlygeek/tabular'
        Plug 'hyiltiz/vim-plugins-profile'
        Plug 'nickstenning/honcho'
        "4Go
        Plug 'mattn/gom'
        "--------------------------------------------------------------------------------- 
        function! DoRemote(arg)
                UpdateRemotePlugins
        endfunction

call plug#end()

        source ~/git/aTest/dotFiles/nVim/mix/n-badwolf.vim 
        source ~/git/aTest/dotFiles/nVim/myPlug/nHydra.vim 
        "source ~/git/aTest/dotFiles/nVim/myPlug/amake.vim
        "-------------------------------------------------------------------------------
        au! BufNewFile,BufRead *.js, *.html, *.css
                                \ set tabstop=8
                                \ set softtabstop=8
                                \ set shiftwidth=8
                                \ set colorcolumn=2,92,100,112,120
        "-------------------------------------------------------------------------------
        autocmd! filetype html  set colorcolumn=2,92,100,112,120
        autocmd! filetype html  set tabstop=8
        autocmd! filetype html hi Normal  ctermbg=22
        "autocmd! filetype html colorscheme inkpot
        "autocmd! filetype html colorscheme desert256
         autocmd! filetype html colorscheme molokayo
        ""Plug 'kellino/wordnet.nvim'
        augroup filetype_settings
                autocmd!
                autocmd FileType zsh setlocal ts=2 sw=2 sts=2 expandtab
                autocmd FileType vim setlocal ts=8 sw=8 sts=8 expandtab
                autocmd FileType php setlocal ts=4 sw=4 sts=4 expandtab commentstring=//\ %s omnifunc=phpactor#Complete
                autocmd FileType html setlocal ts=8 sw=8 sts=8 expandtab
                autocmd FileType css setlocal ts=8 sw=8 sts=8 expandtab
                autocmd FileType scss setlocal ts=4 sw=4 sts=4 expandtab
                autocmd FileType less setlocal ts=2 sw=2 sts=2 expandtab
                autocmd FileType javascript setlocal ts=4 sw=4 sts=4 expandtab
                autocmd FileType vue setlocal ts=4 sw=4 sts=4 expandtab commentstring=//\ %s
                autocmd FileType vue syntax sync fromstart
                autocmd FileType snippets setlocal ts=4 sw=4 sts=4 expandtab
        augroup END


"-nPlugEnd-nPlugStop3-}}}

"-AAA4-SyntaxColor------------------------------------------------------------------------------------------{{{
        "Show syntax highlighting groups for word under cursor
        function! <SID>SynStack()
                if !exists("*synstack")
                        return
                endif
                echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
        endfunc
        "------------------------------------------------------------------------------------------
        function! ShowFunc()
                let gf_s = &grepformat
                let gp_s = &grepprg
                let &grepformat = '%*\k%*\sfunction%*\s%l%*\s%f %*\s%m'
                let &grepprg = 'ctags -x --c-types=f --sort=no -o -'
                write
                silent! grep %
                cwindow
                let &grepformat = gf_s
                let &grepprg = gp_s
        endfunc
        nmap sf :call ShowFunc()<CR>
        "------------------------------------------------------------------------------------------
        function! ShowFuncKeys(bang)
                for i in range(1,12)
                        redir! => map
                        exe "silent " . (a:bang == "!" ? 'verbose' : '') . " map<F" . i . ">"
                        redir end
                        if map !~ 'No mapping found'
                                echomsg map
                        endif
                endfor
        endfunction
        com! -bang ShowFuncKeys :call ShowFuncKeys(<q-bang>)
        "------------------------------------------------------------------------------------------
        function! s:ShowMaps()
                let old_reg = getreg("a")          " save the current content of register a
                let old_reg_type = getregtype("a") " save the type of the register as well
                try
                        redir @a                           " redirect output to register a
                        " Get the list of all key mappings silently, satisfy"
                        " Press ENTER to continue"
                        silent map | call feedkeys("\<CR>")
                        redir END                          " end output redirection
                        vnew                               " new buffer in vertical window
                        put a                              " put content of register
                        " Sort on 4th character column which is the key(s)
                        %!sort -k1.4,1.4
                finally                              " Execute even if exception is raised
                        call setreg("a", old_reg, old_reg_type) " restore register a
                endtry
        endfunction
        com! ShowMaps call s:ShowMaps()      " Enable :ShowMaps to call the function
        nnoremap sm :ShowMaps<CR>            " Map keys to call the function
"-4SynColor-}}}

"-AAA7--Abbr------------------------------------------------------------------------------------------------{{{
        "-Command mode related ???
        " cno $h e ~/
        " cno $d e ~/Desktop/
        " cno $c e <C-\>eCurrentFileDir("e")<cr>
        "------------------------------------------------------------------------------------------
        command! -bang E e<bang>
        command! -bang Q q<bang>
        command! -bang W w<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Wq wq<bang>
        command! -bang WQ wq<bang>

        "-PYTHON-ABBR-
        iabbrev yypl print ('-------------------------------------------------------')
        abb dlin "==================================================================================
        abb alin "AAA--------------------------------------------------------------------------------
        iabbrev yyy  "---------------------------------------------------------------------------------
        iabbrev yyy2 "--------------------------------------------------------------------------------------{{{
        iabbrev yyy3 "-}}}


        iabbrev mispell misspell
        iabbrev funciton function
        iabbrev functiton function
        iabbrev fucntion function
        iabbrev funtion function
        iabbrev retunr return
        iabbrev reutrn return
        iabbrev reutn return
        iabbrev queyr query
        iabbrev htis this
        iabbrev foreahc foreach
        iabbrev forech foreach

        iabbrev #i #include
        iabbrev #d #define
        iabbrev cmnt /*<CR><CR>*/<Up>
        iabbrev @@  alf@nomail.com
        iabbrev ccopy Copyright 2013 Alf , no rights reserved.
        iabbrev xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
        iabbrev ydate <c-r>=strftime("%Y %b %d")<cr>
        " My information
        iab xname <C-R> Alf Durak
"-7Abbr-}}}

"-AAA8--Jump-----------------------------------------------------------------------------------------------{{{
        set cinoptions=N-s,g0,+2s,l-s,i2s
        "------------------------------------------------------------------------------------------
                nnoremap z1 :set foldlevel=1<cr>
                nnoremap zf :call FocusLine()<cr>
                "-Focus the current line. Basically: -1. Close all folds.
                function! FocusLine()
                        let oldscrolloff = &scrolloff
                        set scrolloff=0
                        execute "keepjumps normal! mzzMzvzt25\<c-y>\<cr>"
                        let &scrolloff = oldscrolloff
                endfunction

                "-Mappings to easily toggle fold levels
                "-Make zO recursively open whatever fold we're in, even if it's partially open.
                function! JumpTo(jumpcommand)
                        execute a:jumpcommand
                        call FocusLine()
                        Pulse
                endfunction

                function! JumpToInSplit(jumpcommand)
                        execute "normal! \<c-w>v"
                        execute a:jumpcommand
                        Pulse
                endfunction

                function! JumpToTag()
                        call JumpTo("normal! \<c-]>")
                endfunction

                function! JumpToTagInSplit()
                        call JumpToInSplit("normal! \<c-]>")
                endfunction
        "------------------------------------------------------------------------------------------
                nnoremap <C-]> :silent! call JumpToTag()<cr>
                " nnoremap <C-s> :silent! call JumpToTagInSplit()<cr>
        "------------------------------------------------------------------------------------------
"-8Jump-}}}

"-AAA10-MiniPlugIn------------------------------------------------------------------------------------------{{{
        command! ErrorsToggle call ErrorsToggle()
        function! ErrorsToggle() 
                if exists("w:is_error_window")
                        unlet w:is_error_window
                        exec "q"
                else
                        exec "Errors"
                        lopen
                        let w:is_error_window = 1
                endif
        endfunction

        "----------------------------------------------------------------------------------
        "---------------------------------------------------------------------------------

        " Use grep on filenames instead of relying on find's patterns.
        " TODO: How to hook this up with 'gf'?
        command! -nargs=1 FindFiles call FindFiles(<q-args>)
        function! FindFiles(filename)
                let error_file=tempname()
                silent exe '!find . ~
                                        \|grep -Pis "'.a:filename.'" -- -
                                        \| xargs file
                                        \| sed "s/:/:1:/" > '.error_file
                setl errorformat=%f:%l:%m
                exe "cfile ". error_file
                copen
                call delete(error_file)
        endfunction


        "------------------------------------------------------------------------------
        " Remove non visible buffers
        "------------------------------------------------------------------------------
        function! Wipeout()
                "From tabpagebuflist() help, get a list of all buffers in all tabs
                let tablist = []
                for i in range(tabpagenr('$'))
                        call extend(tablist, tabpagebuflist(i + 1))
                endfor

                let nWipeouts = 0
                for i in range(1, bufnr('$'))
                        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
                                "bufno exists AND isn't modified AND isn't in the list of buffers
                                "open in windows and tabs
                                silent exec 'bwipeout' i
                                let nWipeouts = nWipeouts + 1
                        endif
                endfor
                echomsg nWipeouts . ' buffer(s) wiped out'
        endfunction
        "nnoremap ;x :tabcl<cr>:call wipeout()<cr>

"-10Mini-}}}

"-AAA12-Diff------------------------------------------------------------------------------------------------{{{
         " This is from https://github.com/sgeb/vim-diff-fold/ without the extra
         function! DiffFoldLevel()
                 let l:line=getline(v:lnum)
                 if l:line =~# '^\(diff\|Index\)'  " file
                         return '>1'
                 elseif l:line =~# '^\(@@\|\d\)'   " hunk
                         return '>2'
                 elseif l:line =~# '^\*\*\* \d\+,\d\+ \*\*\*\*$' " context: file1
                         return '>2'
                 elseif l:line =~# '^--- \d\+,\d\+ ----$'     " context: file2
                         return '>2'
                 else
                         return '='
                 endif
         endfunction
        "------------------------------------------------------------------------------------------
        augroup ft_diff
                autocmd!
                " autocmd FileType diff setlocal foldmethod=expr
                autocmd FileType diff setlocal foldexpr=DiffFoldLevel()
        augroup END
        " See :help DiffOrig
        command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis \ | wincmd p | diffthis
        " diffoff used to set wrap as a side effect
        command! Diffoff        diffoff | setlocal nowrap
"-12Diff-}}}



"-AAA17-CMDHeight2--Verbose--MAKE-----------------------------------------------------------------------{{{
        "Instead of setting 'verbose' in your vimrc, use autocommands, as follows (for instance)
        if &cmdheight == 1
                set cmdheight=2
        endif
        if &verbose == 0
                augroup late-verbose
                autocmd!
                        autocmd!    VimEnter    *    set verbose=0
                        autocmd!    VimLeave    *    set verbose=0
                augroup END
        endif

        "---------------------------------------------------------
        "-Compiling-C-source-In-Vim
        autocmd! FileType c,cpp
                                \ if empty(glob("[Mm]akefile")) |
                                \   setlocal makeprg=make\ %< |
                                \ endif
        "---------------------------------------------------------

        "---------------------------------------------------------
        "-The %< in our makeprg definition refers to the current file with its extension
        "stripped. We specifically only change the behaviour if no Makefile
        "exists so that we don’t interfere with the normal usage of the :make
        "command.
        "---------------------------------------------------------

"-17-}}}



"-AAA19-PyStart--PythonStart----------------------------------------------------------------------------------------{{{
        function! s:UsingPython3()
                if has('python3')
                        return 1
                endif
                return 0
        endfunction

        let s:using_python3 = s:UsingPython3()
        let s:python_until_eof = s:using_python3 ? "python3 << EOF" : "python << EOF"
        let s:python_command = s:using_python3 ? "py3 " : "py "
        "----------------------------------------------------------------------------------
        "Python runners
        "Python runners
        autocmd! filetype python noremap <buffer> <F4> :w<CR>:!python %<CR>
        autocmd! filetype python inoremap <buffer> <C-F4> <Esc>:w<CR>:!python %<CR>
        autocmd! filetype python noremap <buffer> <S-F4> :w<CR>:!ipython %<CR>
        autocmd! filetype python inoremap <buffer> <S-F4> <Esc>:w<CR>:!ipython %<CR>
        noremap <buffer> <F4> :w<CR>:!python %<CR>
        noremap <buffer> <C-F4> :w<CR>:!clear;python %<CR>
        noremap <buffer> <S-F4> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
        "----------------------------------------------------------------------------------
        augroup python_files 
                " This function detects, based on Python content, whether this is a
                " Django file, which may enabling snippet completion for it
                autocmd!
                function! s:DetectPythonVariant()
                        let n = 1
                        while n < 50 && n < line("$")
                                " check for django
                                if getline(n) =~ 'import\s\+\<django\>' || getline(n) =~ 'from\s\+\<django\>\s\+import'
                                        set ft=python.django
                                        "set syntax=python
                                        return
                                endif
                                let n = n + 1
                        endwhile
                        " go with html
                        set ft=python
                endfunction 
                autocmd! BufNewFile,BufRead *.py call s:DetectPythonVariant()

                "--------------------------------------------------------------------------
                autocmd! filetype python setlocal formatoptions-=t " But disable autowrapping as it is super annoying
                "--------------------------------------------------------------------------
                " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set earlier, as it is important)
                autocmd! filetype python setlocal textwidth=149
                autocmd! filetype python match ErrorMsg '\%>120v.\+'

                "----------------------------------------------------------------------------------
                autocmd! filetype python nnoremap <C-F10> :SyntasticCheck<CR>
                autocmd! filetype python nnoremap <F10>  :LocationToggle<cr>
                "------------------------------------------------- 
                "Automatic insertion of breakpoints
                "autocmd! filetype python nnoremap <buffer> <leader>bp :normal oimport pdb; pdb.set_trace()  # TODO: BREAKPOINT  # noqa<Esc>
                "==========================================================================
                "==JediYes=Mit=C-z===-gj-===pyref-gu-==-PyDoc-macht-mUUUUU-U-U-------------

                        let g:jedi#use_splits_not_buffers = "left"
                        let g:jedi#popup_on_dot = 0
                "------------------------------------------------- 
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
                        let g:jedi#documentation_command = "gj"
                        "==-USA-U-=============================================================
                        "==================================================================
                        "file:///usr/share/doc/python2.7/html/index.html
                        "file:///usr/share/doc/python/python-policy.html/index.html
                        "file:///usr/share/doc/
                        "===========================================================
                        "let g:jedi#auto_vim_configuration = 0
                        "let g:jedi#goto_assignments_command = "<localleader>g"
                        "let g:jedi#goto_definitions_command = "<localleader>d"
                        "let g:jedi#usages_command = "<localleader>u"
                        "let g:jedi#rename_command = "<localleader>r"
                        "=====================================================
                        " let g:jedi#goto_command = "<leader>d"
                        " let g:jedi#goto_assignments_command = "<leader>g"
                        " let g:jedi#goto_definitions_command = ""
                        " let g:jedi#usages_command = "<leader>n"
                        " let g:jedi#rename_command = "<leader>r"
                "==================================================================================
                autocmd! FileType python setlocal omnifunc=jedi#completions
                autocmd! FileType python setlocal completeopt-=preview
                "====================SSS===========================================================
                let g:LanguageClient_serverCommands = {
                                        \ 'python': ['pyls','--log-file', '/tmp/pyls.log'],
                                        \}
                "==================================================================================
                " let g:LanguageClient_serverCommands.python = ['pyls']
                "==================================================================================

                " Map renaming in python
                autocmd FileType python nnoremap <buffer>
                                        \ <leader>v :call LanguageClient_textDocument_re
                "====================SSS===========================================================
                "----------------------------------------------------------------------------------
                autocmd! FileType python :hi IndentGuidesOdd   ctermbg=16
        augroup END
"-19py-}}}



"-AAA21--PLAY--Start--Ag--CtrlP--Unite--CommandT--BigList-400-------------------------------------------------------{{{

        "===SetPLAY1================================================================================
        if executable('ag')
                let g:ag_working_path_mode="r"
                set grepprg=ag\ --nogroup\ --nocolor
                let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
                let g:ctrlp_use_caching = 0
                let g:ackprg = 'ag --vimgrep --smart-case'
                let g:unite_source_grep_command = 'ag'
                let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
                let g:unite_source_grep_recursive_opt = ''
        endif
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


        "====Voide=================================================================================
        "====Voide=================================================================================


        "==========================================================================================
        let g:tq_language=['en', 'ru', 'de', 'cn']
        "-Presidenti, group, Hotel-
        "==Losh====================================================================================
        nnoremap <leader>1 yypVr=
        "I work with HTML often, so I have ,ft mapped to a “fold tag” function:
        nnoremap <leader>ft Vatzf

        "I also work with Nick Sergeant and he likes his CSS properties sorted, so here
        nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

"-AAA21--PLAY--STOP--BigList800-}}}


        "--------------------------------------------------
        " inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
        " inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>
        "--------------------------------------------------
        "===AG=====================================================================================
        let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'

        "===============================================================================================================
        " highlight TechWordsToAvoid ctermbg=red ctermfg=white
        " match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        " autocmd! BufWinEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        " autocmd! InsertEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        " autocmd! InsertLeave * match TechWordsToAvoid /\cobviously\|basically\|simply\|of course\|clearly\|just\|everyone knows\|however,\|so,\|easy\|assuming\|intuitively\|however/
        " autocmd! BufWinLeave * call clearmatches()
        "===============================================================================================================
        "python print_pyhel()
        function! InsertCountry()
                python print("Hello from Python source code!")
                python print_pyhel()
        endfunction
        command! -nargs=0 InsertCountry call InsertCountry()


        " I have found it helpful to print all Vim activity to a file by starting Vim with the -V option:
        " vim -V12log
        " This provides the maximum verbosity (level 12) and outputs it to the file log.
        " You can then perform some Vim actions which you know to be slow, and then see
        " which functions/mappings are being called internally.


        " function! SomeExample()
        "         python << endPython

        "                 def example():
        "                         print("Python stuff")

        "                 example()

        "         endPython
        " endfunction


"===============================================================================================================
"===============================================================================================================
"===============================================================================================================
" Vim comments start with a double quote.
" Function definition is VimL. We can mix VimL and Python in
" function definition.
" We start the python code like the next line.
function! Reddit()

python << EOF
# the vim module contains everything we need to interface with vim from
# python. We need urllib2 for the web service consumer.
import vim, urllib2
import json

TIMEOUT = 20
URL = "http://reddit.com/.json"

try:
    # Get the posts and parse the json response
    response = urllib2.urlopen(URL, None, TIMEOUT).read()
    json_response = json.loads(response)

    posts = json_response.get("data", "").get("children", "")

    # vim.current.buffer is the current buffer. It's list-like object.
    # each line is an item in the list. We can loop through them delete
    # them, alter them etc.
    # Here we delete all lines in the current buffer
    del vim.current.buffer[:]

    # Here we append some lines above. Aesthetics.
    vim.current.buffer[0] = 80*"-"

    for post in posts:
        # In the next few lines, we get the post details
        post_data = post.get("data", {})
        up = post_data.get("ups", 0)
        down = post_data.get("downs", 0)
        title = post_data.get("title", "NO TITLE").encode("utf-8")
        score = post_data.get("score", 0)
        permalink = post_data.get("permalink").encode("utf-8")
        url = post_data.get("url").encode("utf-8")
        comments = post_data.get("num_comments")

        # And here we append line by line to the buffer.
        # First the upvotes
        vim.current.buffer.append("↑ %s"%up)
        # Then the title and the url
        vim.current.buffer.append("    %s [%s]"%(title, url,))
        # Then the downvotes and number of comments
        vim.current.buffer.append("↓ %s    | comments: %s [%s]"%(down, comments, permalink,))
        # And last we append some "-" for visual appeal.
        vim.current.buffer.append(80*"-")

except Exception, e:
    print e

EOF
" Here the python code is closed. We can continue writing VimL or python again.
endfunction
command! -nargs=0 Reddit call Reddit()
"===============================================================================================================
"===============================================================================================================
"===============================================================================================================
