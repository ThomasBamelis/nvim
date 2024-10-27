-- This file is automatically loaded by lazyvim.config.init

local map = vim.keymap.set

-- windows
map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true }) -- Helps which-key to give a better name
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>ws", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>ws", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<leader>wm", "<C-W>_", { desc = "Maximize Window", remap = true })
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<leader>wh", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to Right Window", remap = true })
-- Resize window using <ctrl> arrow keys
map("n", "<leader>w<Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<leader>w<Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<leader>w<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<leader>w<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- buffers
-- We do not use Neovim buffers, but the bufferline plugin, see its config file for keybinds
map("n", "<leader>B", "<leader>b", { desc = "Buffers (DONT USE: neovim)" }) -- For which key
--map("n", "<C-o>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
--map("n", "<C-i>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>Bp", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<leader>Bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
--map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
--map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>Bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
--map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>Bd", "<cmd>:bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Delete Buffer" })
map("n", "<leader>BD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- tabs
map("n", "<leader><tab>", "<leader><tab>", { desc = "Tabs" }) -- For which key
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>h", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>l", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })

-- Quickfixing
map("n", "<leader>F", "<leader>F", { desc = "Quickfix List" }) -- For which key
map("n", "<leader>Fo", vim.cmd.copen, { desc = "Open Quickfix List" })
map("n", "<leader>Fk", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "<leader>Fj", vim.cmd.cnext, { desc = "Next Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
map("n", "<leader>Ff", vim.cmd.cfirst, { desc = "First Quickfix" })
map("n", "<leader>Fl", vim.cmd.clast, { desc = "Last Quickfix" })
map("n", "<leader>Fq", vim.cmd.cclose, { desc = "Close Quickfix list" })
map("n", "<leader>Fg", "<cmd>.cc<cr>", { desc = "Goto quickfix under cursor" })

-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
map("n", "<leader>d", "<leader>d", { desc = "Diagnostics List" })
map("n", "<leader>do", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "<leader>dj", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "<leader>dk", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "<leader>de", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "<leader>dE", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "<leader>dw", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "<leader>dW", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- toggle options
-- TODO: translate to normal vim commands
--LazyVim.toggle.map("<leader>uf", LazyVim.toggle.format())
--LazyVim.toggle.map("<leader>uF", LazyVim.toggle.format(true))
--LazyVim.toggle.map("<leader>us", LazyVim.toggle("spell", { name = "Spelling" }))
--LazyVim.toggle.map("<leader>uw", LazyVim.toggle("wrap", { name = "Wrap" }))
--LazyVim.toggle.map("<leader>uL", LazyVim.toggle("relativenumber", { name = "Relative Number" }))
--LazyVim.toggle.map("<leader>ud", LazyVim.toggle.diagnostics)
--LazyVim.toggle.map("<leader>ul", LazyVim.toggle.number)
--LazyVim.toggle.map( "<leader>uc", LazyVim.toggle("conceallevel", { values = { 0, vim.o.conceallevel > 0 and vim.o.conceallevel or 2 } }))
--LazyVim.toggle.map("<leader>uT", LazyVim.toggle.treesitter)
--LazyVim.toggle.map("<leader>ub", LazyVim.toggle("background", { values = { "light", "dark" }, name = "Background" }))
--if vim.lsp.inlay_hint then
--  LazyVim.toggle.map("<leader>uh", LazyVim.toggle.inlay_hints)
--end

-- quit
map("n", "<leader>q", "<leader>q", { desc = "Quit things" }) -- for which key
map("n", "<leader>qa", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit :q" })
map("n", "<leader>qw", "<C-W>c", { desc = "Close window", remap = true })
map("n", "<leader>qb", "<cmd>:bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Delete Buffer" })
map("n", "<leader>qB", "<cmd>:bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Delete Buffer" })
map("n", "<leader>qt", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- Behaviour changing keybinds

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

-- Skip over wrapped lines
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
	"n",
	"<leader>ur",
	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
	{ desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
