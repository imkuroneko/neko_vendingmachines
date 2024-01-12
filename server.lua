QBCore = exports['qb-core']:GetCoreObject()

local PurchasablesItems = {
    ['drinks'] = {},
    ['snacks'] = {},
    ['coffee'] = {},
    ['slush'] = {},
}

for key, value in pairs(Config.Drinks.items) do
    PurchasablesItems['drinks'][value] = Config.Drinks.price
end
for key, value in pairs(Config.Snacks.items) do
    PurchasablesItems['snacks'][value] = Config.Snacks.price
end
for key, value in pairs(Config.Coffee.items) do
    PurchasablesItems['coffee'][value] = Config.Coffee.price
end
for key, value in pairs(Config.Slush.items) do
    PurchasablesItems['slush'][value] = Config.Slush.price
end


RegisterNetEvent('neko_vendingmachine:server:sellitem', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = PurchasablesItems[data.type][data.item]

    if price ~= nil then

        if Player.Functions.GetMoney('cash') >= price then
            if Player.Functions.AddItem(data.item, 1) then
                Player.Functions.RemoveMoney('cash', price)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.item], 'add')
                TriggerClientEvent('QBCore:Notify', src, 'Has comprado x1 '..data.label, 'success')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'No tienes suficiente en efectivo', 'error')
        end

    else
        TriggerClientEvent('QBCore:Notify', src, 'No se ha encontrado este artículo en la máquina expendedora', 'error')
    end
end)
