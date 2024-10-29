local M = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    highlight = { enable = true },
  },
}

M.config = function()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    highlight = { enable = true },
    -- Automatically install missing parsers when entering buffer, needs cargo install tree-sitter-cli
    auto_install = true,
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "asm",
      "cmake",
      "comment",
      "cpp",
      "csv",
      "devicetree",
      "disassembly",
      "gitcommit",
      "git_rebase",
      "kconfig",
      "make",
      "meson",
      "ninja",
      "objdump",
      "rust",
      "ssh_config",
      "tmux",
      "verilog",
    },
  })
end

return M
