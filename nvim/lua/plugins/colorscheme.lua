return {
    {
        "sainnhe/gruvbox-material",

        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            -- remove soon
            vim.o.background = "light"

            vim.g.gruvbox_material_enable_italic = true

            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
}
