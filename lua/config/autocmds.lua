-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- [[ Save when exiting insert mode ]]
-- :autocmd InsertLeave * silent! update
local AutoSaving_group = vim.api.nvim_create_augroup("AutoSaving", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    if vim.fn.getbufvar(buf, "&modifiable") == 1 and vim.api.nvim_get_option_value('buftype', { buf = buf }) == "" then
      vim.cmd.update({ mods = { silent = true } })
    end
  end,
  group = AutoSaving_group,
  pattern = "*",
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

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
