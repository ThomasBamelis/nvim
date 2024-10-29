local leader_key = "b"
return {
  -- buffer tabs
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = ""
          local sep = ""
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and ""
                or (e == "warning" and "" or "")
            s = s .. sep .. n .. sym
            sep = " "
          end
          return s
        end,
      },
    },
    event = "VeryLazy",
    --init = function(_)
    --	vim.opt.termguicolors = true
    --end,
    keys = {
      { "<leader>" .. leader_key,    "<leader>" .. leader_key,                  desc = "Buffers (bufferline)" },        -- for which key
      { "<leader>" .. leader_key .. "p", "<Cmd>BufferLineTogglePin<CR>",        desc = "Toggle Pin" },
      { "<leader>" .. leader_key .. "d", "<cmd>:bp<bar>sp<bar>bn<bar>bd<CR>",   desc = "Close current buffer (C-p)" },
      { "<leader>qb",                "<cmd>:bp<bar>sp<bar>bn<bar>bd<CR>",       desc = "Close current buffer (C-p, <Leader>qb)" },
      { "<C-p>",                     "<cmd>:bp<bar>sp<bar>bn<bar>bd<CR>",       desc = "Close current buffer" },
      { "<leader>" .. leader_key .. "P", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>" .. leader_key .. "e", "<Cmd>BufferLineCloseOthers<CR>",      desc = "Delete Other Buffers" },
      { "<leader>" .. leader_key .. "r", "<Cmd>BufferLineCloseRight<CR>",       desc = "Delete Buffers to the Right" },
      { "<leader>" .. leader_key .. "t", "<Cmd>BufferLineCloseLeft<CR>",        desc = "Delete Buffers to the Left" },
      { "<leader>" .. leader_key .. "h", "<cmd>BufferLineCyclePrev<cr>",        desc = "Prev Buffer" },
      { "<C-i>",                     "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer (C-i, [b)" },
      { "[b",                        "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
      { "<leader>" .. leader_key .. "l", "<cmd>BufferLineCycleNext<cr>",        desc = "Next Buffer (C-o, ]b)" },
      { "<C-o>",                     "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
      { "]b",                        "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
      { "<leader>" .. leader_key .. "H", "<cmd>BufferLineMovePrev<cr>",         desc = "Move buffer prev (C-n, [B)" },
      { "<C-n>",                     "<cmd>BufferLineMovePrev<cr>",             desc = "Move buffer prev" },
      { "[B",                        "<cmd>BufferLineMovePrev<cr>",             desc = "Move buffer prev" },
      { "<leader>" .. leader_key .. "L", "<cmd>BufferLineMoveNext<cr>",         desc = "Move buffer next (C-m, ]B)" },
      { "<C-m>",                     "<cmd>BufferLineMoveNext<cr>",             desc = "Move buffer next" },
      { "]B",                        "<cmd>BufferLineMoveNext<cr>",             desc = "Move buffer next" },
    },
  },
}
