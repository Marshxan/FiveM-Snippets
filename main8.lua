RegisterNetEvent('playerConnected')
AddEventHandler('playerConnected', function()
    local player = source
    local name = GetPlayerName(player)

    SendChatMessage(name .. " has joined the server!", "", false)
end
