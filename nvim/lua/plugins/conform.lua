-- override args
-- can also use a function
require("conform.formatters.shfmt").args = { "-i", "2", "-sr", "-s", "-ci" }

local formatters = {
  ["php"] = { "pint", "prettier" },
  -- ["nu"] = { "nufmt" },
  ["go"] = { "gofumpt", "golines", "goimports", "trim_whitespace" },
  -- Use the "_" filetype to run formatters on filetypes that don't
  -- have other formatters configured.
  ["_"] = { "trim_whitespace" },
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
  end,
}
