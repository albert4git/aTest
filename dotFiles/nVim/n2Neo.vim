 let neocomplete_mode = 1
set encoding=utf-8
 
" start vundler
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
" core plugins
Bundle "gmarik/vundle"
Bundle "flazz/vim-colorschemes"
Bundle "kien/ctrlp.vim"
 
Bundle "fsouza/go.vim"
Bundle "dgryski/vim-godef"
Bundle "nsf/gocode"
Bundle "Blackrush/vim-gocode"
 
  Bundle "Shougo/neocomplete"
  Bundle "Shougo/neosnippet"
  Bundle "honza/vim-snippets"
  Bundle "Shougo/echodoc.vim"
 
" enable all the plugins
filetype plugin indent on
 
set ls=2
 
  " " NEOCOMPLETE (experimental)
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  let g:neocomplete#data_directory = "~/.vim/tmp/swap"
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 2
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
 
  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }
 
  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'
 
  " " snipmate rebind
  " imap <C-l> <esc>a<Plug>snipMateNextOrTrigger
  " smap <C-l> <Plug>snipMateNextOrTrigger
 
  " Plugin key-mappings.
  inoremap <expr><C-g>  neocomplete#undo_completion()
  inoremap <expr><C-l>  neocomplete#complete_common_string()
  inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-u>  neocomplete#close_popup() . "\<C-u>"
  inoremap <expr><C-h>  neocomplete#smart_close_popup() . "\<C-w>"
 
  " Plugin key-mappings.
  imap <C-i>     <Plug>(neosnippet_expand_or_jump)
  smap <C-i>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-i>     <Plug>(neosnippet_expand_target)
 
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
 
  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
 
  " golang fix
  let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
 
  " neosnippet
  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
 
  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
 
  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
 
  " vim-rails ovveride fix
  let g:neocomplete#force_overwrite_completefunc = 1
 
  " ruby au's
  augroup RubyCompletion
    au!
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
    autocmd FileType eruby set filetype=html.eruby
  augroup END
