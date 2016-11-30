-- via.
--   http://qiita.com/deg84/items/792bf6b2adf467df9bdc
--   https://github.com/naoya/hammerspoon-init/blob/f5246e/init.lua

local function keyCode(key, modifiers)
   modifiers = modifiers or {}
   return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(100)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()      
   end
end

local function keyCodeSet(keys)
   return function()
      for i, keyEvent in ipairs(keys) do
         keyEvent()
      end
   end
end

local function remapKey(modifiers, key, keyCode)
   hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

local function disableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:disable()
   end
end

local function enableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:enable()
   end
end

local function handleGlobalAppEvent(name, event, app)
   if event == hs.application.watcher.activated then
      -- hs.alert.show(name)
      if name == "iTerm2" then
         disableAllHotkeys()         
      else
         enableAllHotkeys()
      end
   end
end


-- カーソル移動

remapKey({'alt'}, 'h', keyCode('left'))
remapKey({'alt'}, 'j', keyCode('down'))
remapKey({'alt'}, 'k', keyCode('up'))
remapKey({'alt'}, 'l', keyCode('right'))

