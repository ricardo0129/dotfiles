local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
-- local app_icons = require("helpers.app_icons")

local spaces = {}
local greek_letters = {"α", "β", "γ", "δ", "ε", "ζ", "η", "θ", "λ"}

for i = 1, 10, 1 do
  local space = sbar.add("space", "space." .. i, {
    space = i,
    icon = {
      font = {
          style = settings.font.style_map["Bold"],
          size = 16.0,
      },
      string = greek_letters[i],
      color = colors.white,
      highlight_color = colors.orange,
    },
    padding_left = 7,
    padding_right = 7,

    -- popup = { background = { border_width = 5, border_color = colors.white} }
  })

  spaces[i] = space

  -- Padding space
  sbar.add("space", "space.padding." .. i, {
    space = i,
    script = "",
    width = settings.group_paddings,
  })

  local space_popup = sbar.add("item", {
    position = "popup." .. space.name,
  })

  space:subscribe("space_change", function(env)
    local selected = env.SELECTED == "true"
    space:set({
      icon = { highlight = selected, },
      label = { highlight = selected },
    })
  end)

  space:subscribe("mouse.clicked", function(env)
    if env.BUTTON == "other" then
      space_popup:set({ background = { image = "space." .. env.SID } })
      space:set({ popup = { drawing = "toggle" } })
    else
      local op = (env.BUTTON == "right") and "--destroy" or "--focus"
      sbar.exec("yabai -m space " .. op .. " " .. env.SID)
    end
  end)

  space:subscribe("mouse.exited", function(_)
    space:set({ popup = { drawing = false } })
  end)
end

local space_window_observer = sbar.add("item", {
  drawing = false,
  updates = true,
})
