-- This script shows a message on the player's screen when they press the "E" key. The message displayed is "Hello, world!"

local function showMessage(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, Keys['E']) then
            showMessage("Hello, world!")
        end
    end
end)
