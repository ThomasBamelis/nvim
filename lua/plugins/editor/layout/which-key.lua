return {
	-- Keybind helper
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = {
			"echasnovski/mini.icons",
			"nvim-web-devicons",
		},
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
