ZPlug configuration

Now let’s see some snippets from the zplug itself. For instance, this code
allows zplug to update itself. Zplug first downloads its own repository, and
later the hook which enables auto updating is evoked.


zplug 'zplug/zplug', hook-build:'zplug --self-manage'

Basing on the OS type, this part of configuration installs the correct gopass
(I’ll talk about the gopass itself later) binary from its GitHub releases
(check it to see how the  _gopass_release function works).

function _gopass_release {
    [ "$(uname)" = "Linux" ] && echo '*linux*amd64*tar.gz' || echo '*darwin*'
}
zplug "gopasspw/gopass", from:gh-r, as:command, use:"$(_gopass_release)"

Here you can see how to load the library from the oh-my-zsh framework together
with its minimal configuration (not all of the functions are loaded).


HIST_STAMPS="mm/dd/yyyy" # variable used in oh-my-zsh/lib/history.zsh


zplug "robbyrussell/oh-my-zsh", use:"lib/{clipboard,completion,directories,history,termsupport,key-bindings}.zsh"

The last snippet shows how to load the autocompletion oh-my-zsh plugins (but
they also could be not connected with any framework) basing on programs you
have installed on the current profile.

zplug "plugins/docker", from:oh-my-zsh, if:'[[ $commands[docker] ]]'
zplug "plugins/docker-compose", from:oh-my-zsh, if:'[[ $commands[docker-compose] ]]'

#==========================================================================
Most of my ZPlugins are kept as so called “commands” inside $ZPLUG_BIN
directory. It means that after they are installed they don’t have to be
loaded (unless they are going to be updated). If you want to do it, set
$ZPLUG_UPDATE variable to true.

if [ ! -d ~/.zplug ]; then
    git clone --depth=1 https://github.com/zplug/zplug ~/.zplug;
fi
export ZPLUG_LOADFILE="$DOTFILES/zsh/.zplugs.zsh"
source ~/.zplug/init.zsh
zplug load
if [ "$ZPLUG_UPDATE" = true ] ; then
    zplugs_install
    zplug update
fi

Luckily in ZPlug, including or excluding the program is a matter of just a few lines. Configurations presented below correspond to sections in .zplug.zsh commented with the same titles.
