"-------------------------------------------------------------------------------
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ neocomplete#start_manual_complete()
inoremap <S-TAB> <C-p>
"-------------------------------------------------------------------------------
" expansion
"-------------------------------------------------------------------------------
inoremap <silent> <C-]> <C-x><C-]>
inoremap <silent> <C-o> <C-x><C-o>
inoremap <silent> <C-k> <C-x><C-k>
inoremap <silent> <C-d> <C-x><C-d>
inoremap <silent> <C-u> <C-x><C-u>
inoremap <silent> <C-f> <C-x><C-f>
inoremap <silent> <C-l> <C-x><C-l>

"-------------------------------------------------------------------------------
let g:UltiSnipsSnippetsDir='~/.vim/plugged/ultisnips/'
let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/ultisnips/', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"
"let g:UltiSnipsEditSplit="vertical"

" circular windows navigation
nnoremap <Tab>   <c-W>w
nnoremap <S-Tab> <c-W>W
" jump list
nnoremap <C-j> <C-i>
nnoremap <C-k> <C-o>
"-------------------------------------------------------------------------------
imap <C-b>     <Plug>(neosnippet_expand_or_jump)
smap <C-b>     <Plug>(neosnippet_expand_or_jump)
xmap <C-b>     <Plug>(neosnippet_expand_target)
"-------------------------------------------------------------------------------
"-------------------------------------------GGG---------------------------------
"-------------------------------------------------------------------------------
set wmh=0
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>|
map <C-L> <C-W>l<C-W>|
map <C-=> <C-W>=
"-------------------------------------------------------------------------------
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set complete=.,w,b,u,t,k
"-------------------------------------------------------------------------------
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"-------------------------------------------------------------------------------
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
"-------------------------------------------------------------------------------
set dictionary+=~/git/aTest/redVim/dikt/english-words.txt
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $CACHE.'/vimshell/command-history',
            \ 'java' : '~/.vim/dict/java.dict,~/.vim/dict/ruby.dict',
            \ }
"-------------------------------------------------------------------------------
let g:tq_mthesaur_file="~/git/aTest/redVim/dikt/mthesaur.txt"
"--------------------------------------------HHH--------------------------------
set thesaurus=mthesaur.txt
let s:thesaurus_pat = "~/git/aTest/redVim/dikt/.txt"

imap <c-s> <plug>(fzf-complete-line)
imap <c-s> <plug>(fzf-complete-line)


command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
      \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))

