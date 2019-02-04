

Magic! tada


Plugins

Oh My Zsh comes with a shitload of plugins to take advantage of. You can take a look in the plugins directory and/or the wiki to see what's currently available.
Enabling Plugins

Once you spot a plugin (or several) that you'd like to use with Oh My Zsh, you'll need to enable them in the .zshrc file. You'll find the zshrc file in your $HOME directory. Open it with your favorite text editor and you'll see a spot to list all the plugins you want to load.

vi ~/.zshrc

For example, this might begin to look like this:

plugins=(
  git
  bundler
  dotenv
  osx
  rake
  rbenv
  ruby
)

Using Plugins

Most plugins (should! we're working on this) include a README, which documents how to use them.
Themes

We'll admit it. Early in the Oh My Zsh world, we may have gotten a bit too theme happy. We have over one hundred themes now bundled. Most of them have screenshots on the wiki. Check them out!
Selecting a Theme

Robby's theme is the default one. It's not the fanciest one. It's not the simplest one. It's just the right one (for him).

Once you find a theme that you'd like to use, you will need to edit the ~/.zshrc file. You'll see an environment variable (all caps) in there that looks like:

ZSH_THEME="robbyrussell"

"-----------------------------------------------------------------------------------------------------------------"

Advanced Topics

If you're the type that likes to get their hands dirty, these sections might resonate.
Advanced Installation

Some users may want to change the default path, or manually install Oh My Zsh.
Custom Directory

The default location is ~/.oh-my-zsh (hidden in your home directory)

If you'd like to change the install directory with the ZSH environment variable, either by running export ZSH=/your/path before installing, or by setting it before the end of the install pipeline like this:

export ZSH="$HOME/.dotfiles/oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

Manual Installation
1. Clone the repository:

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

2. Optionally, backup your existing ~/.zshrc file:

cp ~/.zshrc ~/.zshrc.orig

3. Create a new zsh configuration file

You can create a new zsh config file by copying the template that we have included for you.

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

4. Change your default shell

chsh -s /bin/zsh

5. Initialize your new zsh configuration

Once you open up a new terminal window, it should load zsh with Oh My Zsh's configuration.
Installation Problems

If you have any hiccups installing, here are a few common fixes.

    You might need to modify your PATH in ~/.zshrc if you're not able to find some commands after switching to oh-my-zsh.
    If you installed manually or changed the install location, check the ZSH environment variable in ~/.zshrc.

Custom Plugins and Themes

If you want to override any of the default behaviors, just add a new file (ending in .zsh) in the custom/ directory.

If you have many functions that go well together, you can put them as a XYZ.plugin.zsh file in the custom/plugins/ directory and then enable this plugin.

If you would like to override the functionality of a plugin distributed with Oh My Zsh, create a plugin of the same name in the custom/plugins/ directory and it will be loaded instead of the one in plugins/.
Getting Updates

By default, you will be prompted to check for upgrades every few weeks. If you would like oh-my-zsh to automatically upgrade itself without prompting you, set the following in your ~/.zshrc:

DISABLE_UPDATE_PROMPT=true

To disable automatic upgrades, set the following in your ~/.zshrc:

DISABLE_AUTO_UPDATE=true

Manual Updates

If you'd like to upgrade at any point in time (maybe someone just released a new plugin and you don't want to wait a week?) you just need to run:

upgrade_oh_my_zsh

Uninstalling Oh My Zsh

Oh My Zsh isn't for everyone. We'll miss you, but we want to make this an easy breakup.

If you want to uninstall oh-my-zsh, just run uninstall_oh_my_zsh from the command-line. It will remove itself and revert your previous bash or zsh configuration.
