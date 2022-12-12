-- Register a chat command that prints a welcome message to the player
RegisterCommand("hello", function(source, args, rawCommand)
    -- Get the player's name
    local playerName = GetPlayerName(source)

    -- Print the welcome message to the player's chat
    print(playerName .. " said hello!")
end, false)

-- Register an event that prints a message to the server console when a player joins
AddEventHandler("playerConnecting", function()
    print("A player is joining the server!")
end)
