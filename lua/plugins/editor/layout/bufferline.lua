return {
	-- buffer tabs
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				diagnostics = "nvim_lsp",
			},
		},
		event = "VeryLazy",
		--init = function(_)
		--	vim.opt.termguicolors = true
		--end,
		keys = {
			{ "<leader>b", "<leader>b", desc = "Buffers (bufferline)" }, -- for which key
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
			{ "<leader>bd", "<cmd>:bp<bar>sp<bar>bn<bar>bd<CR>", desc = "Close current buffer (C-p)" },
			{ "<leader>qb", "<cmd>:bp<bar>sp<bar>bn<bar>bd<CR>", desc = "Close current buffer (C-p, <Leader>qb)" },
			{ "<C-p>", "<cmd>:bp<bar>sp<bar>bn<bar>bd<CR>", desc = "Close current buffer" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
			{ "<leader>be", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
			{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
			{ "<leader>bt", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
			{ "<leader>bh", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "<C-i>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer (C-i, [b)" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "<leader>bl", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer (C-o, ]b)" },
			{ "<C-o>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "<leader>bH", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev (C-n, [B)" },
			{ "<C-n>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
			{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
			{ "<leader>bL", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next (C-m, ]B)" },
			{ "<C-m>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
			{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
		},
	},
}
