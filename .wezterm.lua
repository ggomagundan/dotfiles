-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

wezterm.on('gui-startup', function(cmd)
  local tab, neo_pane, window = mux.spawn_window(cmd or {})
  local code_tab, code_pane, code_window = window:spawn_tab(cmd or {})

  window:gui_window():maximize()
  -- Create a split occupying the right 1/3 of the screen
  local ssh_pane = neo_pane:split { size = 0.5,  direction='Bottom' }
  local btm_pane = ssh_pane:split { size = 0.5 }

  local cow_pane = neo_pane:split { size =  0.8 }
  -- Create another split in the right of the remaining 2/3
  -- of the space; the resultant split is in the middle
  -- 1/3 of the display and has the focus.
  local matrix_pane = cow_pane:split { size = 0.55 }
  local clock_pane = neo_pane:split {size = 0.3, direction='Bottom'}

  window:gui_window():maximize()

  ssh_pane:send_text 'echo ssh\n'
  btm_pane:send_text 'btm\n'

  neo_pane:send_text 'neofetch\n'
  clock_pane:send_text 'rsclock -c -S -U -s ▦  -b 0  -f 34\n'
  cow_pane:send_text 'fortune | cowsay -f ~/Documents/rhino.cow  | lolcat\n'
  matrix_pane:send_text 'cmatrix\n'

end)

config.window_close_confirmation = 'AlwaysPrompt'

-- Hide the tab bar if only one tab is open
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font 'FiraCode Nerd Font'


-- config.leader = { key = 'w', mods = 'CTRL' }

config.keys = {
  -- CTRL+SHIFT+Space, followed by 'a' will put us in activate-pane
  -- mode until we press some other key or until 1 second (1000ms)
  -- of time elapses
  {
    key = 'a',
    mods = 'LEADER',
    action = act.ActivateKeyTable {
      name = 'activate_pane',
      timeout_milliseconds = 1000,
    },
  },

  -- You won't see a difference in what is on screen, you just won't
  -- be able to scroll back until you've output more stuff on screen.
  -- This is the default behavior.

  {
    key = 'k',
    mods = 'CMD',
    action = act.ClearScrollback 'ScrollbackOnly',
  },

  -- Clears the scrollback and viewport leaving the prompt line the new first line.
  {
    key = 'k',
    mods = 'CMD',
    action = act.ClearScrollback 'ScrollbackAndViewport',
  },

  -- Clears the scrollback and viewport, and then sends CTRL-L to ask the
  -- shell to redraw its prompt
  {
    key = 'k',
    mods = 'CMD',
    action = act.Multiple {
      act.ClearScrollback 'ScrollbackAndViewport',
      act.SendKey { key = 'L', mods = 'CTRL' },
    },
  },


}

config.key_tables = {

  -- Defines the keys that are active in our activate-pane mode.
  -- 'activate_pane' here corresponds to the name="activate_pane" in
  -- the key assignments above.

  activate_pane = {
    { key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
    { key = 'h', action = act.ActivatePaneDirection 'Left' },

    { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
    { key = 'l', action = act.ActivatePaneDirection 'Right' },

    { key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
    { key = 'k', action = act.ActivatePaneDirection 'Up' },

    { key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
    { key = 'j', action = act.ActivatePaneDirection 'Down' },
  },
}

config.hyperlink_rules = {
    {
        regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",
        format = "$0",
    },
    {
        regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
        format = "$0",
    },
    {
        regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
        format = "mailto:$0",
    },
    {
        regex = [[\bfile://\S*\b]],
        format = "$0",
    },
    {
        regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
        format = "$0",
    },
    {
        regex = [[\b[tT](\d+)\b]],
        format = "https://example.com/tasks/?t=$1",
    },
}


config.window_frame = {
  border_left_width = '0.6cell',
  border_right_width = '0.2cell',
  border_bottom_height = '0.2cell',
  border_top_height = '0.2cell',
  border_left_color = 'purple',
  border_right_color = 'purple',
  border_bottom_color = 'purple',
  border_top_color = 'purple',
}

-- Don't make a sound
config.audible_bell='Disabled'

config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.6,
    hue=1.0,
}


config.background = {
  -- This is the deepest/back-most layer. It will be rendered first
  {
    source = {
      File = '/Users/plutusds/Downloads/planet-volumes.jpg'
    },
    hsb ={

      brightness = 0.05,

      -- You can adjust the hue by scaling its value.
      -- a multiplier of 1.0 leaves the value unchanged.
      hue = 1.3,

      -- You can adjust the saturation also.
      saturation = 0.5,
    },
    opacity = 0.95,
  }
}



-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'GruvboxDarkHard'
-- config.color_scheme = 'Whimsy'
config.color_scheme = 'Tomorrow Night (Gogh)'

-- and finally, return the configuration to wezterm
--
return config
