--Virtual Garage Script

--Create the virtual garage object and set its properties
local virtualGarage = {
  title = "Virtual Garage",
  currentVehicle = nil,
  vehicles = {
    {
      model = "mesa3",
      spawn = {x = -1250.29, y = -334.96, z = 37.87},
      heading = 31.58
    },
    {
      model = "buzzard2",
      spawn = {x = -1241.9, y = -344.61, z = 37.17},
      heading = 148.12
    }
  }
}

--Function to enter the virtual garage
function enterVirtualGarage()
  --Check if the player is already inside the virtual garage
  if virtualGarage.currentVehicle ~= nil then
    --If the player is already inside, warp them to the vehicle's current location
    SetEntityCoords(GetPlayerPed(-1), virtualGarage.currentVehicle.spawn.x, virtualGarage.currentVehicle.spawn.y, virtualGarage.currentVehicle.spawn.z)
    return
  end

  --Display the virtual garage menu
  local menu = {}
  menu.title = virtualGarage.title
  menu.buttons = {}

  --Add each vehicle in the garage as a menu option
  for _, vehicle in pairs(virtualGarage.vehicles) do
    table.insert(menu.buttons, {
      label = vehicle.model,
      action = function()
        --Spawn the selected vehicle
        local ped = GetPlayerPed(-1)
        local model = GetHashKey(vehicle.model)
        RequestModel(model)
        while not HasModelLoaded(model) do
          Citizen.Wait(0)
        end
        local veh = CreateVehicle(model, vehicle.spawn.x, vehicle.spawn.y, vehicle.spawn.z, vehicle.heading, true, false)
        SetPedIntoVehicle(ped, veh, -1)
        SetEntityAsMissionEntity(veh, true, true)
        virtualGarage.currentVehicle = vehicle
      end
    })
  end

  --Open the menu
  TriggerEvent("vMenu:openMenu", menu)
end

--Bind the enter virtual garage function to the "G" key
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustReleased(0, 47) then --G
      enterVirtualGarage()
    end
  end
end)
