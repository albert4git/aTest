
"apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
apt-get install flake8
sudo apt-get install   python-libxml2  python-matplotlib python-numpy ipython python-scipy python-tk

git clone https://github.com/rtqichen/torchdiffeq.git
cd torchdiffeq
pip install -e .


        " [ IDE ] {{{
            " Python-mode-klen {{{ Python IDE.
                " K: doc <C-space>: Rope autocomp
                " <Leader>r: run <Leader>b: set/unset breakpoint.
                " pylint, rope, pydoc  :help Python-mode-contents Show documentation
                    " key <-> command {{{
                    " [[      jump on previous  class or function.
                    " ]]      jump on next class or function.
                    " [m      jump on previous class or method.
                    " ]m      jump on next class or method.
                    " ac      select a class. Ex: vac, dac, yac, cac.
                    " ic      select inner class. Ex: vic, dic, yic, cic.
                    " am      select a function or method. Ex: vam, dam, yam, cam.
                    " im      select inner function or method. Ex: vim, dim, yim, cim.
                    " }}}
                let g:pymode_doc = 1 " Load show documentation plugin
                let g:pymode_doc_key = 'K' " Key for show python documentation
                let g:pydoc = 'pydoc' " Executable command for documentation search
                " Run python code
                let g:pymode_run = 1 " Load run code plugin
                let g:pymode_run_key = '<LocalLeader>r' " Key for run python code
                " Pylint checking
                let g:pymode_lint = 1 " Load pylint code plugin
                let g:pymode_lint_checker = "pyflakes" " pylint, pyflakes or PEP8
                let g:pymode_lint_config = "$HOME/.pylintrc" " Pylint configuration file
                let g:pymode_lint_write = 1 " Check code every save
                let g:pymode_lint_cwindow = 1 " Auto open cwindow if errors be finded
                let g:pymode_lint_jump = 1 " Auto jump on first error
                let g:pymode_lint_signs = 1 " Place error signs
                let g:pymode_lint_minheight = 3 " Minimal height of pylint error window
                let g:pymode_lint_maxheight = 6 " Maximal height of pylint error window
                " Rope refactoring library
                let g:pymode_rope = 1 " Load rope plugin
                let g:pymode_rope_auto_project = 1 " Auto create and open ropeproject
                let g:pymode_rope_enable_autoimport = 1 " Enable autoimport
                let g:pymode_rope_autoimport_generate = 1 " Auto generate global cache
                let g:pymode_rope_autoimport_underlineds = 0
                let g:pymode_rope_codeassist_maxfixes = 10
                let g:pymode_rope_sorted_completions = 1
                let g:pymode_rope_extended_complete = 1
                let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]
                let g:pymode_rope_confirm_saving = 1
                let g:pymode_rope_global_prefix = "<C-x>p"
                let g:pymode_rope_local_prefix = "<C-c>r"
                let g:pymode_rope_vim_completion = 1 " use vim's complete function.
                let g:pymode_rope_guess_project = 0 " scan project slow completion speed
                let g:pymode_rope_goto_def_newwin = 1
                let g:pymode_rope_always_show_complete_menu = 1 " default=0
                " Other stuff
                let g:pymode_breakpoint = 1 " Load breakpoints plugin
                let g:pymode_breakpoint_key = '<LocalLeader>b' " set/unset breakpoint
                let g:pymode_utils_whitespaces = 1 " Autoremove unused whitespaces
                let g:pymode_options_indent = 1 " default pymode python indent options
                let g:pymode_options_fold = 1 " Set default pymode python fold options
                let g:pymode_options_other = 1 " Set default pymode python other options
                " utils
                let g:pymode_utils = 1 " utils script
                let g:pymode_utils_whitespaces = 1 " autoremove unused whitespaces
                " virtualenv
                let g:pymode_virtualenv = 1 " virtualenv support
                " syntax
                let g:pymode_syntax = 1 " use custom syntax highlighting
                let g:pymode_syntax_builtin_objs = 1
                let g:pymode_syntax_builtin_funcs = 1
                " indent
                let g:pymode_options_indent = 1
                " fold
                let g:pymode_options_fold = 1
                " others
                let g:pymode_options_other = 1
                " PyLintWindowToggle command
                " motion
                let g:pymode_motion = 1 " pymode enable some python motions.
            " }}}
        " }}}



" Format JSON
map <leader>j !python -m json.tool<CR>


  " Programming: Python                                         {{{3

  " Show [CurrentClass.current_method] in the status line for Python files
  " (my fork because bugfixes)
  Plug 'mgedmin/pythonhelper.vim'

  " Insert Python import statements computed from tags, bound to <F5>
  Plug 'mgedmin/python-imports.vim'

  " A smarter :Tag [package.][module.][class.]name command for Python
  Plug 'mgedmin/pytag.vim'

  " <Leader>oo to jump to Python standard library source code
  " (my fork because bugfixes)
  Plug 'mgedmin/python_open_module.vim'

  " Python folding, to replace my hacky syntax/python.vim perhaps?
  " (I'm not ready to switch yet)
""Plug 'tmhedberg/SimpylFold'

  " Automate switching between code and unit test files, bound to <C-F6>
  Plug 'mgedmin/test-switcher.vim'

  " Locate the source code line from clipboard contents, bound to <F7>
  Plug 'mgedmin/source-locator.vim'

  " :EnableTestOnSave and have fun doing code katas
  Plug 'mgedmin/test-on-save.vim'

  " :HighlightCoverage for Python
  Plug 'mgedmin/coverage-highlight.vim'
  noremap [C :<C-U>PrevUncovered<CR>
  noremap ]C :<C-U>NextUncovered<CR>

  " Better Python autoindentation
  Plug 'Vimjas/vim-python-pep8-indent'
  " Misbehaves for long literals (over 50 lines), see
  " https://github.com/Vimjas/vim-python-pep8-indent/pull/90

  " More up-to-date Python syntax that supports f-strings and everything
  Plug 'vim-python/python-syntax'
  let python_highlight_all = 1
  let python_slow_sync = 1

