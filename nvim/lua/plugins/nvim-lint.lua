local cspell = require("lint").linters.cspell
local cspell_json_file = vim.fn.expand("$HOME/.config/nvim/cspell.json")
vim.list_extend(cspell.args, { "--config", cspell_json_file })

return {
    "mfussenegger/nvim-lint",
    opts = {
        linters_by_ft = {
            markdown = { "markdownlint" },
            sh = { "shellcheck" },
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
