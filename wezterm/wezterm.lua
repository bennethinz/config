local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action

config.window_close_confirmation = "NeverPrompt"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 14.0
config.color_scheme = "Catppuccin Mocha"

-- Remove macOS title bar but keep the traffic light buttons. Also allow the window to be resized
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- So that I can do a backslash with left opt
config.send_composed_key_when_left_alt_is_pressed = true
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

-- config.window_background_opacity = 0.2
-- config.macos_window_background_blur = 40

-- Use the fancy tab bar, and give it the same background as the terminal
-- (Catppuccin Mocha base color), so it blends in seamlessly
config.use_fancy_tab_bar = true
config.window_frame = {
  font = wezterm.font("JetBrainsMono Nerd Font Mono"),
  font_size = 12.0,
  active_titlebar_bg = '#1e1e2e',
  inactive_titlebar_bg = '#1e1e2e',
}

config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = '#1e1e2e',
      fg_color = '#cdd6f4', -- Mocha text color
    },
    inactive_tab = {
      bg_color = '#1e1e2e',
      fg_color = '#6c7086', -- Mocha overlay0, dimmed
    },
    inactive_tab_hover = {
      bg_color = '#1e1e2e',
      fg_color = '#cdd6f4',
      italic = false,
    },
    new_tab = {
      bg_color = '#1e1e2e',
      fg_color = '#6c7086',
    },
    new_tab_hover = {
      bg_color = '#1e1e2e',
      fg_color = '#cdd6f4',
    },
  },
}


-- Add horizontal padding around tab titles
wezterm.on('format-tab-title', function(tab, tabs, panes, conf, hover, max_width)
  local title = tab.active_pane.title
  local padding = '  '
  -- Only truncate if the padded title would exceed the tab's max width
  if #title + 4 > max_width then
    title = wezterm.truncate_right(title, max_width - 4)
  end
  return padding .. title .. padding
end)

config.tab_max_width = 48 -- characters, default is 16

return config
