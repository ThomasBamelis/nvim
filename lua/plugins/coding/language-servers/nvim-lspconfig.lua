local leader_key = "c"
local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
  },
}

M.config = function()
  -- import lspconfig plugin
  local lspconfig = require("lspconfig")

  -- import mason_lspconfig plugin
  local mason_lspconfig = require("mason-lspconfig")

  -- import cmp-nvim-lsp plugin
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  -- Tell nvim-cmp about the capabilities of the language server
  local capabilities = cmp_nvim_lsp.default_capabilities()

  -- Setup the keybinds
  local keymap = vim.keymap
  -- Function to execute when a language server will attach.
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf, silent = true }

      -- Taken by diagnostics: o, j, k, e, E, w, W

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "<leader>" .. leader_key .. "R", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "<leader>" .. leader_key .. "D", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "<leader>" .. leader_key .. "d", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "<leader>" .. leader_key .. "i", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "<leader>" .. leader_key .. "t", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>" .. leader_key .. "a", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>" .. leader_key .. "r", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>" .. leader_key .. "D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show documentation for what is under cursor (K)"
      keymap.set("n", "<leader>" .. leader_key .. "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
      keymap.set("n", "K", vim.lsp.buf.hover, opts)                             -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>" .. leader_key .. "!", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end,
  })

  -- Change the Diagnostic symbols in the sign column (gutter)
  local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  -- Setup the language servers
  mason_lspconfig.setup_handlers({
    -- default handler for installed servers
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
      })
    end,

    -- Bash
    ["bashls"] = function()
      lspconfig["bashls"].setup({
        capabilities = capabilities,
      })
    end,

    -- Python
    ["pyright"] = function()
      lspconfig["pyright"].setup({
        capabilities = capabilities,
      })
    end,

    -- assembly
    ["asm_lsp"] = function()
      lspconfig["asm_lsp"].setup({
        capabilities = capabilities,
      })
    end,

    -- C/C++
    ["clangd"] = function()
      lspconfig["clangd"].setup({
        capabilities = capabilities,
      })
    end,

    -- CMake
    ["cmake"] = function()
      lspconfig["cmake"].setup({
        capabilities = capabilities,
      })
    end,

    -- Dockerfile
    ["dockerls"] = function()
      lspconfig["dockerls"].setup({
        capabilities = capabilities,
      })
    end,

    -- Docker compose
    ["docker_compose_language_service"] = function()
      lspconfig["docker_compose_language_service"].setup({
        capabilities = capabilities,
      })
    end,

    -- JSON
    ["jsonls"] = function()
      lspconfig["jsonls"].setup({
        capabilities = capabilities,
      })
    end,

    -- Lua
    ["lua_ls"] = function()
      -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })
    end,

    -- Markdown
    ["marksman"] = function()
      lspconfig["marksman"].setup({
        capabilities = capabilities,
      })
    end,

    -- Meson
    ["mesonlsp"] = function()
      lspconfig["mesonlsp"].setup({
        capabilities = capabilities,
      })
    end,

    -- Rust
    -- TODO: check options here https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
    ["rust_analyzer"] = function()
      lspconfig["rust_analyzer"].setup({
        -- TODO: add experimental.serverStatusNotification = true to capabilities
        capabilities = capabilities,
      })
    end,

    -- SystemVerilog
    ["verible"] = function()
      lspconfig["verible"].setup({
        capabilities = capabilities,
      })
    end,
  })
end

return M
