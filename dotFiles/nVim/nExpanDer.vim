        "!-Expander6-nice- nnoremap <silent> ;n i<c-r>=neosnippet#expand('func')<cr>

        "?-inoremap <silent><CR>       <C-r>=pumvisible()?"\<lt>C-y>":"\<lt>CR>"<CR>  "--Auto Open/Close popup
        "!-set completeopt=longest,menuone,preview
        "?-inoremap <expr><c-g> deoplete#undo_completion()
        "?-inoremap <expr><C-l>     deoplete#refresh()
        "let g:UltiSnipsExpandTrigger="<c-;>"

        "let g:deoplete#sources#syntax#min_keyword_length=2 "-www
        "let g:deoplete#omni#functions = {}
        "let g:deoplete#sources = {}
        "------------------------------------------------------------------------------------------
        " call deoplete#custom#option('sources', {
        "                         \ 'tex' : ['buffer', 'dictionary', 'file', 'omni']
        "                         \})
        "------------------------------------------------------------------------------------------
        " call deoplete#custom#option('sources', {
        "                         \ 'tex' : ['buffer', 'omni']
        "                         \})
        "------------------------------------------------------------------------------------------
        " call deoplete#custom#source('omni', 'input_patterns', {
        "                                 \ 'tex' : '\\(?:'
        "                                 \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
        "                                 \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        "                                 \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
        "                                 \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
        "                                 \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
        "                                 \ . '|\w*'
        "                                 \ .')',
        "                             \}
        "                         \)
        "------------------------------------------------------------------------------------------




" deoplete + neosnippet + autopairs changes
let g:AutoPairsMapCR=0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

If you want to use a different collection of snippets than the built-in ones, then you can set a path to the snippets with the g:neosnippet#snippets_directory variable (e.g Honza's Snippets)

But if you enable g:neosnippet#enable_snipmate_compatibility, neosnippet will load snipMate snippets from runtime path automatically.

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

"??? Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'



        set completeopt=longest,menuone,preview
        let g:deoplete#sources = {}
        let g:deoplete#omni#functions = {}


        set complete=.,w,b,u,t,k
        "autocmd Syntax * exec('set dict=/usr/share/vim/syntax/' .expand('<amatch>') .'.vim')
        "------------------------------------------------------------------------------------------
        " Expander4 
        " let g:SuperTabDefaultCompletionType = "<c-n>"
        " let g:SuperTabLongestHighlight = 1
        " let g:SuperTabCrMapping = 1
        "------------------------------------------------------------------------------------------
        "193 Insert the current filename at cursor postion.
        "imap \f   <C-R>=expand("%:t:r")<CR>



        "------------------------------------------------------------------------------------------
        " let g:UltiSnipsUsePythonVersion = 2
        " let g:UltiSnipsExpandTrigger="<c-;>"
        " let g:UltiSnipsJumpForwardTrigger="<c-b>"
        " If you want :UltiSnipsEdit to split your window.
        " let g:UltiSnipsEditSplit="vertical"
        "------------------------------------------------------------------------------------------



set nocompatible
set encoding=utf-8
set fileencoding=utf-8
syntax on
execute pathogen#infect()
filetype plugin indent on
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = $HOME.'/vimfiles/bundle/vim-snippets/UltiSnips'




<Tab>       * =TriggerSnippet()<CR>
         Last set from ~\vimfiles\bundle\snipmate.vim\after\plugin\snipMate.vim
