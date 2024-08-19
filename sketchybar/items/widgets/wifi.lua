local colors = require("colors")
local icons = require("icons")
--[[
sbar.exec("/Users/ricky/.config/sketchybar/c_utils/ispeed/bin/network_load")
local color = colors.cyan

local wifi_up = sbar.add("item", "widgets.wifi1", {
  position = "right",
  icon = {
    font = {
    },
    string = icons.wifi.upload,
    color = color,
  },
  label = {
    font = {
    },
    string = "??? Bps",
    padding_right = 5,
    color = color,
  },
})

local wifi_down = sbar.add("item", "widgets.wifi2", {
  position = "right",
  icon = {
    font = {
    },
    color = colors.cyan,
    string = icons.wifi.download,
  },
  label = {
    font = {
    },
    string = "??? Bps",
    padding_right = 5,
    color = colors.cyan,
  },
})

wifi_up:subscribe("network_update", function(env)
  local up_color = (env.upload == "000 Bps") and colors.grey or colors.red
  local down_color = (env.download == "000 Bps") and colors.grey or colors.blue
  wifi_up:set({
    label = {
      string = env.upload,
      color = color 
    }
  })
  wifi_down:set({
    label = {
      string = env.download,
      color = color 
    }
  })
end)
]]--
