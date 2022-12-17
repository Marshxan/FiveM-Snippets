local players = {}

-- This function is called when the resource is started
function start()
  -- Print a message to the console
  print("Hello, FiveM!")
  
  -- Register a network event to be triggered when a player connects to the server
  RegisterNetEvent("playerConnect")
  AddEventHandler("playerConnect", onPlayerConnect)
end

-- This function is called when the resource is stopped
function stop()
  -- Print a message to the console
  print("Goodbye, FiveM!")
  
  -- Unregister the network event
  UnregisterNetEvent("playerConnect")
  RemoveEventHandler("playerConnect", onPlayerConnect)
end

-- This function is called when a player connects to the server
function onPlayerConnect(player)
  -- Print a message to the console
  print("Player " .. player .. " has connected to the server!")
  
  -- Add the player to the list of connected players
  table.insert(players, player)
end

-- This function is called every frame
function onTick()
  -- Loop through all connected players
  for i, player in ipairs(players) do
    -- Check if the player is in a vehicle
    if IsPedInAnyVehicle(player) then
      -- Get the vehicle the player is in
      local vehicle = GetVehiclePedIsIn(player)
      
      -- Check if the vehicle is a police car
      if GetVehicleClass(vehicle) == 18 then
        -- Give the player a police badge
        GiveWeaponToPed(player, GetHashKey("WEAPON_BADGE"), 1, false, true)
      end
    end
  end
end

-- Register the start, stop, and onTick functions to be called when the resource is started or stopped, or every frame, respectively
AddEventHandler("onResourceStart", start)
AddEventHandler("onResourceStop", stop)
Citizen.CreateThread(onTick)


--This script will print "Hello, FiveM!" to the console when the resource is started, and "Goodbye, FiveM!" when the resource is stopped. It will also keep track of all players that are currently connected to the server, and give any player that is in a police car a police badge every frame.
