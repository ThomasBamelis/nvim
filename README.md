# nvim
My neovim config

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
