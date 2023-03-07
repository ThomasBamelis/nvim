-- navigation using the syntax tree, like go to definition and so on
local m = {}

local rt = require("rust-tools")

-- TODO see peek definition in packer.lua of nvim-treeset. It peeks at function
-- with gf gF

-- navigation from nvim lsp
local opts = { noremap=true, silent=true }

opts.desc = 'see errors in floating windows'
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
opts.desc = 'see next error'
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
opts.desc = 'see prev error'
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
opts.desc = 'show list of error locations'
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function m.on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  bufopts.desc = 'go to Declaration of symbol (header file)'
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  bufopts.desc = 'go to definition of symbol (c file)'
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  bufopts.desc = 'Show info of symbol'
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  bufopts.desc = 'go to implementation of symbol (c file)'
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  bufopts.desc = 'Show help of signature'
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  bufopts.desc = 'add workspace folder'
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  bufopts.desc = 'delete workspace folder'
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  bufopts.desc = 'list workspace folders'
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  bufopts.desc = 'go to type definition'
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  bufopts.desc = 'rename symbol'
  vim.keymap.set('n', 'gn', vim.lsp.buf.rename, bufopts)
  bufopts.desc = 'do code action (quickfixes)'
  --vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'ga', '<cmd>CodeActionMenu<cr>', bufopts)
  bufopts.desc = 'go to symbol references (usage of the thing)'
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  bufopts.desc = 'format file'
  vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = true } end, bufopts)

  -- FOR RUST
  bufopts.desc = 'Show Rust hover action'
  vim.keymap.set("n", "gh", rt.hover_actions.hover_actions, { buffer = bufnr })
  bufopts.desc = 'Show Rust code action group'
  vim.keymap.set("n", "g1", rt.code_action_group.code_action_group, { buffer = bufnr })
end

return m
