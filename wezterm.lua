local wezterm = require("wezterm")
local padding = 40

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Kanagawa Wave"
	else
		return "Kanagawa Lotus"
	end
end

local is_dark_mode = "false"
if get_appearance():find("Dark") then
	is_dark_mode = "true"
end

return {
	font_size = 22,
	font = wezterm.font("MonoLisa Nerd Font Mono", { weight = "Bold" }),
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, --disable ligatures
	scrollback_lines = 10000,
	enable_tab_bar = false,
	audible_bell = "Disabled",
	line_height = 1.4,
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	color_scheme = scheme_for_appearance(get_appearance()),
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
	color_schemes = {
		["Kanagawa Lotus"] = {
			foreground = "#545464",
			background = "#f2ecbc",

			cursor_bg = "#43436c",
			cursor_fg = "#43436c",
			cursor_border = "#43436c",

			selection_fg = "#43436c",
			selection_bg = "#9fb5c9",

			scrollbar_thumb = "#b5cbd2",
			split = "#b5cbd2",

			ansi = {
				"#1F1F28",
				"#c84053",
				"#6f894e",
				"#77713f",
				"#4d699b",
				"#b35b79",
				"#597b75",
				"#545464",
			},

			brights = {
				"#8a8980",
				"#d7474b",
				"#6e915f",
				"#836f4a",
				"#6693bf",
				"#624c83",
				"#5e857a",
				"#43436c",
			},

			indexed = {
				[16] = "#e98a00", -- extended color 1
				[17] = "#e82424", -- extended color 2
			},

			tab_bar = {
				background = "#e4d794",

				active_tab = {
					bg_color = "#b35b79",
					fg_color = "#e4d794",
				},

				inactive_tab = {
					bg_color = "#a6a69c",
					fg_color = "#e4d794",
				},

				inactive_tab_hover = {
					bg_color = "#9fb5c9",
					fg_color = "#43436c",
					italic = true,
				},

				new_tab = {
					bg_color = "#8a8980",
					fg_color = "#e4d794",
				},

				new_tab_hover = {
					bg_color = "#9fb5c9",
					fg_color = "#43436c",
					italic = true,
				},
			},
		},
		["Kanagawa Wave"] = {
			foreground = "#DCD7BA",
			background = "#1F1F28",

			cursor_bg = "#C8C093",
			cursor_fg = "#C8C093",
			cursor_border = "#C8C093",

			selection_fg = "#DCD7BA",
			selection_bg = "#2D4F67",

			scrollbar_thumb = "#16161D",
			split = "#16161D",

			ansi = {
				"#1a1a22",
				"#C34043",
				"#76946A",
				"#C0A36E",
				"#7E9CD8",
				"#957FB8",
				"#6A9589",
				"#C8C093",
			},

			brights = {
				"#727169",
				"#E82424",
				"#98BB6C",
				"#E6C384",
				"#7FB4CA",
				"#938AA9",
				"#7AA89F",
				"#DCD7BA",
			},

			indexed = {
				[16] = "#FFA066",
				[17] = "#FF5D62",
			},

			tab_bar = {
				background = "#181616",

				active_tab = {
					bg_color = "#957FB8",
					fg_color = "#181616",
				},

				inactive_tab = {
					bg_color = "#a6a69c",
					fg_color = "#181616",
				},

				inactive_tab_hover = {
					bg_color = "#223249",
					fg_color = "#181616",
					italic = true,
				},

				new_tab = {
					bg_color = "#727169",
					fg_color = "#181616",
				},

				new_tab_hover = {
					bg_color = "#223249",
					fg_color = "#181616",
					italic = true,
				},
			},
		},
	},
	set_environment_variables = {
		IS_DARK_MODE = is_dark_mode,
	},
}
