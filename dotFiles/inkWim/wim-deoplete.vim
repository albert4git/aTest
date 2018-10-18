
let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-6.0/lib/libclang.so.1"
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
 let g:deoplete#sources#clang#sort_algo = 'priority' " alphabetical
"--------------------------------------------------------------------------------
"-- g:deoplete#sources#clang#std
"--------------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
\ 'tex' : ['buffer', 'dictionary', 'file', 'omni']
\})
call deoplete#custom#source('omni', 'input_patterns', {
            \ 'tex' : '\\(?:'
                \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
                \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
                \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
                \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
                \ . '|\w*'
                \ .')',
                \}
                \)
" JAVA ? -----------------------------------------------------------------------
"https://github.com/Shougo/deoplete.nvim/issues/277
"--------------------------------------------------------------------------------
"call deoplete#custom#option('auto_refresh_delay', 0)
"call deoplete#custom#option('num_processes', 0)
call deoplete#custom#option('refresh_always', v:true)
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0

"let g:deoplete#max_abbr_width = 35
"let g:deoplete#max_menu_width = 20
"--------------------------------------------------------------------------------
let g:deoplete#sources#ternjs#timeout = 3
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
call deoplete#custom#source('_', 'min_pattern_length', 2)
"--------------------------------------------------------------------------------
" let g:deoplete#auto_complete_delay = 50  " Default is 50
" let g:deoplete#auto_refresh_delay = 500  " Default is 500
let g:deoplete#skip_chars = ['(', ')', '<', '>']
let g:deoplete#tag#cache_limit_size = 800000
let g:deoplete#file#enable_buffer_path = 1

let g:deoplete#sources#jedi#statement_length = 30
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#short_types = 1


"--------------------------------------------------------------------------------
call deoplete#custom#source('padawan',       'rank', 660)
call deoplete#custom#source('go',            'rank', 650)
call deoplete#custom#source('vim',           'rank', 640)
call deoplete#custom#source('flow',          'rank', 630)
call deoplete#custom#source('TernJS',        'rank', 620)
call deoplete#custom#source('jedi',          'rank', 610)
call deoplete#custom#source('omni',          'rank', 600)
call deoplete#custom#source('neosnippet',    'rank', 510)
call deoplete#custom#source('member',        'rank', 500)
call deoplete#custom#source('file_include',  'rank', 420)
call deoplete#custom#source('file',          'rank', 410)
call deoplete#custom#source('tag',           'rank', 400)
call deoplete#custom#source('around',        'rank', 330)
call deoplete#custom#source('buffer',        'rank', 320)
call deoplete#custom#source('dictionary',    'rank', 310)
call deoplete#custom#source('tmux-complete', 'rank', 300)
call deoplete#custom#source('syntax', 'rank', 200)
"--------------------------------------------------------------------------------
call deoplete#custom#source('omni',          'mark', '⌾')
call deoplete#custom#source('flow',          'mark', '⌁')
call deoplete#custom#source('padawan',       'mark', '⌁')
call deoplete#custom#source('TernJS',        'mark', '⌁')
call deoplete#custom#source('go',            'mark', '⌁')
call deoplete#custom#source('jedi',          'mark', '⌁')
call deoplete#custom#source('vim',           'mark', '⌁')
call deoplete#custom#source('neosnippet',    'mark', '⌘')
call deoplete#custom#source('tag',           'mark', '⌦')
call deoplete#custom#source('around',        'mark', '↻')
call deoplete#custom#source('buffer',        'mark', 'ℬ')
call deoplete#custom#source('tmux-complete', 'mark', '⊶')
call deoplete#custom#source('syntax',        'mark', '♯')
call deoplete#custom#source('member', 'mark', '.')
