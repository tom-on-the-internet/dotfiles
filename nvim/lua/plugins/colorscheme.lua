return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "carbonfox",
        },
    },
    {
        "EdenEast/nightfox.nvim",
        opts = {
            options = {
                -- transparent = true, -- Disable setting background
            },
        },
    },
    {
        "mcchrish/zenbones.nvim",
        dependencies = { "rktjmp/lush.nvim" },
    },
}
