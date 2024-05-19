local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  topmost = "window",
  height = 30,
  color = colors.bar.bg,
  notch_width = 400, 
})
