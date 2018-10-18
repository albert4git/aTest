        " Auto commands
        augroup vimrc
                autocmd!
        augroup END

        augroup ft_quickfix au! au filetype qf setlocal
                "colorcolumn=1,2,3,4,5,6,7,8,9,10,11,12 nolist cursorline
                "nowrap tw=0
                "au filetype qf highlight ColorColumn ctermbg=2 au filetype qf
                "highlight CursorColumn ctermbg=White
                au filetype qf highlight CursorLine ctermbg=DarkGray term=bold
                "au filetype qf hi Normal ctermbg=DarkBlue !!!Vimscript is a
                "joke au filetype qf nnoremap <buffer> <cr> :execute "normal!
                "\<lt>cr>"<cr> au filetype qf highlight ColorColumn
                "ctermbg=220
        augroup end

        function! s:vimscript()
                setlocal tabstop=8 " number of space for tab
                setlocal shiftwidth=8 " width of auto indent
                au filetype vim highlight ColorColumn ctermbg=236
                setlocal expandtab
                autocmd FileType vim hi Normal ctermbg=234
                autocmd filetype vim highlight CursorLine ctermbg=Black term=bold cterm=bold
                autocmd filetype vim highlight CursorColumn ctermbg=Black
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

        " Make fugitive's fake buffers visually distinguishable
        augroup MakeFugitiveVisible
                au!
                au BufNew,BufReadPost fugitive://* Margin 0
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

        augroup ft_diff
            au!
            " autocmd FileType diff setlocal foldmethod=expr
            autocmd FileType diff setlocal foldexpr=DiffFoldLevel()
        augroup END

        " Create missing directory on save                              {{{2
        augroup MkDirOnSave
                au!
                "au BufWritePre * call mkdirondemand#doit()
        augroup END


        " Auto format codes
        "noremap <F7> :Autoformat<CR>
        """ formatt upon saving
        """ au BufWrite * :Autoformat
        augroup NrHighlight
                autocmd!
                autocmd WinEnter * hi LineNr ctermfg=247 guifg=#9e9e9e ctermbg=233 guibg=#121212
                autocmd WinLeave * hi LineNr ctermfg=274 guifg=#e9e9e9 ctermbg=133 guibg=#212121
        augroup END

        augroup configgroup
                autocmd!
                autocmd VimEnter * highlight clear SignColumn
                autocmd BufWritePre *.php, *.py, *.js, *.txt, *.hs, *.java, *.md
                \:call <SID>StripTrailingWhitespaces()
                autocmd FileType java setlocal noexpandtab
                autocmd FileType java setlocal list
                autocmd FileType java setlocal listchars=tab:+\ ,eol:-
                autocmd FileType java setlocal formatprg=par\ -w80\ -T4
                autocmd FileType php setlocal expandtab
                autocmd FileType php setlocal list
                autocmd FileType php setlocal listchars=tab:+\ ,eol:-
                autocmd FileType php setlocal formatprg=par\ -w80\ -T4
                autocmd FileType ruby setlocal tabstop=2
                autocmd FileType ruby setlocal shiftwidth=2
                autocmd FileType ruby setlocal softtabstop=2
                autocmd FileType ruby setlocal commentstring=#\ %s
                autocmd FileType python setlocal commentstring=#\ %s
                autocmd BufEnter *.cls setlocal filetype=java
                autocmd BufEnter *.zsh-theme setlocal filetype=zsh
                autocmd BufEnter Makefile setlocal noexpandtab
                autocmd BufEnter *.sh setlocal tabstop=2
                autocmd BufEnter *.sh setlocal shiftwidth=2
                autocmd BufEnter *.sh setlocal softtabstop=2
        augroup END

        "------------------------------------------------------------------------ 
        " let g:qfenter_keymap = {}
        " let g:qfenter_keymap.open = ['<CR>', '<2-LeftMouse>']
        " let g:qfenter_keymap.vopen = ['<Leader><CR>']
        " let g:qfenter_keymap.hopen = ['<Leader><Space>']
        " let g:qfenter_keymap.topen = ['<Leader><Tab>']
        "
        " If you're a CtrlP user, for instance, you might like these for familiarity:
        " let g:qfenter_keymap = {}
        " let g:qfenter_keymap.vopen = ['<C-v>']
        " let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
        " let g:qfenter_keymap.topen = ['<C-t>']

