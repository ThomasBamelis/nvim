local leader_key = ';'
return {
  -- Plugin for changing/deleting surrounding quotes/brackets/...
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = '<leader>' .. leader_key .. 'a',            -- Add surrounding in Normal and Visual modes
        delete = '<leader>' .. leader_key .. 'd',         -- Delete surrounding
        find = '<leader>' .. leader_key .. 'f',           -- Find surrounding (to the right)
        find_left = '<leader>' .. leader_key .. 'F',      -- Find surrounding (to the left)
        highlight = '<leader>' .. leader_key .. 'h',      -- Highlight surrounding
        replace = '<leader>' .. leader_key .. 'r',        -- Replace surrounding
        update_n_lines = '<leader>' .. leader_key .. 'n', -- Update `n_lines`

        suffix_last = 'l',                                -- Suffix to search with "prev" method
        suffix_next = 'n',                                -- Suffix to search with "next" method
      },
    },
    keys = {
      { "<leader>" .. leader_key, mode = { "n", "x" }, "<leader>" .. leader_key, desc = "Manipulate braces,qoutes,... (mini.surround)" },
    },
  },
}
