return {
  {
    "rgroli/other.nvim",
    config = function()
      require("other-nvim").setup({
        mappings = {
          "angular",
          "laravel",
          "rails",
          "golang",
        },
      })
    end,
  },
}
