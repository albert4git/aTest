set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" let g:deoplete#sources#jedi#extra_path = $PYTHONPATH

call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
call plug#end()

let g:deoplete#enable_at_startup = 1
call deoplete#enable_logging('DEBUG', 'deoplete.log')
call deoplete#custom#source('jedi', 'is_debug_enabled', 1)
