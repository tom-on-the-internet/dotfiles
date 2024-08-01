return {
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "djlint",
                "erb-formatter",
                "golangci-lint-langserver",
                "shellcheck",
                "shfmt",
            })
        end,
    },
}
