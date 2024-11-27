local leader_key = "a"
return {
  -- Use zbinraum to have access to the plugin that provides the nvim-cmp backend
  -- Lazy load cause there is a bit of a startup time
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = true,
    opts = {
      -- Disable for use with cmp
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
}
