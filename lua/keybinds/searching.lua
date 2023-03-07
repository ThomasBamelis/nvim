-- HLS lens config
local opts = {noremap = true, silent = true}

opts.desc = 'next search match'
vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    opts)
opts.desc = 'prev search match'
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    opts)
-- TODO find out what this do, is normal vim remap to hlslens
opts.desc = '* search'
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
opts.desc = '# search'
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
opts.desc = 'g* search'
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
opts.desc = 'g# search'
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)

opts.desc = 'noh command'
vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', opts)

-- LeaderF config
opts.desc = 'grep through repo'
vim.api.nvim_set_keymap('n', '<Leader>g', '<Cmd>Leaderf rg<CR>', opts)
opts.desc = 'Show recently opened files'
vim.api.nvim_set_keymap('n', '<Leader>r', '<Cmd>Leaderf mru<CR>', opts)
opts.desc = 'Search for file'
vim.api.nvim_set_keymap('n', '<Leader>f', '<Cmd>LeaderfFile<CR>', opts)
opts.desc = 'Search in buffer'
vim.api.nvim_set_keymap('n', '<Leader>b', '<Cmd>LeaderfBuffer<CR>', opts)
