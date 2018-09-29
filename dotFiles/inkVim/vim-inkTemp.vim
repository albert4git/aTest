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

"------------------------------------------------------------------------------------------
function cd() {
    if [[ "$#" != 0 ]]; then
        builtin cd "$@";
        return
    fi
    while true; do
        local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
        local dir="$(printf '%s\n' "${lsd[@]}" |
            fzf --reverse --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                ls -p --color=always "${__cd_path}";
        ')"
        [[ ${#dir} != 0 ]] || return 0
        builtin cd "$dir" &> /dev/null
    done
}
"------------------------------------------------------------------------------------------
j() {
    if [[ "$#" -ne 0 ]]; then
                cd $(autojump $@)
                return
    fi
    cd "$(autojump -s | sed '/_____/Q; s/^[0-9,.:]*\s*//' |  fzf --height 40% --reverse --inline-info)" 
}

        command! -bang -nargs=* Ag

                        \ call fzf#vim#ag(<q-args>,
                        \                 <bang>0 ? fzf#vim#with_preview('up:60%')
                        \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
                        \                 <bang>0)

"----------------------------------------------------------------------------------------- 
"-Diffwhite-Toggle-{{{
        set diffopt-=iwhite
        let g:diffwhitespaceon = 0
        function! ToggleDiffWhitespace()
                if g:diffwhitespaceon
                        set diffopt-=iwhite
                        let g:diffwhitespaceon = 0
                else
                        set diffopt+=iwhite
                        let g:diffwhitespaceon = 1
                endif
                diffupdate
        endfunc
" }}}
" Virtualedit Toggle {{{


set virtualedit=block
let g:virtualeditallon = 0

function! ToggleVirtualEdit()
        if g:virtualeditallon
                set virtualedit=block
                let g:virtualeditallon = 0
        else
                set virtualedit=all
                let g:virtualeditallon = 1
        endif
endfunc

nnoremap <leader>V :call ToggleVirtualEdit()<cr>

" TODO: Figure out the diffexpr shit necessary to make this buffer-local.
" nnoremap <leader>W :call ToggleDiffWhitespace()<CR>




"----------------------------------------------------------------------------------------- 

" tasks
nnoremap <silent><Leader>; :Unite -silent -toggle
                                \ grep:%::FIXME\|TODO\|NOTE\|XXX\|COMBAK\|@todo<CR>

" buffers
nnoremap <silent><Leader>b :Unite -silent buffer<CR>
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
         "----------------------------------------------------------------------------------------
         " set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
         " set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
         "------------------------------------------------------------------------------------------

         " My garbage brain can't ever remember digraph codes
         " inoremap <c-k><c-k> <esc>:help digraph-table<cr>


         "-nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

         " Kill window
         nnoremap K :q<cr>

         " select last paste in visual mode
         nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

         "-[popup menu]-
         set pumheight=20 " popup menu height. 0: long


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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
               " Autodetect filetype on first save                             {{{2
               augroup FiletypeOnSave
                       au!
                       au BufWritePost * if &ft == "" | filetype detect | endif
               augroup END

               " chmod +x on save                                              {{{2
               augroup MakeExecutableOnSave
                       " https://unix.stackexchange.com/questions/39982/vim-create-file-with-x-bit
                       " See also http://vim.wikia.com/wiki/Setting_file_attributes_without_reloading_a_buffer
                       au!
                       au BufWritePost * call chmodx#doit()
               augroup END

               " Make fugitive's fake buffers visually distinguishable         {{{2
               augroup MakeFugitiveVisible
                       au!
                       au BufNew,BufReadPost fugitive://* Margin 0
               augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
