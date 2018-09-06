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

        augroup NoSimultaneousEdits
                autocmd!
                autocmd SwapExists * let v:swapchoice = 'o'
                autocmd SwapExists * echomsg ErrorMsg
                autocmd SwapExists * echo 'Duplicate edit session (readonly)'
                autocmd SwapExists * echohl None
                autocmd SwapExists * sleep 2
        augroup END


        "====[ Edit and auto-update this config file and plugins ]==========

        augroup VimReload
                autocmd!
                autocmd BufWritePost $MYVIMRC source $MYVIMRC
        augroup END


augroup VisibleNaughtiness
        autocmd!
        autocmd BufEnter * set list
        autocmd BufEnter * set list
        autocmd BufEnter *.txt set nolist
        autocmd BufEnter *.vp* set nolist
        autocmd BufEnter * if !&modifiable
        autocmd BufEnter * set nolist
        autocmd BufEnter * endif
augroup END
