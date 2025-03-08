return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          { section = "header" },
          { section = "keys", padding = 0, align = "center" },
        },
        preset = {
          keys = {
            {
              icon = "",
              key = "c",
              desc = "Code",
              action = ":lua Snacks.dashboard.pick('files')",
              text = "   Code",
            },
            {
              icon = "󰩈",
              key = "q",
              desc = "Give Up",
              action = ":qa",
              text = "󰩈   Quit",
            },
          },
          header = [[
░░░░░░░░░░░░░░  ░░
░░              ░░
░░░░░░░░░░░░░░░░░░
░░              ░░
░░░░░░░░░░░░░░  ░░
                ░░
░░░░░░░░░░░░░░░░░░
░░              ░░
░░░░░░░░░░░░░░░░░░
]],
        },
      },
      -- too slow
      scroll = {
        enabled = false,
      },
      indent = {
        enabled = false,
      },
      picker = {
        source = "files",
        win = {
          input = {
            keys = {
              ["<a-u>"] = { "toggle_hidden", mode = { "i", "n" } },
            },
          },
        },
      },
    },
  },
}
