return {
	-- Show a list of todo comments
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts = {},
		keys = {
			{
				"<leader>fy",
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
				"<leader>fY",
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
			{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find in list of Todo" },
			{ "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Find in list of Todo/Fix/Fixme" },
		},
	},
}
