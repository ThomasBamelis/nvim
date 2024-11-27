-- Completion
local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- for copilot
    "zbirenbaum/copilot-cmp",
    -- for symbols
    "onsails/lspkind.nvim",
  },
}

M.config = function()
  local cmp = require("cmp")
  local lspkind = require('lspkind')
  local select_opts = { behavior = cmp.SelectBehavior.Select }

  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  -- Fix for copilot-cmp when pressing tab
  local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    if not table.unpack then
      table.unpack = unpack
    end
    local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    formatting = {
      fields = { "menu", "abbr", "kind" },
      -- using lspkind for symbols
      format = lspkind.cmp_format({
        mode = 'symbol', -- show only symbol annotations
        symbol_map = {
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰜢",
          Variable = "󰀫",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
          Copilot = ""
        },
        -- default symbol map
        -- can be either 'default' (requires nerd-fonts font) or
        -- 'codicons' for codicon preset (requires vscode-codicons font)
        --
        -- default: 'default'
        preset = 'default',
        maxwidth = {
          -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          -- can also be a function to dynamically calculate max width such as
          -- menu = function() return math.floor(0.45 * vim.o.columns) end,
          menu = 50, -- leading text (labelDetails)
          abbr = 50, -- actual suggestion item
        },
        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        show_labelDetails = true, -- show labelDetails in menu. Disabled by default

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        --before = function (entry, vim_item)
        --  ...
        --  return vim_item
        --end
      })
    },
    mapping = {
      -- Scroll list down if too long
      ["<C-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.mapping.scroll_docs(4)
        else
          fallback()
        end
      end, { "i", "s" }),
      -- Scroll list up if too long
      ["<C-k>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.mapping.scroll_docs(-4)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        -- Fix for copilot-cmp with has_words_before
        if cmp.visible() and has_words_before() then
          cmp.select_next_item(select_opts)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        -- Fix for copilot-cmp with has_words_before
        if cmp.visible() and has_words_before() then
          cmp.select_prev_item(select_opts)
        else
          fallback()
        end
      end, { "i", "s" }),
      -- Open completion window
      ["<C-Space>"] = cmp.mapping.complete(),
      -- Close completion window
      ["<C-e>"] = cmp.mapping.abort(),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      -- If nothing is selected (including preselections) add a newline as usual.
      -- If something has explicitly been selected by the user, select it.
      -- ["<CR>"] = cmp.mapping({
      --   i = function(fallback)
      --     if cmp.visible() and cmp.get_active_entry() then
      --       cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
      --     else
      --       fallback()
      --     end
      --   end,
      --   s = cmp.mapping.confirm({ select = true }),
      --   c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      -- }),
    },
    sources = cmp.config.sources({
      -- nvim_lsp but do not include text suggestions
      { name = "nvim_lsp",
        entry_filter = function(entry, ctx)
          return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
        end
      },
      { name = "copilot" },
    }, {
      { name = "buffer", keyword_length = 3, max_item_count = 2},
      { name = "path" },
      { name = "crates" },
    }),
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer", keyword_length = 3, max_item_count = 2},
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })


  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --  capabilities = capabilities
  --}
end

return M
