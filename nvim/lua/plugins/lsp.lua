return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        cssls = {},
        jsonls = {},
        html = {},
        lemminx = {},
        emmet_language_server = {},
        intelephense = {
          init_options = {
            licenceKey = "00G0KD8UUF391H9",
          },
        },
        golangci_lint_ls = {
          init_options = {
            command = {
              "golangci-lint",
              "run",
              "-c",
              "~/.config/nvim/golangci.yml",
            },
          },
        },
      },
      setup = {
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
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
