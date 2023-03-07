local opts = { noremap=true, silent=true }

-- buffer nav

-- next and prev buffer
opts.desc = 'next buffer'
vim.api.nvim_set_keymap("n", "<leader>k", ":bn<cr>", opts)
opts.desc = 'prev buffer'
vim.api.nvim_set_keymap("n", "<leader>j", ":bp<cr>", opts)
opts.desc = 'close buffer'
vim.api.nvim_set_keymap("n", "<leader>w", ":bp<bar>sp<bar>bn<bar>bd<cr>", opts)
--vim.api.nvim_set_keymap('n', '<leader>j', 'gt', opts)
--vim.api.nvim_set_keymap('n', '<leader>k', 'gT', opts)

-- Window nav
opts.desc = 'close windows'
vim.api.nvim_set_keymap('n', '<space>q', '<C-w>q', opts)
opts.desc = 'split horizontally'
vim.api.nvim_set_keymap('n', '<space>s', '<C-w>s', opts)
opts.desc = 'split vertically'
vim.api.nvim_set_keymap('n', '<space>v', '<C-w>v', { noremap = true, silent = true , desc = "Split window vertically" })
-- Move between windows with spacebar + homerow
opts.desc = 'Move to left window'
vim.api.nvim_set_keymap('n', '<space>h', '<C-w>h', opts)
opts.desc = 'Move to down window'
vim.api.nvim_set_keymap('n', '<space>j', '<C-w>j', opts)
opts.desc = 'Move to up window'
vim.api.nvim_set_keymap('n', '<space>k', '<C-w>k', opts)
opts.desc = 'Move to right window'
vim.api.nvim_set_keymap('n', '<space>l', '<C-w>l', opts)
-- resize windows
-- heigth
opts.desc = 'Increase window height'
vim.api.nvim_set_keymap('n', '<space>n', '20<C-w>+', opts)
opts.desc = 'Decrease window height'
vim.api.nvim_set_keymap('n', '<space>m', '20<C-w>-', opts)
-- width (space <> without shift)
opts.desc = 'Increase window width'
vim.api.nvim_set_keymap('n', '<space>.', '20<C-w>>', opts)
opts.desc = 'Decrease window width'
vim.api.nvim_set_keymap('n', '<space>,', '20<C-w><', opts)
opts.desc = 'Make all windows same width and height'
vim.api.nvim_set_keymap('n', '<space>=', '<C-w>=', opts)

-- Vista (list functions struct etc...)
-- :help vista-commands
-- :help vista-options
opts.desc = 'Toggle symbols window (funcs, vars, structs,...)'
vim.api.nvim_set_keymap('n', '<space>c', '<cmd>Vista!!<cr>', opts)

-- file explorer
-- When you are in the window, do 'g?' for it to show the commands to do stuff. Adding a file is a etc...
opts.desc = 'Toggle file explorer (g? for help)'
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>NvimTreeToggle<cr>', opts)
--vim.api.nvim_set_keymap('n', '<space>F', '<cmd>NvimTreeFocus<cr>', opts)
opts.desc = 'Find file in file explorer'
vim.api.nvim_set_keymap('n', '<space>F', '<cmd>NvimTreeFindFile<cr>', opts)
--vim.api.nvim_set_keymap('n', '<space>c', '<cmd>NvimTreeCollapse<cr>', opts)
