local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local menu_watcher = sbar.add("item", {
  drawing = false,
  updates = false,
})
local space_menu_swap = sbar.add("item", {
  drawing = false,
  updates = true,
})
sbar.add("event", "swap_menus_and_spaces")

local max_items = 15
local menu_items = {}
for i = 1, max_items, 1 do
  local menu = sbar.add("item", "menu." .. i, {
    padding_left = 11,
    drawing = false,
    icon = { drawing = false },
    label = {
      font = {
        style = settings.font.style_map["Bold"],
      },
    },
    click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s " .. i,
  })


  menu_items[i] = menu
menu_items[i]:subscribe("mouse.entered", function(env)
    menu_items[i]:set({
      label = {
        color = colors.orange,
      },
    })
end)

menu:subscribe("mouse.exited", function(env)
    menu:set({
      label = {
        color = colors.white,
      },
    })
end)

end

sbar.add("bracket", { '/menu\\..*/' }, {
})

local menu_padding = sbar.add("item", "menu.padding", {
  drawing = false,
})

local function update_menus(env)
  sbar.exec("$CONFIG_DIR/helpers/menus/bin/menus -l", function(menus)
    sbar.set('/menu\\..*/', { drawing = false })
    menu_padding:set({ drawing = true })
    id = 1
    for menu in string.gmatch(menus, '[^\r\n]+') do
      if id < max_items then
        menu_items[id]:set( { label = menu, drawing = true } )
      else break end
      id = id + 1
    end
  end)
end

menu_watcher:subscribe("front_app_switched", update_menus)

space_menu_swap:subscribe("swap_menus_and_spaces", function(env)
  local drawing = menu_items[1]:query().geometry.drawing == "on"
  if drawing then
    menu_watcher:set( { updates = false })
    sbar.set("/menu\\..*/", { drawing = false })
    sbar.set("/space\\..*/", { drawing = true })
    sbar.set("front_app", { drawing = true })
  else
    menu_watcher:set( { updates = true })
    sbar.set("/space\\..*/", { drawing = false })
    sbar.set("front_app", { drawing = true })
    update_menus()
  end
end)

return menu_watcher
