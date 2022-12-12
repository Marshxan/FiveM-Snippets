-- This is a simple example script for FiveM
-- It logs a message to the console when the player joins the game

AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
  deferrals.defer()
  deferrals.update('Checking player data...')

  -- Perform any necessary checks here, such as verifying the player's license or whitelist status

  -- Once the checks are complete, we can allow the player to join the game
  deferrals.done()
end)

AddEventHandler('playerDropped', function(reason)
  -- Log a message to the console when a player leaves the game
  print(reason)
end)
