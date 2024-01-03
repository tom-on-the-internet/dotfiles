return {
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                path_display = { "truncate" },
            },
            pickers = {
                buffers = {
                    mappings = {
                        i = {
                            ["<c-d>"] = "delete_buffer", -- delete buffer
                        },
                    },
                },
            },
        },
    },
}
