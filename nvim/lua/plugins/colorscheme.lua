return {
    {
        {
            "EdenEast/nightfox.nvim", -- lazy
            config = function()
                require("nightfox").setup({ options = { transparent = true } })
                vim.cmd("colorscheme terafox")
            end,
        },
        {
            "rcarriga/nvim-notify",
            opts = {
                background_colour = "#000000",
            },
        },
    },
    {
        "folke/tokyonight.nvim",
        opts = { style = "moon", transparent = true },
    },
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- {
    --   "maxmx03/fluoromachine.nvim",
    --   config = function()
    --     local fm = require("fluoromachine")
    --
    --     fm.setup({
    --       glow = true,
    --       theme = "fluoromachine",
    --       transparent = "full",
    --     })
    --   end,
    -- },
    -- {
    --   "rcarriga/nvim-notify",
    --   opts = {
    --     background_colour = "#000000",
    --   },
    -- },
}
