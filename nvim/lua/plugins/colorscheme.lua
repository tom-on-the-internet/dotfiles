return {
  {
    "LazyVim/LazyVim",
    opts = {},
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
      -- vim.cmd("colorscheme kanagawa-paper-ink")
    end,
  },
  {
    "oskarnurm/koda.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("koda").setup({ transparent = true })
      -- vim.cmd("colorscheme koda")
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({ transparent = true, italic_comments = true, borderless_pickers = true })
      vim.cmd("colorscheme cyberdream")
    end,
  },
}
