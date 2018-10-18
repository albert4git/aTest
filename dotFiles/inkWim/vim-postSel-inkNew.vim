
       " fugitive {{{ Intuitive and Simple Git wrapper for Vim.
            " Usage:
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
            "   auto open quickfix window for :Ggrep.
            "?" autocmd QuickFixCmdPost grep cwindow
        " }}}

     " minibufexplorer {{{
            let g:miniBufExplSplitBelow = 0  " position at bottom or top.
            let g:miniBufExplSplitToEdge = 1 " force MBR to open at the edge of screen
            let g:miniBufExplorerMoreThanOne = 1 " open when more than one.
            let g:miniBufExplMapWindowNavVim = 1 " Ctrl + h/j/k/l
            let g:miniBufExplMapWindowNavArrows = 0 " Ctrl + Arrow keys
            let g:miniBufExplMapCTabSwitchBufs = 1 " <C-TAB> and <C-S-TAB>
            let g:miniBufExplMapCTabSwitchWindows = 0 " <C-TAB> and <C-S-TAB>
            let g:miniBufExplUseSingleClick = 1 " single click or tabs.
            let g:miniBufExplModSelTarget = 1 " if use other explorer like TagList.
            let g:miniBufExplCloseOnSelect = 0 " close after select buffer.
            let g:miniBufExplCheckDupeBufs = 0 " when >15 buffers
            let g:miniBufExplShowBufNumbers = 1 " show buffer number, 0 to omit them
            " let g:miniBufExplForceSyntaxEnable = 1 " conflict with Powerline.
            let g:miniBufExplorerDebugLevel = 0  " MBE serious errors output. [0/4/10]
            let g:miniBufExplorerDebugMode  = 1  " Uses VIM's echo function
            let g:miniBufExplMaxSize = 0
            let g:miniBufExplMinSize = 1
            " Vertical mode
            " let g:miniBufExplVSplit = 20   " column width in chars in virtical.
            " let g:miniBufExplMaxSize = <max width: default 0>
            " let g:miniBufExplMinSize = <min width: default 1>
            " MiniBufExpl Colors
            hi MBENormal guifg=#808080 ctermfg=250
            hi MBEChanged guifg=#CD5907 ctermfg=208 cterm=bold
            hi MBEVisibleNormal guifg=#5DC2D6 ctermfg=024
            hi MBEVisibleNormalActive guifg=#5DC2D6 ctermfg=026 cterm=bold
            hi MBEVisibleChanged guifg=#F1266F ctermfg=208 cterm=bold
            hi MBEVisibleChangedActive guifg=#F1266F ctermfg=232 ctermbg=208 cterm=bold
            " FIXME how to auto open MiniBufExpl
        " }}}


        " Rainbow_Parentheses_Improved {{{ show parentheses in different color
            " Usage: :RainbowToggle, rainbow#toggle()
            " au syntax * call rainbow#load([
            "             \ ['(',')'],['\[','\]'],['{','}'],
            "             \ ['begin','end'],
            "             \ ])
            " au syntax * call rainbow#activate()
        " }}}


    " [ VimL ] {{{
        " vesting {{{ best VimScript VimL test framework.
        " TODO
        " }}}

        " Vim-Support {{{ Vim Script IDE for Vim/gVim.
            " :h vimsupport.
        " }}}

        " runVimTests {{{ A testing framework for Vim.
        " }}}

        " Self {{{ Vim prototype object system.
        " }}}

        " vimple {{{ provides VimLOO (Object Oriented VimL) objects for write-only :ex commands
        " }}}
    " }}}



        " AutoPairs {{{
                " shortcuts:
                "   <M-o> : newline with indentation
                "   <M-a> : jump to of line
                "   <M-n> : jump to next pairs
                "   <M-e> : jump to end of pairs.
                "   Ctrl-V ) : insert ) without trigger the plugin.
            "let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
            let g:AutoPairsShortcuts = 1
            " let g:AutoPairscutToggle = '<another key>'
                " if bellowing keys conflict with others
            let g:AutoPairsShortcutToggle = '<M-p>'
            let g:AutoPairsShortcutFastWrap = '<M-e>'
            let g:AutoPairsShortcutJump = '<M-n>'
            let g:AutoPairsShortcutBackInsert = '<M-b>'
            let g:AutoPairsMapBS = 1
            let g:AutoPairsMapCR = 0 " insert a new indented line if cursor in pairs.
                " error in vimwiki <CR> Enter. but use upper inoremap can solve.
            let g:AutoPairsMapSpace = 0
                " error in abbreviations <space> auto expand.
            let g:AutoPairsCenterLine = 1
            let g:AutoPairsFlyMode = 0
        " }}}

    " [ shell ] {{{
        " vimshell {{{ powerful shell inplemented by vim script
            "built-in functionalities that you had to set up to enable if it's on zsh.
            " :VimShell[Create,Tab,Pop,Interactive,....] [{options}...] [{path}]
            let g:vimshell_prompt = "vimshell%"
            let g:vimshell_user_prompt = "getcwd()\n"
            "let g:vimshell_right_prompt =
            let g:vimshell_no_default_keymappings = 0 " disable all key mapping in vimshell
            let g:vimshell_use_terminal_command = "urxvt -e"
            "let g:vimshell_temporary_directory = "expand('~/.vimshell')"
            let g:vimshell_max_command_history = 1000
            let g:vimshell_max_directory_stack = 100
            "let g:vimshell_vimshrc_path = "expand('~/.vimshrc')"
            "let g:vimshell_escape_colors =
            let g:vimshell_disable_escape_highlight = 0
            let g:vimshell_cat_command = "cat" " $PAGER command path
            "let g:vimshell_editor_command = " $EDITOR command path
            let g:vimshell_environment_term = "rxvt-unicode-256color" " $TERM env
            let g:vimshell_split_command = "nicely" " nicely, tabnew, vsplit
            let g:vimshell_popup_command = ""
            let g:vimshell_popup_height = 30
            let g:vimshell_cd_command = "lcd"
            let g:vimshell_no_save_history_commands = {'history' : 1, 'h' : 1, 'histdel' : 1}
            let g:vimshell_scrollback_limit = 1000
            let g:vimshell_interactive_no_save_history_commands = {}
            let g:vimshell_interactive_update_time = 500
            "let g:vimshell_interactive_command_options
            "let g:vimshell_interactive_interpreter_commands =
            "let g:vimshell_interactive_encodings =
            "let g:vimshell_interactive_echoback_commands =
            let g:vimshell_terminal_cursor = 'i:block-Cursor/lCursor'
            "let g:vimshell_terminal_commands =
            "let g:vimshell_interactive_cygwin_commands =
            let g:vimshell_interactive_cygwin_path = 'c:/cygwin/bin'
            let g:vimshell_interactive_cygwin_home = ''
            "let g:unite_source_vimshell_external_history_path =
        " }}}
    " }}}
