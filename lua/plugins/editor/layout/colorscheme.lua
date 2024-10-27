return {
	-- Color scheme: tokyonight transparent
	{
		"folke/tokyonight.nvim",
		enabled = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	-- Color scheme: gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		enabled = true,
		priority = 1000,
		opts = {},
	},
}
