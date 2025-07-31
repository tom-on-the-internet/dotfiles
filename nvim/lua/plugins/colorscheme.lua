return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
      styles = {
        -- no italic comments.
        comments = {},
      },
    },
  },
  -- turn off italics for comments in tokyonight
  {
    "folke/tokyonight.nvim",
    opts = {
      styles = {
        comments = {
          italic = false,
        },
      },
    },
  },
  { "fcancelinha/nordern.nvim", branch = "master", priority = 1000 },
}
