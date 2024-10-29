local leader_key = "e"
return {
  -- Formatting code automatically
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      { "<leader>" .. leader_key,        "<leader>e",                                     desc = "Format code (conform)" }, -- for which key
      -- Customize or remove this keymap to your liking
      {
        "<leader>" .. leader_key .. "f",
        function()
          require("conform").format({ async = true })
        end,
        mode = "n",
        desc = "Format buffer",
      },
      { "<leader>" .. leader_key .. "e", function() vim.g.disable_autoformat = false end, desc = "Enable format on save" },
      { "<leader>" .. leader_key .. "d", function() vim.g.disable_autoformat = true end,  desc = "Disable format on save" },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        sh = { "shfmt" },
        -- Python
        python = { "isort", "black" },
        -- C/C++
        c = { "clang-format" },
        cpp = { "clang-format" },
        hpp = { "clang-format" },
        h = { "clang-format" },
        -- Rust
        rust = { "rustfmt" },
        -- Assembly
        s = { "asmfmt" },
        S = { "asmfmt" },
        asm = { "asmfmt" },
        -- CMake
        cmake = { "cmake-format" },
        -- JSON
        json = { "deno_fmt" },
        -- Markdown
        markdown = { "deno_fmt" },
        -- Verilog
        verilog = { "verible" },
        vlg = { "verible" },
        -- Lua
        lua = { "stylua" },
        -- all use codespell
        ['*'] = { "codespell" },
        -- all without language server run trim_whitespace and trim_newlines
        ['_'] = { "trim_whitespace", "trim_newlines" },
      },
      -- Set default options
      default_format_opts = {
        -- When no formatter is available but lsp is, use lsp for formatting
        lsp_format = "fallback",
      },
      -- Set up format-on-save
      format_on_save = function(bufnr)
        -- Disable autoformat on certain filetypes
        local ignore_filetypes = { "sql" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match("/node_modules/") then
          return
        end
        -- Return the settings
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      vim.g.disable_autoformat = false
    end,
  },
}
