"-         "------------------------------------------
"-         " XXX Wichtig for C++
"-         " nnoremap <left>  :cprev<cr>zvzz
"-         " nnoremap <right> :cnext<cr>zvzz
"-         " nnoremap <up>    :lprev<cr>zvzz
"-         " nnoremap <down>  :lnext<cr>zvzz
"-         "------------------------------------------
"-
"-         function! ShowCtrlKeys(bang)
"-                 for i in range(1,12)
"-                         redir! => map
"-                         exe "silent " . (a:bang == "!" ? 'verbose' : '') . " map<C-" . i . ">"
"-                         redir end
"-                         if map !~ 'No mapping found'
"-                                 echomsg map
"-                         endif
"-                 endfor
"-         endfunction
"-         com! -bang ShowCtrlKeys :call ShowCtrlKeys(<q-bang>)

                " Man
                " nnoremap M K
                "-------------------------
                "inoremap <C-t> []<esc>i
                "inoremap <C-e> {}<esc>i
                "inoremap <M-i> <Tab>

                "-------------------------
                "vnoremap <F9> i[
                "vnoremap <S-F9> a[
                "vnoremap <F10> i<
                "vnoremap <S-F10> a<
                "-------------------------
"-         "----------------------------------------------------------------------------------------
"-         " Tab completion for vim-lsp inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
"-         " inoremap <tab> <c-n>
"-         " inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
"-         " inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"
"-         " set completeopt=menu,longest,preview
"-         "----------------------------------------------------------------------------------------
"-
"-         "----------------------------------------------------------------------------------------
"-         " set list
"-         " set listchars=tab:▸\ ,eol:¬,trail:⋅
"-         " set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
"-         " set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
"-         "------------------------------------------------------------------------------------------
"-
"-         " My garbage brain can't ever remember digraph codes
"-         " inoremap <c-k><c-k> <esc>:help digraph-table<cr>
"-
"-
"-         " The normal use of S is covered by cc, so don't worry about shadowing it.
"-         "-nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
"-
"-         " Kill window
"-         nnoremap K :q<cr>
"-
"-         " select last paste in visual mode
"-         nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
"-
"-         "-[popup menu]-
"-         set pumheight=20 " popup menu height. 0: long
"-
"-
"-         function! ScratchToggle()
"-                 if exists("w:is_scratch_window")
"-                         unlet w:is_scratch_window
"-                         exec "q"
"-                 else
"-                         exec "normal! :Sscratch\<cr>\<C-W>L"
"-                         let w:is_scratch_window = 1
"-                 endif
"-         endfunction
"-         nnoremap <silent> <leader><tab> :ScratchToggle<cr>
"-         command! ScratchToggle call ScratchToggle()
"-         "-------------------------------------------------------------------------------
"-         "----------------------------------------
"-         "--------------------------------
"-         " source ~/vim-deopleteA.vim
"-         " source ~/vim-neo-omni.vim
"-         " source ~/vim-make.vim
"-         " source ~/vim-autocmd.vim
"-         "--------------------------------
"-         "----------------------------------------
"-         "-------------------------------------------------------------------------------
"-
"-         "-------------------------------------------------------------------------------
"-         "highlight Comment ctermbg=6 ctermfg=White cterm=bold
"-         "highlight Comment ctermbg=3 ctermfg=White cterm=bold
"-         "highlight Comment ctermbg=6 ctermfg=White
"-
"-         """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-         let g:miniBufExplMapWindowNavVim = 1
"-         let g:miniBufExplMapWindowNavArrows = 1
"-         let g:miniBufExplMapCTabSwitchBufs = 1
"-         let g:miniBufExplModSelTarget = 1
"-         """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-         "-------------------------------------------------------------------------------
"-         "- Circular windows navigation
"-         "- nnoremap <Tab>   <c-W>w
"-         "- nnoremap <S-Tab> <c-W>W
"-         "-------------------------------------------------------------------------------
"-         """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-         "" <F12> = show the Unicode name of the character under cursor
"-         "" I used to have my own :UnicodeName for this, but tpope/vim-characterize is
"-         "" better
"-         ""map             <F12>           <Plug>(characterize)
"-         "" <S-F12> = show highlight group under cursor
"-         ""map             <S-F12>         :ShowHighlightGroup<CR>
"-         "" <C-F12> = show syntax stack under cursor
"-         ""map             <C-F12>         :ShowSyntaxStack<CR>
"-
"-         "-------------------------------------------------------------------------------
"-        "- if !get(g:, 'loaded_gutentags', 0)
"-        "-         finish
"-        "- endif
"-        "-
"-        "- function! airline#extensions#gutentags#status()
"-        "-         let msg = gutentags#statusline()
"-        "-         return empty(msg) ? '' :  'Gen. ' . msg
"-        "- endfunction
"-        "-
"-        "- function! airline#extensions#gutentags#init(ext)
"-        "-         call airline#parts#define_function('gutentags', 'airline#extensions#gutentags#status')
"-        "- endfunction
"-         "-------------------------------------------------------------------------------
"-         "set cursorline
"-         "hi StatusLineNC  ctermbg=3 ctermfg=6 cterm=NONE
"-         "hi statuslineNC guifg=White
"-         "hi statusline ctermbg=Cyan ctermfg=Black  cterm=bold
"-         "-------------------------------------------------------------------------------
"-
"-         "syntax on
"-         "set t_Co=256
"-         "colorscheme onehalfdark
"-         "let g:airline_theme='onehalfdark'
"-         "lightline
"-         "let g:lightline.colorscheme='onehalfdark'
"-         "My stuff --------------------------------------------------------------------------
"-         " echo (leader)
"-         " echo (localleader)
"-         "-------------------------------------------------------------------------------
"-===========================================================================================
"-         "-AAA15-Diff----------------------------------------------------------------------------{{{
"-         " This is from https://github.com/sgeb/vim-diff-fold/ without the extra
"-         function! DiffFoldLevel()
"-                 let l:line=getline(v:lnum)
"-                 if l:line =~# '^\(diff\|Index\)'     " file
"-                         return '>1'
"-                 elseif l:line =~# '^\(@@\|\d\)'  " hunk
"-                         return '>2'
"-                 elseif l:line =~# '^\*\*\* \d\+,\d\+ \*\*\*\*$' " context: file1
"-                         return '>2'
"-                 elseif l:line =~# '^--- \d\+,\d\+ ----$'     " context: file2
"-                         return '>2'
"-                 else
"-                         return '='
"-                 endif
"-         endfunction
"-
"-         augroup ft_diff
"-             au!
"-             " autocmd FileType diff setlocal foldmethod=expr
"-             autocmd FileType diff setlocal foldexpr=DiffFoldLevel()
"-         augroup END
"-
"-
"-         " See :help DiffOrig
"-                 command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis \ | wincmd p | diffthis
"-
"-         " Diffget/diffput in visual mode
"-                 vmap            \do             :diffget<CR>
"-                 vmap            \dp             :diffput<CR>
"-
"-         " diff-diff-diff
"-                 nnoremap <silent> <expr> ,d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"
"-
"-         " Diffoff-Diffoff
"-                 nnoremap <leader>D :diffoff!<cr>
"-
"-         " diffoff used to set wrap as a side effect
"-                 command! Diffoff        diffoff | setlocal nowrap
"-
"-         "-15-Diff-}}}



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                " Create missing directory on save                              {{{2
"                augroup MkDirOnSave
"                        au!
"                        au BufWritePre * call mkdirondemand#doit()
"                augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                " Autodetect filetype on first save                             {{{2
"                augroup FiletypeOnSave
"                        au!
"                        au BufWritePost * if &ft == "" | filetype detect | endif
"                augroup END
"
"                " chmod +x on save                                              {{{2
"                augroup MakeExecutableOnSave
"                        " https://unix.stackexchange.com/questions/39982/vim-create-file-with-x-bit
"                        " See also http://vim.wikia.com/wiki/Setting_file_attributes_without_reloading_a_buffer
"                        au!
"                        au BufWritePost * call chmodx#doit()
"                augroup END
"
"                " Make fugitive's fake buffers visually distinguishable         {{{2
"                augroup MakeFugitiveVisible
"                        au!
"                        au BufNew,BufReadPost fugitive://* Margin 0
"                augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
