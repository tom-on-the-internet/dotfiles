local cspell = require("lint").linters.cspell
local cspell_json_file = vim.fn.expand("$HOME/.config/nvim/cspell.json")
vim.list_extend(cspell.args, { "--config", cspell_json_file })

return {
    "mfussenegger/nvim-lint",
    opts = {
        linters_by_ft = {
            css = { "cspell" },
            gitcommit = { "cspell" },
            go = { "cspell" },
            graphql = { "cspell" },
            handlebars = { "cspell" },
            html = { "cspell" },
            javascript = { "cspell" },
            javascriptreact = { "cspell" },
            json = { "cspell" },
            jsonc = { "cspell" },
            less = { "cspell" },
            lua = { "cspell" },
            markdown = { "markdownlint", "cspell" },
            php = { "cspell" },
            ruby = { "cspell" },
            scss = { "cspell" },
            sh = { "shellcheck", "cspell" },
            terraform = { "tflint", "trivy", "cspell" },
            typescript = { "cspell" },
            typescriptreact = { "cspell" },
            vue = { "cspell" },
            yaml = { "cspell" },
        },
        linters = {
            markdownlint = {
                args = {
                    "--disable",
                    "MD005",
                    "MD007",
                    "MD013",
                    "MD026",
                    "MD029",
                    "--",
                },
            },
        },
    },
}
