return {
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            servers = {
                angularls = {},
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
                elp = function()
                    require("lspconfig").emmet_language_server.setup({})
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
