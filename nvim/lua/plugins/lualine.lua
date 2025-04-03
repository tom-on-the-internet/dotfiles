return {
  "nvim-lualine/lualine.nvim",
  opts = {

    theme = "lackluster",
    sections = {
      lualine_z = {
        function()
          return "텀"
        end,
      },
    },
  },
}
