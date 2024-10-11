local wezterm = require("wezterm")
local padding = 40

return {
	font = wezterm.font({ family = "Departure Mono" }),
	font_rules = {
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font({
				family = "VictorMono Nerd Font",
				italic = true,
			}),
		},
	},
	color_scheme = "carbonfox",
	font_size = 22,
	line_height = 1.2,
	window_background_opacity = 0.95,
	macos_window_background_blur = 25,

	scrollback_lines = 10000,
	enable_tab_bar = false,
	audible_bell = "Disabled",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",

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
