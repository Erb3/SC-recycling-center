local red = {}
local success, hook

if settings.get("recycling.webhook") ~= nil then
  local discohook = require("DiscordHook")
  success, hook = discohook.createWebhook(settings.get("recycling.webhook"))
  if not success then
    error("Invalid Discord webhook")
  end
end

function red.dump(chest, turtleID)

  print("Emptying")

  local list = chest.list()
  local didTransfer = false
  local foundWarning = false

  for slot, data in pairs(chest.list()) do
    if not (data.name == "sc-peripherals:print" and chest.getItemDetail(slot, true).displayName == "§cWARNING! DO NOT PUT ANYTHING IN HERE!") then
      chest.pushItems(turtleID, slot)
      print("Pushing to turtle. Slot: " .. slot)
      didTransfer = true
    else
      foundWarning = true
    end
  end

  if not foundWarning then
    if not fs.exists("/webhook.txt") then
      if settings.get("recycling.webhook") ~= nil then
        hook.sendEmbed("", "Recycling Center Warning", "<@943537773586026496> \n Somebody stole the warning from the red-red-red recycling enderchest! Remember to remove webhook.txt.", nil, 16750744, nil, nil, nil, "https://img.freepik.com/premium-vector/recycled-bin-cartoon-vector-illustration-isolated-object_311865-10193.jpg")
      end

      local f = fs.open("webhook.txt", "w")
      f.write("Y")
      f.close()
    end
  end

  if didTransfer then
    local droppedStuff = true
    for slot=1,16 do
      turtle.select(slot)
      if turtle.dropDown() == false then
        break
      end
    end
  else
    print("No transfer done")
  end
end

return red