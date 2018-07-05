#/bin/bash
# ln -sf /full/path/to/parent/child/child ../child1
# ln -sf /full/path/to/parent/child/child ../child2
# To make a link to a file in another user's home directory:
# ln ~sandra/prog.c .

############################################################################################
# --- extract() {
# ---     if [ -f "$1" ]; then
# ---         case "$1" in
# ---             *.tar.bz2)  tar -jxvf "$1"                        ;;
# ---             *.tar.gz)   tar -zxvf "$1"                        ;;
# ---             *.bz2)      bunzip2 "$1"                          ;;
# ---             *.dmg)      hdiutil mount "$1"                    ;;
# ---             *.gz)       gunzip "$1"                           ;;
# ---             *.tar)      tar -xvf "$1"                         ;;
# ---             *.tbz2)     tar -jxvf "$1"                        ;;
# ---             *.tgz)      tar -zxvf "$1"                        ;;
# ---             *.zip)      unzip "$1"                            ;;
# ---             *.ZIP)      unzip "$1"                            ;;
# ---             *.pax)      cat "$1" | pax -r                     ;;
# ---             *.pax.Z)    uncompress "$1" --stdout | pax -r     ;;
# ---             *.Z)        uncompress "$1"                       ;;
# ---             *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
# ---         esac
# ---     else
# ---         echo "'$1' is not a valid file to extract"
# ---     fi
# --- }
############################################################################################
# -- dotfiles=(".vimrc" ".zshrc" ".gitconfig")
# -- dir="${HOME}/Documents/dotfiles"
# --
# -- for dotfile in "${dotfiles[@]}";do
# --  ln -sf "${HOME}/${dotfile}" "${dir}"
# -- done
############################################################################################
# --  navigated to our newly created directory
# --  turned it into a local git repository
# --  added all the files it contained into our local Git repository
# --  committed all the added files into the new local repository
# --  hooked up our local git repository with the GitHub repository
# --  pushed our files to the remote (GitHub) repository
############################################################################################
#.gitignore
#.profile
#git add -f somedirname
############################################################################################
#  ln -nfs ~/Dropbox/dotfiles/.bash_profile ~/.bash_profile
#  ln -nfs ~/Dropbox/dotfiles/.bash_osx ~/.bash_osx
#  ln -nfs ~/Dropbox/dotfiles/.vimrc ~/.vimrc
#  ln -nfs ~/Dropbox/dotfiles/.vim ~/.vim
#  ln -nfs ~/Dropbox/dotfiles/.slate ~/.slate
#  ln -nfs ~/Dropbox/dotfiles/.slate.js ~/.slate.js
#  ln -nfs ~/Dropbox/dotfiles/.gemrc ~/.gemrc
#  ln -nfs ~/Dropbox/dotfiles/.irbrc ~/.irbrc
#  ln -nfs ~/Dropbox/dotfiles/.git_completion.bash ~/.git_completion.bash
#  ln -nfs ~/Dropbox/dotfiles/.tmux.conf ~/.tmux.conf
#  ln -nfs ~/Dropbox/dotfiles/.tmux.osx.clipboard ~/.tmux.osx.clipboard
#  ln -nfs ~/Dropbox/dotfiles/.tmux.linux.clipboard ~/.tmux.linux.clipboard
#  ln -nfs ~/Dropbox/dotfiles/.ackrc ~/.ackrc
#  ln -nfs ~/Dropbox/dotfiles/.inputrc ~/.inputrc
#  ln -nfs ~/Dropbox/dotfiles/.config ~/.config
############################################################################################
#  symlink_it.sh creates the symlinks to the versioned versions:
# --
# -- ln -sn etc/bash .bash
# -- ln -sn etc/bashrc .bashrc
# -- ln -sn etc/bash_profile .bash_profile
# -- ln -sn etc/vim .vim
# -- ln -sn etc/vimrc .vimrc
# -- ln -sn etc/irbrc .irbrc
############################################################################################
# -- bash/local contains the shell scripts that are conditionally loaded to override the defaults
# -- (svn propset svn:ignore local bash). Here’s a preview of the relevant parts from my .bashrc:
# --
# --   cond_source ()
# --   {
# --     if [ -f $1 ]; then
# --       source $1
# --     fi
# --   }
# --   cond_source "$HOME/.bash/local/variables.sh"
# --
# --   cond_source "$HOME/.bash/aliases.sh"
# --   cond_source "$HOME/.bash/local/aliases.sh"
# --
# --   cond_source "$HOME/.bash/completes.sh"
# --   cond_source "$HOME/.bash/local/completes.sh"
# --
# --   cond_source "$HOME/.bash/bindings.sh"
# --   cond_source "$HOME/.bash/local/bindings.sh"
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


cp -r kong18 king18
ls king18
############################################################################################
# zip -r arch.kong18.zip kong18
# ls
############################################################################################
# cp ~/.emacs.d/init.el ~/.emacs.d/"1emacs-$(date +"%m-%d-%y-%r")"
# rm ~/.emacs.d/init.el
# ln -s ~/atest/dotFiles/initEm2.el ~/.emacs.d/init.el
############################################################################################

############################################################################################
# cp ~/.vimrc ~/"1vimrc-$(date +"%s")"
# rm ~/.vimrc
# ln -s ~/atest/dotFiles/vimrc2008 ~/.vimrc 
############################################################################################
