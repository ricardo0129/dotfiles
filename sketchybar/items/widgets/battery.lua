local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local battery = sbar.add("item", "widgets.battery", {
  position = "right",
  label = { 
      padding_right = 10,
      padding_left = 10,
      font = { 
          family = settings.font.numbers 
      },
  },
  icon = {
      padding_left = 10,
  },
  update_freq = 180,
})


battery:subscribe({"routine", "power_source_change", "system_woke"}, function()
  sbar.exec("pmset -g batt", function(batt_info)
    local icon = "!"
    local label = "?"

    local found, _, charge = batt_info:find("(%d+)%%")
    if found then
      charge = tonumber(charge)
      label = charge .. "%"
    end

    local charging, _, _ = batt_info:find("AC Power")

    if charging then
      icon = icons.battery.charging
    else
      if found and charge > 80 then
        icon = icons.battery._100
      elseif found and charge > 60 then
        icon = icons.battery._75
      elseif found and charge > 40 then
        icon = icons.battery._50
      elseif found and charge > 20 then
        icon = icons.battery._25
      else
        icon = icons.battery._0
      end
    end

    local lead = ""
    if found and charge < 10 then
      lead = "0"
    end

    local c = colors.orange

    battery:set({
      icon = {
        string = icon,
        color = c,
      },
      label = { 
          string = lead .. label,
          color = c,
      },
    })
  end)
end)
