" ------------------------------------------------------------------------------
" # Register Quickfix Local Mappings
" ------------------------------------------------------------------------------

augroup quickfix_mappings
  autocmd!
  autocmd FileType qf call QuickfixLocalMappings()
augroup END


" ------------------------------------------------------------------------------
" # Quickfix Helpers
" ------------------------------------------------------------------------------

command! RemoveQuickfixItem silent! call RemoveQuickfixItem()
command! PreviewQuickfixItem silent! call PreviewQuickfixItem()

" When using `dd` in the quickfix list, remove the item from the quickfix list.
" https://stackoverflow.com/questions/42905008/quickfix-list-how-to-add-and-remove-entries
function! RemoveQuickfixItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  copen
endfunction

function! PreviewQuickfixItem()
  .cc
  wincmd j
endfunction

" ------------------------------------------------------------------------------
" # Vimscript Helpers
" ------------------------------------------------------------------------------

function! FlipDictionary(dictionary)
  let flipped = {}
  for [key, value] in items(a:dictionary)
    let flipped[value] = key
  endfor
  return flipped
endfunction
" ------------------------------------------------------------------------------
" # Everything cosmetic
" ------------------------------------------------------------------------------

" Overall colour scheme
colorscheme base16-monokai

" Airline colour scheme
let g:airline_theme = 'base16color'

" Customize vertical split character
set fillchars+=vert:\ ,

" Highlight 121st character on lines that exceed 120
call matchadd('ColorColumn', '\%121v', 100)

" Customize highlight colors
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Search ctermbg=blue ctermfg=white
highlight Visual ctermbg=black ctermfg=white
highlight LineNr ctermbg=none
highlight CursorLineNR ctermbg=green ctermfg=green
highlight SignColumn ctermbg=none
highlight ColorColumn ctermbg=black
highlight GitGutterAdd ctermbg=none ctermfg=green
highlight GitGutterChange ctermbg=none ctermfg=yellow
highlight GitGutterDelete ctermbg=none ctermfg=red
highlight GitGutterChangeDelete ctermbg=none ctermfg=red
highlight VertSplit ctermbg=none ctermfg=none
highlight StatusLine ctermfg=none ctermbg=none
highlight StatusLineNC ctermfg=none ctermbg=none
highlight CursorLine ctermbg=black ctermfg=none
highlight QuickFixLine ctermbg=black ctermfg=none
highlight ALEErrorSign ctermbg=none ctermfg=red
highlight ALEWarningSign ctermbg=none ctermfg=magenta
highlight Pmenu ctermfg=grey ctermbg=black
highlight PmenuSel ctermfg=white ctermbg=blue
highlight PmenuSbar ctermbg=black
highlight PmenuThumb ctermbg=white

" ------------------------------------------------------------------------------
" # Sane defaults
" ------------------------------------------------------------------------------

set hidden
set nobackup
set noswapfile
set autoread
set confirm
set encoding=utf-8
set clipboard=unnamed
set backspace=indent,eol,start
set relativenumber
set noshowmode

" Set updatetime for CursorHold, gitgutter, etc.
set updatetime=1000

" Auto complete menu options
set completeopt=menu,menuone,noinsert,noselect

" Yeah, it's a package, but it comes with vim
packadd! matchit

" Check for external changes and reload buffer
augroup check_for_external_changes
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if filereadable(bufname('%')) | checktime
augroup END

" This one causes deoplete flicker?
" set lazyredraw

" ------------------------------------------------------------------------------
" # Register Help Local Mappings
" ------------------------------------------------------------------------------

augroup help_local_mappings
  autocmd!
  autocmd BufWinEnter * if &l:buftype ==# 'help' | call HelpLocalMappings() | endif
augroup END


" ------------------------------------------------------------------------------
" # Load Fullscreen Help Buffers
" ------------------------------------------------------------------------------

augroup fullscreen_help_buffer
  autocmd!
  autocmd BufWinEnter * if &l:buftype ==# 'help' | wincmd o | endif
augroup END
" ------------------------------------------------------------------------------
" # Filetype Settings
" ------------------------------------------------------------------------------

augroup filetype_settings
  autocmd!
  autocmd FileType zsh setlocal ts=2 sw=2 sts=2 expandtab
  autocmd FileType vim setlocal ts=2 sw=2 sts=2 expandtab
  autocmd FileType php setlocal ts=4 sw=4 sts=4 expandtab commentstring=//\ %s omnifunc=phpactor#Complete
  autocmd FileType html setlocal ts=4 sw=4 sts=4 expandtab
  autocmd FileType css setlocal ts=4 sw=4 sts=4 expandtab
  autocmd FileType scss setlocal ts=4 sw=4 sts=4 expandtab
  autocmd FileType less setlocal ts=2 sw=2 sts=2 expandtab
  autocmd FileType javascript setlocal ts=4 sw=4 sts=4 expandtab
  autocmd FileType vue setlocal ts=4 sw=4 sts=4 expandtab commentstring=//\ %s
  autocmd FileType vue syntax sync fromstart
  autocmd FileType snippets setlocal ts=4 sw=4 sts=4 expandtab
augroup END


" ------------------------------------------------------------------------------
" # Experimental Stuff
" ------------------------------------------------------------------------------

" Always insert completion popup candidate without entering new line.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Strip whitespace on save
augroup misc_commands
  autocmd!
  autocmd BufEnter * EnableStripWhitespaceOnSave
augroup END

function! RecordGif()
  let g:fzf_layout = { 'down': '~55%' }
  :ALEDisable
endfunction
command! RecordGif silent! call RecordGif()

augroup goyo_events
  autocmd!
  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup END

let g:limelight_conceal_ctermfg = 'black'

if !exists("*s:goyo_enter")
  function! s:goyo_enter()
    nnoremap j gj
    nnoremap k gk
    Limelight
  endfunction
endif

if !exists("*s:goyo_leave")
  function! s:goyo_leave()
    nunmap j
    nunmap k
    Limelight!
    so $MYVIMRC
  endfunction
endif

if has("gui_running")
  set guioptions=
  set guifont=Menlo\ LG100
endif

" command! -bang -nargs=+ Methods
"   \ call fzf#vim#buffer_tags(<q-args>, { 'options': ['--nth', '..-2,-1', '--query', '^f$ '] })

function! OpenWritableSearchBufferFromQuickfix()
  WritableSearchFromQuickfix
  wincmd o
endfunction
command! OpenWritableSearchBufferFromQuickfix silent! call OpenWritableSearchBufferFromQuickfix()


" Because :sav works, but doesn't save relative to the source's location, and doesn't open the duplicated file either.

function! DuplicateCurrentFile(path)
  let path = "%:h/" . a:path
  execute "saveas " . path
  execute "edit " . path
endfunction

command! -bar -nargs=1 Duplicate call DuplicateCurrentFile(<q-args>)

" Php import sorting.
" Look into php-cs-fixer and ale instead? :P

function! SortLinesByLength() range
  silent execute a:firstline . ',' . a:lastline . 'sort'
  silent execute a:firstline . ',' . a:lastline . 's/^\(.*\)$/\=strdisplaywidth(submatch(0))." ".submatch(0)/'
  silent execute a:firstline . ',' . a:lastline . 'sort n'
  silent execute a:firstline . ',' . a:lastline . 's/^\d\+\s//'
endfunction

function! PhpSortImports(...)
  normal gg
  call search('use .*;')
  let firstline = line('.')
  if firstline == 1
    echo 'No imports to sort.'
    return
  endif
  normal }k
  let lastline = line('.')
  if a:0 && a:1 == 'length'
    execute firstline . ',' . lastline . 'call SortLinesByLength()'
    echo 'Sorted imports by length.'
  else
    execute firstline . ',' . lastline . 'sort'
    echo 'Sorted imports alphabetically.'
  endif
endfunction

command! -bar PhpSortImports call PhpSortImports()
command! -bar PhpSortImportsByLength call PhpSortImports('length')

nmap <Leader>psi :PhpSortImports<CR>
nmap <Leader>psl :PhpSortImportsByLength<CR>

" Messing with CtrlSF

let g:ctrlsf_ackprg = '/usr/local/bin/ag'

let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

command! -n=* -comp=customlist,ctrlsf#comp#Completion CtrlSFSmart call ctrlsf#Search(agriculture#smart_quote_input(<q-args>))

nmap <Leader><Leader><Leader>/ :CtrlSFSmart<Space>

