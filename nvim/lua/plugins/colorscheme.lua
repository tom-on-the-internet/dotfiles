return {
    {
        "rebelot/kanagawa.nvim",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none",
                            },
                        },
                    },
                },
            })

            -- remove soon
            vim.o.background = "light"

            vim.cmd.colorscheme("kanagawa")
        end,
    },
}
