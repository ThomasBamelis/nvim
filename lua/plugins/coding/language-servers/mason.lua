return {
  -- Installer for language servers
  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
      },
      -- Install formatters for conform here
      ensure_installed = {
        "shfmt",        -- sh
        "isort",        -- python
        "black",        -- python
        "clang-format", -- C/C++
        "rustfmt",      -- Rust
        "amsfmt",       -- Assembly
        "cmakelang",    -- CMake
        "deno",         -- Javascript, JSON, Markdown
        "stylua",       -- lua
        "codespell",    -- non intrusive spell checking
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    --config = function(_, opts)
    --	require("mason").setup(opts)
    --	local mr = require("mason-registry")
    --	mr:on("package:install:success", function()
    --		vim.defer_fn(function()
    --			-- trigger FileType event to possibly load this newly installed LSP server
    --			require("lazy.core.handler.event").trigger({
    --				event = "FileType",
    --				buf = vim.api.nvim_get_current_buf(),
    --			})
    --		end, 100)
    --	end)
    --
    --	mr.refresh(function()
    --		for _, tool in ipairs(opts.ensure_installed) do
    --			local p = mr.get_package(tool)
    --			if not p:is_installed() then
    --				p:install()
    --			end
    --		end
    --	end)
    --end,
  },

  -- Links the mason installed language servers to nvim-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    --cmd = "Mason",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- Install nvim-lsp language servers here
      ensure_installed = {
        "bashls",                          -- bash
        "pyright",                         -- python
        "asm_lsp",                         -- assembly
        "clangd",                          -- C/C++
        "cmake",                           -- CMake
        "dockerls",                        -- Dockerfile
        "docker_compose_language_service", -- Docker compose
        "jsonls",                          -- json
        "lua_ls",                          -- Lua
        "marksman",                        -- marksman
        "mesonlsp",                        -- Meson
        "rust_analyzer",                   -- Rust
        "verible",                         -- SystemVerilog
      },
      automatic_installation = true,
    },
    --config = function()
    --end,
  },
}
