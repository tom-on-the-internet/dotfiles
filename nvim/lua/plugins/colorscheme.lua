return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanso",
    },
  },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      colorscheme = "vscode",
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
  { "Mofiqul/vscode.nvim" },
}
