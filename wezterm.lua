local wezterm = require("wezterm")
local padding = 20

return {
    font_size = 22,
    font = wezterm.font("Liga SFMono Nerd Font"),
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, --disable ligatures
    scrollback_lines = 10000,
    enable_tab_bar = false,
    audible_bell = "Disabled",
    line_height = 1.2,
    adjust_window_size_when_changing_font_size = false,
    window_decorations = "RESIZE",
    window_close_confirmation = "NeverPrompt",
    color_scheme = "carbonfox",
    window_padding = {
        left = padding,
        right = padding,
        top = padding,
        bottom = padding,
    },
    keys = {
        {
            key = "U",
            mods = "CTRL|SHIFT",
            action = wezterm.action({
                QuickSelectArgs = {
                    patterns = {
                        "https?://\\S+",
                    },
                    action = wezterm.action_callback(function(window, pane)
                        local url = window:get_selection_text_for_pane(pane)
                        wezterm.log_info("opening: " .. url)
                        wezterm.open_with(url)
                    end),
                },
            }),
        },
        {
            key = "w",
            mods = "CMD",
            action = wezterm.action.CloseCurrentTab({ confirm = false }),
        },
    },
}
