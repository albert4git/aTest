It appears that YCM is not working

In Vim, run :messages and carefully read the output. YCM will echo messages to
the message log if it encounters problems. It's likely you misconfigured
something and YCM is complaining about it.

Also, you may want to run the :YcmDebugInfo command; it will make YCM spew out
various debugging information, including the YCM and ycmd logfile paths and
the compile flags for the current file if the file is a C-family language file
and you have compiled in Clang support. Logfiles can be opened in the editor
using the :YcmToggleLogs command.

My software versions:
    Python 2.7.9
    Vim 7.4.
    Debian 8.0 (jessie)

    sudo apt-get install build-essential cmake
    sudo apt-get install python-dev

    Googled each line of the errors I receive to find a solution, but nothing worked.


    autocmd FileType c 		let g:ycm_global_ycm_extra_conf	= '~/.vim/ycm_files/c/.ycm_extra_conf.py'
    autocmd FileType cpp 	let g:ycm_global_ycm_extra_conf	= '~/.vim/ycm_files/cpp/.ycm_extra_conf.py'

:py import sys; print sys.version_info

set runtimepath+=/path/to/YCM
vim -u /path/to/minimal/vimrc


pip install neovim

For C family language completion:

cd ~/.config/nvim/plugged/YouCompleteMe
./install.py

https://github.com/Valloric/YouCompleteMe

I ran install.py separately, hadn't seen nifty one-liner method

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

