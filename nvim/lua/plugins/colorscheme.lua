return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "neobones",
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
