-- hs.loadSpoon("ShiftIt")
-- spoon.ShiftIt:bindHotkeys({})

-- Referer : https://github.com/elliotwaite/hammerspoon-config
-- Remap Tilde key and GraveAccent key
TildeHotkey = hs.hotkey.new('rigthshift', 'escape', function() hs.eventtap.keyStrokes('~') end)
GraveAccentHotkey = hs.hotkey.new(nil, 'home', function() hs.eventtap.keyStrokes('`') end)
TildeHotkey:enable()
GraveAccentHotkey:enable()
