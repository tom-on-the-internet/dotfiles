return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {
          function()
            return "텀"
          end,
        },
      },
    },
  },
}
