        function! ScratchToggle()
                if exists("w:is_scratch_window")
                        unlet w:is_scratch_window
                        exec "q"
                else
                        exec "normal! :Sscratch\<cr>\<C-W>L"
                        let w:is_scratch_window = 1
                endif
        endfunction
        nnoremap <silent> <leader><tab> :ScratchToggle<cr>
        command! ScratchToggle call ScratchToggle()
        "-------------------------------------------------------------------------------
        "----------------------------------------
        "--------------------------------
        " source ~/vim-deopleteA.vim
        " source ~/vim-neo-omni.vim
        " source ~/vim-make.vim
        " source ~/vim-autocmd.vim
        "--------------------------------
        "----------------------------------------
        "-------------------------------------------------------------------------------

        "-------------------------------------------------------------------------------
        "highlight Comment ctermbg=6 ctermfg=White cterm=bold
        "highlight Comment ctermbg=3 ctermfg=White cterm=bold
        "highlight Comment ctermbg=6 ctermfg=White

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:miniBufExplMapWindowNavVim = 1
        let g:miniBufExplMapWindowNavArrows = 1
        let g:miniBufExplMapCTabSwitchBufs = 1
        let g:miniBufExplModSelTarget = 1
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "-------------------------------------------------------------------------------
        "- Circular windows navigation
        "- nnoremap <Tab>   <c-W>w
        "- nnoremap <S-Tab> <c-W>W
        "-------------------------------------------------------------------------------
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "" <F12> = show the Unicode name of the character under cursor
        "" I used to have my own :UnicodeName for this, but tpope/vim-characterize is
        "" better
        ""map             <F12>           <Plug>(characterize)
        "" <S-F12> = show highlight group under cursor
        ""map             <S-F12>         :ShowHighlightGroup<CR>
        "" <C-F12> = show syntax stack under cursor
        ""map             <C-F12>         :ShowSyntaxStack<CR>

        "-------------------------------------------------------------------------------
       "- if !get(g:, 'loaded_gutentags', 0)
       "-         finish
       "- endif
       "-
       "- function! airline#extensions#gutentags#status()
       "-         let msg = gutentags#statusline()
       "-         return empty(msg) ? '' :  'Gen. ' . msg
       "- endfunction
       "-
       "- function! airline#extensions#gutentags#init(ext)
       "-         call airline#parts#define_function('gutentags', 'airline#extensions#gutentags#status')
       "- endfunction
        "-------------------------------------------------------------------------------
        "set cursorline
        "hi StatusLineNC  ctermbg=3 ctermfg=6 cterm=NONE
        "hi statuslineNC guifg=White
        "hi statusline ctermbg=Cyan ctermfg=Black  cterm=bold
        "-------------------------------------------------------------------------------

        "syntax on
        "set t_Co=256
        "colorscheme onehalfdark
        "let g:airline_theme='onehalfdark'
        "lightline
        "let g:lightline.colorscheme='onehalfdark'
        "My stuff --------------------------------------------------------------------------
        " echo (leader)
        " echo (localleader)
        "-------------------------------------------------------------------------------
