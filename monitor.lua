local bf = require("bigfont")
local mon = peripheral.wrap("monitor_311")
local w, h = mon.getSize()

mon.clear()
mon.setTextColor(colors.white)
mon.setBackgroundColor(colors.black)
mon.setCursorPos(1,1)
bf.writeOn(mon, 1, "Recycling Center", 2, 2)

mon.setCursorPos(2, math.floor(h / 2))
mon.write("Run ")
mon.setTextColor(colors.orange)
mon.write("\\recycle")
mon.setTextColor(colors.white)
mon.write(" for more info.")

mon.setCursorPos(2, math.floor(h / 2) + 1)
mon.write("Operated by the Recycling Foundation.")