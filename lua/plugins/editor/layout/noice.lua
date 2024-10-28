return {
  -- Puts the command box in the middle of screen and shows warning in popup boxes
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,     -- use a classic bottom cmdline for search
        command_palette = true,   -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,       -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,   -- add a border to hover docs and signature help
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>n",  "<leader>n",                                                                   desc = "Notifications (noice and nvim-notify)" }, -- for which key
      { "<leader>ne", function() require("noice").redirect(vim.fn.getcmdline()) end,                 mode = "c",                                    desc = "Redirect Cmdline (S-enter)" },
      { "<S-Enter>",  function() require("noice").redirect(vim.fn.getcmdline()) end,                 mode = "c",                                    desc = "Redirect Cmdline" },
      { "<leader>nl", function() require("noice").cmd("last") end,                                   desc = "Noice Last Message" },
      { "<leader>nh", function() require("noice").cmd("history") end,                                desc = "Noice History" },
      { "<leader>na", function() require("noice").cmd("all") end,                                    desc = "Noice All" },
      { "<leader>nd", function() require("noice").cmd("dismiss") end,                                desc = "Noice Dismiss All" },
      { "<leader>nt", function() require("noice").cmd("pick") end,                                   desc = "Noice Picker (Telescope/FzfLua)" },
      { "<leader>nf", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,  silent = true,                                 expr = true,                        desc = "Scroll Forward (c-f)",  mode = { "n" } },
      { "<c-f>",      function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,  silent = true,                                 expr = true,                        desc = "Scroll Forward",        mode = { "i", "n", "s" } },
      { "<leader>nb", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true,                                 expr = true,                        desc = "Scroll Backward (c-b)", mode = { "n" } },
      { "<c-b>",      function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true,                                 expr = true,                        desc = "Scroll Backward",       mode = { "i", "n", "s" } },
    },
    config = function(_, opts)
      -- HACK: noice shows messages from before it was enabled,
      -- but this is not ideal when Lazy is installing plugins,
      -- so clear the messages in this case.
      if vim.o.filetype == "lazy" then
        vim.cmd([[messages clear]])
      end
      require("noice").setup(opts)
    end,
  },
}
