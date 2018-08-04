" ------------------VimRC--Short--MPI--Last-------------------------------------
" ln -s /usr/etc/vim_settings/vimrc /home/user/.vimrc
" ln -s /usr/etc/vim_settings/vim /home/user/.vim
"------------------------------------------------
" ln -s ~/.vim/vimrc ~/.vimrc               "I use symbolic link...
" ln ~/.vimrc .vim/.vimrc                   "hard links are the best ...
" export VIMINIT="source ~/.vim/vimrc"
" set viminfo+=n~/.vim/viminfo
" echo ($VIMRUNTIME)
" echo($MYVIMRC)
"------------------------------------------------
" set runtimepath=/home/b/.vim,$VIMRUNTIME
" let $VIMHOME = $HOME."/.vim"
"------------------------------------------------
"    system vimrc file: "$VIM/vimrc"
"      user vimrc file: "$HOME/.vimrc"
"  2nd user vimrc file: "~/.vim/vimrc"
"       user exrc file: "$HOME/.exrc"
"   system gvimrc file: "$VIM/gvimrc"
"     user gvimrc file: "$HOME/.gvimrc"
" 2nd user gvimrc file: "~/.vim/gvimrc"
"        defaults file: "$VIMRUNTIME/defaults.vim"
"     system menu file: "$VIMRUNTIME/menu.vim"
"   fall-back for $VIM: "/usr/share/vim"
"-------------------------------------------------------------------------------

source ~/vim-plug.vim
source ~/vim-preSet.vim
source ~/vim-deopleteA.vim
"source ~/vim-neo-omni.vim
"source ~/vim-2syntastic.vim
"source ~/vim-make.vim
"source ~/vim-autocmd.vim
source ~/vim-maps.vim
source ~/vim-2optic.vim
source ~/vim-searchA.vim
source ~/vim-abbr.vim
source ~/vim-postSet.vim

"-------------------------------------------------------------------------------