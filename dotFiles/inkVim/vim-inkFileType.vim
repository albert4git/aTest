
        autocmd FileType c set makeprg=gcc\ -O2\ -g\ -Wall\ -Wextra\ -o'%<'\ '%'\ -lm
        autocmd filetype c nnoremap <C-c> :w <bar> !gcc -std=c99 -lm % -o %:p:h/%:t:r.out && ./%:r.out<CR>
        autocmd filetype java nnoremap <C-c> :w <bar> !javac % && java -enableassertions %:p <CR>
        autocmd filetype python nnoremap <C-c> :w <bar> !python % <CR>
        autocmd filetype perl nnoremap <C-c> :w <bar> !perl % <CR>
        autocmd filetype go nnoremap <C-c> :w <bar> !go build % && ./%:p <CR>

        " Java {{{
        augroup ft_java
            au!
            au FileType java setlocal foldmethod=marker
            au FileType java setlocal foldmarker={,}
            au FileType java inoremap <c-n> <c-x><c-]>
        augroup END
        " }}}

        " Go {{{
        let g:tagbar_type_go = {
                                \ 'ctagstype': 'go',
                                \ 'kinds' : [
                                \'p:package',
                                \'f:function',
                                \'v:variables',
                                \'t:type',
                                \'c:const'
                                \ ]
                                \ }
        " }}}

        " Markdown {{{
        let g:tagbar_type_markdown = {
                                \ 'ctagstype' : 'markdown',
                                \ 'kinds' : [
                                \ 'h:Heading_L1',
                                \ 'i:Heading_L2',
                                \ 'k:Heading_L3'
                                \ ]
                                \ }
        " }}}

        " Xquery {{{
        let g:tagbar_type_xquery = {
                                \ 'ctagstype' : 'xquery',
                                \ 'kinds'     : [
                                \ 'f:function',
                                \ 'v:variable',
                                \ 'm:module',
                                \ ]
                                \ }
        " }}}


        " gnuplot {{{

        function! OpenGnuplotRepl() "{{{
            NeoRepl gnuplot
            set syntax=gnuplot
            " syn match replPrompt /\v^\*/
            " hi def link replPrompt SpecialChar

            " syn match replResult /\v^#\<[^>]+\>$/
            " hi def link replResult Debug
        endfunction "}}}

        function! SendGNUPlotParagraph() "{{{
            let view = winsaveview()

            execute "normal! ^vip\<esc>"
            call NeoReplSendSelection()

            call winrestview(view)
        endfunction "}}}
        function! SendGNUPlotBuffer() "{{{
            let view = winsaveview()

            execute "normal! ggVG"
            call NeoReplSendSelection()

            call winrestview(view)
        endfunction "}}}

        augroup ft_gnuplot
            au!

            au BufNewFile,BufRead *.gp setlocal filetype=gnuplot

            au FileType gnuplot nnoremap <buffer> <silent> <localleader>o :call OpenGnuplotRepl()<cr>

            au FileType gnuplot nnoremap <buffer> <silent> <localleader>e :call SendGNUPlotParagraph()<cr>

            au FileType gnuplot setlocal foldmethod=marker foldmarker={{{,}}}
        augroup END

        " }}}


        " Makefile {{{

        augroup ft_make
            au!

            au Filetype make setlocal shiftwidth=8
        augroup END

        " }}}


        " Markdown {{{

        augroup ft_markdown
            au!
                au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1
                au Filetype markdown setlocal spell
                " Use <localleader>1/2/3 to add headings.
                au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
                au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
                au Filetype markdown nnoremap <buffer> <localleader>3 mzI###<space><esc>`zllll
                au Filetype markdown nnoremap <buffer> <localleader>4 mzI####<space><esc>`zlllll
        augroup END

        " }}}

"---AAA12---------------------------------------------------------------------------------------------------------- {{{
        augroup ft_markdown
            au!
                autocmd FileType c set makeprg=gcc\ -O2\ -g\ -Wall\ -Wextra\ -o'%<'\ '%'\ -lm
                autocmd filetype c nnoremap <C-c> :w <bar> !gcc -std=c99 -lm % -o %:p:h/%:t:r.out && ./%:r.out<CR>
                autocmd filetype java nnoremap <C-c> :w <bar> !javac % && java -enableassertions %:p <CR>
                autocmd filetype python nnoremap <C-c> :w <bar> !python % <CR>
                autocmd filetype perl nnoremap <C-c> :w <bar> !perl % <CR>
                autocmd filetype go nnoremap <C-c> :w <bar> !go build % && ./%:p <CR>
                "------------------------------------------------------------------------------------------
                let g:quickrun_known_file_types = {
                        \"cpp": ["!g++ %", "./a.out"],
                        \"c": ["!gcc %", "./a.out"],
                        \"php": ["!php %"],
                        \"vim": ["source %"],
                        \"py": ["!python %"],
                        \}
        augroup END
        "------------------------------------------------------------------------------------------
        "compiler javac
        "set makeprg =javac\ hello2W.java
        "------------------------------------------------------------------------------------------
" }}}


        " Python {{{

        function! SelectTopLevelPythonHunk() "{{{
            " oh darling what have I done
            " if we're on toplevel line that ends in a :, drop down one line before
            " we move on.  this is bad and i feel bad.
            let line = getline(".")
            if len(line) > 0 && line[0] != " " && line[len(line) - 1] == ":"
                normal! j
            endif
            normal! v
            " use the non-bang version of normal here because we need to use the
            " indentation script.  this is also bad and i still feel bad.
            normal ai
            " keep chomping upwards in the indentation stack til we get to something
            " that's at the top level.  its bad.
            while getline(".")[0] == " "
                normal ai
            endwhile
        endfunction "}}}

        function! OpenPythonRepl() "{{{
            "fucking kill me
            NeoRepl fish
        endfunction "}}}

        function! SendPythonLine() "{{{
            let view = winsaveview()
            execute "normal! ^vg_\<esc>"
            call NeoReplSendSelection()
            call winrestview(view)
        endfunction "}}}

        function! SendPythonParagraph() "{{{
            let view = winsaveview()
            execute "normal! ^vip\<esc>"
            call NeoReplSendSelection()
            call winrestview(view)
        endfunction "}}}

        function! SendPythonTopLevelHunk() "{{{
            let view = winsaveview()
            let old_z = @z
            call SelectTopLevelPythonHunk()
            normal! gv"zy
            call NeoReplSendRaw("%cpaste\n" . @z . "\n--\n")
            let @z = old_z
            call winrestview(view)
        endfunction "}}}

        function! SendPythonSelection() "{{{
            let view = winsaveview()
            let old_z = @z
            normal! gv"zy
            call NeoReplSendRaw("%cpaste\n" . @z . "\n--\n")
            let @z = old_z
            call winrestview(view)
        endfunction "}}}

        function! SendPythonBuffer() "{{{
            let view = winsaveview()
            execute "normal! ggVG\<esc>"
            normal! gv"zy
            call NeoReplSendRaw("%cpaste\n" . @z . "\n--\n")
            call winrestview(view)
        endfunction "}}}

        augroup ft_python
            au!
            au FileType python setlocal define=^\s*\\(def\\\\|class\\)
            " Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
            " override this in a normal way, could you?
            au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif
            " Strip REPL-session marks from just-pasted text
            au FileType python nnoremap <localleader>s mz`[v`]:v/\v^(\>\>\>\|[.][.][.])/d<cr>gv:s/\v^(\>\>\> \|[.][.][.] \|[.][.][.]$)//<cr>:noh<cr>`z
            " Set up some basic neorepl mappings.
            " key  desc                   mnemonic
            " \o - connect neorepl        [o]pen repl
            " \l - send current line      [l]ine
            " \p - send current paragraph [p]aragraph
            " \e - send top-level hunk    [e]val
            " \e - send selected hunk     [e]val
            " \r - send entire file       [r]eload file
            " \c - send ctrl-l            [c]lear
            au FileType python nnoremap <buffer> <silent> <localleader>o :call OpenPythonRepl()<cr>
            " Send the current line to the REPL
            au FileType python nnoremap <buffer> <silent> <localleader>l :call SendPythonLine()<cr>
            " Send the current paragraph to the REPL
            au FileType python nnoremap <buffer> <silent> <localleader>p :call SendPythonParagraph()<cr>
            "" Send the current top-level hunk to the REPL
            au FileType python nnoremap <buffer> <silent> <localleader>e :call SendPythonTopLevelHunk()<cr>
            " Send the current selection to the REPL
            au FileType python vnoremap <buffer> <silent> <localleader>e :<c-u>call SendPythonSelection()<cr>
            " Send the entire buffer to the REPL ([r]eload)
            au FileType python nnoremap <buffer> <silent> <localleader>r :call SendPythonBuffer()<cr>
            " Clear the REPL
            au FileType python nnoremap <buffer> <silent> <localleader>c :call NeoReplSendRaw("")<cr>
        augroup END

        " }}}


        " Paredit {{{

        let g:paredit_smartjump = 1
        let g:paredit_shortmaps = 0
        let g:paredit_electric_return = 1
        let g:paredit_matchlines = 200
        let g:paredit_disable_lisp = 1
        let g:paredit_disable_clojure = 1

        function! EnableParedit()
            call PareditInitBuffer()
            " Quit fucking with my split-line mapping, paredit.
            nunmap <buffer> S
            " Also quit fucking with my save file mapping.
            nunmap <buffer> s
            " Please just stop
            nunmap <buffer> <leader>W
            nunmap <buffer> <leader>O
            nunmap <buffer> <leader>S
            " Oh my god will you fuck off already
            " nnoremap <buffer> dp :diffput<cr>
            " nnoremap <buffer> do :diffobtain<cr>
            " Eat shit
            nunmap <buffer> [[
            nunmap <buffer> ]]
            " Better mappings
            noremap <buffer> () :<c-u>call PareditWrap("(", ")")<cr>
            noremap <buffer> )( :<c-u>call PareditSplice()<cr>
            noremap <buffer> (( :<c-u>call PareditMoveLeft()<cr>
            noremap <buffer> )) :<c-u>call PareditMoveRight()<cr>
            noremap <buffer> (j :<c-u>call PareditJoin()<cr>
            noremap <buffer> (s :<c-u>call PareditSplit()<cr>
            noremap <buffer> )j :<c-u>call PareditJoin()<cr>
            noremap <buffer> )s :<c-u>call PareditSplit()<cr>
            " ))
        endfunction
        " }}}

        " Python-Mode {{{
        let g:pymode_doc = 1
        let g:pymode_doc_bind = 'M'
        let g:pydoc = 'pydoc'
        let g:pymode_syntax = 1
        let g:pymode_syntax_all = 0
        let g:pymode_syntax_builtin_objs = 1
        let g:pymode_syntax_print_as_function = 0
        let g:pymode_syntax_space_errors = 0
        let g:pymode_run = 0
        let g:pymode_lint = 0
        let g:pymode_breakpoint = 0
        let g:pymode_utils_whitespaces = 0
        let g:pymode_virtualenv = 0
        let g:pymode_folding = 0
        let g:pymode_options_indent = 0
        let g:pymode_options_fold = 0
        let g:pymode_options_other = 0
        let g:pymode_options = 0
        let g:pymode_rope = 0
        let g:pymode_rope_global_prefix = "<localleader>R"
        let g:pymode_rope_local_prefix = "<localleader>r"
        let g:pymode_rope_auto_project = 1
        let g:pymode_rope_enable_autoimport = 0
        let g:pymode_rope_autoimport_generate = 1
        let g:pymode_rope_autoimport_underlineds = 0
        let g:pymode_rope_codeassist_maxfixes = 10
        let g:pymode_rope_sorted_completions = 1
        let g:pymode_rope_extended_complete = 1
        let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]
        let g:pymode_rope_confirm_saving = 1
        let g:pymode_rope_vim_completion = 1
        let g:pymode_rope_guess_project = 1
        let g:pymode_rope_goto_def_newwin = 0
        let g:pymode_rope_always_show_complete_menu = 0
        " }}}

        " Rainbow Parentheses {{{

        let g:rbpt_max = 1

        " }}}

        " Scala {{{
                let g:scala_use_builtin_tagbar_defs = 0
                let g:scala_use_default_keymappings = 0
        " }}}

        augroup ft_diff
            au!
            autocmd FileType diff setlocal foldmethod=expr
            autocmd FileType diff setlocal foldexpr=DiffFoldLevel()
        augroup END
        " }}}


