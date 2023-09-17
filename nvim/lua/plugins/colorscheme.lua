return {
  {
    "maxmx03/fluoromachine.nvim",
    config = function()
      local fm = require("fluoromachine")

      fm.setup({
        glow = true,
        theme = "fluoromachine",
        transparent = "full",
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
}
