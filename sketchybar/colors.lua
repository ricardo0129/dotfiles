
return {
  black=0xff24283b,
  grey = 0xff7f8490,
  white=0xffa9b1d6,
  magenta=0xffbb9af7,
  blue=0xff7aa2f7,
  cyan=0xff7dcfff,
  green=0xff9ece6a,
  yellow=0xffe0af68,
  orange=0xffff9e64,
  red=0xfff7768e,
  bar_color=0xa51a1b26,
  comment=0xff565f89,
  transparent = 0x00000000,

  bar = {
    bg = 0xff24283b,
    border = 0xa51a1b26,
  },
  popup = {
    bg = 0xa51a1b26,
    border = 0xa51a1b26,
  },
  bg1 = 0xff24283b,
  bg2 = 0xff24283b,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
