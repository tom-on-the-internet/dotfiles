return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        angularls = {},
        intelephense = { init_options = {
          licenceKey = "00G0KD8UUF391H9",
        } },
        eslint = {},
        -- TODO: Find a better way of doing this.
        golangci_lint_ls = {
          init_options = {
            command = {
              "golangci-lint",
              "run",
              "-c",
              "~/.config/golangci/golangci.yaml",
            },
          },
        },
      },
      setup = {
        angularls = function()
          local util = require("lspconfig.util")

          require("lspconfig").angularls.setup({
            root_dir = util.root_pattern("angular.json", "nx.json"),
          })
          return true
        end,
        eslint = function()
          require("lazyvim.util").on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
