return {
	-- Status line at the bottom
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "AndreM222/copilot-lualine" }, -- for copilot integration
    },
    opts = {
      options = {
          icons_enabled = true,
          --theme = cozynight,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {},
          always_divide_middle = true
      },
      sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff',
              {
                  'diagnostics',
                  sources = { "nvim_diagnostic" },
                  symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
              }
          },
          lualine_c = { 'filename' },
          lualine_x = { {'copilot', show_colors=true } ,'encoding', 'fileformat', 'filetype' }, -- I added copilot here
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
      },
      inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
      },
      tabline = {},
      extensions = {}
    },
	},
}
