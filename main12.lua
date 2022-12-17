-- This function is called when the resource is started
function start()
  -- Print a message to the console
  print("Hello, FiveM!")
end

-- This function is called when the resource is stopped
function stop()
  -- Print a message to the console
  print("Goodbye, FiveM!")
end

-- Register the start and stop functions to be called when the resource is started or stopped
AddEventHandler("onResourceStart", start)
AddEventHandler("onResourceStop", stop)


-- This script will print "Hello, FiveM!" to the console when the resource is started, and "Goodbye, FiveM!" when the resource is stopped.
