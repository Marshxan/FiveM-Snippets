local doorCode = '1234' -- Set the door code here

-- This function is called when the player presses the "E" key
function onKeyPress(key)
  if key == 'E' then
    -- Prompt the player to enter the door code
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 4)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
      Citizen.Wait(0)
    end
    local enteredCode = GetOnscreenKeyboardResult()

    -- Check if the player entered the correct code
    if enteredCode == doorCode then
      -- Open the door if the code is correct
      local player = GetPlayerPed(-1)
      local coords = GetEntityCoords(player)
      local door = GetClosestObjectOfType(coords, 3.0, GetHashKey('prop_door_01'), false, false, false)
      SetEntityRotation(door, 0.0, 0.0, 90.0, 2, true)
      SetEntityCollision(door, false, false)
    else
      -- Display an error message if the code is incorrect
      TriggerEvent('chat:addMessage', { args = { '^1[ERROR]', 'Incorrect door code.' } })
    end
  end
end

-- Register the key press event
Citizen.CreateThread(function()
  while true do
    Wait(0)
    onKeyPress(GetKeyPressed())
  end
end)
