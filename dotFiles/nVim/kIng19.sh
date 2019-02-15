#/bin/bash
# ln -sf /full/path/to/parent/child/child ../child1
# ln -sf /full/path/to/parent/child/child ../child2
# To make a link to a file in another user's home directory:
# ln ~sandra/prog.c .
############################################################################################
############################################################################################
# mv ~/.bashrc ~/"1bashrc-$(date +"%m-%d-%y-%r")"
# ln -s ~/atest/dotFiles/bashrc_color ~/.bashrc
#
# mv ~/.bashrc_help ~/"1bashrc_help-$(date +"%m-%d-%y-%r")"
# ln -s ~/atest/dotFiles/bashrc_help_color ~/.bashrc_help
############################################################################################
rm ~/.tmuxinator/kBank19.yml
rm ~/.zshrc
rm ~/.tmux.conf 
rm ~/.ctags
rm ~/.bashrc

ln -s ~/git/aTest/dotFiles/nVim/kBank20.yml     ~/.tmuxinator/kBank20.yml
ln -s ~/git/aTest/dotFiles/nVim/kBank19.yml     ~/.tmuxinator/kBank19.yml
ln -s ~/git/aTest/dotFiles/nVim/kZshrc19        ~/.zshrc
ln -s ~/git/aTest/dotFiles/nVim/kTmux19.conf    ~/.tmux.conf 
ln -s ~/git/aTest/dotFiles/nVim/kCtags19        ~/.ctags
ln -s ~/git/aTest/dotFiles/nVim/kBashColorRC19  ~/.bashrc

rm ~/.config/nvim/init.vim
ln -b  ~/git/aTest/dotFiles/nVim/minit.vim ~/.config/nvim/init.vim
#------------------------------------------------------------------------------------------
ln -b  ~/git/aTest/dotFiles/inkVim/vimrc-ink.vim ~/.vimrc

ln -b  ~/git/aTest/dotFiles/nVim/ninitOkt18.vim ~/.config/nvim/init.vim
#------------------------------------------------------------------------------------------

cp -r ~/.vim bVimFolderPre2019
ls -l ~/

cp -r ~/.config/nvim/ ~/bNvimFolderFeb2019
ls -l ~/bNvimFolderFeb2019

###########################################################################################
# ls ~/vim-*
# ls ~/git/dot-vim-mpi/
# cp -r ~/git/dot-vim-mpi/                       ~/.vim
# cp -r ~/git/aTest/dotFiles/inkVim      /media/red/A5A1-FBC4/4inkVim
# cp -r ~/git/aTest/dotFiles/inkWim      /media/red/A5A1-FBC4/4inkWim
#########################################################################################
# mount --bind /home/shared/files /home/website/files/
#########################################################################################
# zip -r arch.kong18.zip kong18
#########################################################################################
# cp ~/.emacs.d/init.el ~/.emacs.d/"1emacs-$(date +"%m-%d-%y-%r")"
# rm ~/.emacs.d/init.el
# ln -s ~/atest/dotFiles/initEm2.el ~/.emacs.d/init.el
#########################################################################################
# cp ~/.vimrc ~/"1vimrc-$(date +"%s")"
# rm ~/.vimrc
# ln -s ~/atest/dotFiles/vimrc2008 ~/.vimrc
#########################################################################################
############################################################################################
#if [HOME ]; then
#    mkdir -pHOME/kong18acer/
#fi;
#############################################################################################
#$NOW=$(date +"%m-%d-%Y-%T")
#echo NOW
#############################################################################################
#mkdir -p kong18
#rm *.*~
#ls kong18
#############################################################################################
#ls kong18
#rm kong18/18-*
#NOW=$(date +"%m-%d-%Y-%T")
#NW=$(date +"%m-%d-%Y")
#NW="AB"
#############################################################################################
#cp ~/.profile kong18/"18-profile.$NW"
#cp ~/.bashrc kong18/"18-bashrc.$NW"
#ls kong18
#######################################################################################
## cp -r kong18 king18
##---------------------------------------------------
##---------------------------------------------------
#ls -a ~/
#rm ~/.bashrc
#ln -b king18/bashrc-alf-cc   ~/.bashrc
#ls -a ~/*
##---------------------------------------------------
##---------------------------------------------------
#ls -a ~/
#ln -b king18/18-gitconfig.AB     ~/.gitconfig
#ln -b king18/18-gitignore.AB     ~/.gitignore
#ls -a ~/
