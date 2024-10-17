local wezterm = require("wezterm")
local padding = 40
local opacity = 1

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.window_background_opacity == 1 then
		overrides.window_background_opacity = opacity
	else
		overrides.window_background_opacity = 1
	end
	window:set_config_overrides(overrides)
end)

return {
	font = wezterm.font({ family = "IBM Plex Mono" }),
	font_size = 22,
	line_height = 1.2,
	window_background_opacity = opacity,
	macos_window_background_blur = 5,
	color_scheme = "Catppuccin Frappe",

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
		{
			key = "B",
			mods = "CTRL",
			action = wezterm.action.EmitEvent("toggle-opacity"),
		},
	},
}
