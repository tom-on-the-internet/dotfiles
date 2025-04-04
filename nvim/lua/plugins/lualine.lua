return {
  "nvim-lualine/lualine.nvim",
  opts = {

    theme = "vscode",
    sections = {
      lualine_z = {
        function()
          return "텀"
        end,
      },
    },
  },
}
