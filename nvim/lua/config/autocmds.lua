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

-- Function to close all buffers of a specific filetype
local function close_buffers_by_filetype(filetype)
    local buffers = vim.api.nvim_list_bufs()
    for _, buf in ipairs(buffers) do
        if
            vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf)
        then
            local buf_filetype = vim.api.nvim_buf_get_option(buf, "filetype")

            if buf_filetype == filetype then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end
    end
end

-- Create an autocommand to close "dashboard" buffers when a "dbui" buffer is opened
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "dbui" },
    callback = function()
        close_buffers_by_filetype("dashboard")
    end,
})
