local wezterm = require("wezterm")
local padding = 40

return {
	font_size = 16,
	enable_tab_bar = false,
	font = wezterm.font("CaskaydiaCove Nerd Font Mono"),
	line_height = 1.1,
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	color_scheme = "Synthwave Alpha (Gogh)",
	window_background_opacity = 0.93,
	colors = {
		background = "#230735",
		foreground = "8BA7A7",
	},
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
	},
}
