local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local apple = sbar.add("item", {
  icon = {
    string = icons.apple,
    padding_right = 10,
    padding_left  = 5,
  },
  label = { drawing = false },
  click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0"
})

apple:subscribe("mouse.entered", function(env)
    apple:set({
      icon = { color = colors.green },
    })
end)

apple:subscribe("mouse.exited", function(env)
    apple:set({
      icon = { color = colors.white },
    })
end)
