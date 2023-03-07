-- debugging keybinds
--[[
Setting breakpoints via :lua require'dap'.toggle_breakpoint().
Launching debug sessions and resuming execution via :lua require'dap'.continue().
Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)
See :help dap.txt, :help dap-mapping and :help dap-api.
--]]

local opts = { noremap=true, silent=true }
local dap = require'dap'
opts.desc = 'toggle breakpoints'
vim.keymap.set('n', '<leader>dp', dap.toggle_breakpoint, opts)
opts.desc = 'Launch or continue'
vim.keymap.set('n', '<leader>dc', dap.continue, opts)
opts.desc = 'Step over breakpoint'
vim.keymap.set('n', '<leader>do', dap.step_over, opts)
opts.desc = 'Step into breakpoint'
vim.keymap.set('n', '<leader>di', dap.step_into, opts)
opts.desc = 'Shows the window to inspect the variables'
vim.keymap.set('n', '<leader>ds', dap.repl.open, opts)
