-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local cspell = require("util.cspell")

map("n", "<leader>y", "@q", { desc = "Run q macro" })

map("n", "<leader>Y", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy relative file path to clipboard" })

map("n", "<leader>cW", cspell.add_all_unknown, { desc = "Add all unknown words to cspell dictionary" })
map("v", "<leader>cx", cspell.add_selected, { desc = "Add word to cspell dictionary" })

map("n", "<leader>ac", function()
  vim.g.completion = not vim.g.completion
  vim.notify("completions are " .. (vim.g.completion and "ON" or "OFF"))
end, { desc = "Toggle Completion" })

map("n", "<leader>ai", function()
  vim.g.copilot_enabled = not vim.g.copilot_enabled
  vim.notify("Copilot is " .. (vim.g.copilot_enabled and "ON" or "OFF"))
end, { desc = "Toggle Copilot" })
