-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false
vim.opt.swapfile = false
vim.opt.spell = false -- I use cspell
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = false
vim.opt.scrolloff = 10 -- Lines of context
vim.g.lazyvim_php_lsp = "intelephense"
vim.g.ai_cmp = false
-- show trailing spaces but hide tabs
vim.opt.listchars = {
  tab = "  ", -- Represents a tab with two actual space characters, making it invisible.
  trail = "·",
}
