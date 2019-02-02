        To start your debug session, use the following variants:

        Usage: Dbg - (no auto start)
            Dbg . (autostart current file -- python)
            Dbg url (autostart a URL -- PHP)
            Dbg num (autostart a past url -- PHP)

        Note: for PHP urls, vim-debug keeps track of the last 5 urls you debugged -- so you don't have to keep typing them in.

        Debugger commands:

        [usage:] dbg command [options]
        - quit    :: exit the debugger
        - run     :: continue execution until a breakpoint is reached or the program ends
                default shortcut: \r
        - stop    :: exit the debugger
        - over    :: step over next function call
                default shortcut: \o
        - watch   :: execute watch functions
                default shortcut: \w
        - up      :: go up the stack
                default shortcut: \u
        - here    :: continue execution until the cursor (tmp breakpoint)
                default shortcut: \h
        - down    :: go down the stack
                default shortcut: \d
        - exit    :: exit the debugger
        - eval    :: eval some code
        - break   :: set a breakpoint
                default shortcut: \b
        - into    :: step into next function call
                default shortcut: \i
        - out     :: step out of current function call
                default shortcut: \t

        To disable the default mappings, set the variable g:vim_debug_disable_mappings
        to a value different than 0 in the debugger.vim file.

        For example:

        let g:vim_debug_disable_mappings = 1

        Installation

        Execute the following commands:

        sudo pip install dbgp

        and then use your preferred vim plugin manage (pathogen, Vundle,
        vim-plug, et al.) and install this repository (jaredly/vim-debug) as
        appropriate for the given manager.
