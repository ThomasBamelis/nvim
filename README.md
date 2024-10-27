# nvim
My neovim config

## What to install
### MAC
```
# Node.js provider
brew install node
# NEW SHELL
npm install -g neovim

# Perl neovim plugin
brew install perl cpanminus
brew link perl
# NOW OPEN NEW SHELL
cpanm -n Neovim::Ext

# Python neovim plugin
python3 -m pip install neovim

# Ruby provider
brew install ruby
echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc
# NEW SHELL
gem install neovim

# For lazy.nvim, install luarocks
# Needs lua 5.1: you must compile it and make the lua executable link to lua5.1 on you path
wget https://www.lua.org/ftp/lua-5.1.5.tar.gz
make macosx
make INSTALL_TOP=$HOME/<install_dir> install
ln -s $HOME/<install_dir>/bin/lua ~/.local/bin/lua5.1
brew install lua@5.1
# install luarocks
brew install luarocks

New shell
```

## Important shortcuts
Press these shortcuts and wait for help to show of specific commands.

In normal mode:
 - Spacebar is for windows and plugin windows
 - g is for smart code stuff (go to definition,...)
 - Leader ',' is for buffer navigation and other miscellanious stuff
 - Show the help of a symbol (documentation) with shift+k (K)

## Plugins
All plugins are in lua/plugins/packer.lua

See their Github pages on how to use them.
The `config = function()` will execute when the plugin is loaded
and does the startup (setup function) and configuration.

Language servers are where nvim-lsp is configured.
Code completion is where nvim-cmp is configured.

## Searching
The exit LeaderF popup do <ESC>.
To start scrolling through suggestions do <TAB> (you can't exit from there with <ESC>, do <TAB> again to be able to exit).

## Guides

Follow these nice guides:
lua: https://learnxinyminutes.com/docs/lua/
nvim lua: https://github.com/nanotee/nvim-lua-guide
