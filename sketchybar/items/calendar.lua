local settings = require("settings")
local colors = require("colors")
local icons = require("icons")

local cal = sbar.add("item", {
  icon = {
    color = colors.blue,
    padding_left = 10,
    padding_right = 10,
    font = {
      size = 16.0,
    },
  },
  label = {
    padding_right = 10,
    color = colors.blue,
  },
  position = "right",
  update_freq = 180,
})

local clock = sbar.add("item", {
  icon = {
    padding_left = 10,
    padding_right = 10,
    color = colors.yellow,
    font = {
      size = 16.0,
    },
  },
  label = {
    padding_right = 10,
    color = colors.yellow,
  },
  position = "right",
  update_freq = 1,
})

clock:subscribe({ "forced", "routine", "system_woke" }, function(env)
 clock:set({ icon = icons.time.clock, label = os.date("%I:%M %p") })
end)

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
 cal:set({ icon = icons.time.calendar, label = os.date("%a %d %b ")})
end)
