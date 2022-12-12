function myFirstScript()
  TriggerEvent("chat:addMessage", {
    color = { 255, 0, 0},
    multiline = true,
    args = {"Server", "Welcome to the server!"}
  })
end
