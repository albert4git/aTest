        au! Cursorhold * exe 'match ShowMatches /\v%(%#\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(%(\{%(\n|[^\{\}])*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*\})|%(\n|[^\{\}]))*%#\})/'
        set ut=30


        "Use this vmap to enclose a block with fold markers:
        vmap <M-z> mz:<esc>'<O// {{{<esc>'>o// }}}<esc>`z?{{{<cr>A<space>
        vmap <M-1> mz:<esc>'<O {{{<esc>'>o }}}<esc>`z?{{{<cr>A<space>



        " put the cursor over a perl module name and try backslash-pd to see perldoc
        :nmap <Leader>pd :e `perldoc -ml <cword>`<CR>

        "----------------------------------------------------------------------------------
        function! MakeSession()
            let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
            if (filewritable(b:sessiondir) != 2)
                exe 'silent !mkdir -p ' b:sessiondir
                redraw!
            endif
            let b:filename = b:sessiondir . '/session.vim'
            exe "mksession! " . b:filename
        endfunction

        function! LoadSession()
            let b:sessiondir  = $HOME . "/.vim/sessions" . getcwd()
            let b:sessionfile = b:sessiondir . "/session.vim"
            if (filereadable(b:sessionfile))
                exe 'source ' b:sessionfile
            else
                echo "No session loaded."
            endif
        endfunction

        au VimEnter * :call LoadSession()
        au VimLeave * :call MakeSession()
        "----------------------------------------------------------------------------------

        function! QFixToggle(forced)
                if exists("g:qfix_win") && a:forced == 0
                        cclose
                        unlet g:qfix_win
                else
                        copen 10
                        let g:qfix_win = bufnr("$")
                endif
        endfunction
        command -bang -nargs=? QFix call QFixToggle(<bang>0)
        nmap <silent> \` :QFix<CR>
        "--------------------------------------------------------------------------------- 
        " set background=dark
        " hi SpecialKey    guifg=Blue
        " hi MoreMsg       guifg=Green
        " hi Visual        guifg=NONE guibg=NONE
        " hi Folded        ctermbg=4 guibg=Blue
        " hi FoldColumn    ctermbg=7
        " hi DiffAdd       guibg=Blue
        " hi DiffChange    guibg=Magenta
        " hi DiffDelete    guibg=Cyan
        " hi Normal        guifg=Gray guibg=Black
        " hi Cursor        guibg=White
        " hi lCursor       guibg=White
        " hi Comment       guifg=Cyan
        " hi Constant      guifg=Magenta
        " hi Special       guifg=Red
        " hi Identifier    guifg=Cyan
        " hi Statement     guifg=Yellow
        " hi PreProc       guifg=Blue
        " hi Type          guifg=Green
        " hi Underlined    guifg=Blue
        " hi Todo          guifg=Black
        "
        "--------------------------------------------------------------------------------- 
        " if {
        "         map             <S-F11>         :ShowHighlightGroup<CR>
        "         "-show-syntax-stack under cursor
        "         map             <C-F11>         :ShowSyntaxStack<CR>
        "    }

        hi VariableType ctermbg=LightYellow
        hi VariableType ctermfg=brown
        hi VarName ctermfg=darkblue

        "------------------------------------------------------------------------------------------------------
        " autocmd filetype cpp nnoremap <F7> :!g++ % -ggdb -o %:r <CR>
        " autocmd filetype cpp nnoremap <F7> :!g++ % -ggdb -o %:r && ./%:r <CR>
        " autocmd filetype cpp nnoremap <F7> :!g++ % -ggdb -o %:r && gdb -tui %:r <CR>
        "------------------------------------------------------------------------------------------------------


"-Java-{{{
        augroup ft_java
                au!
                au FileType java setlocal foldmethod=marker
                au FileType java setlocal foldmarker={,}
                au FileType java inoremap <c-n> <c-x><c-]>
        augroup END

        augroup ft_quickfix
                au!
                au Filetype qf setlocal colorcolumn=0 nolist nowrap tw=0
                " vimscript is a joke
                au Filetype qf nnoremap <buffer> <cr> :execute "normal! \<lt>cr>"<cr>
        augroup END

        augroup ft_vim
                au!
                au FileType vim setlocal foldmethod=marker keywordprg=:help
                au FileType help setlocal textwidth=78
                au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif

                au FileType vim vnoremap <localleader>S y:@"<CR>
                au FileType vim nnoremap <localleader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

                au FileType vim inoremap <c-n> <c-x><c-n>
        augroup END

        augroup ft_fugitive
                au!
                au BufNewFile,BufRead .git/index setlocal nolist
        augroup END

        function! s:vimscript()
                setlocal tabstop=8 " number of space for tab
                setlocal shiftwidth=8 " width of auto indent
                au filetype vim highlight ColorColumn ctermbg=236
                setlocal expandtab
                autocmd FileType vim hi Normal ctermbg=234
                autocmd filetype vim highlight CursorLine ctermbg=0 term=bold cterm=bold
                autocmd filetype vim highlight CursorColumn ctermbg=Black
        endfunction

        augroup vimrc-vimscript
                autocmd!
                autocmd FileType vim call s:vimscript()
        augroup END
"-}}}
