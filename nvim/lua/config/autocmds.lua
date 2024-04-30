-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

local function augroup(name)
    return vim.api.nvim_create_augroup("tom_" .. name, { clear = true })
end

-- delete this group created by lazyvim
-- we'll make our own
local wrap_spell_autocmd =
    vim.api.nvim_get_autocmds({ group = "lazyvim_wrap_spell" })[1]
vim.api.nvim_del_autocmd(wrap_spell_autocmd.id)

-- wrap these file types
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("wrap"),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
    end,
})

local lint = require("lint")
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
    group = vim.api.nvim_create_augroup("lint", { clear = true }),
    callback = function()
        lint.try_lint("cspell")
    end,
})
