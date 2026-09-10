-- ~/.wezterm.lua
local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- Helper: check if executable exists in Windows PATH
local function exe_exists(name)
  local ok, _stdout, _stderr = wezterm.run_child_process { 'where', name }
  return ok
end

-- Keybindings
config.leader = { key='a', mods='CTRL', timeout_milliseconds=1000 }
local keys = {
  -- Split panes (inherit current domain)
  { key='\\', mods='LEADER|SHIFT', action=act.SplitHorizontal{domain='CurrentPaneDomain'} },
  { key='-', mods='LEADER', action=act.SplitVertical{domain='CurrentPaneDomain'} },
  -- Focus panes
  { key='h', mods='LEADER', action=act.ActivatePaneDirection('Left') },
  { key='j', mods='LEADER', action=act.ActivatePaneDirection('Down') },
  { key='k', mods='LEADER', action=act.ActivatePaneDirection('Up') },
  { key='l', mods='LEADER', action=act.ActivatePaneDirection('Right') },

  { key='c', mods='LEADER', action=act.SpawnTab('CurrentPaneDomain') },
  { key='q', mods='LEADER', action=act.CloseCurrentPane{confirm=true} },

  -- Other modes
  { key='s', mods='LEADER', action=act.ShowLauncherArgs{flags='DOMAINS|WORKSPACES'} },
  { key='v', mods='LEADER', action=act.ActivateCopyMode },
  { key='r', mods='LEADER', action=act.ReloadConfiguration },
}

-- Tab switching
for i = 1, 9 do
  table.insert(keys, {
    key = tostring(i), mods = 'ALT', action = act.ActivateTab(i - 1),
  })
end
table.insert(keys, { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) })
table.insert(keys, { key = 'Tab', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) })

config.keys = keys

-- Appearance
config.font = wezterm.font('CaskaydiaCove Nerd Font Mono')
config.font_size = 10
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.default_prog = { 'pwsh.exe' }
config.initial_cols = 120 
config.initial_rows = 28 
config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
return config
