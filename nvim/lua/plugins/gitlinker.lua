return {
  {
    "linrongbin16/gitlinker.nvim",
    config = function()
      require("gitlinker").setup({
        mappings = "<leader>gY",
      })
    end,
  },
}
