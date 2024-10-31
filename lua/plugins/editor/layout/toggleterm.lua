local leader_key = "t"
return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    cmd = { "ToggleTerm" },
    opts = {
      float_opts = {
        border = 'curved'
      },
    },
    config = function(_, opts)
      -- Pass opts
      require("toggleterm").setup(opts)

      -- THOMAS TODO: rework by looking at this guy, the terminal keymaps don't work and he doesn't need his own function to start the terminals: https://github.com/krshrimali/nvim/blob/master/lua/user/toggleterm.lua

      -- Create predefined terminals
      local Terminal            = require('toggleterm.terminal').Terminal
      local main                = Terminal:new {
        cmd = "/bin/zsh",      -- command to execute when creating the terminal e.g. 'top'
        display_name = "main", -- the name of the terminal
        direction = "float",   -- the layout for the terminal, same as the main config options
        count = 1,             -- The id of the terminal
        --dir = string -- the directory for the terminal
        --close_on_exit = bool -- close the terminal window when the process exits
        --highlights = table -- a table with highlights
        --env = table -- key:value table with environmental variables passed to jobstart()
        --clear_env = bool -- use only environmental variables from `env`, passed to jobstart()
        --on_open = fun(t: Terminal) -- function to run when the terminal opens
        --on_close = fun(t: Terminal) -- function to run when the terminal closes
        auto_scroll = true, -- automatically scroll to the bottom on terminal output
        -- callbacks for processing the output
        --on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
        --on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
        --on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
      }

      -- Code to start the terminals in the background on the first use of a shortcut
      local all_terminals       = { main }

      local initialization_done = false

      local init_terminals      = function()
        for _, t in ipairs(all_terminals) do
          t:spawn()
        end
      end

      function _toggleterm_cmd(command)
        if not initialization_done then
          init_terminals()
          initialization_done = true
        end
        vim.cmd(command)
      end
    end,
    -- stylua: ignore start
    keys = {
      { "<leader>" .. leader_key,    "<leader>" .. leader_key,                                          desc = "Terminal (ToggleTerm)",                  mode = { "n" } },        -- for which-key
      { "<leader>" .. leader_key .. "i", '<cmd>lua _toggleterm_cmd("")<cr>',                            desc = "Init all terminals",                     mode = { "n" } },
      { "<leader>" .. leader_key .. "t", '<cmd>lua _toggleterm_cmd("ToggleTermToggleAll")<cr>',         desc = "Show/hide all terminals (C-t)",          mode = { "n" } },
      { "<C-t>",                     '<cmd>lua _toggleterm_cmd("ToggleTermToggleAll")<cr>',             desc = "Show/hide all terminals",                mode = { "n", "t" } },
      { "<leader>" .. leader_key .. "m", '<cmd>lua _toggleterm_cmd("1ToggleTerm")<cr>',                 desc = "Open/focus main terminal",               mode = { "n" } },
      { "<leader>" .. leader_key .. "1", '<cmd>lua _toggleterm_cmd("TermSelect 1")<cr>',                desc = "Open/focus main terminal",               mode = { "n" } },
      { "<leader>" .. leader_key .. "l", '<cmd>lua _toggleterm_cmd("ToggleTermSendCurrentLine 1")<cr>', desc = "Send line to main terminal",             mode = { "n" } },
      { "<leader>" .. leader_key .. "v", '<cmd>lua _toggleterm_cmd("ToggleTermSendVisualLines 1")<cr>', desc = "Send visual block to main terminal",     mode = { "n" } },
      { "<leader>" .. leader_key .. "s", '<cmd>lua _toggleterm_cmd("ToggleTermSendVisualSelection 1")<cr>', desc = "Send visual selection to main terminal", mode = { "n" } },
      --{ "<C-h>",      "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle terminal",               mode = { "n", "t" } },
      { "<esc><esc>",                [[<C-\><C-n>]],                                                     desc = "Enter Normal Mode",                      mode = { "t" } },
      { "jj",                [[<C-\><C-n>]],                                                     desc = "Enter Normal Mode",                      mode = { "t" } },
      { "<C-h>",                     "<cmd>wincmd h<cr>",                                               desc = "Go to Left Window",                      mode = { "t" } },
      { "<C-w>",                     "<cmd><C-\\><C-n><C-w><cr>",                                       desc = "Enter normal mode and window?",          mode = { "t" } },
      { "<C-j>",                     "<cmd>wincmd j<cr>",                                               desc = "Go to Lower Window",                     mode = { "t" } },
      { "<C-k>",                     "<cmd>wincmd k<cr>",                                               desc = "Go to Upper Window",                     mode = { "t" } },
      { "<C-l>",                     "<cmd>wincmd l<cr>",                                               desc = "Go to Right Window",                     mode = { "t" } },
      --{ "<C-/>",      "<cmd>close<cr>",                           desc = "Hide Terminal",                          mode = { "t" } },
      --{ "<c-_>",      "<cmd>close<cr>",                           desc = "which_key_ignore",                       mode = { "t" } },
    },
  },
}
