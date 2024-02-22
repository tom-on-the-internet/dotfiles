return {
    {
        "echasnovski/mini.files",
        opts = {
            windows = {
                preview = true,
                width_focus = 30,
                width_preview = 90,
            },
            options = {
                use_as_default_explorer = true,
            },
        },
    },
    {
        "echasnovski/mini.indentscope",
        opts = {
            draw = {
                delay = 0,
                animation = require("mini.indentscope").gen_animation.none(),
            },
        },
    },
}
