return {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
        local logo = [[
░░░░░░░░░░░░░░  ░░
░░              ░░
░░░░░░░░░░░░░░░░░░
░░              ░░
░░░░░░░░░░░░░░  ░░
                ░░
░░░░░░░░░░░░░░░░░░
░░              ░░
░░░░░░░░░░░░░░░░░░
    ]]

        logo = string.rep("\n", 8) .. logo .. "\n\n"

        local opts = {
            theme = "doom",
            hide = {
                -- this is taken care of by lualine
                -- enabling this messes up the actual laststatus setting after loading a file
                statusline = false,
            },
            config = {
                header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
        { action = 'lua LazyVim.pick()()',   desc = " Code",  icon = " ", key = "c",key_format = ' %s' },
        { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Give Up",   icon = "󰩈 ", key = "q",key_format = ' %s'  },
        },
                footer = {},
            },
        }

        -- open dashboard after closing lazy
        if vim.o.filetype == "lazy" then
            vim.api.nvim_create_autocmd("WinClosed", {
                pattern = tostring(vim.api.nvim_get_current_win()),
                once = true,
                callback = function()
                    vim.schedule(function()
                        vim.api.nvim_exec_autocmds(
                            "UIEnter",
                            { group = "dashboard" }
                        )
                    end)
                end,
            })
        end

        return opts
    end,
}
