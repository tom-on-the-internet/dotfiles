local util = require("conform.util")

return {
  "stevearc/conform.nvim",
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      php = { "pint" },
      go = { "gofumpt", "golines", "goimports", "trim_whitespace" },
      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      _ = { "trim_whitespace" },
    },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2", "-sr", "-s", "-ci" },
      },
      pint = {
        command = util.find_executable({
          "vendor/bin/pint",
        }, "pint"),
        stdin = false,
        args = function()
          local config = vim.fn.findfile("pint.json", ".;")
          return config ~= "" and { "--config", config, "$FILENAME" } or {}
        end,
      },
    },
  },
}
