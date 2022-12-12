--ESX
-- This script creates a shop that allows players to buy items using in-game money. The shop has a list of items that can be purchased, along with their prices. When the player presses the "F2" key, the shop menu will be displayed on their screen. The player can then select an item to purchase, and if they have enough money, the item will be bought and the player will receive a message thanking them for their purchase.
local shopItems = {
    {name="Pizza", price=10},
    {name="Soda", price=5},
    {name="Sandwich", price=15},
    {name="Candy", price=2},
    {name="Chips", price=3},
}

local function showShopMenu()
    local elements = {}
    for i, item in ipairs(shopItems) do
        table.insert(elements, {label=item.name .. " - $" .. item.price, price=item.price})
    end

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop',
        {
            title    = "Shop",
            align    = 'bottom-right',
            elements = elements
        },
        function(data, menu)
            local item = shopItems[data.current.value]
            ESX.UI.Menu.CloseAll()

            if item.price <= ESX.PlayerData.money then
                ESX.TriggerServerCallback('esx_shop:buyItem', function(wasPurchased)
                    if wasPurchased then
                        showMessage("Thanks for your purchase!")
                    else
                        showMessage("You don't have enough money for that!")
                    end
                end, item.name, item.price)
            else
                showMessage("You don't have enough money for that!")
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, Keys['F2']) then
            showShopMenu()
        end
    end
end)
