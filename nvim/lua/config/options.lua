-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false
vim.opt.swapfile = false
vim.opt.conceallevel = 0 -- don't hide my json strings
vim.opt.spell = false -- I use cspell
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = false

vim.filetype.add({ extension = { templ = "templ" } })

-- hacky, please fix this
-- vim.cmd("autocmd BufRead,BufEnter *.template.html set filetype=angular")
-- vim.cmd("autocmd BufRead,BufEnter *.template.html set commentstring=<!--%s-->")
