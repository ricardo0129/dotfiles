local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local weather = sbar.add("item", "widgets.weather", {
  position = "right",
  label = { 
      padding_right = 10,
      padding_left = 10,
      color = colors.cyan,
      font = { 
          family = settings.font.numbers 
      },
  },
  icon = {
      padding_left = 10,
      color = colors.cyan,
  },
  update_freq = 1800,
})


weather:subscribe({ "forced", "routine", "system_woke" }, function(env)
  sbar.exec("sh /Users/ricky/.config/sketchybar/items/widgets/run.sh", function(res)
    weather:set({
      label = { 
          string = res,
      },
    })
  end)
end)
