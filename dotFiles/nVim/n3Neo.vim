" File switching, start in insert mode
nnoremap <silent> <D-p> :<C-u>Unite -start-insert file_rec/async:!<CR>
" Buffer switching
nnoremap <silent> <D-u> :<C-u>Unite -quick-match buffer<CR>
" Tab switching
nnoremap <silent> <C-t> :<C-u>Unite -quick-match buffer tab<CR>

" Enabled to track yank history
let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_save_clipboard = 1
" Yank history like YankRing
nnoremap <silent> <D-y> :<C-u>Unite history/yank<CR>

" Open most recent files
" Require Shougo/neomru.vim
nnoremap <silent> <D-o> :<C-u>Unite file_mru<CR>


tpope/vim-surround

Provides mappings to easily delete, change and add such surroundings in pairs.

xmap ( S)
xmap { S{
xmap [ S]
xmap " S"
xmap ' S'
xmap ` S`
xmap T St

"******************
if s:meet_neocomplete_requirements()
  "" neocomplete
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
else
  "" neocomplcache
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_ignore_case = 1
  let g:neocomplcache_enable_smart_case = 1
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns._ = '\h\w*'
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
endif
