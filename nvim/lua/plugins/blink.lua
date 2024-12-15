return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          border = "rounded",
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
      sources = {
        -- adding any nvim-cmp sources here will enable them
        -- with blink.compat
        compat = {},
        default = { "lsp", "path", "snippets", "buffer" },
        cmdline = {},
      },
      keymap = {
        preset = "default",
      },
    },
  },
}
