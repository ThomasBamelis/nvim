-- This file can be loaded by calling `lua require('plugins')` from your init.vim


-- Function that will check if Packer is installed.
-- If it is not installed, clone it in the right destination.
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Check if packer is installed, returns true it wasn't installed and we just installed it.
local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Specify your plugins here
return require('packer').startup(function(use)
  -- Let Packer manage itself (update itself etc..)
  use 'wbthomason/packer.nvim'


  -------------------------------------------------------------------------------
  --
  -- EXAMPLES
  --
  -------------------------------------------------------------------------------


  -- Simple plugins can be specified as strings
  -- use 'rstacruz/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  --use {
  --  'w0rp/ale',
  --  ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --  cmd = 'ALEEnable',
  --  config = 'vim.cmd[[ALEEnable]]'
  --}
  --

  -- Plugins can have dependencies on other plugins
  --[[
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }
  --]]

  -- Plugins can also depend on rocks from luarocks.org:
  --[[
  use {
    'my/supercoolplugin',
    rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  }
  --]]

  -- You can specify rocks in isolation
  --[[
  use_rocks 'penlight'
  use_rocks {'lua-resty-http', 'lpeg'}
  --]]

  -- Local plugins can be included
  --use '~/projects/personal/hover.nvim'

  -- Plugins can have post-install/update hooks
  --use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  --use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  --use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  --[[
  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  --]]

  -- Use dependency and run lua function after load
  --[[
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  --]]

  -- You can specify multiple plugins in a single call
  --use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- You can alias plugin names
  --use {'dracula/vim', as = 'dracula'}


  -------------------------------------------------------------------------------
  --
  -- MY PLUGINS START here
  --
  -------------------------------------------------------------------------------

  -------------------------------------------------------------------------------
  -- Code analysis
  -------------------------------------------------------------------------------

  -- Advanced syntax highlighting
      use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

  -- Adds language server functionality frontend to neovim
  -- Config in language_servers.lua
  use {
    'neovim/nvim-lspconfig',
  }
  -- Adds snippets backend for cmp to use
  use {
    'SirVer/ultisnips',
  }

  -- Completion (provides nicer completion, but what gets recommended is decided by other things)
  use {
    'hrsh7th/nvim-cmp',
    -- Needs this plugin to bind it to nvim-cmp
    requires = {
        -- nvim-cmp source for vim's cmdline.
        'hrsh7th/cmp-cmdline',
        -- nvim-cmp source for filesystem paths.
        'hrsh7th/cmp-path',
        -- nvim-cmp source for buffer words.
        'hrsh7th/cmp-buffer',
        -- nvim-cmp source for connecting to nvim-lspconfig.
        'hrsh7th/cmp-nvim-lsp',
        -- nvim-cmp source for snippets provided by ultisnips.
        {'quangnguyen30192/cmp-nvim-ultisnips',
          config = function()
            -- optional call to setup (see customization section)
            require("cmp_nvim_ultisnips").setup{}
          end,
        }
    }
  }

  -- :Vista will open a window with all structs/funcs/symbol in you source file :)
  -- :help vista-commands
  -- :help vista-options
  use {
    'liuchengxu/vista.vim',
      config = function()
        vim.cmd([[
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'nvim_lsp'
" To enable fzf's preview window set g:vista_fzf_preview.
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
        ]])
      end,
  }

  -- Shows version of cargo crates
    use {
        "Saecki/crates.nvim",
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
          require("crates").setup()
        end,
    }

    -- Sets up nvim-lspconfig for rust_analyzer and other rust stuff
  use {
  'simrat39/rust-tools.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    }
  }

    -- Sets up nvim-lspconfig for C/C++
  use {
    'p00f/clangd_extensions.nvim',
  }

  -- java
  use {
    'mfussenegger/nvim-jdtls',
    config = function()
      local config = {
          cmd = {'jdtls'},
          root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
      }
      require('jdtls').start_or_attach(config)
    end,
    ft = 'java',
  }

  -- json
  use "b0o/schemastore.nvim"

  -- typescript
  use 'jose-elias-alvarez/typescript.nvim'

  -------------------------------------------------------------------------------
  -- Debugging
  -------------------------------------------------------------------------------

  -- setup in debugging.lua
  use {
    'mfussenegger/nvim-dap'
    }


  -------------------------------------------------------------------------------
  -- Various
  -------------------------------------------------------------------------------

  -- Color scheme
  -- :help gruvbox-material.txt
  use 'sainnhe/gruvbox-material'

  -- Git plugin. :Git is like :!git but well integrated and much more
  -- :help fugitive
  use {
      'tpope/vim-fugitive',
      config = function()
      end,
  }

  -- Searching through code
  -- TODO make it execute :LeaderfInstallCExtension
  -- let g:Lf_WindowPosition = 'popup'
  -- let g:Lf_PreviewInPopup = 1
  use {
      'Yggdroot/LeaderF',
      run = ':LeaderfInstallCExtension',
      config = function()
          vim.g.Lf_WindowPosition = 'popup'
          vim.g.Lf_PreviewInPopup = 1
          vim.g.Lf_PopupColorscheme = 'gruvbox_material'
          vim.g.Lf_ShowHidden = 1
          vim.g.Lf_UseVersionControlTool = 1
          vim.g.Lf_PopupWidth = 140
          -- set up working directory for git repository
          vim.g.Lf_WorkingDirectoryMode = 'a'
            -- Popup window settings
          vim.cmd([[
            let w = float2nr(&columns * 0.8)
            if w > 140
              let g:Lf_PopupWidth = 140
            else
              let g:Lf_PopupWidth = w
            endif

            let g:Lf_PopupPosition = [0, float2nr((&columns - g:Lf_PopupWidth)/2)]
          ]])
      end,
  }

  -- Nice status line
  use {
  'nvim-lualine/lualine.nvim',
      config = function()
          require('lualine').setup {
              options = {
                  theme = 'gruvbox-material' 
            }
          }
      end,
      requires = {
                'kyazdani42/nvim-web-devicons',
                config = function()
                  require('nvim-web-devicons').setup {
                      color_icons = true;
                  }
                end,
        }
  }

  -- Fancy searching with / (shows number of matches etc...)
  use {
      'kevinhwang91/nvim-hlslens',
      config = function()
          require('hlslens').setup()
      end,
  }

  -- Completion for : and /
  use {
      'gelguy/wilder.nvim',
      config = function()
        local wilder = require('wilder')
        wilder.setup({
            modes = {':', '/', '?'},
            next_key = '<Tab>',
            previous_key = '<S-Tab>',
            accept_key = '<Down>',
            reject_key = '<Up>',
        })
        wilder.set_option('pipeline', {
          wilder.branch(
            wilder.cmdline_pipeline(),
            wilder.search_pipeline()
          ),
        })
        wilder.set_option('renderer', wilder.popupmenu_renderer({
          -- highlighter applies highlighting to the candidates
          highlighter = wilder.basic_highlighter(),
          left = {' ', wilder.popupmenu_devicons()},
          right = {' ', wilder.popupmenu_scrollbar()},
        }))
      end,
  }

  -- Comment out blocks with gc in Visual mode
  use 'tpope/vim-commentary'


  -- When pressing a key, show possible next keys and show what they
  -- would execute.
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Show notifications like a GUI
  use {
    'rcarriga/nvim-notify',
    config = function()
      vim.opt.termguicolors = true
      require('notify').setup {
        -- config
      }
    end,
  }

  -- Home screen
    use {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
            change_to_vcs_root = true,
            theme = 'doom',
        }
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
    }

  -- Show preview when using quickfix
  use {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function()
      require("nvim-bqf").setup {
      }
    end,
  }



  -- Automatically sync (update/install) plugins after packer is cloned
  -- for the first time.
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
