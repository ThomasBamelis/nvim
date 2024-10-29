local leader_key = "f"
return {
  -- Show a list of todo comments
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {},
    keys = {
      {
        "<leader>" .. leader_key .. "y",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next Todo Comment (]t)",
      },
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next Todo Comment",
      },
      {
        "<leader>" .. leader_key .. "Y",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous Todo Comment ([t)",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous Todo Comment",
      },
      { "<leader>" .. leader_key .. "t", "<cmd>TodoTelescope<cr>",                     desc = "Find in list of Todo" },
      { "<leader>" .. leader_key .. "T", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Find in list of Todo/Fix/Fixme" },
    },
  },
}
