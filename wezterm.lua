local wezterm = require("wezterm")
local padding = 40

return {
	adjust_window_size_when_changing_font_size = false,
	audible_bell = "Disabled",
	-- color_scheme = "Catppuccin Mocha",
	color_scheme = "Night Owl (Gogh)",
	enable_tab_bar = false,
	-- font = wezterm.font({ family = "IBM Plex Mono" }),
	font = wezterm.font({ family = "Berkeley Mono" }),
	font_size = 18,
	line_height = 1.2,
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
