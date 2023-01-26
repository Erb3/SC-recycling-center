if not chatbox.hasCapability("command") or not chatbox.hasCapability("tell") then
	error("Chatbox does not have the required permissions. Did you register the license?")
end

local BOT_NAME = "&6Recycling Center"

while true do
	local event, user, command, args = os.pullEvent("command")

	if command == "recycle" then
		chatbox.tell(user, "&aThe recycling center is a public service that handles all your recycling needs! Just point your enderstorage to the &cred&a/&cred&a/&cred&a frequenzy. Items without NBT are planned to be distributed later on, but this is currently not implemented.", BOT_NAME, nil, "format")
	end
end