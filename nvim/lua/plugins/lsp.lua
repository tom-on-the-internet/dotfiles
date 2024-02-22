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
                templ = {},
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
                templ = function()
                    require("lspconfig").templ.setup({})
                end,
                angularls = function()
                    local util = require("lspconfig.util")

                    require("lspconfig").angularls.setup({
                        root_dir = util.root_pattern("angular.json", "nx.json"),
                    })
                    return true
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
        },
    },
}
