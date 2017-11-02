#/bin/bash
# ln -sf /full/path/to/parent/child/child ../child1
# ln -sf /full/path/to/parent/child/child ../child2
# To make a link to a file in another user's home directory:
# ln ~sandra/prog.c .


# mv ~/.bashrc ~/"1bashrc-$(date +"%m-%d-%y-%r")"
# ln -s ~/atest/dotFiles/bashrc_color ~/.bashrc 

# mv ~/.bashrc_help ~/"1bashrc_help-$(date +"%m-%d-%y-%r")"
# ln -s ~/atest/dotFiles/bashrc_help_color ~/.bashrc_help 

cp ~/.emacs.d/init.el ~/.emacs.d/"1emacs-$(date +"%m-%d-%y-%r")"
rm ~/.emacs.d/init.el
ln -s ~/atest/dotFiles/initEm2.el ~/.emacs.d/init.el


cp ~/.vimrc ~/"1vimrc-$(date +"%s")"
rm ~/.vimrc
ln -s ~/atest/dotFiles/vimrc2008 ~/.vimrc 
