-- override args
-- can also use a function
require("conform.formatters.shfmt").args = { "-i", "2", "-sr", "-s", "-ci" }

return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            ["php"] = { { "prettier" } },
            ["sh"] = { { "shfmt" } },
            ["go"] = { "gofumpt", "golines", "goimports", "trim_whitespace" },
            ["templ"] = { "templ", "trim_whitespace" },
            ["toml"] = { "taplo" },
            -- ["*"] = { "codespell" },
            -- Use the "_" filetype to run formatters on filetypes that don't
            -- have other formatters configured.
            ["_"] = { "trim_whitespace" },
        },
    },
}
