        " Auto commands
        augroup vimrc
                autocmd!
        augroup END

        function! s:vimscript()
            setlocal tabstop=8 " number of space for tab
            setlocal shiftwidth=8 " width of auto indent
            setlocal expandtab
        endfunction

        augroup vimrc-vimscript
            autocmd!
            autocmd FileType vim call s:vimscript()
        augroup END
