return {
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            servers = {
                -- temporarily disable ts_ls
                -- lazy will soon do this for me
                ts_ls = {
                    enabled = false,
                },
                denols = {},
                cssls = {},
                jsonls = {},
                html = {},
                emmet_language_server = {},
                intelephense = {
                    init_options = {
                        licenceKey = "00G0KD8UUF391H9",
                    },
                },
                eslint = {},
                golangci_lint_ls = {
                    init_options = {
                        command = {
                            "golangci-lint",
                            "run",
                            "-c",
                            "~/.config/nvim/golangci.yaml",
                        },
                    },
                },
                stylelint_lsp = {},
            },
            setup = {
                stylelint_lsp = function()
                    require("lspconfig").stylelint_lsp.setup({})
                end,
                emmet_language_server = function()
                    require("lspconfig").emmet_language_server.setup({
                        filetypes = {
                            "css",
                            "html",
                            "javascript",
                            "javascriptreact",
                            "less",
                            "sass",
                            "scss",
                            "template",
                            "typescriptreact",
                        },
                    })
                end,
                eslint = function()
                    require("lazyvim.util").lsp.on_attach(function(client)
                        if client.name == "eslint" then
                            client.server_capabilities.documentFormattingProvider =
                                true
                        elseif client.name == "tsserver" then
                            client.server_capabilities.documentFormattingProvider =
                                false
                        end
                    end)
                end,
            },
            inlay_hints = {
                enabled = false,
            },
            document_highlight = {
                enabled = false,
            },
        },
    },
}
