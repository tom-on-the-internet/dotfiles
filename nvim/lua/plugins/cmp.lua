-- 🐶
return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
        local cmp = require("cmp")

        local sources = vim.tbl_filter(function(source)
            return source.name ~= "buffer"
        end, opts.sources)

        vim.list_extend(sources, {
            { name = "emoji" },
            {
                name = "buffer",
                option = {
                    get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                    end,
                },
            },
        })

        opts.sources = cmp.config.sources(sources)
    end,
}
