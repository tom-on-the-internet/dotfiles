return {
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
      {
        "<leader>gl",
        "<cmd>GitLink<cr>",
        desc = "Yank git link",
        mode = { "n", "v" },
      },
      {
        "<leader>gL",
        "<cmd>GitLink!<cr>",
        desc = "Yank git link",
        mode = { "n", "v" },
      },
    },
  },
}
