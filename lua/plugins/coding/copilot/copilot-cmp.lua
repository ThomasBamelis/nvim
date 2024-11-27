return {
  {
    -- You have to add this to nvim-cmp
    -- { name = "copilot", group_index = 2 },
    -- Also add the tab completion fix
    -- And add a symbol map for copilot to lspkind
    -- Copilot = "",
    "zbirenbaum/copilot-cmp",
    lazy_load = true,
    dependencies = {
      "zbirenbaum/copilot.lua",
    },
    opts = {
    },
  }
}
