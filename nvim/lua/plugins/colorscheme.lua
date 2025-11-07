return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "kanagawa-paper-ink",
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
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa-paper").setup({
        transparent = true,
        diag_background = false,
        styles = {
          comment = { italic = false },
        },
      })
    end,
  },
  -- transparent tokyo night
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
    },
  },
}
