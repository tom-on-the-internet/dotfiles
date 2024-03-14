-- override args
-- can also use a function
require("conform.formatters.shfmt").args = { "-i", "2", "-sr", "-s", "-ci" }
require("conform.formatters.sql_formatter").args =
    { "--config", "$HOME/.config/sql-formatter.json" }

return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            ["php"] = { { "prettier" } },
            ["angular"] = { { "prettier" } },
            ["sh"] = { { "shfmt" } },
            ["templ"] = { { "templ" } },
            ["go"] = { "gofumpt", "golines", "goimports", "trim_whitespace" },
            -- ["*"] = { "codespell" },
            -- Use the "_" filetype to run formatters on filetypes that don't
            -- have other formatters configured.
            ["_"] = { "trim_whitespace" },
        },
    },
}
