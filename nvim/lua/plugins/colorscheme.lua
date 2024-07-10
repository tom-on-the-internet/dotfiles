return {
    {
        "sainnhe/gruvbox-material",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            if os.getenv("IS_DARK_MODE") == "false" then
                vim.o.background = "light"
            else
                vim.o.background = "dark"
            end

            vim.g.gruvbox_material_enable_italic = true

            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
}
