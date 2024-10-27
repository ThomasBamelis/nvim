-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Install python3 env with pynvim, neovim and flake8 in config dir with name venv
vim.g.python3_host_prog = vim.fn.stdpath("config") .. "/venv/bin/python3"

-- gc in visual will comment out the visual block

-- Go to start or end of line easier
vim.api.nvim_set_keymap("x", "H", "^", { desc = "First character in line" })
vim.api.nvim_set_keymap("n", "H", "^", { desc = "First character in line" })
vim.api.nvim_set_keymap("n", "L", "g_", { desc = "Last character in line" })
vim.api.nvim_set_keymap("x", "L", "g_", { desc = "Last character in line" })

-- Continuous visual shifting (does not exit Visual mode), `gv` means
-- to reselect previous visual area, see https://superuser.com/q/310417/736190
vim.api.nvim_set_keymap("x", "<", "<gv", { desc = "Shift left" })
vim.api.nvim_set_keymap("x", ">", ">gv", { desc = "Shift right" })

-- Toggle spell checking
vim.api.nvim_set_keymap("n", "<F11>", "<cmd>set spell!<cr>", { desc = "toggle spell" })
vim.api.nvim_set_keymap("i", "<F11>", "<c-o><cmd>set spell!<cr>", { desc = "toggle spell" })

-- Remove trailing whitespace characters
vim.api.nvim_set_keymap("n", "<leader><space>", "<cmd>StripTrailingWhitespace<cr>", { desc = "remove trailing space" })

-- Keep cursor position after yanking
-- I think this bugs out sometimes
--vim.api.nvim_set_keymap("n", "y", "myy", { desc = "Yank" })

-- Move the cursor based on physical lines, not the actual lines.
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.api.nvim_set_keymap("n", "^", "g^", { desc = "toggle spell" })
vim.api.nvim_set_keymap("n", "0", "g0", { desc = "toggle spell" })

-- Don't replace clipboard when pasting in visual
vim.keymap.set("x", "p", function()
	return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })

-- Put word in single quotes (ciw, delete word under cursor, ', C-r" (paste las word), '. Use register 8 for it
vim.keymap.set(
	"n",
	"<leader>'",
	[[ciw'<C-r>-'<Esc>]],
	{ remap = false, expr = false, desc = "Put word under curser in singel quotes" }
)

-- root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Set LSP servers to be ignored when used with `util.root.detectors.lsp`
-- for detecting the LSP root
vim.g.root_lsp_ignore = { "copilot" }

-- Set filetype to `bigfile` for files larger than 1.5 MB
-- Only vim syntax will be enabled (with the correct filetype)
-- LSP, treesitter and other ft plugins will be disabled.
-- mini.animate will also be disabled.
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

local opt = vim.opt

-- tabbing
opt.tabstop = 2
opt.shiftround = true -- Round indent
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

-- no swap files
opt.swapfile = false

-- line number
opt.number = true
opt.relativenumber = true

-- Ignore certain files and folders when globing
opt.wildignore:append({
	"*.o",
	"*.obj",
	"*.dylib",
	"*.bin",
	"*.dll",
	"*.exe",
	"*/venv/*",
	"*/hdevn/*",
	"*/.git/*",
	"*/.svn/*",
	"*/__pycache__/*",
	"*/build/**",
	"*.jpg",
	"*.png",
	"*.jpeg",
	"*.bmp",
	"*.gif",
	"*.tiff",
	"*.svg",
	"*.ico",
	"*.pyc",
	"*.pkl",
	"*.DS_Store",
	"*.aux",
	"*.bbl",
	"*.blg",
	"*.brf",
	"*.fls",
	"*.fdb_latexmk",
	"*.synctex.gz",
	"*.xdv",
})
opt.wildignorecase = true -- ignore file and dir name cases in cmd-completion

-- Break line at predefined characters
opt.linebreak = true
-- Character to show before the lines that have been soft-wrapped
opt.showbreak = "↪"
-- Ask for confirmation when handling unsaved or read-only files
opt.confirm = true
-- Minimum lines to keep above and below cursor when scrolling
opt.scrolloff = 5
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time

-- Auto-write the file based on some condition
opt.autowrite = true
opt.autowriteall = true
-- Persistent undo even after you close a file and re-open it
opt.undofile = true
opt.undolevels = 10000

opt.pumheight = 10 -- Maximum number of items to show in popup menu
-- These mess up plugins
--opt.pumblend = 10 -- pseudo transparency for completion menu
--opt.winblend = 0 -- pseudo transparency for floating window

-- Align indent to next multiple value of shiftwidth. For its meaning,
-- see http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
opt.shiftround = true

opt.virtualedit = "block" -- Virtual edit is useful for visual block edit

opt.spelllang = { "en" } -- Spell languages
opt.spellsuggest:append("1") -- show 1 spell suggestions at most

-- Enable true color support.
-- Makes it crash?
--opt.termguicolors = true

-- Set up cursor color and shape in various mode, ref:
-- https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
opt.guicursor = { "n-v-c:block-Cursor/lCursor", "i-ci-ve:ver25-Cursor2/lCursor2", "r-cr:hor20", "o:hor20" }
opt.signcolumn = "yes:1"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true -- Insert indents automatically

-- Window indicative characters
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

opt.inccommand = "nosplit" -- preview incremental substitute
opt.jumpoptions = "view"

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

opt.showmode = false -- Dont show mode since we have a statusline

opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current

opt.wildmode = "longest:full,full" -- Command-line completion mode

opt.wrap = true -- Enable line wrap
opt.smoothscroll = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
