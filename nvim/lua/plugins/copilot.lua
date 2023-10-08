return {
    {
        enabled = true,
        "zbirenbaum/copilot.lua",
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = false,
                keymap = {
                    accept = "<M-o>",
                    accept_word = false,
                    accept_line = false,
                    prev = false,
                    next = false,
                    dismiss = false,
                },
            },
            panel = { enabled = false },
        },
    },
}
