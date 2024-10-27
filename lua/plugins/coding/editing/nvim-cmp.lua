
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
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
		}, {
			{ name = "buffer" },
			{ name = "path" },
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