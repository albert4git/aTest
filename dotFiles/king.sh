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
if [ $HOME ]; then
    mkdir -p $HOME/kong18acer/
fi;
############################################################################################
$NOW=$(date +"%m-%d-%Y-%T")
echo $NOW
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
############################################################################################
# zip -r arch.kong18.zip kong18
############################################################################################
# cp ~/.emacs.d/init.el ~/.emacs.d/"1emacs-$(date +"%m-%d-%y-%r")"
# rm ~/.emacs.d/init.el
# ln -s ~/atest/dotFiles/initEm2.el ~/.emacs.d/init.el
############################################################################################
# cp ~/.vimrc ~/"1vimrc-$(date +"%s")"
# rm ~/.vimrc
# ln -s ~/atest/dotFiles/vimrc2008 ~/.vimrc 
############################################################################################
