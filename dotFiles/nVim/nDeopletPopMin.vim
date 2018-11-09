 Your minimal init.vim/vimrc
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




" For Vim only
"set runtimepath+=~/path/to/nvim-yarp/
"set runtimepath+=~/path/to/vim-hug-neovim-rpc/
