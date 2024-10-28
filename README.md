# nvim
My neovim config

## Keybinds
The biggest problem with using vim is remembering the keybinds.
But don't worry, the plugin which-key.nvim will show you what happens for different keys after you press the leader key!
That still can get messy, so record in this table the logical subcategories and stick to them.

Leader = Spacebar
LocalLeader = ,

| Key after leader | subcategory |
| ---------------- | ----------- |
| Ctrl + {hjkl}    | Move between open windows and terminal|
| Ctrl + {io}      | Move between buffers |
| Ctrl (+ Option on mac) + arrow keys| Resize current window |
| Ctrl + {s}       | Save file |
| < >              | indenting lines |
| alt/option + {jk}| Move lines up or down |
| Leader + {-\|}       | Split windows |
| Leader + w       | Windows |
| Leader + b       | Buffers (bufferline) |
| Leader + B       | Buffers (DONT USE -> bufferline) |
| Leader + \<tab\>   | Tabs |
| Leader + L       | lazy.nvim   |
| Leader + l       | Location list |
| Leader + F       | Quickfix list |
| Leader + d       | Diagnostics list |
| Leader + q       | Quiting things |
| Leader + n       | Notification (noice and nvim-notify) |
| Leader + a       | File explorer (neo-tree)|
| Leader + t       | Terminal (toggle-term) |
| s                | search/find |
|                  |             |

## What to install
### MAC

The default mac terminal does not support truecolor.
You must use someting else.
I like Kitty.
`brew install --cask kitty`
then find it in the applications folder and start it.
Download the firacode nerd font:
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
Unzip it and open `font book`.
Then file -> Add font to current user, and select all fonts in the unzipped FiraCode folder.
Then open Kitty, press Kitty -> Settings... and change to font:
`#font_family mononoki`
To
`font_family FiraCode Nerd Font Mono`
And change to font size so you don't go blind
`font_size 16.0`
And set the option key to be used as alt (so or \<A-x\> keybinds work)
`mac_option_as_alt yes`

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
cd ~/.config/nvim
python3 -m venv venv
source venv/bin/python3
python3 -m pip install neovim pynvim flake8

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
 - Show the help of a symbol (documentation) with shift+k (K)

## Plugins
All plugins are in lua/plugins/

See their Github pages on how to use them.
The `config = function()` will execute when the plugin is loaded
and does the startup (setup function) and configuration.

Lazy.nvim gives the opts and keys for setting the options and keymaps without calling config.

## Language servers
Language servers are configured in lua/plugins/coding/language-servers.
We use 5 plugins for that:
- mason: installs the language servers. 
- mason-lspconfig: makes the mason language servers ready for nvim-lspconfig
- nvim-lspconfig: uses and configures the language servers
- nvim-treesitter: syntax highlighting
- nvim-cmp: provides the completion

To add a language you have to add it to the ensure_installed of mason-lspconfig, nvim-lspconfig and nvim-treesitter.

## Searching
Telescope, todo,...

## Guides

Follow these nice guides:
lua: https://learnxinyminutes.com/docs/lua/
nvim lua: https://github.com/nanotee/nvim-lua-guide
