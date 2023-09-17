return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
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
    },
  },
}
