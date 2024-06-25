return {
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "shellcheck",
                "shfmt",
                "golangci-lint-langserver",
                "erb-formatter",
            })
        end,
    },
}
