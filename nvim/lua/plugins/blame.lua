return {
  {
    "FabijanZulj/blame.nvim",
    lazy = false,
    config = function()
      require("blame").setup({})
      vim.keymap.set("n", "<leader>gx", "<CMD>BlameToggle<CR>", { desc = "Git Blame" })
    end,
    opts = {},
  },
}
