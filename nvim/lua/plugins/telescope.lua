return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        preview = {
          -- do not search huge files
          filesize_limit = 0.1, -- MB
        },
      },
    },
  },
}
