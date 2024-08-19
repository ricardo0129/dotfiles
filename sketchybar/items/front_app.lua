local colors = require("colors")
local settings = require("settings")

-- local app_icons = require("helpers.app_icons")

local front_app = sbar.add("item", "front_app", {
  position = "right",
  display = "active",
  icon = { drawing = false },
  label = {
    padding_right = 50, 
    font = {
      style = settings.font.style_map["Bold"],
    },
  },
  updates = true,
})

front_app:subscribe("front_app_switched", function(env)
  front_app:set({ label = { 
      string = env.INFO 
  } })
end)

front_app:subscribe("mouse.clicked", function(env)
  sbar.trigger("swap_menus_and_spaces")
end)

front_app:subscribe("mouse.entered", function(env)
  front_app:set({
    label = { color = colors.green },
  })
end)

front_app:subscribe("mouse.exited", function(env)
  front_app:set({
    label = { color = colors.white },
  })
end)
