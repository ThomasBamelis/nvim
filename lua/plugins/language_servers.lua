-----------------------------------------------------------------------------------------------
-- For any other language support you want, check here
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#docker_compose_language_service
-----------------------------------------------------------------------------------------------

-- INSTALL THE LANGUAGE SERVERS ON YOUR MACHINE
--[[
pip install pyright cmake-language-server hdl-checker
sudo apt install rust-analyzer jdtls
npm install -g @ansible/ansible-language-server bash-language-server @microsoft/compose-language-service dockerfile-language-server-nodejs vscode-langservers-extracted typescript-language-server
cargo install asm-lsp
rustup component add rust-src
-- https://github.com/luals/lua-language-server/wiki/Getting-Started#command-line
-- https://github.com/Galarius/opencl-language-server/blob/main/_dev/build.md
-- https://github.com/REditorSupport/languageserver#installation
--]]

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

keybinds = require('keybinds.code_navigation')
local on_attach = keybinds.on_attach


local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-------------------------------------------------------------------------------------------------
-- Python
-- pip install pyright
-------------------------------------------------------------------------------------------------

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-------------------------------------------------------------------------------------------------
-- C/C++
-- Don't use normal lspconfig, we use rust-tools for this
-------------------------------------------------------------------------------------------------

require("clangd_extensions").setup({
    server = {
      on_attach = on_attach,
      flags = lsp_flags,
    },
})

-------------------------------------------------------------------------------------------------
-- RUST
-- Don't use normal lspconfig, we use rust-tools for this
-- rustup component add rust-src
-- sudo apt install rust-analyzer
-------------------------------------------------------------------------------------------------
--[[
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
--]]

require("rust-tools").setup({
  server = {
    on_attach = on_attach,
    flags = lsp_flags,
  },
})


-------------------------------------------------------------------------------------------------
-- Ansible
-- npm install -g @ansible/ansible-language-server
-------------------------------------------------------------------------------------------------

require('lspconfig')['ansiblels'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-------------------------------------------------------------------------------------------------
-- Assembly
-- cargo install asm-lsp
-------------------------------------------------------------------------------------------------

require('lspconfig')['asm_lsp'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-------------------------------------------------------------------------------------------------
-- Bash
-- npm i -g bash-language-server
-------------------------------------------------------------------------------------------------

require('lspconfig')['bashls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-------------------------------------------------------------------------------------------------
-- CMake
-- pip install cmake-language-server
-------------------------------------------------------------------------------------------------

require('lspconfig')['cmake'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-------------------------------------------------------------------------------------------------
-- Docker compose
-- npm install @microsoft/compose-language-service
-------------------------------------------------------------------------------------------------

require('lspconfig')['docker_compose_language_service'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-------------------------------------------------------------------------------------------------
-- Docker compose
-- npm install -g dockerfile-language-server-nodejs
-------------------------------------------------------------------------------------------------

require('lspconfig')['dockerls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-------------------------------------------------------------------------------------------------
-- Docker compose
-- npm install -g dockerfile-language-server-nodejs
-------------------------------------------------------------------------------------------------

require('lspconfig')['dockerls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-------------------------------------------------------------------------------------------------
-- Java
-- sudo apt install jdtls
-------------------------------------------------------------------------------------------------
-- see packer.lua

-------------------------------------------------------------------------------------------------
-- json
-- npm install -g vscode-langservers-extracted
-------------------------------------------------------------------------------------------------

require('lspconfig').jsonls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}

-------------------------------------------------------------------------------------------------
-- cssls
-- npm install -g vscode-langservers-extracted
-------------------------------------------------------------------------------------------------

require('lspconfig').cssls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

-------------------------------------------------------------------------------------------------
-- html
-- npm install -g vscode-langservers-extracted
-------------------------------------------------------------------------------------------------
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').html.setup {
  capabilities = capabilities,
}

-------------------------------------------------------------------------------------------------
-- typescript
-- npm install -g typescript-language-server
-------------------------------------------------------------------------------------------------

require("typescript").setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
    },
    server = { -- pass options to lspconfig's setup method
      on_attach = on_attach,
      flags = lsp_flags,
    },
})

-------------------------------------------------------------------------------------------------
-- Lua
-- https://github.com/luals/lua-language-server/wiki/Getting-Started#command-line
-------------------------------------------------------------------------------------------------
require('lspconfig')['lua_ls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-------------------------------------------------------------------------------------------------
-- Verilog/Vhdl
-- pip install hdl-checker
-------------------------------------------------------------------------------------------------

require('lspconfig')['hdl_checker'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-------------------------------------------------------------------------------------------------
-- Opencl
-- https://github.com/Galarius/opencl-language-server/blob/main/_dev/build.md
-------------------------------------------------------------------------------------------------

require('lspconfig')['opencl_ls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-------------------------------------------------------------------------------------------------
-- R
-- https://github.com/REditorSupport/languageserver#installation
-------------------------------------------------------------------------------------------------

require('lspconfig')['r_language_server'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- TODO set vista ctags cmd and executives
