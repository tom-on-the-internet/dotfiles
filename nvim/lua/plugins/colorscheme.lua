local function setupCarbonfox()
    require("nightfox").setup({
        options = {
            transparent = vim.g.transparent_background,
            styles = {
                comments = "italic",
                keywords = "bold",
                types = "italic,bold",
            },
        },
    })
    vim.cmd.colorscheme("carbonfox")
end

vim.keymap.set("n", "<leader>ct", function()
    vim.g.transparent_background = not vim.g.transparent_background
    setupCarbonfox()
end, { desc = "Toggle transparency" })

return {
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("catppuccin").setup({
    --             flavour = "frappe", -- latte, frappe, macchiato, mocha
    --             transparent_background = true, -- disables setting the background color.
    --             integrations = {
    --                 aerial = true,
    --                 grug_far = true,
    --                 mason = true,
    --                 noice = true,
    --                 notify = true,
    --                 lsp_trouble = true,
    --                 dadbod_ui = true,
    --             },
    --         })
    --         vim.cmd.colorscheme("catppuccin")
    --     end,
    -- },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = setupCarbonfox,
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
