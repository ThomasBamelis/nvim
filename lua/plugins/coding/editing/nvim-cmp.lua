-- Completion
local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
}

M.config = function()
  local cmp = require("cmp")
  local select_opts = { behavior = cmp.SelectBehavior.Select }

  vim.opt.completeopt = { "menu", "menuone", "noselect" }

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
      format = function(entry, item)
        local menu_icon = {
          nvim_lsp = '[LSP]',
          crates = '[]',
          path = '[PATH]',
          buffer = '[BUF]',
          snippet = '[SNIP]',
        }
        item.menu = menu_icon[entry.source.name]
        return item
      end,
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
        if cmp.visible() then
          cmp.select_next_item(select_opts)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
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
      { name = "nvim_lsp" },
    }, {
      { name = "buffer" },
      { name = "path" },
      { name = "crates" },
    }),
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
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
