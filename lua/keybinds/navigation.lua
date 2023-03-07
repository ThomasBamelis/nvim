-- buffer nav

-- next and prev buffer
vim.api.nvim_set_keymap("n", "<leader>k", ":bn<cr>", { silent = true, desc = "next buffer" })
vim.api.nvim_set_keymap("n", "<leader>j", ":bp<cr>", { silent = true, desc = "previous buffer" })
-- close buffer
vim.api.nvim_set_keymap("n", "<leader>w", ":bp<bar>sp<bar>bn<bar>bd<cr>", { silent = true, desc = "close buffer" })
--vim.api.nvim_set_keymap('n', '<leader>j', 'gt', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>k', 'gT', { noremap = true, silent = true })

-- Window nav
-- close windows
vim.api.nvim_set_keymap('n', '<space>q', '<C-w>q', { noremap = true, silent = true })
-- Split s or v
vim.api.nvim_set_keymap('n', '<space>s', '<C-w>s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>v', '<C-w>v', { noremap = true, silent = true , desc = "Split window vertically" })
-- Move between windows with spacebar + homerow
vim.api.nvim_set_keymap('n', '<space>h', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>j', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>k', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>l', '<C-w>l', { noremap = true, silent = true })
-- resize windows
-- heigth
vim.api.nvim_set_keymap('n', '<space>n', '20<C-w>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>m', '20<C-w>-', { noremap = true, silent = true })
-- width (space <> without shift)
vim.api.nvim_set_keymap('n', '<space>.', '20<C-w>>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>,', '20<C-w><', { noremap = true, silent = true })
-- make all windows same width and height
vim.api.nvim_set_keymap('n', '<space>=', '<C-w>=', { noremap = true, silent = true })

-- Vista (list functions struct etc...)
vim.api.nvim_set_keymap('n', '<space>c', '<cmd>Vista!!<cr>', { noremap = true, silent = true })

-- file explorer
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>NvimTreeToggle<cr>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<space>F', '<cmd>NvimTreeFocus<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>F', '<cmd>NvimTreeFindFile<cr>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<space>c', '<cmd>NvimTreeCollapse<cr>', { noremap = true, silent = true })
