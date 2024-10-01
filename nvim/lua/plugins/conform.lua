-- override args
-- can also use a function
require("conform.formatters.shfmt").args = { "-i", "2", "-sr", "-s", "-ci" }

local formatters = {
    ["php"] = { "pint", "prettier" },
    -- ["php"] = { "prettier" },
    ["template"] = { "djlint" },
    ["sql"] = { "sqlfluff", "trim_whitespace" },
    ["sqlite"] = { "sqlfluff" },
    ["mysql"] = { "sqlfluff" },
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

        -- all of this is to ensure prettier runs on php files
        opts.formatters = opts.formatters or {}
        if opts.formatters.prettier and opts.formatters.prettier.condition then
            local condition = opts.formatters.prettier.condition
            opts.formatters.prettier.condition = function(_, ctx)
                local ft = vim.bo[ctx.buf].filetype --[[@as string]]
                if ft == "php" then
                    return true
                end
                return condition(_, ctx)
            end
        end
    end,
}
