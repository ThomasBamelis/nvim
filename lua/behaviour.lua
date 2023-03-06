-- tabbing
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- no swap files
vim.opt.swapfile = false

-- line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Ignore certain files and folders when globing
vim.opt.wildignore:append({
'*.o','*.obj','*.dylib','*.bin','*.dll','*.exe',
'*/.git/*','*/.svn/*','*/__pycache__/*','*/build/**',
'*.jpg','*.png','*.jpeg','*.bmp','*.gif','*.tiff','*.svg','*.ico',
'*.pyc','*.pkl',
'*.DS_Store',
'*.aux','*.bbl','*.blg','*.brf','*.fls','*.fdb_latexmk','*.synctex.gz','*.xdv'
})
vim.opt.wildignorecase = true  -- ignore file and dir name cases in cmd-completion

-- Break line at predefined characters
vim.opt.linebreak = true
-- Character to show before the lines that have been soft-wrapped
vim.opt.showbreak='↪'
-- Ask for confirmation when handling unsaved or read-only files
vim.opt.confirm = true
-- Minimum lines to keep above and below cursor when scrolling
vim.opt.scrolloff=3
-- Auto-write the file based on some condition
vim.opt.autowrite = true
-- Persistent undo even after you close a file and re-open it
vim.opt.undofile = true

vim.opt.pumheight=10  -- Maximum number of items to show in popup menu
vim.opt.pumblend=10  -- pseudo transparency for completion menu
vim.opt.winblend=0  -- pseudo transparency for floating window

-- Align indent to next multiple value of shiftwidth. For its meaning,
-- see http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
vim.opt.shiftround = true

vim.opt.virtualedit='block'  -- Virtual edit is useful for visual block edit

vim.opt.spelllang={'en'}  -- Spell languages
vim.opt.spellsuggest:append('3')  -- show 3 spell suggestions at most



-- Enable true color support.
vim.opt.termguicolors = true

-- Set up cursor color and shape in various mode, ref:
-- https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
vim.opt.guicursor={'n-v-c:block-Cursor/lCursor','i-ci-ve:ver25-Cursor2/lCursor2','r-cr:hor20','o:hor20'}
vim.opt.signcolumn='yes:1'

-- gc in visual will comment out the visual block


-- Go to start or end of line easier
vim.api.nvim_set_keymap("x", "H", "^", { desc = "toggle spell" })
vim.api.nvim_set_keymap("n", "H", "^", { desc = "toggle spell" })
vim.api.nvim_set_keymap("n", "L", "g_", { desc = "toggle spell" })
vim.api.nvim_set_keymap("x", "L", "g_", { desc = "toggle spell" })

-- Continuous visual shifting (does not exit Visual mode), `gv` means
-- to reselect previous visual area, see https://superuser.com/q/310417/736190
vim.api.nvim_set_keymap("x", "<", "<gv", { desc = "toggle spell" })
vim.api.nvim_set_keymap("x", ">", ">gv", { desc = "toggle spell" })

-- Toggle spell checking
vim.api.nvim_set_keymap("n", "<F11>", "<cmd>set spell!<cr>", { desc = "toggle spell" })
vim.api.nvim_set_keymap("i", "<F11>", "<c-o><cmd>set spell!<cr>", { desc = "toggle spell" })

-- Remove trailing whitespace characters
vim.api.nvim_set_keymap("n", "<leader><space>", "<cmd>StripTrailingWhitespace<cr>", { desc = "remove trailing space" })

-- Keep cursor position after yanking
--vim.api.nvim_set_keymap("n", "y", "myy", { desc = "toggle spell" })

--[[
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("restore_after_yank", { clear = true }),
  callback = function()
    vim.cmd([[
      silent! normal! `y
      silent! delmarks y
      --]]
--    ]])
    --[[
  end,
})
--]]

-- Move the cursor based on physical lines, not the actual lines.
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.api.nvim_set_keymap("n", "^", "g^", { desc = "toggle spell" })
vim.api.nvim_set_keymap("n", "0", "g0", { desc = "toggle spell" })

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
