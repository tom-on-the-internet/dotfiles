return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "ANGkeith/telescope-terraform-doc.nvim",
                config = function()
                    require("telescope").load_extension("terraform_doc")
                end,
            },
            {
                "isak102/telescope-git-file-history.nvim",
                dependencies = { "tpope/vim-fugitive" },
                config = function()
                    require("telescope").load_extension("git_file_history")
                end,
            },
        },
    },
}
