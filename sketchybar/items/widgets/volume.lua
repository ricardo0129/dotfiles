local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local popup_width = 250

local volume_percent = sbar.add("item", "widgets.volume1", {
  position = "right",
  icon = {
    padding_left = 10,
    color = colors.green,
  },
  label = {
    padding_right = 20,
    color = colors.green,
    font = { 
        family = settings.font.numbers 
    }
  },
  background = {
  },
})


volume_percent:subscribe("volume_change", function(env)
  local volume = tonumber(env.INFO)
  local icon = icons.volume._0
  if volume > 60 then
    icon = icons.volume._100
  elseif volume > 30 then
    icon = icons.volume._66
  elseif volume > 10 then
    icon = icons.volume._33
  elseif volume > 0 then
    icon = icons.volume._10
  end

  local lead = " "
  if volume < 10 then
    lead = " 0"
  end

  volume_percent:set({ icon = icon, label = lead .. volume .. "%" })
end)
