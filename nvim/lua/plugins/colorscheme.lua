return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin-mocha",
        },
    },
    -- {
    --     "rebelot/kanagawa.nvim",
    --     config = function()
    --         require("kanagawa").setup({
    --             colors = {
    --                 theme = {
    --                     all = {
    --                         ui = {
    --                             bg_gutter = "none",
    --                         },
    --                     },
    --                 },
    --             },
    --             overrides = function(colors)
    --                 local theme = colors.theme
    --                 return {
    --                     NormalFloat = { bg = "none" },
    --                     FloatBorder = { bg = "none" },
    --                     FloatTitle = { bg = "none" },
    --
    --                     -- Save an hlgroup with dark background and dimmed foreground
    --                     -- so that you can use it where your still want darker windows.
    --                     -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
    --                     NormalDark = {
    --                         fg = theme.ui.fg_dim,
    --                         bg = theme.ui.bg_m3,
    --                     },
    --
    --                     -- Popular plugins that open floats will link to NormalFloat by default;
    --                     -- set their background accordingly if you wish to keep them dark and borderless
    --                     LazyNormal = {
    --                         bg = theme.ui.bg_m3,
    --                         fg = theme.ui.fg_dim,
    --                     },
    --                     MasonNormal = {
    --                         bg = theme.ui.bg_m3,
    --                         fg = theme.ui.fg_dim,
    --                     },
    --                     TelescopeTitle = { fg = theme.ui.special, bold = true },
    --                     TelescopePromptNormal = { bg = theme.ui.bg_p1 },
    --                     TelescopePromptBorder = {
    --                         fg = theme.ui.bg_p1,
    --                         bg = theme.ui.bg_p1,
    --                     },
    --                     TelescopeResultsNormal = {
    --                         fg = theme.ui.fg_dim,
    --                         bg = theme.ui.bg_m1,
    --                     },
    --                     TelescopeResultsBorder = {
    --                         fg = theme.ui.bg_m1,
    --                         bg = theme.ui.bg_m1,
    --                     },
    --                     TelescopePreviewNormal = { bg = theme.ui.bg_dim },
    --                     TelescopePreviewBorder = {
    --                         bg = theme.ui.bg_dim,
    --                         fg = theme.ui.bg_dim,
    --                     },
    --                     Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
    --                     PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
    --                     PmenuSbar = { bg = theme.ui.bg_m1 },
    --                     PmenuThumb = { bg = theme.ui.bg_p2 },
    --                 }
    --             end,
    --         })
    --         vim.cmd("colorscheme kanagawa")
    --     end,
    -- },
    -- {
    --     "gbprod/nord.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("nord").setup({
    --             transparent = true,
    --         })
    --         vim.cmd.colorscheme("nord")
    --     end,
    -- },
    -- {
    --     {
    --         "EdenEast/nightfox.nvim", -- lazy
    --         config = function()
    --             require("nightfox").setup({ options = { transparent = true } })
    --             vim.cmd("colorscheme terafox")
    --         end,
    --     },
    --     {
    --         "rcarriga/nvim-notify",
    --         opts = {
    --             background_colour = "#000000",
    --         },
    --     },
    -- },
    -- {
    --     "folke/tokyonight.nvim",
    --     opts = { style = "moon", transparent = true },
    -- },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
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
