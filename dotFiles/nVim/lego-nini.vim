
"-AAA3-UnPlug-nPlugStart------------------------------------------------------------------------------------{{{
call plug#begin()
        Plug 'c9s/helper.vim'
        Plug 'c9s/treemenu.vim'
        Plug 'nixprime/cpsm'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
        Plug 'tomtom/tlib_vim'       
        "--------------------------------------------------------------------------------- 
        "Plug 'Shougo/vimshell.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'vim-jp/vital.vim'
        Plug 'lambdalisue/vital-Whisky/'
        Plug 'prabirshrestha/async.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'lambdalisue/gina.vim'
        Plug 'lambdalisue/vim-gita'
        Plug 'lambdalisue/suda.vim'

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
        Plug 'scrooloose/syntastic'
        "------------------------------------------------------------------------------------------
        Plug 'nvie/vim-flake8'
        "------------------------------------------------------------------------------------------
        Plug 'easymotion/vim-easymotion'
                let g:EasyMotion_smartcase = 1
                let g:EasyMotion_do_mapping = 0 "-Disable default mappings
                nmap <LocalLeader><LocalLeader> <Plug>(easymotion-overwin-w)
        "------------------------------------------------------------------------------------------
        Plug 'haya14busa/vim-easyoperator-line'
                xmap <LocalLeader>l <Plug>(easyoperator-line-select)
        "--------------------------------------------------------------------------------- 
        Plug 'mattboehm/vim-accordion'
                let g:accordion_mode="v"
        Plug 'vim-scripts/SpellCheck'
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
        Plug 'skywind3000/vim-preview'
                "VSSplit
        "--------------------------------------------------------------------------------- 
        Plug 'kshenoy/vim-signature'
                " :SignatureListMarkers         : List all markers
                " :SignatureListMarkers 1       : List only the '!' marker
                " :SignatureListMarkers @       : List only the '@' marker
                " :SignatureListMarkers 0, 2    : List only ) marker with 2 lines of context
                " :SignatureListMarkers '', 2   : List all markers with 2 lines of context
                " :SignatureListMarkers '!@', 2 : List only the '!' and '@' markers and show
        "--------------------------------------------------------------------------------- 
        Plug 'krisajenkins/vim-pipe'
                autocmd BufNewFile,BufReadPost *.json setlocal filetype=javascript.json
                let b:vimpipe_command="lynx -dump -stdin"
                let b:vimpipe_command='jslint <(cat)'
                let b:vimpipe_command="python -m json.tool"
                let b:vimpipe_command="multimarkdown"
                " let b:vimpipe_filetype="html"
                " g:vimpipe_invoke_map    <LocalLeader>r
                " g:vimpipe_close_map     <LocalLeader>p

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
        "--------------------------------------------------------------------------------- 
        Plug 'osyo-manga/vim-brightest'
                let g:brightest#highlight = { "group" : "Define" }
        "---------------------------------------------------------------------------------- 
        Plug 'brooth/far.vim'
        Plug 'aghareza/vim-gitgrep'
        Plug 'motemen/git-vim'
        Plug 'c9s/hypergit.vim'
                " <leader>G    toggle hypergit menu
                " <leader>ci   commit current file changes
                " <leader>ca   commit all changes
                " <leader>ga   add file to git repository
                " <leader>gb   branch manager buffer
                " <leader>gs   status manager buffer
                " <leader>gh   stash manager buffer
                " :GitCommit
                " :GitCommitAll
                " :GitCommitAmend
                " :GitStatus
                " :GitStash
                " :GitPush
                " :GitPull
        "--------------------------------------------------------------------------------- 
        Plug 'machakann/vim-highlightedyank'
                let g:highlightedyank_highlight_duration = -1
        "----------------------------------------------------------------------------------
        Plug 'kana/vim-textobj-user'
        Plug 'gilligan/textobj-gitgutter'
                vmap ih <Plug>(textobj-gitgutter-i)
        "----------------------------------------------------------------------------------
        Plug 'kana/vim-textobj-user'
        Plug 'kana/vim-textobj-diff'
        Plug 'reedes/vim-textobj-sentence'
        Plug 'kana/vim-textobj-function'
        Plug 'Julian/vim-textobj-brace'
        Plug 'glts/vim-textobj-indblock'
        Plug 'beloglazov/vim-textobj-quotes'
        "---gi-----------------------------------------------------------------------------
        Plug 'bps/vim-textobj-python'
        "---gi-----------------------------------------------------------------------------
        Plug 'terryma/vim-expand-region'
                 "-Default-settings. 
                 let g:expand_region_text_objects = {
                                         \ 'iw'  :0,
                                         \ 'iW'  :0,
                                         \ 'i"'  :0,
                                         \ 'i''' :1,
                                         \ 'ib'  :1,
                                         \ 'i)'  :1,
                                         \ 'iB'  :1, 
                                         \ 'i}'  :1, 
                                         \ 'i]'  :1,
                                         \ 'if'  :1,
                                         \ 'io'  :1,
                                         \ 'ip'  :1,
                                         \ 'ih'  :1
                                         \ }
        "----------------------------------------------------------------------------------
        "----------------------------------------------------------------------------------
        nmap <m-1> <esc>viq<left> 
                nmap <m-q> <esc>vaq<left> 
                        nmap <m-0> <esc>vab<left> 
                                nmap <m-3> <esc>viB 
                                        nmap <m-i> <esc>vio 
                                        nmap <m-9> <esc>vif 
                        nmap <m-8> <esc>vaf 
                nmap <m-7> <esc>vip 
        nmap <m-6> <esc>vih 
        "---------------------------------------------------------------------------------- 
        "---------------------------------------------------------------------------------- 
        " ci'q<<b>>({"  - 'change' insede "})</<b>>q'
        "-???- onoremap a i( , da ???-
        " vap / v2ap 
        " diw / daw 
        "---------------------------------------------------------------------------------- 
        inoremap <F1> <ESC>
        nnoremap <F1> <ESC>
        vnoremap <F1> <ESC>
        "---------------------------------------------------------------------------------- 
        nnoremap <buffer> <F2> <Esc>:help <C-r><C-w><CR>
        nnoremap <buffer> <C-F2> <Esc>:helpgrep <C-r><C-w><CR>
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
        command! LocationToggle call LocationToggle()
        function! LocationToggle()
                if exists("w:is_location_window")
                        unlet w:is_location_window
                        exec "q"
                else
                        lopen
                        let w:is_location_window = 1
                endif
        endfunction

        nnoremap <F8> :LocationToggle<cr>
                nnoremap <LocalLeader>n :lnext<cr>zvzz
                nnoremap <LocalLeader>b :lprev<cr>zvzz
        "----------------------------------------------------------------------------------
        function! ToggleQuickFix()
                if exists("g:qwindow")
                        cclose
                        execute "wincmd p"
                        unlet g:qwindow
                else
                        try
                                copen
                                execute "wincmd J"
                                let g:qwindow = 1
                        catch
                                echo "Error!"
                        endtry
                endif
        endfunction

        "-Open-Quickfix-window-automatically-----------------------------------------------
        autocmd QuickFixCmdPost grep cwindow
        autocmd! vimrc QuickfixCmdPost [^l]* nested copen | wincmd p
        autocmd! vimrc QuickfixCmdPost l* nested lopen | wincmd p
        "----------------------------------------------------------------------------------
        nnoremap <F9> :call ToggleQuickFix()<CR>
                nnoremap <Leader>b :cprev<cr>zvzz
                nnoremap <Leader>n :cnext<cr>zvzz
        "----------------------------------------------------------------------------------
        "----------------------------------------------------------------------------------
        Plug 'adriaanzon/vim-textobj-matchit'
        "`am` and `im` :if-ifend , for-endfore ..
        Plug 'romainl/vim-qf'
        Plug 'yssl/QFEnter'
        Plug 'sk1418/QFGrep'
        Plug 'AndrewRadev/qftools.vim'
                let g:qf_mapping_ack_style = 1
                let g:qf_window_bottom = 0
                let g:qf_auto_open_loclist = 0
                let g:qf_max_height = 8
                let g:qf_nowrap = 1
        "----------------------------------------------------------------------------------
        "Plug 'gastonsimone/vim-dokumentary/'
                "??? apt-get install dictd dict-gcide dict
        "--------------------------------------------------------------------------------- 
        Plug 'vim-scripts/mako.vim'
                "g:mako_detect_lang_from_ext = 1
        Plug 'sophacles/vim-bundle-mako'
        Plug 'aperezdc/vim-template'
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
        Plug 'Chun-Yang/vim-action-ag'
        Plug 'rking/ag.vim'
        Plug 'jesseleite/vim-agriculture'
        "--------------------------------------
        "Plug 'vim-scripts/ReplaceWithRegister'
        "-------------------------------------------------------------------------
        "-------------------------------------------------------------------------
        "Plug 'neomake/neomake'
        "Plug 'Rykka/trans.vim'
        Plug 'ron89/thesaurus_query.vim'
        "-TODO-
        "Plug 'roxma/nvim-completion-manager'
        "--------------------------------------------------------------------------------- 
        Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
        "Plug 'Shougo/neocomplete.vim'
        "--------------------------------------------------------------------------------- 
        Plug 'ervandew/supertab'
        "--------------------------------------------------------------------------------- 
        Plug 'honza/vim-snippets'
        Plug 'SirVer/ultisnips'
        Plug 'garbas/vim-snipmate'
        Plug 'Shougo/neosnippet.vim'
        Plug 'Shougo/neosnippet-snippets'
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
        Plug 'MarcWeber/vim-addon-mw-utils'
        "--------------------------------------------------------------------------------- 
        Plug 'Shougo/neomru.vim'
        "--------------------------------------
        Plug 'kien/ctrlp.vim'
        Plug 'wincent/command-t'

                " nmap <Leader>f :GFiles<CR>
                " nmap <Leader>F :Files<CR>
                " nmap <Leader>t :BTags<CR>
                " nmap <Leader>T :Tags<CR>
                " nmap <Leader>m :Methods<CR>
                " nmap <Leader>b :Buffers<CR>
                " nmap <Leader>l :BLines<CR>
                " nmap <Leader>L :Lines<CR>
                " nmap <Leader>h :History<CR>
                " nmap <Leader>H :GHistory<CR>
                " nmap <Leader>: :History:<CR>
                " nmap <Leader>M :Maps<CR>
                " nmap <Leader>C :Commands<CR>
                " nmap <Leader>' :Marks<CR>
                " nmap <Leader>s :Filetypes<CR>
                " nmap <Leader>S :Snippets<CR>
                " nmap <Leader><Leader>h :Helptags!<CR>
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
        Plug 'roxma/python-support.nvim'
                let g:python_support_python2_require = 0
                let g:python_support_python3_require = 0
        "--------------------------------------------------------------------------------- 
        function! DoRemote(arg)
                UpdateRemotePlugins
        endfunction
        "--------------------------------------------------------------------------------- 
        Plug 'zyedidia/vim-snake'
        Plug 'tpope/vim-dispatch'
        Plug 'neovim/pynvim'
        "Plug '5t111111/nvim-example-python3-plugin', { 'do': function('DoRemote') }

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

"-AAA5-Ulty--NeoSnippet--Ctrl-B--Expander0------------------------------------------------------------------{{{
        "-!!!-Insert completion-!!!---------
        silent! set complete& completeopt=menu infercase pumheight=10 noshowfulltag shortmess+=c
        "suppress intro message because the above makes it look bad
        set shortmess+=I
        "--------------------------------------------
        "------------------------------------------------------------------------------------------
        "inoremap <silent> <C-]> <C-x><C-]>
        "inoremap <silent> <C-u> <C-x><C-u>
        "----------------------------------------------------
        let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
        let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
        let g:SuperTabContextDiscoverDiscovery =
                \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
        "----------------------------------------------------
        let g:SuperTabContextDefaultCompletionType = "<c-n>"
        let g:SuperTabDefaultCompletionType = "<c-n>"
        let g:SuperTabLongestHighlight = 1
        let g:SuperTabCrMapping = 1
        let g:SuperTabClosePreviewOnPopupClose = 1

        "------------------------------------------------------------------------------------------
        function! JumpToCSS()
                let id_pos = searchpos("id", "nb", line('.'))[1]
                let class_pos = searchpos("class", "nb", line('.'))[1]

                if class_pos > 0 || id_pos > 0
                        if class_pos < id_pos
                                execute ":vim '#".expand('<cword>')."' **/*.less"
                        elseif class_pos > id_pos
                                execute ":vim '.".expand('<cword>')."' **/*.less"
                        endif
                endif
        endfunction

        "nnoremap <leader>e :call JumpToCSS()<CR>zz
        "------------------------------------------------------------------------------------------
        imap <expr> <c-z> TabComplete()
        smap <expr> <c-z> TabComplete()
        xmap <expr> <c-z> TabComplete()

        function! TabComplete()
                if neosnippet#expandable_or_jumpable()
                        return "\<Plug>(neosnippet_expand_or_jump)"
                elseif &filetype =~ 'html\|css' && IsEmmetExpandable()
                        return "\<plug>(emmet-expand-abbr)"
                elseif pumvisible()
                        return "\<c-n>"
                else
                        return "\<tab>"
                endif
        endfunction
        "------------------------------------------------------------------
        " function! TabComplete()
        " if neosnippet#expandable_or_jumpable()
        "         return "\<Plug>(neosnippet_expand_or_jump)"
        "         elseif &filetype =~ 'html\|css' && emmet#isExpandable()
        "         return "\<plug>(emmet-expand-abbr)"
        "         elseif pumvisible()
        "         return "\<c-n>"
        " endif
        " endfunction

        "------------------------------------------------------------------------------------------
        function! IsEmmetExpandable()
                if !emmet#isExpandable() | return 0 | endif
                if &filetype =~ 'css' | return 1 | endif

                let expr = matchstr(getline('.')[:col('.')], '\(\S\+\)$')
                return expr =~ '[.#>+*]' || index(s:emmetElements, expr) >= 0
        endfunction

        let s:emmetElements = ['a', 'abbr', 'acronym', 'address', 'applet', 'area', 'article', 'aside', 'audio', 'b', 'base', 'basefont', 'bdi', 'bdo', 'big', 'blockquote', 'body', 'br', 'button', 'canvas', 'caption', 'center', 'cite', 'code', 'col', 'colgroup', 'datalist', 'dd', 'del', 'details', 'dfn', 'dialog', 'dir', 'div', 'dl', 'dt', 'em', 'embed', 'fieldset', 'figcaption', 'figure', 'font', 'footer', 'form', 'frame', 'frameset', 'h1', 'head', 'header', 'hr', 'html', 'i', 'iframe', 'img', 'input', 'ins', 'kbd', 'keygen', 'label', 'legend', 'li', 'link', 'main', 'map', 'mark', 'menu', 'menuitem', 'meta', 'meter', 'nav', 'noframes', 'noscript', 'object', 'ol', 'optgroup', 'option', 'output', 'p', 'param', 'pre', 'progress', 'q', 'rp', 'rt', 'ruby', 's', 'samp', 'script', 'section', 'select', 'small', 'source', 'span', 'strike', 'strong', 'style', 'sub', 'summary', 'sup', 'table', 'tbody', 'td', 'textarea', 'tfoot', 'th', 'thead', 'time', 'title', 'tr', 'track', 'tt', 'u', 'ul', 'var', 'video', 'wbr']
        \ + ['emb', 'btn', 'sty', 'dlg', 'fst', 'fig', 'leg', 'tarea', 'hdr', 'cmd', 'colg', 'art', 'fset', 'src', 'prog', 'bq', 'kg', 'adr' , 'cap', 'datag', 'datal', 'sect', 'str', 'obj', 'ftr', 'optg', 'ifr', 'out', 'det', 'acr', 'opt']

        "------------------------------------------------------------------------------------------
        " imap <leader><tab> <C-x><C-o>
        "==========================================================================================
        set runtimepath+=~/.config/nvim/plugged/neosnippet.vim/
        set runtimepath+=~/.config/nvim/plugged/neosnippet-snippets/
        "==========================================================================================
        set pumheight=12
        hi Pmenu  ctermfg=202 ctermbg=14
        hi PmenuSbar   ctermfg=11 ctermbg=5 cterm=NONE
        hi PmenuThumb  ctermfg=12 ctermbg=2 cterm=NONE
"-5-Complete-}}}
"-AAA6--GitGutter-------------------------------------------------------------------------------------------{{{
        let g:gitgutter_signs = 1
        let g:gitgutter_max_signs = 2000
        "------------------------------------------------------------------------------------------
        highlight GitGutterAdd ctermfg=green
        highlight GitGutterChange ctermfg=yellow
        highlight GitGutterDelete ctermfg=red
        highlight GitGutterChangeDelete ctermfg=yellow
        "------------------------------------------------------------------------------------------
        if exists("*gitgutter#highlight#define_highlights")
                " let vim-gitgutter know we changed the SignColumn colors!
                call gitgutter#highlight#define_highlights()
        endif
"-6-}}}
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

        "-------------------------------------------------------------------------
        "Clear hlsearch and set nopaste
        nnoremap <silent> <Esc><Esc> :<C-u>set nopaste<CR>:nohlsearch<CR>
        "-------------------------------------------------------------------------
        nmap <silent> n nzz
        nmap <silent> N Nzz
        nmap <silent> g* g*zz
        nmap <silent> g# g#zz
        " Super useful! From an idea by Michael Naumann
        vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
        vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
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


"-AAA16-Wildmenu--------------------------------------------------------------------------------------------{{{
        " More useful command-line completion
        au! FocusLost * :silent! wall     "Save when losing focus
        set wildmenu
        set wildmode=list:longest
        set wildmode=list:full
        set wildignore+=.hg,.git,.svn                    " Version control
        set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
        set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
        set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
        set wildignore+=*.spl                            " compiled spelling word lists
        set wildignore+=*.sw?                            " Vim swap files
        set wildignore+=*.DS_Store                       " OSX bullshit
        set wildignore+=*.luac                           " Lua byte code
        set wildignore+=migrations                       " Django migrations
        set wildignore+=*.pyc                            " Python byte code
        set wildignore+=*.orig                           " Merge resolution files
        set wildignore+=*.fasl                           " Lisp FASLs
        set wildignore+=*.dx64fsl                        " CCL
        set wildignore+=classes
        set wildignore+=lib
        "silent! set wildchar=9 nowildmenu wildmode=list:longest wildoptions= wildignorecase cedit=<C-k>
"-16-}}}
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

"-AAA18-SyntasticCheck--------------------------------------------------------------------------------------{{{
        let g:syntastic_always_populate_loc_list = 1
        "let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        ""let g:syntastic_java_checkers = ['checkstyle']
        ""let g:syntastic_java_javac_executable = '~/.vim/plugged/syntastic/syntax_checkers/java/javac.vim'
        let g:systastic_python_checkers = ['pylint', 'python']
        let g:syntastic_mode_map = {'mode': 'active'}
        let g:syntastic_python_pylint_quiet_messages = {}
        let g:syntastic_enable_signs = 1
        "let g:syntastic_auto_jump = 1
        let g:syntastic_enable_highlighting = 1
        "let g:syntastic_echo_current_error  = 1
        let g:syntastic_javascript_checkers=['jshint']
        let g:syntastic_php_checkers=['php']
        let g:syntastic_css_checkers=['csslint']
        let g:syntastic_python_checkers = ['flake8']
        let g:syntastic_error_symbol = '⚡'
        let g:syntastic_warning_symbol = '⚠'
        "let g:syntastic_check_on_w = 1

        " let g:syntastic_python_checkers=['python', 'flake8']
        " let g:syntastic_python_flake8_post_args='--ignore=W391'
        " For forcing the use of flake8, pyflakes, or pylint set
        " let g:syntastic_python_checkers = ['pyflakes']

"-18-}}}


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

        "-Fix window position of help------------------------------------------------------
        au! FileType vim,help nnoremap M :exec "help" expand("<cword>")<CR>
        "----------------------------------------------------------------------------------


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
        "===SetPLAY2===============================================================================
        " In Neovim, you can set up fzf window using a Vim command
        let g:fzf_layout = { 'window': 'enew' }
        let g:fzf_layout = { 'window': '-tabnew' }
        let g:fzf_layout = { 'window': '10split enew' }

        "let g:fzf_history_dir = '~/.local/share/fzf-history'


        let g:fzf_colors =
                                \ { 'fg':      ['fg', 'Comment'],
                                \ 'bg':      ['bg', 'Normal'],
                                \ 'hl':      ['fg', 'Comment'],
                                \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                                \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn', 'Normal'],
                                \ 'hl+':     ['fg', 'Statement'],
                                \ 'info':    ['fg', 'PreProc'],
                                \ 'border':  ['fg', 'Ignore'],
                                \ 'prompt':  ['fg', 'Conditional'],
                                \ 'pointer': ['fg', 'Exception'],
                                \ 'marker':  ['fg', 'Keyword'],
                                \ 'spinner': ['fg', 'Comment'],
                                \ 'header':  ['fg', 'Comment'] }

        "==========================================================================================
        function! s:fzf_statusline()
                highlight fzf1 ctermfg=161 ctermbg=2
                highlight fzf2 ctermfg=23 ctermbg=9
                highlight fzf3 ctermfg=237 ctermbg=13
                setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
        endfunction
        autocmd! User FzfStatusLine call <SID>fzf_statusline()
        "---------------------Ctrl-x--Lynx---------------------------------------------------------
        let g:fzf_command_prefix = 'Fzf'
        let g:fzf_action = {
                                \ 'ctrl-t': 'tab split',
                                \ 'ctrl-x': ':Lynx',
                                \ 'ctrl-v': 'vsplit' }
        "------------------------------------------------------------------------------------------
        " Mapping selecting mappings
        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)

        imap <expr><C-j> fzf#vim#complete#word({'left': '15%'})
        imap <C-l> <plug>(fzf-complete-line)
        "********NiceNice*****************************************************************
        command! FZFTag if !empty(tagfiles()) | call fzf#run({
        \ 'source': "cat " . join(tagfiles()) . ' | grep -P "' . expand('%:t') . '"',
        \ 'sink': function('<sid>tag_handler'),
        \ 'options': '+m --with-nth=1',
        \ 'down': '50%'
        \ }) | else | echo 'No tags' | endif

        function! s:tag_handler(tag)
            if !empty(a:tag)
                let token = split(split(a:tag, '\t')[2],';"')[0]
                let m = &magic
                setlocal nomagic
                execute token
                if m
                    setlocal magic
                endif
            endif
        endfunction
        nnoremap <silent> <Leader>t :FZFTagA<cr>
        "**********************************************************************************
        "-[Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1
        "-[[B]Commits] Customize the options used by 'git log':
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
        "-[Tags] Command to generate tags file
        let g:fzf_tags_command = 'ctags -R'
        "-[Commands] --expect expression for directly executing the command
        let g:fzf_commands_expect = 'alt-enter,ctrl-x'
        "---???------------------------------------------------------------------------------------
        let generate_tags=1

        "===SetPLAY3===============================================================================
        call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
                                \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))

        "------------------------------------------------------------------------------------------
        call unite#filters#sorter_default#use(['sorter_rank'])
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        call unite#filters#matcher_default#use(['matcher_fzf'])

        "===SetPLAY5===============================================================================
        "   - :Unite [{options}] {source's'}
        "      - parameters of source
        "          - e.g. file:foo:bar -- here ['foo', 'bar'] is parameters
        "          - e.g. file:foo\:bar -- use \ to escape
        "          - e.g. file:foo::bar -- ['foo', '', 'bar']
        "   - press 'I' to search after prompt '>'
        "       - *word,
        "       - **/foo (directory recursively)
        "       - foo bar (AND)
        "       - foo|bar (OR)
        "       - foo !bar (negative)
        ":UniteResume, :UniteBookmarkAdd,
        let g:ctrlp_cmd = 'CtrlPMRU'
        let g:ctrlp_extensions = ['tag']
        let g:ctrlp_match_window_bottom = 0
        let g:ctrlp_match_window_reversed = 0
        let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
        let g:ctrlp_dotfiles = 0
        let g:ctrlp_switch_buffer = 0
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_map = '<leader>p'
        let g:ctrlp_open_new_file = 'R'
        "let g:ctrlp_working_path_mode = 'ar'
        "===SetPLAY6===============================================================================
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
        "------------------------------Ulti-Expander-Unite----------------------------------
        function! UltiSnipsCallUnite()
                Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
                return ''
        endfunction
        "===PLAY1==BliZZ==F3+(C-q)=================================================================
                inoremap <F3> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
                let g:UltiSnipsExpandTrigger="<tab>"
                let g:UltiSnipsJumpForwardTrigger="<C-q>"
                let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
        "==========================================================================================
        "------------------------------------------------------------------
        "Tell Neosnippet about the other snippets
        " let g:neosnippet#snippets_directory = '~/.vim/snippets'    
        "-???-let g:neosnippet#enable_snipmate_compatibility = 1
        let g:neosnippet#snippets_directory = "~/.config/nvim/plugged/neosnippet-snippets/neosnippets/"
        "===PLAY2==BLiZZ==(C-s)+(C-b)==============================================================
                imap <C-s>    <Plug>(neosnippet_start_unite_snippet)
                imap <C-b>    <Plug>(neosnippet_expand_or_jump)
                smap <C-b>    <Plug>(neosnippet_expand_or_jump)
                xmap <C-b>    <Plug>(neosnippet_expand_target)
                nnoremap <Leader>y :<C-u>Unite -buffer-name=neosnippet neosnippet<CR>
        "==========================================================================================

        "==========================================================================================

        "===PLAY4===SUCHE========************======================================================
                nnoremap <Leader>l :lgrep -R <cword> .<cr>
                nnoremap <Leader>g :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
                nnoremap <Leader>a :Ack <cword> .<cr>
                nnoremap ? :Ack
                nmap <Leader>6 :Rg <cword> .<cr>
                nmap <Leader>7 :Ag <cword> .<cr>
                nmap <Leader>8 <Plug>AgRawSearch <cword> .<cr>
                nmap <Leader>/ <Plug>AgRawSearch
                "-----------------------------------------------------------------"
                "  s - open entry in a new horizontal window                      "
                "  v - open entry in a new vertical window                        "
                "  t - open entry in a new tab                                    "
                "  o - open entry and come back                                   "
                "  O - open entry and close the location/quickfix window          "
                "  p - open entry in a preview window                             "
                "-----------------------------------------------------------------"
                " :Keep                                                           "
                " :Reject                                                         "
                " :Restore                                                        "
                " :Doline s/^/--                                                  "
                " :SaveList                                                       "
                " :SaveList curlist                                               "
                " :SaveListAdd curlist                                            "
                " :LoadList curlist                                               "
                " :ListLists                                                      "
                "-----------------------------------------------------------------"
        "===PLAY5=================================================================================
                nnoremap ;p :CtrlP<cr>
                nnoremap ;m :CtrlPMRU<cr>
        "===PLAY6==================================================================================
                nnoremap ;h :CommandTHelp<cr>
                nnoremap ;b :CommandTBuffer<cr>
                let g:CommandTCancelMap=['<C-x>', '<C-c>']
                "------------------------------------------------------------------------------
                " <Leader>t provide fast, intuitive mechanism for opening files and buffers
                " <BS> <Del> -- delete
                " <Left> <C-h> -- move left.
                " <Right> <C-l> -- move right
                " <C-a> -- move to the start.
                " <C-e> -- move to the end.
                " <C-u> -- clear the contents of the prompt.
                " <Tab> -- switch focus between the file listing and prompt.
                "----------------------------------------------------------------------
                " <C-CR> <C-s> -- split open
                " <C-v> -- vsplit
                " <C-t> -- tab
                " <C-j> <C-n> <Down> -- select next file in file listing.
                " <C-k> <C-p> <Up> -- select previous file in file listing.
                " <Esc> <C-c> -- cancel (dismisses file listing)

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
        noremap <S-j> :PreviewScroll -1<cr>
        noremap <S-l> :PreviewScroll +1<cr>
        "------------------------------------------------------------------------------------------ 
        fun! ScrollOtherWindow(dir)
                if a:dir == "down"
                        let move = "\<C-E>"
                elseif a:dir == "up"
                        let move = "\<C-Y>"
                endif
                exec "normal \<C-W>p" . move . "\<C-W>p"
        endfun
        nmap <silent> <C-M-Down> :call ScrollOtherWindow("down")<CR>
        nmap <silent> <C-M-Up> :call ScrollOtherWindow("up")<CR>
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
