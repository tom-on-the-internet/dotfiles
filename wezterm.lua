local wezterm = require("wezterm")
local padding = 40

local function get_appearance()
	-- handle wezterm.gui not being available in a mux server
	if not wezterm.gui then
		return "Dark"
	end

	return wezterm.gui.get_appearance()
end

local function scheme_for_appearance(appearance)
	return "Tokyo Night Moon"
	-- return "carbonfox"
	-- if appearance:find("Dark") then
	--     return "Tokyo Night Moon"
	-- else
	--     return "Tokyo Night Light"
	-- end
end

local is_dark_mode = "false"
if get_appearance():find("Dark") then
	is_dark_mode = "true"
end

return {
	font_size = 22,
	font = wezterm.font("Maple Mono"),
	-- harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, --disable ligatures
	scrollback_lines = 10000,
	enable_tab_bar = false,
	audible_bell = "Disabled",
	-- line_height = 1.0,
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	window_background_opacity = 0.95,
	macos_window_background_blur = 20,
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
	set_environment_variables = {
		IS_DARK_MODE = is_dark_mode,
	},
}
