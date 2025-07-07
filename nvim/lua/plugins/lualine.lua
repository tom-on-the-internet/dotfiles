return {
  "nvim-lualine/lualine.nvim",
  opts = {
    theme = "catppuccin",
    sections = {
      lualine_x = {
        "codecompanion",
      },
      lualine_z = {
        function()
          return "텀"
        end,
      },
    },
  },
}
