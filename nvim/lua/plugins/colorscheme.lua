return {
    {
        "EdenEast/nightfox.nvim",
        config = function()
            require("nightfox").setup({
                options = {
                    transparent = true,
                    styles = {
                        comments = "italic",
                        keywords = "bold",
                        types = "italic,bold",
                    },
                },
            })
            -- vim.cmd.colorscheme("carbonfox")
        end,
    },
    {
        "tokyonight.nvim",
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
    {
        "sainnhe/gruvbox-material",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            if os.getenv("IS_DARK_MODE") == "false" then
                vim.o.background = "light"
            else
                vim.o.background = "dark"
            end

            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_transparent_background = true
            -- vim.cmd.colorscheme("gruvbox-material")
        end,
    },
}
