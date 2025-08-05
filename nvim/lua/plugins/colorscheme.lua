return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-paper-ink",
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
        diag_background = false,
        styles = {
          comment = { italic = false },
        },
      })
    end,
  },
}
