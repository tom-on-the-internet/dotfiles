return {
  "nvim-lualine/lualine.nvim",
  opts = {
    theme = "catppuccin",
    sections = {
      lualine_z = {
        function()
          return "텀"
        end,
      },
    },
  },
}
