return {
  {
    "lionyxml/gitlineage.nvim",
    dependencies = {
      "sindrets/diffview.nvim", -- optional, for open_diff feature
    },
    config = function()
      require("gitlineage").setup({
        keymap = "<leader>gv",
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
}
