lib.locale()
local QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory

local PurchasablesItems = {}
for typeMachine, dataMachine in pairs(Config.Machines) do
    PurchasablesItems[typeMachine] = {}
    for itemId, itemCod in pairs(dataMachine.items) do
        PurchasablesItems[typeMachine][itemCod] = dataMachine.price
    end
end

RegisterNetEvent('neko_vendingmachine:server:sellitem', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = PurchasablesItems[data.type][data.item]

    if price ~= nil then
        if Player.Functions.GetMoney('cash') >= price then
            if ox_inventory:CanCarryItem(source, data.item, 1) then
                ox_inventory:RemoveItem(source, 'cash', price)
                ox_inventory:AddItem(source, data.item, 1)
                TriggerClientEvent('ox_lib:notify', src, { description = locale('item_buyed', data.label), type = 'success' })
            end
        else
            TriggerClientEvent('ox_lib:notify', src, { description = locale('not_enough_money'), type = 'error' })
        end
    else
        TriggerClientEvent('ox_lib:notify', src, { description = locale('item_not_found'), type = 'error' })
    end
end)
