-- create a variable to track the player's score
local playerScore = 0

-- create a function to add to the player's score
function addToScore(points)
    playerScore = playerScore + points
end

-- create an event to run when the player joins the game
AddEventHandler('playerSpawned', function()
    -- display a message to the player
    TriggerEvent('chatMessage', '', {255, 255, 255}, 'Welcome to the game! Your score is: ' .. playerScore)
end)

-- create an event to run when the player presses a key
AddEventHandler('onPlayerKeyPress', function(key)
    if key == 'E' then
        -- add 100 points to the player's score
        addToScore(100)

        -- display a message to the player
        TriggerEvent('chatMessage', '', {255, 255, 255}, 'You pressed E! Your score is now: ' .. playerScore)
    end
end)

-- This script creates a variable to track the player's score, a function to add to the player's score, and two event handlers: one for when the player spawns and one for when the player presses a key. When the player spawns, the script displays their current score. When the player presses the "E" key, the script adds 100 points to their score and displays the updated score.
