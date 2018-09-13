let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#omni#input_patterns.java = [
            \'[^. \t0-9]\.\w*',
            \'[^. \t0-9]\->\w*',
            \'[^. \t0-9]\::\w*',
            \]
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['javacomplete2']
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#set('omni', 'mark', '')
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
set isfname-==


I have resistered LanguageClient as a deoplete source .But the sorter and matcher of completion seems like unpleasant .How to customise the sorter and matcher just like vscode behavior or another source ?
I have read LanguageClient source's code.
It uses default matcher and sorter.
So

 call deoplete#custom#source('LanguageClient', 'sorters', [])

It disables the default sorter(sorter_rank).

And

    How to customise the sorter and matcher just like vscode behavior or another source ?

I don't know VSCode's sort.
But the default is sorter_rank and same with another source.

You can create the new sorter. You can choose them.


" Your minimal init.vim/vimrc
set runtimepath+=~/path/to/deoplete.nvim/
let g:deoplete#enable_at_startup = 1
call deoplete#custom#buffer_option('require_same_filetype', v:false)

  call deoplete#custom#source('LanguageClient','mark', 'ℰ')
  call deoplete#custom#source('omni',          'mark', '⌾')
  call deoplete#custom#source('flow',          'mark', '⌁')
  call deoplete#custom#source('TernJS',        'mark', '⌁')
  call deoplete#custom#source('go',            'mark', '⌁')
  call deoplete#custom#source('jedi',          'mark', '⌁')
  call deoplete#custom#source('vim',           'mark', '⌁')
  call deoplete#custom#source('ultisnips',     'mark', '⌘')
  call deoplete#custom#source('around',        'mark', '↻')
  call deoplete#custom#source('buffer',        'mark', 'ℬ')
  call deoplete#custom#source('tmux-complete', 'mark', '⊶')
  call deoplete#custom#source('syntax',        'mark', '♯')
  call deoplete#custom#source('member',        'mark', '.')

    set completeopt-=preview  "close show_docstring
    let g:deoplete#enable_at_startup = 0
    " Set minimum syntax keyword length.
    let g:min_pattern_length=2

    " delay
    let g:deoplete#auto_complete_delay=0
    " auto_refresh
    let g:auto_refresh_delay=0
    
    let refresh_always=true
    


    " Plugin key-mappings.
    inoremap <expr><C-g>     deoplete#undo_completion()
    inoremap <expr><C-l>     deoplete#refresh()

    " <C-h>: close popup and delete backword char.
    inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"

    " register omni
    call deoplete#custom#source('omni', 'functions', {
    \ 'html': 'htmlcomplete#CompleteTags',
    \ 'css' : 'csscomplete#CompleteCSS',
    \ 'scss' : 'csscomplete#CompleteCSS',
    \ 'sass' : 'csscomplete#CompleteCSS',
    \ 'xml' : 'xmlcomplete#CompleteTags',
    \ 'markdown' : 'htmlcomplete#CompleteTags',
    \ })

    call deoplete#custom#source('omni', 'input_patterns', {
    \ 'html' : '<[^>]',
    \ 'css'  : '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
    \ 'scss' : '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
    \ 'sass' : '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
    \ 'xml'  : '<[^>]*',
    \ 'md'   : '<[^>]*',
    \})
