return {
	-- The fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false, -- telescope did only one release, so use HEAD for now
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
			{ "nvim-telescope/telescope-project.nvim" },
		},
		opts = function(_, opts)
			-- Load the faster locally compiled fuzzy finder
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("project")
		end,
		keys = {
			{ "<leader>f", "<leader>f", desc = "Find stuff (Telescope & todo-comments)" }, -- which key
			-- find
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep (Root Dir)" },
			{ "<leader>fh", "<cmd>Telescope command_history<cr>", desc = "Find in command history" },
			{
				"<leader>fB",
				"<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
				desc = "Find open buffers",
			},
			{ "<leader>fa", "<cmd>Telescope find_files<cr>", desc = "Find files (Root Dir)" },
			{ "<leader>ff", "<cmd>Telescope git_files<cr>", desc = "Find files (in current git repo)" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Find recently opened files" },
			--{ "<leader>fR", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
			-- git: I don't want git stuff managed by telescope
			--{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
			--{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
			-- search
			{ "<leader>fR", "<cmd>Telescope registers<cr>", desc = "Find in register contents" },
			{ "<leader>fA", "<cmd>Telescope autocommands<cr>", desc = "Find Auto Commands" },
			{ "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find in current buffer" },
			{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find commands" },
			{ "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Find in diagnostics (current file)" },
			{ "<leader>fD", "<cmd>Telescope diagnostics<cr>", desc = "Find in diagnostics (workspace)" },
			--{ "<leader>sG", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
			{ "<leader>f?", "<cmd>Telescope help_tags<cr>", desc = "Find in help pages" },
			--{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
			--{ "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
			{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find in keymaps" },
			{ "<leader>fl", "<cmd>Telescope loclist<cr>", desc = "Find in location list" },
			{ "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Find in man pages" },
			--{ "<leader>sM", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
			{ "<leader>fo", "<cmd>Telescope vim_options<cr>", desc = "Find in vim options" },
			{ "<leader>fx", "<cmd>Telescope resume<cr>", desc = "Resume previous find" },
			{ "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Find in quickfix list" },
		},
	},

	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
}
