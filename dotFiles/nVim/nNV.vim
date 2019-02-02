" String. Set to '' (the empty string) if you don't want an extension appended by default.
" Don't forget the dot, unless you don't want one.
let g:nv_default_extension = '.md'

" String. Default is first directory found in `g:nv_search_paths`. Error thrown
"if no directory found and g:nv_main_directory is not specified
"let g:nv_main_directory = g:nv_main_directory or (first directory in g:nv_search_paths)

" Dictionary with string keys and values. Must be in the form 'ctrl-KEY':
" 'command' or 'alt-KEY' : 'command'. See examples below.
"--------------------------------------------------------------------------
let g:nv_keymap = {
                    \ 'ctrl-s': 'split ',
                    \ 'ctrl-v': 'vertical split ',
                    \ 'ctrl-t': 'tabedit ',
                    \ })
"--------------------------------------------------------------------------

" String. Must be in the form 'ctrl-KEY' or 'alt-KEY'
let g:nv_create_note_key = 'ctrl-x'
" String. Controls how new note window is created.
let g:nv_create_note_window = 'vertical split'
" Boolean. Show preview. Set by default. Pressing Alt-p in FZF will toggle this for the current search.
let g:nv_show_preview = 1
" Boolean. Wrap text in preview window.
let g:nv_wrap_preview_text = 1
" Float. Width of preview window as a percentage of screen's width. 50% by default.
let g:nv_preview_width = 50
" String. Determines where the preview window is. Valid options are: 'right', 'left', 'up', 'down'.
let g:nv_preview_direction = 'right'

" String. Yanks the selected filenames to the default register.
let g:nv_yank_key = 'ctrl-y'

" String. Separator used between yanked filenames.
let g:nv_yank_separator = "\n"
" Boolean. If set, will truncate each path element to a single character. If
" you have colons in your pathname, this will fail. Not set by default.
let g:nv_use_short_pathnames = 0
"List of Strings. Shell glob patterns. Ignore all filenames that match any of
" the patterns.
let g:nv_ignore_pattern = ['summarize-*', 'misc*']
" List of Strings. Key mappings like above in case you want to define your own
" handler function. Most users won't want to set this to anything.
let g:nv_expect_keys = []



Your Own Mappings

nnoremap <C-b> :Buffers<CR>
nnoremap <C-g>g :Ag<CR>
nnoremap <leader><leader> :Commands<CR>
nnoremap <C-p> :call FzfOmniFiles()<CR>

OmniFiles - My Customization

Auto select to use GitFiles or Files based on the project directory

fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GitFiles
  endif
endfun
