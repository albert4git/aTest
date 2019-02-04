#/bin/bash
# ln -sf /full/path/to/parent/child/child ../child1
# ln -sf /full/path/to/parent/child/child ../child2
# To make a link to a file in another user's home directory:
# ln ~sandra/prog.c .
############################################################################################
############################################################################################
#
# mv ~/.bashrc ~/"1bashrc-$(date +"%m-%d-%y-%r")"
# ln -s ~/atest/dotFiles/bashrc_color ~/.bashrc
#
# mv ~/.bashrc_help ~/"1bashrc_help-$(date +"%m-%d-%y-%r")"
# ln -s ~/atest/dotFiles/bashrc_help_color ~/.bashrc_help
#
############################################################################################
if [HOME ]; then
    mkdir -pHOME/kong18acer/
fi;
############################################################################################
$NOW=$(date +"%m-%d-%Y-%T")
echoNOW
############################################################################################
mkdir -p kong18
rm *.*~
ls kong18
############################################################################################

ls kong18
rm kong18/18-*
NOW=$(date +"%m-%d-%Y-%T")
NW=$(date +"%m-%d-%Y")
NW="AB"

cp ~/.profile kong18/"18-profile.$NW"
cp ~/.bashrc kong18/"18-bashrc.$NW"
cp ~/.bash_history kong18/"18-bash_history.$NW"
cp ~/.bash_logout kong18/"18-bash_logout.$NW"
cp ~/.gitconfig kong18/"18-gitconfig.$NW"
cp ~/.vimrc kong18/"18-vimrc-13.$NW"
cp ~/.vimrc.before kong18/"18-vimrc.before.13.$NW"
cp ~/.vimrc.bundles kong18/"18-vimrc.bundles.13.$NW"
cp ~/.viminfo kong18/"18-viminfo.13.$NW"
cp ~/.vimrc.local kong18/"18-vimrc.local.13.$NW"
ls kong18


######################################################################################
# cp -r kong18 king18
#---------------------------------------------------
#--------------ToDo---------------------------------
ls king18
ls -al ~/.emacs.d

ln -s  ./el-king18/*  ~/.emacs.d
ls ~/.emacs.d
#---------------------------------------------------
#---------------------------------------------------
#---------------------------------------------------
ls -a ~/
rm ~/.bashrc
ln -b king18/bashrc-alf-cc   ~/.bashrc
ls -a ~/*

#---------------------------------------------------
# ln -b king18/18-bashrc.AB        ~/.bashrc
#---------------------------------------------------
#---------------------------------------------------
ls -a ~/
ln -b king18/18-gitconfig.AB     ~/.gitconfig
ln -b king18/18-gitignore.AB     ~/.gitignore
ls -a ~/

#---------------------------------------------------
#ln -ls local-config/project-name.yml ~/.tmuxninator
ln -s ~/git/aTest/dotFiles/tMUX/bank1.yml ~/.tmuxinator/
ln -s ~/git/aTest/dotFiles/tMUX/bank2.yml ~/.tmuxinator/
ln -s ~/git/aTest/dotFiles/tMUX/ctagsDotRedHome ~/.ctags
ln -s ~/git/aTest/dotFiles/zSH/zshrcFeb2019 ~/.zshrc
#---------------------------------------------------
ln -s ~/git/aTest/dotFiles/tMUX/tmux.conf ~/.tmux.conf
#---------------------------------------------------

ln -b  ~/git/aTest/dotFiles/inkVim/vimrc-ink.vim ~/.vimrc

ln -b  ~/git/aTest/dotFiles/nVim/ninitOkt18.vim ~/.config/nvim/init.vim

ls ~/vim-*
ls ~/git/dot-vim-mpi/

cp -r ~/git/dot-vim-mpi/                       ~/.vim

cp -r ~/git/aTest/dotFiles/inkVim      /media/red/A5A1-FBC4/4inkVim
cp -r ~/git/aTest/dotFiles/inkWim      /media/red/A5A1-FBC4/4inkWim


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
