-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local copilot_on = false

local function copilot()
  if copilot_on then
    copilot_on = false
    vim.notify("Copilot disabled", "info", { title = "🤖️" })
  else
    copilot_on = true
    vim.notify("Copilot enabled", "info", { title = "🤖️" })
  end

  require("copilot.suggestion").toggle_auto_trigger()
end

map("n", "<leader>o", "<cmd>silent! only<cr>", { desc = "Close other windows" })
map("n", "<leader>gb", "<cmd>G blame<cr>", { desc = "Git blame" })
map("n", "<leader>gl", "<cmd>0Gclog<cr>", { desc = "Git log current file" })
map("n", "<leader>y", "@q", { desc = "Run q macro" })
map("v", "Y", '"+y', { desc = "Send selection to clipboard" })
map("n", "<leader>a", copilot, { desc = "toggle copilot" })
