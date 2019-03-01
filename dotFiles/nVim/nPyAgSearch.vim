        "===============================================================================
        " DESCRIPTION:   Search from the project root recursively for a specified
        "                string
        " EXAMPLE USAGE: Press <Leader>sp and enter the string to search for. The
        "                results are displayed in the quickfix window.
        "===============================================================================
        if executable('ag')
                set grepprg=ag\ --nogroup\ --nocolor\ --column\ --ignore-dir\ node_modules\ --ignore-dir\ bower_components
                set grepformat=%f:%l:%c:%m
        endif

        function! TheSilverSearcher()
                python3 << endPython

                        import vim

                        def python_input(message = 'input'):
                        vim.command('call inputsave()')
                        vim.command("let user_input = input('" + message + ": ')")
                        vim.command('call inputrestore()')
                        return vim.eval('user_input')

                        def silver_search():
                        search_args = python_input("Search For")
                        if search_args:
                                vim.command('silent grep! "{}"'.format(search_args))
                                vim.command('redraw!')
                                vim.command('redrawstatus!')
                                vim.command('copen')

                                silver_search()

                endPython
        endfunction

        command Search call TheSilverSearcher()

        "===============================================================================
        " Function Keymappings
        "===============================================================================
        nnoremap <Leader>sp :Search<CR>

        "===============================================================================
        " Unite Keymap Menu Item(s)
        "===============================================================================
        "let g:unite_source_menu_menus.CustomKeyMaps.command_candidates += [['➤ Search 



        "===============================================================================
        " DESCRIPTION:   Wrap a word with a specified function.
        " EXAMPLE USAGE: Assuming the following test `someFunction(arg1, arg2)`
        "                position the cursor on `arg1` and press <Leader>ww you will
        "                be prompted for the text to wrap with if you enter
        "                `otherFunc` the line will be modifyed as follows
        "                `someFunction(otherFunc(arg1), arg2)`
        "===============================================================================
        function! WrapWordWith()
                python3 << endPython

                import vim
                from itertools import dropwhile

                        def python_input(message = 'input'):
                                vim.command('call inputsave()')
                                vim.command("let user_input = input('" + message + ": ')")
                                vim.command('call inputrestore()')
                                return vim.eval('user_input')

                        def wrap_with():
                                the_chars = {"[": "]", "['": "']", '["': '"]', "(": ")", "('": "')", '("': '")', "": ")"}
                                the_word = vim.eval('expand("<cword>")')
                                current_line = vim.current.line
                                wrap_name = python_input("Wrap with")
                                cursor_pos = vim.current.window.cursor
                                open_char_gen = dropwhile(lambda x: x not in ["[", "(", "'", '"'], wrap_name)
                                open_char = "".join(open_char_gen)
                                courtesy_opener = "" if open_char else "("
                                vim.current.buffer[cursor_pos[0] - 1] = current_line.replace(the_word, "{}{}{}{}".format(wrap_name, courtesy_opener, the_word, the_chars[open_char]))

                wrap_with()

                endPython

        endfunction

        command! WrapWith call WrapWordWith()

        "===============================================================================
        " Function Keymappings
        "===============================================================================
        nnoremap <Leader>ww :WrapWith<CR>

        "===============================================================================
        " Unite Keymap Menu Item(s)
        "===============================================================================
        "let g:unite_source_menu_menus.CustomKeyMaps.command_candidates += [['➤ Wrap word under cursor with method  
