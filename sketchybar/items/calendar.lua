local settings = require("settings")
local colors = require("colors")
local icons = require("icons")

local clock = sbar.add("item", {
  icon = {
    padding_left = 5,
    padding_right = 5,
    font = {
      --size = 1.0,
    },
  },
  label = {
    padding_right = 5,
    color = colors.cyan,
  },
  position = "right",
  update_freq = 1,
})

clock:subscribe({ "forced", "routine", "system_woke" }, function(env)
 clock:set({ label = "[" .. os.date("%m-%d-%Y %I:%M %p %a") .. "]" })
end)
