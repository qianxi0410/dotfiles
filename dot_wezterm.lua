-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.font = wezterm.font_with_fallback({
	{ family = "Maple Mono", weight = "Regular" }, -- 英文字体
	"LXGW WenKai", -- 中文字体
})
config.font_size = 15.0
config.harfbuzz_features = { "zero" }

config.color_scheme = "Gruvbox dark, hard (base16)"
config.default_cursor_style = "SteadyUnderline"
config.window_padding = {
	left = 4,
	right = 0,
	top = 4,
	bottom = 0,
}
config.enable_scroll_bar = false
config.enable_tab_bar = false -- i use tmux btw
-- config.window_background_opacity = 0.9 -- 和hyprland一致

-- 关闭bee
config.audible_bell = "Disabled"

-- config.default_prog = { "tmux" }

-- and finally, return the configuration to wezterm
return config