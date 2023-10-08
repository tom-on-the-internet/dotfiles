return {
    {
        "ruifm/gitlinker.nvim",
        config = function()
            require("gitlinker").setup({ mappings = null })
        end,
    },
}
