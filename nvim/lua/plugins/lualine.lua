local kanagawa_paper = require("lualine.themes.kanagawa-paper-ink")

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    theme = kanagawa_paper,
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            local mode_map = {
              ["NORMAL"] = "일반",
              ["INSERT"] = "삽입",
              ["VISUAL"] = "시각",
              ["V-LINE"] = "시-줄",
              ["V-BLOCK"] = "시-블럭",
              ["COMMAND"] = "명령",
              ["REPLACE"] = "대체",
            }
            return mode_map[str] or str
          end,
        },
      },
      lualine_b = {
        {
          function()
            local reg = vim.fn.reg_recording()
            return " recording to " .. reg
          end,
          color = "DiagnosticError",
          cond = function()
            return vim.fn.reg_recording() ~= ""
          end,
        },
      },
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
