local util = require("conform.util")

local formatters = {
  ["php"] = { "prettier", "pint" },
  ["go"] = { "gofumpt", "golines", "goimports", "trim_whitespace" },
  -- Use the "_" filetype to run formatters on filetypes that don't
  -- have other formatters configured.
  ["_"] = { "trim_whitespace", lsp_format = "prefer" },
}

return {
  "stevearc/conform.nvim",
  ---@param opts ConformOpts
  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    for k, v in pairs(formatters) do
      opts.formatters_by_ft[k] = v
    end

    opts.formatters = opts.formatters or {}
    if opts.formatters.prettier and opts.formatters.prettier.condition then
      local condition = opts.formatters.prettier.condition
      opts.formatters.prettier.condition = function(_, ctx)
        -- ensure prettier runs on php files
        local ft = vim.bo[ctx.buf].filetype --[[@as string]]
        if ft == "php" then
          return true
        end

        -- ensure prettier does not run in deno
        if require("lspconfig").util.root_pattern("deno.json", "deno.jsonc")(vim.fn.getcwd()) then
          return false
        end
        return condition(_, ctx)
      end
    end
    -- Customize formatters
    -- shfmt
    opts.formatters.shfmt = opts.formatters.shfmt or {}
    opts.formatters.shfmt.prepend_args = opts.formatters.shfmt.prepend_args or { "-i", "2", "-sr", "-s", "-ci" }

    --  pint
    opts.formatters.pint = opts.formatters.pint or {}
    opts.formatters.pint.command = util.find_executable({
      "vendor/bin/pint",
    }, "pint")
    opts.formatters.pint.stdin = false
    opts.formatters.pint.args = function()
      local config = vim.fn.findfile("pint.json", ".;")
      return config ~= "" and { "--config", config, "$FILENAME" } or {}
    end
  end,
}

-- return {
--   "stevearc/conform.nvim",
--   -- This will provide type hinting with LuaLS
--   ---@module "conform"
--   ---@type conform.setupOpts
--   opts = {
--     -- Define your formatters
--     formatters_by_ft = {
--       php = { "pint" },
--       go = { "gofumpt", "golines", "goimports", "trim_whitespace" },
--       -- Use the "_" filetype to run formatters on filetypes that don't
--       -- have other formatters configured.
--       ["_"] = { "trim_whitespace", lsp_format = "prefer" },
--     },
--     -- Customize formatters
--     formatters = {
--       shfmt = {
--         prepend_args = { "-i", "2", "-sr", "-s", "-ci" },
--       },
--       pint = {
--         command = util.find_executable({
--           "vendor/bin/pint",
--         }, "pint"),
--         stdin = false,
--         args = function()
--           local config = vim.fn.findfile("pint.json", ".;")
--           return config ~= "" and { "--config", config, "$FILENAME" } or {}
--         end,
--       },
--     },
--   },
-- }
