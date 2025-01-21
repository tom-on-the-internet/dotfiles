---@module "lazy"
---@type LazySpec
return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "mikavilpas/blink-ripgrep.nvim",
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
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
        compat = {},
        default = { "lsp", "path", "snippets", "buffer", "ripgrep" },
        cmdline = {},
        providers = {
          ripgrep = {
            module = "blink-ripgrep",
            name = "Ripgrep",
            -- the options below are optional, some default values are shown
            ---@module "blink-ripgrep"
            ---@type blink-ripgrep.Options
            opts = {
              prefix_min_len = 5,
              context_size = 5,
              max_filesize = "100K",
            },
          },
        },
      },
      keymap = {
        preset = "default",
      },
    },
  },
}
