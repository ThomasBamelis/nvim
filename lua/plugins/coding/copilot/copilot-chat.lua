local leader_key = "j"
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
      { "nvim-telescope/telescope.nvim" }, -- To show prompt actions
      { "MeanderingProgrammer/render-markdown.nvim" }, -- To render the window better
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
      -- Needed for rendermarkdown
      highlight_headers = false,
      separator = '---',
      error_header = '> [!ERROR] Error',
      -- Some extra options
      insert_at_end = true, -- Move cursor to end of buffer when inserting text
      clear_chat_on_new_prompt = true, -- Clears chat on every new prompt
      -- Add custom prompts
      prompts = {
        MyCustomPrompt = {
          prompt = 'Explain how it works.',
          system_prompt = 'You are very good at explaining stuff',
          --mapping = '<leader>ccmc',
          description = 'My custom prompt description',
        }
      },
      -- window options
      window = {
        layout = 'float', -- 'vertical', 'horizontal', 'float', 'replace'
        width = 1.0, -- fractional width of parent, or absolute width in columns when > 1
        height = 0.4, -- fractional height of parent, or absolute height in rows when > 1
        -- Options below only apply to floating windows
        relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
        border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        row = 1, -- row position of the window, default is centered
        col = nil, -- column position of the window, default is centered
        title = 'Copilot Chat', -- title of chat window
        footer = nil, -- footer of chat window
        zindex = 1, -- determines if window is on top or below other floating windows
      },
      -- default mappings
      mappings = {
        complete = {
          insert = '<Tab>',
        },
        close = {
          normal = 'q',
          insert = '<C-c>',
        },
        reset = {
          normal = '<C-l>',
          insert = '<C-l>',
        },
        submit_prompt = {
          normal = '<CR>',
          insert = '<C-s>',
        },
        toggle_sticky = {
          detail = 'Makes line under cursor sticky or deletes sticky line.',
          normal = 'gr',
        },
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>',
        },
        jump_to_diff = {
          normal = 'gj',
        },
        quickfix_diffs = {
          normal = 'gq',
        },
        yank_diff = {
          normal = 'gy',
          register = '"',
        },
        show_diff = {
          normal = 'gd',
        },
        show_system_prompt = {
          normal = 'gp',
        },
        show_user_selection = {
          normal = 'gs',
        },
        show_user_context = {
          normal = 'gc',
        },
        show_help = {
          normal = 'gh',
        },
      },
    },
    cmd = {"CopilotChatToggle", "CopilotChatReset", "CopilotChatExplain", "CopilotChatReview", "CopilotChatFix", "CopilotChatOptimize", "CopilotChatDocs", "CopilotChatTests"},
    keys = {
      { "<leader>" .. leader_key,    "<leader>" .. leader_key,                  desc = "Copilot chat", mode = {"n", "x"}},        -- for which key
      { "<leader>" .. leader_key .. "j", "<Cmd>CopilotChatToggle<CR>",        desc = "Toggle chat (C-j)", mode = {"n", "x"}},
      { "<C-j>", "<Cmd>CopilotChatToggle<CR>",        desc = "Toggle Chat", mode = {"n", "x"}},
      { "<leader>" .. leader_key .. "R", "<Cmd>CopilotChatReset<CR>",        desc = "Reset chat window", mode = {"n", "x"}},
      { "<leader>" .. leader_key .. "e", "<Cmd>CopilotChatExplain<CR>",        desc = "Explain selected code", mode = {"n", "x"}},
      { "<leader>" .. leader_key .. "r", "<Cmd>CopilotChatReview<CR>",        desc = "Review selected code", mode = {"n", "x"}},
      { "<leader>" .. leader_key .. "f", "<Cmd>CopilotChatFix<CR>",        desc = "Fix selected code", mode = {"n", "x"}},
      { "<leader>" .. leader_key .. "o", "<Cmd>CopilotChatOptimize<CR>",        desc = "Optimize selected code", mode = {"n", "x"}},
      { "<leader>" .. leader_key .. "d", "<Cmd>CopilotChatDocs<CR>",        desc = "Document selected code", mode = {"n", "x"}},
      { "<leader>" .. leader_key .. "t", "<Cmd>CopilotChatTests<CR>",        desc = "Generate test for selected code", mode = {"n", "x"}},
      { "<leader>" .. leader_key .. "q",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "Ask quick question about selected code",
        mode = {"n", "x"}
      },
      {
        "<leader>" .. leader_key .. "p",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "Show prompt actions",
        mode = {"n", "x"}
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
