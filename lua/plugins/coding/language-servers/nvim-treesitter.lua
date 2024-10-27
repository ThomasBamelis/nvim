local M = {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true },
	},
}

M.config = function()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
		highlight = { enable = true },
		-- Automatically install missing parsers when entering buffer, needs cargo install tree-sitter-cli
		auto_install = true,
		-- A list of parser names, or "all" (the listed parsers MUST always be installed)
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"printf",
			"python",
			"query",
			"regex",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
			"asm",
			"cmake",
			"comment",
			"cpp",
			"csv",
			"devicetree",
			"disassembly",
			"gitcommit",
			"git_rebase",
			"kconfig",
			"make",
			"meson",
			"ninja",
			"objdump",
			"rust",
			"ssh_config",
			"tmux",
			"verilog",
		},
	})
end

return M
--[[
return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "VeryLazy" },
		lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
		init = function(plugin)
			-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
			-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
			-- no longer trigger the **nvim-treesitter** module to be loaded in time.
			-- Luckily, the only things that those plugins need are the custom queries, which we make available
			-- during startup.
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		keys = {
			{ "<c-space>", desc = "Increment Selection" },
			{ "<bs>", desc = "Decrement Selection", mode = "x" },
		},
		opts_extend = { "ensure_installed" },
		---@type TSConfig
		---@diagnostic disable-next-line: missing-fields
		opts = {
			highlight = { enable = true },
			-- Automatically install missing parsers when entering buffer, needs cargo install tree-sitter-cli
			auto_install = true,
			--indent = { enable = true },
			-- A list of parser names, or "all" (the listed parsers MUST always be installed)
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"printf",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
				"asm",
				"cmake",
				"comment",
				"cpp",
				"csv",
				"devicetree",
				"disassembly",
				"gitcommit",
				"git_rebase",
				"kconfig",
				"make",
				"meson",
				"ninja",
				"objdump",
				"rust",
				"ssh_config",
				"tmux",
				"verilog",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				move = {
					enable = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
						["]a"] = "@parameter.inner",
					},
					goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
						["[a"] = "@parameter.inner",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
						["[A"] = "@parameter.inner",
					},
				},
			},
		},
	},
}
--]]