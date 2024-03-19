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
            dependencies = {
                {
                    "isak102/telescope-git-file-history.nvim",
                    dependencies = { "tpope/vim-fugitive" },
                },
            },
        },
    },
}
