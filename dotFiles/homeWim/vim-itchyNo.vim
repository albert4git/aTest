silent! let [&t_SI,&t_EI] = exists('$TMUX') ? ["\ePtmux;\e\e[5 q\e\\","\ePtmux;\e\e[2 q\e\\"] : ["\e]50;CursorShape=1\x7","\e]50;CursorShape=0\x7"]

" Cache files
let CACHE = expand((isdirectory(expand('~/.vim/cache')) ? '~/vimCache' : '~') . '/.vim/cache')
if !isdirectory($CACHE) | silent! call mkdir($CACHE, 'p') | endif
silent! set history=1000 viminfo='10,/100,:1000,<10,@10,s10,h,n$CACHE/.viminfo
silent! set nospell spellfile=$CACHE/en.utf-8.add
silent! set swapfile directory=$CACHE/swap,$CACHE,/var/tmp/vim,/var/tmp
silent! set nobackup backupdir=$CACHE/backup,$CACHE,/var/tmp/vim,/var/tmp
silent! set undofile undolevels=1000 undodir=$CACHE/undo,$CACHE,/var/tmp/vim,/var/tmp

set statusline=%m%f:%l/%L\ %P\ %<<%-3b\ 0x%-2B>\ %y%r%w%=b:%n\ w:%{winnr()}
set statusline=%<%m%f:%l\ _%{winnr()}_\ %y%r%=<%b\ 0x%B>\ \ %c%V\ %P
"--------------------------------
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %P%*
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{gutentags#statusline()}


" Maximize the window
autocmd vimrc GUIEnter * silent! simalt ~x

" Reset t_vb again
autocmd vimrc GUIEnter * silent! set t_vb=

" Key mappings
" Increment and decrement
nnoremap + <C-a>
nnoremap - <C-x>

" yank to the end of line
nnoremap Y y$

" yank entire lines
nnoremap yie :<C-u>%y<CR>


" navigate window
"?" nnoremap <C-h> <C-w>h
"?" nnoremap <C-j> <C-w>j
"?" nnoremap <C-k> <C-w>k
"?" nnoremap <C-l> <C-w>l
"?" nnoremap <C-x> <C-w>x
"?" nnoremap <expr><C-m> (bufname('%') ==# '[Command Line]' <bar><bar> &l:buftype ==# 'quickfix') ? "<CR>" : "<C-w>j"
"?" nnoremap <C-q> <C-w>

" improve scroll
noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" . (line('.') < 1         + winheight(0) ? 'H' : 'L')
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
noremap <expr> <C-y> (line('w0') <= 1         ? 'k' : "\<C-y>")
noremap <expr> <C-e> (line('w$') >= line('$') ? 'j' : "\<C-e>")

" Open dot files
execute 'nnoremap \. :edit' resolve(expand('~/.vimrc')) '<CR>'
execute 'nnoremap \; :edit' resolve(expand('~/.vimrc.yaml')) '<CR>'
execute 'nnoremap \, :edit' resolve(expand('~/.zshrc')) '<CR>'

" tab
nnoremap <silent> <C-t> :<C-u>tabnew<CR>
inoremap <silent> <C-t> <ESC>:<C-u>tabnew<CR>
nnoremap <silent> g0 :<C-u>tabfirst<CR>
nnoremap <silent> g$ :<C-u>tablast<CR>

" tag
vnoremap <C-]> <ESC><C-w><C-]><C-w>H
nnoremap <C-@> <C-t>


" disable EX-mode
nnoremap  Q <Nop>
nnoremap gQ <Nop>

" Go to the starting position after visual modes
vnoremap <ESC> o<ESC>

" Operator [
onoremap [ <ESC>

" Execute register
nnoremap ] @



" terminal
silent! set termwinkey=<C-q>
silent! tnoremap <silent> <C-q><C-q> <C-q>:try<bar>hide<bar>catch<bar>quit!<bar>endtry<CR>
silent! tnoremap <C-q><C-[> <C-q>N

"?" Escape from Select mode to Normal mode
"?" snoremap <ESC> <C-c>

" Enable ftplugin, indent, syntax
filetype off
if has('vim_starting')
  let &runtimepath = (isdirectory(expand('~/Dropbox/.vim')) ? '~/Dropbox' : '~') . '/.vim/miv/miv/,' . &runtimepath
endif
filetype plugin indent on
silent! syntax enable
if !has('vim_starting')
  doautocmd FileType
endif
