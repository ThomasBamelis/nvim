return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		cmd = {"ToggleTerm"},
		opts = {
			float_opts = {
				border = 'curved'
			},
		},
		keys = {
			{
				"<leader>T",
				"<cmd>ToggleTerm direction=float<cr>",
				desc = "Toggle terminal",
				mode = {"n", "t"},
			},
		},
	},
}
