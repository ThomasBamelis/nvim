local opts = { noremap=true, silent=true }

-- buffer nav

-- next and prev buffer
opts.desc = 'next buffer'
vim.keymap.set("n", "<leader>k", ":bn<cr>", opts)
opts.desc = 'prev buffer'
vim.keymap.set("n", "<leader>j", ":bp<cr>", opts)
opts.desc = 'close buffer'
vim.keymap.set("n", "<leader>w", ":bp<bar>sp<bar>bn<bar>bd<cr>", opts)
--vim.keymap.set('n', '<leader>j', 'gt', opts)
--vim.keymap.set('n', '<leader>k', 'gT', opts)

-- Window nav
opts.desc = 'close windows'
vim.keymap.set('n', '<space>q', '<C-w>q', opts)
opts.desc = 'split horizontally'
vim.keymap.set('n', '<space>s', '<C-w>s', opts)
opts.desc = 'split vertically'
vim.keymap.set('n', '<space>v', '<C-w>v', { noremap = true, silent = true , desc = "Split window vertically" })
-- Move between windows with spacebar + homerow
opts.desc = 'Move to left window'
vim.keymap.set('n', '<space>h', '<C-w>h', opts)
opts.desc = 'Move to down window'
vim.keymap.set('n', '<space>j', '<C-w>j', opts)
opts.desc = 'Move to up window'
vim.keymap.set('n', '<space>k', '<C-w>k', opts)
opts.desc = 'Move to right window'
vim.keymap.set('n', '<space>l', '<C-w>l', opts)
-- resize windows
-- heigth
opts.desc = 'Increase window height'
vim.keymap.set('n', '<space>n', '3<C-w>+', opts)
opts.desc = 'Decrease window height'
vim.keymap.set('n', '<space>m', '3<C-w>-', opts)
-- width (space <> without shift)
opts.desc = 'Increase window width'
vim.keymap.set('n', '<space>.', '3<C-w>>', opts)
opts.desc = 'Decrease window width'
vim.keymap.set('n', '<space>,', '3<C-w><', opts)
opts.desc = 'Make all windows same width and height'
vim.keymap.set('n', '<space>=', '<C-w>=', opts)

-- Vista (list functions struct etc...)
-- :help vista-commands
-- :help vista-options
opts.desc = 'Toggle symbols window (funcs, vars, structs,...)'
vim.keymap.set('n', '<space>c', '<cmd>Vista!!<cr>', opts)

-- file explorer
-- When you are in the window, do 'g?' for it to show the commands to do stuff. Adding a file is a etc...
opts.desc = 'Toggle file explorer (g? for help)'
vim.keymap.set('n', '<space>f', '<cmd>NvimTreeToggle<cr>', opts)
--vim.keymap.set('n', '<space>F', '<cmd>NvimTreeFocus<cr>', opts)
opts.desc = 'Find file in file explorer'
vim.keymap.set('n', '<space>F', '<cmd>NvimTreeFindFile<cr>', opts)
--vim.keymap.set('n', '<space>c', '<cmd>NvimTreeCollapse<cr>', opts)


-- Floating terminal
opts.desc = 'Toggle floating terminal in normal mode'
vim.keymap.set({'n'}, '<space>t', '<cmd>FloatermToggle --name=mainterm<cr>', opts)
opts.desc = 'Toggle floating terminal in the terminal'
vim.keymap.set({'t'}, '<C-q>', '<cmd>FloatermToggle --name=mainterm<cr>', opts)
