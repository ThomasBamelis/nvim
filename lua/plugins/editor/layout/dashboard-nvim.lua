return {
	-- Dashboard on startup
	{
		"nvimdev/dashboard-nvim",
		lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
		opts = function()
			local logo = [[

 ______        _       ____    ____  ________  _____     _____   ______   
|_   _ \      / \     |_   \  /   _||_   __  ||_   _|   |_   _|.' ____ \  
  | |_) |    / _ \      |   \/   |    | |_ \_|  | |       | |  | (___ \_| 
  |  __'.   / ___ \     | |\  /| |    |  _| _   | |   _   | |   _.____`.  
 _| |__) |_/ /   \ \_  _| |_\/_| |_  _| |__/ | _| |__/ | _| |_ | \____) | 
|_______/|____| |____||_____||_____||________||________||_____| \______.' 
                                                                          
	    ]]

			logo = string.rep("\n", 8) .. logo .. "\n\n"

			local opts = {
				theme = "hyper",
				shortcut_type = "letter",
				change_to_vcs_root = true,
				hide = {
					-- this is taken care of by lualine
					-- enabling this messes up the actual laststatus setting after loading a file
					statusline = false,
				},
				config = {
					header = vim.split(logo, "\n"),
					packages = { enable = false },
					shortcut = {

						{
							action = "Telescope oldfiles",
							desc = "Recent Files",
							icon = "",
							key = "r",
							group = "find",
						},
						{
							action = "Telescope find_files",
							desc = "Find File",
							icon = "",
							key = "f",
							group = "find",
						},
						{
							action = "Telescope live_grep",
							desc = " Find Text",
							icon = " ",
							key = "g",
							group = "find",
						},
						{
							action = "ene | startinsert",
							desc = "New File",
							icon = "",
							key = "n",
						},
						{
							action = 'lua require("persistence").load()',
							desc = "Restore Session",
							icon = "",
							key = "s",
						},
						{
							action = "Lazy",
							desc = "Lazy: package manager",
							icon = "󰒲",
							key = "l",
							group = "config",
						},
						{ desc = "Update", icon = "󰊳", group = "config", action = "Lazy update", key = "u" },
						{
							action = "Mason",
							desc = "Mason: installing language servers",
							icon = "",
							key = "m",
							group = "config",
						},
						{
							action = function()
								vim.api.nvim_input("<cmd>qa<cr>")
							end,
							desc = "Quit",
							icon = "",
							key = "q",
						},
					},
					project = {
						enable = true,
						limit = 8,
						icon = "",
						label = "",
						action = "Telescope find_files cwd=",
					},
					mru = { limit = 10, icon = "", label = "", cwd_only = false },
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return {
							"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
						}
					end,
				},
			}

			--for _, button in ipairs(opts.config.center) do
			--	button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			--	button.key_format = "  %s"
			--end

			-- open dashboard after closing lazy
			if vim.o.filetype == "lazy" then
				vim.api.nvim_create_autocmd("WinClosed", {
					pattern = tostring(vim.api.nvim_get_current_win()),
					once = true,
					callback = function()
						vim.schedule(function()
							vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
						end)
					end,
				})
			end

			return opts
		end,
	},
}
