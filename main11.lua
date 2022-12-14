if QBCore.Shared.SplitStr(fromItemData.name, "_")[1] == "weapon" and toSlot == Config.MaxInventorySlots then
    QBCore.Functions.Notify(source, 'You cannot store weapons in your 6th slot!', 'error', 7500)
    TriggerClientEvent("qb-inventory:client:closeinv", source)
    return
end
-- LUNA/QBCORE
-- Makes it so u cant put weapons in ur last slot for ur inventory as people cant steal stuff from it!
