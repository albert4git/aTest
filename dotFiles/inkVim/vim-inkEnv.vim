        " => Turn persistent undo on
        set nobackup
        set nowb
        set noswapfile
        set nowritebackup

        set undodir=~/.vim/undoDir/     " undo files
        set backupdir=~/.vim/backup/ " backups
        set directory=~/.vim/swap/   " swap files

        " Make those folders automatically if they don't already exist.
        if !isdirectory(expand(&undodir))
                call mkdir(expand(&undodir), "p")
        endif
        if !isdirectory(expand(&backupdir))
                call mkdir(expand(&backupdir), "p")
        endif
        if !isdirectory(expand(&directory))
                call mkdir(expand(&directory), "p")
        endif

        if has('persistent_undo')
                set undofile                " So is persistent undo ...
                set undolevels=2000         " Maximum number of changes that can be undo
                set undoreload=20000        " Maximum number lines to save for undo on
                try
                        set undodir=~/.vim/undoDir/
                catch
                endtry
        endif


        "------:Errors, :SyntasticToggleMode, :SyntasticCheck,-------------"
        " Syntastic {{{ :w saving to check. or daemon automatic check.
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_quiet_messages = {'level': 'warnings'}
        let g:syntastic_check_on_open = 0 " check when buffers first loaded/save
        let g:syntastic_echo_current_error = 1 " error associated with lines
        let g:syntastic_enable_signs = 1 " :sign interface to mark syntax errors
        let g:syntastic_error_symbol = '✗'
        let g:syntastic_style_error_symbol = 'S✗'
        let g:syntastic_warning_symbol = '⚠'
        let g:syntastic_style_warning_symbol = 'S⚠'
        let g:syntastic_enable_balloons = 1     " mouse hover, need '+balloon_eval'
        let g:syntastic_enable_highlighting = 1 " syntax highlighting to mark errors
        let g:syntastic_auto_jump = 0           " jump to first detected error
        let g:syntastic_auto_loc_list = 2       " 0/1/2: auto open/close error window
        let g:syntastic_loc_list_height = 10
        let g:syntastic_c_checker = "gcc"
        let g:syntastic_c_compiler = "gcc"      " gcc/clang
        let g:syntastic_c_check_header = 1      " check header files
        let g:syntastic_c_no_include_search = 0
        let g:syntastic_c_include_dirs = [ 'includes', 'headers', ]
        let g:syntastic_c_auto_refresh_includes = 1
        let g:syntastic_c_remove_include_errors = 1
        let g:syntastic_c_compiler_options = ' -ansi'
        let g:syntastic_cpp_compiler = 'g++'    " clang++, g++
        let g:syntastic_cpp_check_header = 1    " check header files
        let g:syntastic_cp_no_include_search = 0
        let g:syntastic_cpp_include_dirs = [ 'includes', 'headers', ]
        let g:syntastic_cpp_auto_refresh_includes = 1
        let g:syntastic_cpp_remove_include_errors = 1
        " alternately, set buffer local variable.
        let g:syntastic_cpp_compiler_options = ' -std=c++0x'
        " let b:syntastic_cpp_cflags = ' -I/usr/include/libsoup-2.4'
        " add additional compiler options.
        " let g:syntastic_cpp_config_file = '.config'
        " default: '.syntastic_cpp_config'
        " let g:syntastic_cpp_errorformat = ''
        " use this variable to override the default error format.
        " let g:syntastic_javascript_checker = "jslint"
        " let g:syntastic_csslint_options = "--warning=none" " disable warning
        " }}}



        " clang_complete {{{ use of clang to complete in C/C++.
        " let g:clang_user_options = '-std=gnu++0x -include malloc.h -fms-extensions -fgnu-runtime'
        " let g:clang_user_options = '-std=c++11 -stdlib=libc++'
        " you can use g:ClangUpdateQuickFix() with a mapping to do this
        " disable with 0 to solve neocomplcache problem
        " clang_complete, snipmate, ultisnips
        " :h clang_complete.txt
        let g:clang_auto_select = 0 " 0/1/2 auto select first entry in popup menu
        let g:clang_complete_auto = 1 " auto complete after -> . ::
        let g:clang_complete_copen = 1 " 1: open quickfix window on error
        let g:clang_hl_errors = 1 " highlight warnings and errors
        let g:clang_periodic_quickfix = 0 " periodically update quickfix
        let g:clang_snippets = 1
        let g:clang_snippets_engine = "ultisnips"
        let g:clang_conceal_snippets = 1
        let g:clang_trailing_placeholder = 0 " for clang_complete snippet engine
        let g:clang_close_preview = 0 " auto close preview window after completion
        let g:clang_exec = "clang" " name or path of clang executable.
        let g:clang_user_options =
                                \ '-std=gnu99' .
                                \ '-stdlib=libc' .
                                \ '-I /usr/include'
        let g:clang_auto_user_options = "path, .clang_complete, clang"
        let g:clang_use_library = 1
        let g:clang_library_path = "/usr/lib/"
        let g:clang_sort_algo = "priority"
        let g:clang_complete_macros = 1
        let g:clang_complete_patterns = 1
        " }}}


        " neocomplcache-clang {{{ clang_complete for neocomplcache.
        " let g:neocomplcache_clang_user_options = '-std=c++11 -stdlib=libc++'
        "clang.so, clang.dll, libclang.dylib
        let g:neocomplcache_clang_use_library = 1 " use clang library
        let g:neocomplcache_clang_library_path = '/usr/lib/'
        let g:neocomplcache_clang_executable_path = '/usr/bin/clang'
        let g:neocomplcache_clang_macros = 1   " -code-completion-macros option
        let g:neocomplcache_clang_patterns = 1 " -code-completion-patterns option
        let g:neocomplcache_clang_auto_options = "path, .clang_complete, clang"
        let g:neocomplcache_clang_user_options = '-std=gnu99 -stdlib=libc'
        let g:neocomplcache_clang_debug = 0 " enable debug message.
        " }}}

        " Wildmenu completion {{{
        " Save when losing focus
        au FocusLost * :silent! wall
        set completeopt=longest,menuone

        let g:commentChar = {
                                \ 'vim': '"',
                                \ 'c': '//',
                                \ 'cpp': '//',
                                \ 'sh': '#',
                                \ 'python': '#'
                                \ }


        " Command line
        "silent! set wildchar=9 nowildmenu wildmode=list:longest wildoptions= wildignorecase cedit=<C-k>
        silent! set wildignore=*.~,*.?~,*.o,*.sw?,*.bak,*.hi,*.pyc,*.out,*.lock suffixes=*.pdf
        set wildmenu
        set wildmode=list:longest
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
        " Clojure/Leiningen
        set wildignore+=classes
        set wildignore+=lib
        " }}}

        " [ position & session & marker ] {{{
                " Extended session management for Vim ':mksession'
                " Extended session management for Vim ':mksession'
                " - :SaveSession
                " - :OpenSession
                " - :CloseSession
                " - :DeleteSession
                " - :ViewSession
                " - :RestartVim
                let g:session_autoload = 'prompt' " 'prompt'/'yes' - auto load session or prompt ?
                let g:session_autosave = 1
                let g:session_directory = "~/.vim/sessions/"
                let g:session_default_to_last = 0 " default open last session instead of default
                let g:session_command_aliases = 1 " :SessionOpen <-> :OpenSession
                set sessionoptions+=blank
                set sessionoptions+=buffers
                set sessionoptions+=curdir
                set sessionoptions+=folds
                set sessionoptions-=help
                set sessionoptions+=options
                set sessionoptions+=tabpages
                set sessionoptions+=resize
                set sessionoptions+=winsize
                set sessionoptions+=winpos
        " }}}



        " Sometimes pytest prepends an 'E' marker at the beginning of a traceback line
        " set errorformat+= \E\ %#File\ \"%f\"\\,\ line\ %l%.%#
        " fugitive {{{ Intuitive and Simple Git wrapper for Vim.
        "   - :Git[!] [args]
        "   - :Gstatus
        "   - :Gcommit [args]
        "   - :Gedit/:Gsplit/:Gvsplit/:Gtabedit/:Gpedit [revision]
        "   - :Gwrite/:Gwq {path}
        "   - :Gmove {destination}
        "   - :Gremove
        "   - :{range}Gread [revision]/[args]
        "   - :Gdiff/:Gsdiff/:Gvdiff [revision]
        "   - :Ggrep/:Glgrep [args] -- :grep/:lgrep with git-grep as 'grepprg'
        "   - :Glog [args] -- load all previous revisions of current file into quickfix
        "   - :[range]Gblame {flags}
        "   - :[range]Gbrowse {revision}
        " XXX   auto open quickfix window for :Ggrep.
        autocmd QuickFixCmdPost grep cwindow
        " }}}

