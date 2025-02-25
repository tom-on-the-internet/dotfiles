local wezterm = require("wezterm")
local padding = 40

return {
	adjust_window_size_when_changing_font_size = false,
	audible_bell = "Disabled",
	-- color_scheme = "Catppuccin Mocha",
	color_scheme = "kanagawabones",
	-- color_scheme = "Kanagawa Dragon (Gogh)",
	enable_tab_bar = false,
	-- font = wezterm.font({ family = "IBM Plex Mono" }),
	font = wezterm.font({ family = "Berkeley Mono" }),
	font_size = 18,
	line_height = 1.2,
	scrollback_lines = 10000,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	max_fps = 120,

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
	--dragon
	force_reverse_video_cursor = true,
	colors = {
		foreground = "#c5c9c5",
		background = "#181616",

		cursor_bg = "#C8C093",
		cursor_fg = "#C8C093",
		cursor_border = "#C8C093",

		selection_fg = "#C8C093",
		selection_bg = "#2D4F67",

		scrollbar_thumb = "#16161D",
		split = "#16161D",

		ansi = {
			"#0D0C0C",
			"#C4746E",
			"#8A9A7B",
			"#C4B28A",
			"#8BA4B0",
			"#A292A3",
			"#8EA4A2",
			"#C8C093",
		},
		brights = {
			"#A6A69C",
			"#E46876",
			"#87A987",
			"#E6C384",
			"#7FB4CA",
			"#938AA9",
			"#7AA89F",
			"#C5C9C5",
		},
	},
}
