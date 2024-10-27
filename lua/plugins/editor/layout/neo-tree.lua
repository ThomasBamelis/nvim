return {
	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
      -- stylua: ignore
    keys = {
      { "<leader>a", "<leader>a", desc = "File explorer"}, -- for which key
      { "<leader>as", "<cmd>Neotree reveal toggle<cr>", desc = "Show/hide file explorer" },
      { "<leader>af", "<cmd>Neotree toggle current reveal_force_cwd<cr>", desc = "Show/hide file explorer in dir of current file" },
      { "<leader>ab", "<cmd>Neotree toggle show buffers right<cr>", desc = "Show/hide open buffers in file explorer" },
      { "<leader>ag", "<cmd>Neotree float git_status<cr>", desc = "Show/hide git status output in file explorer" },
    },
		--[[
    nnoremap / :Neotree toggle current reveal_force_cwd<cr>
    nnoremap | :Neotree reveal<cr>
    nnoremap gd :Neotree float reveal_file=<cfile> reveal_force_cwd<cr>
    --]]
	},
}
