local wezterm = require("wezterm")
local padding = 40
local opacity = 0.85

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
	font_size = 22,
	line_height = 1.2,
	window_background_opacity = opacity,
	macos_window_background_blur = 5,

	scrollback_lines = 10000,
	enable_tab_bar = false,
	audible_bell = "Disabled",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	colors = {
		foreground = "#ffffff",
		background = "#16181a",

		cursor_bg = "#ffffff",
		cursor_fg = "#16181a",
		cursor_border = "#ffffff",

		selection_fg = "#ffffff",
		selection_bg = "#3c4048",

		scrollbar_thumb = "#16181a",
		split = "#16181a",

		ansi = { "#16181a", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
		brights = { "#3c4048", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
		indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
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
