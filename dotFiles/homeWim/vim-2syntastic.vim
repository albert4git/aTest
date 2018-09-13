"let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_java_javac_executable = '~/.vim/plugged/syntastic/syntax_checkers/java/javac.vim'
let g:systastic_python_checkers = ['pylint', 'python']
let g:syntastic_mode_map = {'mode': 'active'}
let g:syntastic_python_pylint_quiet_messages = {}
let g:syntastic_auto_jump = 1
let g:syntastic_echo_current_error  = 1
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_php_checkers=['php']
let g:syntastic_css_checkers=['csslint']
let g:syntastic_check_on_w = 1
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_enable_highlighting=0
let g:syntastic_enable_signs=1
"--------------------------------------------------------------------------------
highlight SyntasticErrorLine guibg=#550000
highlight SyntasticWarningLine guibg=#331d1e
"noremap <F10> :SyntasticCheck<CR>
"--------------------------------------------------------------------------------
highlight clear SyntasticError
highlight link SyntasticError Error
