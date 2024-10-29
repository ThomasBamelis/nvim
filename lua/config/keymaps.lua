-- This file is automatically loaded by lazyvim.config.init

local map = vim.keymap.set

map("i", "jj", "<Esc>", { desc = "Remap ESC in insert mode", remap = true })

local leader_key_windows = "w"
-- windows
map("n", "<leader>" .. leader_key_windows, "<c-w>", { desc = "Windows", remap = true }) -- Helps which-key to give a better name
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below (leader -)", remap = true })
map("n", "<leader>" .. leader_key_windows .. "s", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right (leader |)", remap = true })
map("n", "<leader>" .. leader_key_windows .. "s", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>" .. leader_key_windows .. "d", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<leader>" .. leader_key_windows .. "m", "<C-W>_", { desc = "Maximize Window", remap = true })
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<leader>" .. leader_key_windows .. "h", "<C-w>h", { desc = "Go to Left Window (C-h)", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<leader>" .. leader_key_windows .. "j", "<C-w>j", { desc = "Go to Lower Window (C-j)", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<leader>" .. leader_key_windows .. "k", "<C-w>k", { desc = "Go to Upper Window (C-k)", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
map("n", "<leader>" .. leader_key_windows .. "l", "<C-w>l", { desc = "Go to Right Window (C-l)", remap = true })
-- Resize window using <ctrl> arrow keys
map("n", "<leader>" .. leader_key_windows .. "<Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height (C-up)" })
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<leader>" .. leader_key_windows .. "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height (C-down)" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<leader>" .. leader_key_windows .. "<Left>", "<cmd>vertical resize -2<cr>",
  { desc = "Decrease Window Width (C-left)" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<leader>" .. leader_key_windows .. "<Right>", "<cmd>vertical resize +2<cr>",
  { desc = "Increase Window Width (C-right)" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- buffers
local leader_key_buffers = "B"
-- We do not use Neovim buffers, but the bufferline plugin, see its config file for keybinds
map("n", "<leader>" .. leader_key_buffers, "<leader>" .. leader_key_buffers, { desc = "Buffers (DONT USE: neovim)" }) -- For which key
--map("n", "<C-o>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
--map("n", "<C-i>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>" .. leader_key_buffers .. "p", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<leader>" .. leader_key_buffers .. "n", "<cmd>bnext<cr>", { desc = "Next Buffer" })
--map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
--map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>" .. leader_key_buffers .. "b", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
--map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>" .. leader_key_buffers .. "d", "<cmd>:bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Delete Buffer" })
map("n", "<leader>" .. leader_key_buffers .. "D", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- tabs
local leader_key_tabs = "<tab>"
map("n", "<leader>" .. leader_key_tabs, "<leader>" .. leader_key_tabs, { desc = "Tabs (neovim)" }) -- For which key
map("n", "<leader>" .. leader_key_tabs .. "l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader>" .. leader_key_tabs .. "o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader>" .. leader_key_tabs .. "f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader>" .. leader_key_tabs .. "<tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>" .. leader_key_tabs .. "h", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader>" .. leader_key_tabs .. "d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader>" .. leader_key_tabs .. "l", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

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
map("n", "<leader>p", "<leader>p", { desc = "Packages (lazy,mason)" }) -- which key
map("n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Lazy.nvim" })

local leader_key_locationlist = "F"
map("n", "<leader>" .. leader_key_locationlist, "<leader>" .. leader_key_locationlist, { desc = "Location list" }) -- for which key
map("n", "<leader>" .. leader_key_locationlist .. "o", "<cmd>lopen<cr>", { desc = "Open location list" })

-- Quickfixing
local leader_key_quickfixlist = "F"
map("n", "<leader>" .. leader_key_quickfixlist, "<leader>" .. leader_key_quickfixlist, { desc = "Quickfix List" }) -- For which key
map("n", "<leader>" .. leader_key_quickfixlist .. "o", vim.cmd.copen, { desc = "Open Quickfix List" })
map("n", "<leader>" .. leader_key_quickfixlist .. "k", vim.cmd.cprev, { desc = "Previous Quickfix ([q)" })
map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "<leader>" .. leader_key_quickfixlist .. "j", vim.cmd.cnext, { desc = "Next Quickfix (]q)" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
map("n", "<leader>" .. leader_key_quickfixlist .. "f", vim.cmd.cfirst, { desc = "First Quickfix" })
map("n", "<leader>" .. leader_key_quickfixlist .. "l", vim.cmd.clast, { desc = "Last Quickfix" })
map("n", "<leader>" .. leader_key_quickfixlist .. "q", vim.cmd.cclose, { desc = "Close Quickfix list" })
map("n", "<leader>" .. leader_key_quickfixlist .. "g", "<cmd>.cc<cr>", { desc = "Goto quickfix under cursor" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
local leader_key_diagnostics = "c"
map("n", "<leader>" .. leader_key_diagnostics, "<leader>" .. leader_key_diagnostics, { desc = "Coding (lsp)" }) -- for which key
map("n", "<leader>" .. leader_key_diagnostics .. "o", vim.diagnostic.open_float, { desc = "Show diagnostics for line" })
map("n", "<leader>" .. leader_key_diagnostics .. "j", diagnostic_goto(true), { desc = "Next Diagnostic (]d)" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "<leader>" .. leader_key_diagnostics .. "k", diagnostic_goto(false), { desc = "Prev Diagnostic ([d)" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "<leader>" .. leader_key_diagnostics .. "e", diagnostic_goto(true, "ERROR"), { desc = "Next Error (]e)" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "<leader>" .. leader_key_diagnostics .. "E", diagnostic_goto(false, "ERROR"), { desc = "Prev Error ([e)" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "<leader>" .. leader_key_diagnostics .. "w", diagnostic_goto(true, "WARN"), { desc = "Next Warning (]w)" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "<leader>" .. leader_key_diagnostics .. "W", diagnostic_goto(false, "WARN"), { desc = "Prev Warning ([w)" })
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
local leader_key_inspect = "i"
map("n", "<leader>" .. leader_key_inspect, "<leader>" .. leader_key_inspect, { desc = "Inspect" })
map("n", "<leader>" .. leader_key_inspect .. "i", vim.show_pos, { desc = "Inspect position under cursor" })
map("n", "<leader>" .. leader_key_inspect .. "I", "<cmd>InspectTree<cr>", { desc = "Inspect tree" })

-- Terminal Mappings: we are using ToggleTerm for terminal stuff
--map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
--map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
--map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
--map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
--map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
--map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
--map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

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
  "<leader>=",
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
