" ------------------------------------------------------------------------------
" # Installed Plugins
" ------------------------------------------------------------------------------

Plug '/usr/local/opt/fzf'               " Fzf fuzzy finder
Plug 'junegunn/fzf.vim'                 " Fzf vim wrapper
Plug 'jesseleite/vim-agriculture'       " Better ag search
Plug 'chriskempson/base16-vim'          " Base16 theming architecture
Plug 'vim-airline/vim-airline'          " Status line
Plug 'vim-airline/vim-airline-themes'   " Status line themes
Plug 'scrooloose/nerdtree'              " File system browser
Plug 'ludovicchabant/vim-gutentags'     " Tag generation
Plug 'majutsushi/tagbar'                " Tag browser
Plug 'mbbill/undotree'                  " Undo tree
Plug 'milkypostman/vim-togglelist'      " Quickfix/Location toggler
Plug 'airblade/vim-gitgutter'           " Git gutters
Plug 'tpope/vim-fugitive'               " Git commands
Plug 'tpope/vim-rhubarb'                " Github commands
Plug 'sheerun/vim-polyglot'             " Language pack
Plug 'w0rp/ale'                         " Linters
Plug 'tpope/vim-commentary'             " Code commenting
Plug 'ap/vim-css-color'                 " CSS colour rendering
Plug 'janko-m/vim-test'                 " Test runner
Plug 'junegunn/vim-peekaboo'            " Peek into registers
Plug 'jiangmiao/auto-pairs'             " Insert brackets, quotes, etc. in pairs
Plug 'SirVer/ultisnips'                 " Snippets
Plug 'markonm/traces.vim'               " Substitute highlighting and preview
Plug 'ntpeters/vim-better-whitespace'   " Highlight and trim whitespace
Plug 'tpope/vim-unimpaired'             " Handy bracket mappings
Plug 'tpope/vim-surround'               " Surround commands
Plug 'tpope/vim-repeat'                 " Better . repeating
Plug 'qpkorr/vim-bufkill'               " Close buffer without closing window or split
Plug 'junegunn/goyo.vim'                " Distraction free writing
Plug 'junegunn/limelight.vim'           " Hyper focus writing
Plug 'junegunn/vim-easy-align'          " Text alignment
Plug 'junegunn/vader.vim'               " Vimscript test framework
Plug 'tobyS/vmustache'                  " PHP docblocks dependency
Plug 'tobyS/pdv'                        " PHP docblocks
Plug 'mattn/emmet-vim'                  " HTML/CSS expand abbreviation magic
Plug 'Shougo/deoplete.nvim'             " IDE-like autocompletion
Plug 'roxma/nvim-yarp'                  " Deoplete dependency
Plug 'roxma/vim-hug-neovim-rpc'         " Deoplete dependency
Plug 'phpactor/phpactor',               " PHP refactoring and introspection
  \ { 'for': 'php', 'do': 'composer install' }
Plug 'kristijanhusak/deoplete-phpactor' " PHP Deoplete source
Plug 'vim-vdebug/vdebug'                " Debugging
Plug 'christoomey/vim-run-interactive'  " Run terminal commands in interactive shell
Plug 'houtsnip/vim-emacscommandline'    " Emacs style mappings for ex commands
Plug 'wellle/targets.vim'               " Additional text objects, and better seeking
Plug 'justinmk/vim-sneak'               " Sneak motion and better f/t motions
Plug 'AndrewRadev/writable_search.vim'  " Writable search buffer from quickfix

" Explicit annotation bindings for more accurate go to
let g:explicit_annotation_bindings = {
  \ 'fzf': 'fzf.vim',
  \ 'writable-search': 'writable_search.vim',
  \ }


" ------------------------------------------------------------------------------
" # Basic Plugin Configuration
" ------------------------------------------------------------------------------
" # This is for basic plugin config only.  More elaborate plugin config
" # files are located in the /plugin-config folder.

" Plugin: bufkill
let g:BufKillCreateMappings = 0

" Plugin: togglelist
let g:toggle_list_no_mappings = 1

" Plugin: nerdtree
let g:NERDTreeWinSize=45
let g:NERDTreeQuitOnOpen = 1

" Plugin: phpactor
let g:phpactorBranch = 'develop'

" Plugin: peekaboo
let g:peekaboo_window = 'vertical botright 60new'

" Plugin: ultisnips
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

" Plugin: pdv
let g:pdv_template_dir = $HOME . "/.vim/plugged/pdv/templates_snip"

" Plugin: deoplete
let g:deoplete#enable_at_startup = 1
" call deoplete#custom#source('_', 'max_menu_width', 120)
" call deoplete#custom#option('auto_complete_delay', 600)
" ...Why do these cause boot errors after moving from vimrc to this file?

" Plugin: vdebug
let g:vdebug_options= {
  \ "port" : 9001,
  \ }

" Plugin: polyglot
let g:vim_markdown_frontmatter = 1

" Disable unimparied mappings for emmet
" Plugin: unimpaired
let g:nremap = {"[e": "", "]e": ""}

" Plugin: targets
let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB'

" Plugin: writable-search
let g:writable_search_new_buffer_command = 'enew'

"----------------------------------------------------------------------------------
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 1
let g:netrw_winsize = 25
"----------------------------------------------------------------------------------
noremap <C-n> :bn<CR>
noremap <C-p> :bp<CR>
noremap <Leader>c :set cursorline! cursorcolumn!<CR>
noremap <F2> :w !diff '%' -<CR>
noremap <F4> :setlocal spell! spelllang=en_us<CR>
noremap <F5> :SyntasticCheck<CR>
noremap <Leader>, :nohlsearch<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>- :resize -1<CR>
nnoremap <Leader>= :resize +1<CR>

cnoremap <C-A> <C-B>
cnoremap w!! w !sudo tee % >/dev/null
"----------------------------------------------------------------------------------
"----------------------------------------------------------------------------------
let g:ale_sign_error = '!'
let g:ale_sign_style_error = '!'
let g:ale_sign_warning = '!'
let g:ale_sign_style_warning = '!'

let g:ale_linters = {
  \ 'php': ['php', 'phpcs', 'phpmd'],
  \ }

let g:ale_php_phpcs_standard = 'PSR2'
"----------------------------------------------------------------------------------
" YCM
let g:ycm_server_python_interpreter = $HOME . '/.vim/venv/bin/python'
"----------------------------------------------------------------------------------

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Label'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Label'],
  \ 'info':    ['fg', 'Comment'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Function'],
  \ 'pointer': ['fg', 'Statement'],
  \ 'marker':  ['fg', 'Conditional'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! Mapsn call fzf#vim#maps('n', 0)
command! Mapsx call fzf#vim#maps('x', 0)
command! Mapso call fzf#vim#maps('o', 0)
command! Mapsi call fzf#vim#maps('i', 0)
command! Mapsv call fzf#vim#maps('v', 0)
command! Mapsa call fzf#vim#maps('a', 0)
"---vimSnippets-------------------------------------------------------------------------------
snippet header "Define comment header."
" ------------------------------------------------------------------------------
" # ${0:Installed Plugins}
" ------------------------------------------------------------------------------
endsnippet

snippet fn "Define function."
function! ${1:name}($2)
  ${0:"}
endfunction
endsnippet

snippet cmd "Define simple command."
command! ${1:Name} ${0:call SomeFunction()}
endsnippet
"----------------------------------------------------------------------------------
snippet php "Open php."
<?php

$0
endsnippet

snippet class "Define class."
<?php

namespace $1;

class ${2:Name}
{
    ${0://}
}
endsnippet

snippet method "Define method."
${1:public} function ${2:name}($3)
{
    ${0://}
}
endsnippet

snippet prop "Define property."
${1:public} $${2:property} = $3;
endsnippet

snippet test "Define test method."
/** @test */
${1}function ${2:it_can_do_something}()
{
    ${0://}
}
endsnippet

snippet named "Named constructor."
/**
 * ${1:Instantiate some service.}
 *
 * @param ${3:ParamType} ${4:$param}
 */
public function __construct($3 $4)
{
    ${0://}
}

/**
 * $1
 *
 * @param $3 $4
 * @return static
 */
public static function ${2:namedConstructor}($3 $4)
{
    return new static($4);
}
endsnippet

snippet route "Laravel route."
Route::${1:get}('${2:route}', '${3:Controller}@${4:method}');
endsnippet

snippet routeclosure "Laravel route with closure."
Route::${1:get}('${2:route}', function ($3) {
    ${0://}
});
endsnippet

snippet measure "Laravel debugbar measuring."
\Debugbar::startMeasure('${1}', '$1');

${VISUAL}

\Debugbar::stopMeasure('$1');
endsnippet
"----------------------------------------------------------------------------------
"----------------------------------------------------------------------------------

" Syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Linter Customizations
let g:syntastic_sh_shellcheck_args = "-x"
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_python_pylint_args='-f parseable -r n'
let g:syntastic_python_flake8_args = "--ignore=E402,F403,E501,E302,F811"
let g:syntastic_python_pyflakes_args = "--ignore=E402,F403,E501,E302,F811"
