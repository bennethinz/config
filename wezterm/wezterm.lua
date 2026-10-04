local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action

opacity = 0.2
config.window_close_confirmation = "NeverPrompt"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 14.0
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- So that opt + arrow keys work in tmux
config.keys = {
  { key = 'LeftArrow',  mods = 'OPT', action = act.SendKey { key = 'b', mods = 'ALT' } },
  { key = 'RightArrow', mods = 'OPT', action = act.SendKey { key = 'f', mods = 'ALT' } },
}

config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '1cell',
  bottom = '1cell',
}

config.window_background_opacity = 0.2
config.macos_window_background_blur = 40
config.use_fancy_tab_bar = false

-- Transparent tab bar colors configuration
config.colors = {
  foreground = 'rgba(255, 255, 255, 1)',
  cursor_bg = '#BEF8E6',
  cursor_border = '#BEF8E6',
  tab_bar = {
    background = 'rgba(0, 0, 0, 0.2)',

    active_tab = {
      bg_color = string.format('rgba(0, 0, 0, %s)', opacity),
      fg_color = '#F38BA8',
      underline = 'None',
      intensity = 'Normal',
    },

    inactive_tab = {
      bg_color = string.format('rgba(0, 0, 0, %s)', opacity),
      fg_color = '#7f7f88',
    },

    inactive_tab_hover = {
      bg_color = string.format('rgba(0, 0, 0, %s)', opacity),
      fg_color = '#ffffff',
      italic = false,
    },
    new_tab = {
      bg_color = string.format('rgba(0, 0, 0, %s)', opacity),
      fg_color = '#7f7f88',
    },

    new_tab_hover = {
      bg_color = string.format('rgba(0, 0, 0, %s)', opacity),
      fg_color = '#ffffff',
    },
  },
}


return config
