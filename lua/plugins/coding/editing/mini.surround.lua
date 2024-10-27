return {
	-- Plugin for changing/deleting surrounding quotes/brackets/...
	{
	  "echasnovski/mini.surround",
	  opts = {
	    mappings = {
	      add = "gsa",
	      delete = "gsd",
	      find = "gsf",
	      find_left = "gsF",
	      highlight = "gsh",
	      replace = "gsr",
	      update_n_lines = "gsn",
	    },
	  },
	},
}
