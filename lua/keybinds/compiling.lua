-- debugging keybinds
--[[
Setting breakpoints via :lua require'dap'.toggle_breakpoint().
Launching debug sessions and resuming execution via :lua require'dap'.continue().
Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)
See :help dap.txt, :help dap-mapping and :help dap-api.
--]]

local opts = { noremap=true, silent=true }
opts.desc = 'Toggle latex compilation'
vim.keymap.set({'n'}, 'gl', '<cmd>VimtexCompile<cr>', opts)
