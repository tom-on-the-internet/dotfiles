return {
    {
        "nvim-lualine/lualine.nvim",
        -- opts will be merged with the parent spec
        opts = {
            sections = {
                lualine_z = {
                    function()
                        return "텀"
                    end,
                },
            },
        },
    },
}
