return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        denols = {},
        cssls = {},
        jsonls = {},
        html = {},
        emmet_language_server = {},
        -- tailwindcss = {
        --   hovers = true,
        --   suggestions = true,
        --   root_dir = function(fname)
        --     local root_pattern =
        --       require("lspconfig").util.root_pattern("tailwind.config.cjs", "tailwind.config.js", "postcss.config.js")
        --     return root_pattern(fname)
        --   end,
        -- },
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
              "~/.config/nvim/golangci.yaml",
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
