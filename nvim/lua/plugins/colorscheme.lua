return {
  {
    "LazyVim/LazyVim",
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

  { "projekt0n/github-nvim-theme", name = "github-theme" },
  { "tiagovla/tokyodark.nvim" },
  { "navarasu/onedark.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "marko-cerovac/material.nvim" },
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "sainnhe/sonokai" },
  { "AlexvZyl/nordic.nvim" },

  { "Mofiqul/vscode.nvim" },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      -- vim.cmd.colorscheme("lackluster")
      -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
      -- vim.cmd.colorscheme("lackluster-mint")
    end,
  },
}
