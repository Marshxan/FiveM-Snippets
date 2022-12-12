--ESX
--This script creates a menu that allows the player to spawn vehicles in the game world. The menu has a list of vehicle types that can be spawned, and when the player selects one, the vehicle will be spawned at their current location. The spawned vehicle will have certain default properties, such as its colors and license plate text.

local vehicles = {
    {name="Car", model="car"},
    {name="Truck", model="truck"},
    {name="Motorcycle", model="motorcycle"},
    {name="Bicycle", model="bicycle"},
}

local function showSpawnMenu()
    local elements = {}
    for i, vehicle in ipairs(vehicles) do
        table.insert(elements, {label=vehicle.name, value=vehicle.model})
    end

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_vehicle',
        {
            title    = "Spawn Vehicle",
            align    = 'bottom-right',
            elements = elements
        },
        function(data, menu)
            local model = data.current.value
            ESX.Game.SpawnVehicle(model, {
                x = GetEntityCoords(PlayerPedId()).x,
                y = GetEntityCoords(PlayerPedId()).y,
                z = GetEntityCoords(PlayerPedId()).z
            }, GetEntityHeading(PlayerPedId()), function(vehicle)
                SetVehicleModKit(vehicle, 0)
                SetVehicleColours(vehicle, 0, 0)
                SetVehicleExtraColours(vehicle, 0, 0)
                SetVehicleNumberPlateText(vehicle, "PED")
                SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
            end)
            menu.close()
        end,
        function(data, menu)
            menu.close()
        end
    )
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, Keys['F3']) then
            showSpawnMenu()
        end
    end
end)
