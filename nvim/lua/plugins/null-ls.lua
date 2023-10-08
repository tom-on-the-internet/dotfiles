local cspell_config = {
    find_json = function(cwd)
        return vim.fn.expand("$HOME/.config/nvim/cspell.json")
    end,
}

return {
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            local null_ls = require("null-ls")
            opts.sources = vim.list_extend(opts.sources, {
                -- Order of formatters matters. They are used in order of appearance.
                null_ls.builtins.diagnostics.cspell.with({
                    config = cspell_config,
                    extra_args = {
                        "--config",
                        vim.fn.expand("$HOME/.config/nvim/cspell.json"),
                    },
                    diagnostics_postprocess = function(diagnostic)
                        diagnostic.severity = vim.diagnostic.severity.WARN
                    end,
                }),
                null_ls.builtins.code_actions.cspell.with({
                    config = cspell_config,
                }),
                null_ls.builtins.diagnostics.shellcheck,
                null_ls.builtins.code_actions.shellcheck,
                null_ls.builtins.diagnostics.phpstan.with({
                    method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                    to_temp_file = false,
                }),
                null_ls.builtins.diagnostics.mdl.with({
                    extra_args = { "-r", "~MD005,~MD007,~MD013,~MD026,~MD029" },
                }),

                null_ls.builtins.diagnostics.php,
                null_ls.builtins.formatting.shfmt.with({
                    extra_args = { "-i", "2", "-sr", "-s", "-ci" },
                }),
                null_ls.builtins.formatting.prettierd.with({
                    prefer_local = "node_modules/.bin",
                    filetypes = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "vue",
                        "css",
                        "scss",
                        "less",
                        "html",
                        "json",
                        "php",
                        "yaml",
                        "markdown",
                        "graphql",
                    },
                }),
            })
        end,
    },
}
