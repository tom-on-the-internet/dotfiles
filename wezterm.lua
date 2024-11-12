local wezterm = require("wezterm")
local padding = 40

return {
	adjust_window_size_when_changing_font_size = false,
	audible_bell = "Disabled",
	color_scheme = "Tokyo Night",
	enable_tab_bar = false,
	-- font = wezterm.font({ family = "IBM Plex Mono" }),
	-- window_background_opacity = 0.95,
	font_size = 22,
	line_height = 1.3,
	scrollback_lines = 10000,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",

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
		{
			key = "B",
			mods = "CTRL",
			action = wezterm.action.EmitEvent("toggle-opacity"),
		},
	},
}
