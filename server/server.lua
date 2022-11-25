local QBCore = exports['qb-core']:GetCoreObject()

-- Usabel Items
-- Turbo
QBCore.Functions.CreateUseableItem("turbo" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 18, true, item.name)
    end
end)
-- Engines
QBCore.Functions.CreateUseableItem("engine_0" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 11, 0, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("engine_1" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 11, 1, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("engine_2" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 11, 2, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("engine_3" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 11, 3, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("engine_4" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 11, 4, item.name)
    end
end)
-- Brakes
QBCore.Functions.CreateUseableItem("brakes_1" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 12, 0, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("brakes_2" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 12, 1, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("brakes_3" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 12, 2, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("brakes_4" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 12, 3, item.name)
    end
end)
-- Transmision
QBCore.Functions.CreateUseableItem("transmision_1" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 13, 0, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("transmision_2" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 13, 1, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("transmision_3" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 13, 2, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("transmision_4" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 13, 3, item.name)
    end
end)
-- Suspension
QBCore.Functions.CreateUseableItem("suspension_0" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 15, 0, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("suspension_1" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 15, 1, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("suspension_2" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 15, 2, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("suspension_3" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 15, 3, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("suspension_4" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("moditems:client:installMod", source, 15, 4, item.name)
    end
end)

-- Callbacks
QBCore.Functions.CreateCallback('moditems:removeItem', function(source, cb, item, itemback)
    if item then
        local src = source
        if itemback then
            local add = exports["qb-inventory"]:AddItem(source, itemback, 1)
            if add then
                TriggerClientEvent('QBCore:Notify', src, Lang:t('text.recoverpart'), "success")                
            end
        end
        local remove = exports["qb-inventory"]:RemoveItem(src, item, 1)
        if remove then
            cb(true)
        else
            cb(false)
        end
    end
end)