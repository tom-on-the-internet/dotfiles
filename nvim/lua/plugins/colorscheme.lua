return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "frappe", -- latte, frappe, macchiato, mocha
                transparent_background = true, -- disables setting the background color.
                integrations = {
                    aerial = true,
                    grug_far = true,
                    mason = true,
                    noice = true,
                    notify = true,
                    lsp_trouble = true,
                    dadbod_ui = true,
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "folke/noice.nvim",
        opts = {
            presets = {
                lsp_doc_border = true,
            },
        },
    },
}
