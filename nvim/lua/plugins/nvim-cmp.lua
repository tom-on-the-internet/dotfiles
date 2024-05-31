return {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
        local cmp = require("cmp")
        opts.preselect = cmp.PreselectMode.None
        opts.completion = { completeopt = "menu,menuone,noinsert,noselect" }

        opts.mapping = cmp.mapping.preset.insert({
            ["<C-n>"] = cmp.mapping.select_next_item({
                behavior = cmp.SelectBehavior.Insert,
            }),
            ["<C-p>"] = cmp.mapping.select_prev_item({
                behavior = cmp.SelectBehavior.Insert,
            }),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<C-y>"] = LazyVim.cmp.confirm({ select = false }),
        })
        opts.experimental = { ghost_text = false }

        -- Setup up vim-dadbod
        -- cmp.setup.filetype({ "sql" }, {
        --     sources = {
        --         { name = "vim-dadbod-completion" },
        --         { name = "buffer" },
        --     },
        -- })
    end,
}
