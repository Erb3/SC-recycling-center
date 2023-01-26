local strict = require "strictTrash"
local red = peripheral.wrap "red-red-red"
local self = "turtle_367"

while true do
  print("Clearing red-red-red")
  red.dump(strictChest, self)

  print("Sleeping")
  sleep(5)
end
