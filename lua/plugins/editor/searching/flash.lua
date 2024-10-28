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
      { "<leader>s",  mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Search in file (Flash)" },
      { "<leader>si", mode = { "n", "x", "o" }, function() require("flash").toggle(true) end,        desc = "Toggle Flash Search on when searching normally" },
      { "<leader>so", mode = { "n", "x", "o" }, function() require("flash").toggle(false) end,       desc = "Toggle Flash Search off when searching normally" },
      { "<leader>ss", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Search with tags" },
      { "<leader>st", mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Search with tags Treesitter" },
      { "<leader>sr", mode = "o",               function() require("flash").remote() end,            desc = "Search with Flash and return afterwards (r) (for yanking in mode o)" },
      { "r",          mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "<leader>sR", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Search with Flash Treesitter and return afterwards (R) (for yanking in mode o and visual)" },
      { "R",          mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  },
}
