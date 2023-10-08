return {
    {
        "rgroli/other.nvim",
        config = function()
            require("other-nvim").setup({
                mappings = {
                    {
                        pattern = "/app/Modules/(.*)/(.*).php$",
                        target = "/tests/Modules/%1/%2Test.php",
                    },
                    {
                        pattern = "/tests/Modules/(.*)/(.*)Test.php$",
                        target = "/app/Modules/%1/%2.php",
                    },
                },
            })
        end,
    },
}
