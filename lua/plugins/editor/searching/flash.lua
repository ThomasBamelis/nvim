local leader_key = "s"
return {
  -- Add labels when searching that you can jump to
  {
    "folke/flash.nvim",
    -- The special function (I don't know what it does) requires telescope
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    opts = {
      -- Enable search with jump tags by default
      modes = { search = { enabled = true } }
    },
    -- stylua: ignore
    keys = {
      -- I removed o mode everywhere, don't use it often and makes me unable to use > + space for indenting
      { "<leader>" .. leader_key,        mode = { "n", "x" }, "<leader>" .. leader_key,                            desc = "Search in file (Flash)" },
      { "<leader>" .. leader_key .. "i", mode = { "n", "x" }, function() require("flash").toggle(true) end,        desc = "Toggle Flash Search on when searching normally" },
      { "<leader>" .. leader_key .. "o", mode = { "n", "x" }, function() require("flash").toggle(false) end,       desc = "Toggle Flash Search off when searching normally" },
      { "<leader>" .. leader_key .. "s", mode = { "n", "x" }, function() require("flash").jump() end,              desc = "Search with tags" },
      { "<leader>" .. leader_key .. "t", mode = { "n", "x" }, function() require("flash").treesitter() end,        desc = "Search with tags Treesitter" },
      { "<leader>" .. leader_key .. "r", mode = "x",          function() require("flash").remote() end,            desc = "Search with Flash and return afterwards (r) (for yanking in mode o)" },
      { "r",                             mode = "o",          function() require("flash").remote() end,            desc = "Remote Flash" },
      { "<leader>" .. leader_key .. "R", mode = { "x" },      function() require("flash").treesitter_search() end, desc = "Search with Flash Treesitter and return afterwards (R) (for yanking in mode o and visual)" },
      { "R",                             mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  },
}
