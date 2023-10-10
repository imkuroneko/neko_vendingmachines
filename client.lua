local QBCore = exports['qb-core']:GetCoreObject()

-- ===== Drinks =====================================================================
exports['qb-target']:AddTargetModel(Config.Drinks.props, {
    options = { { type = 'client', event = 'neko_vendingmachine:open:drinks', icon = Config.Drinks.icon, label = Config.Drinks.label } },
    distance = 2.0
})

RegisterNetEvent('neko_vendingmachine:open:drinks')
AddEventHandler('neko_vendingmachine:open:drinks', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() then
            local closestMachine = GetClosestVendingDrinks()
            if closestMachine ~= nil then
                local ShopItems = {}
                ShopItems.label = Config.Drinks.label
                ShopItems.items = Config.Drinks.items
                ShopItems.slots = #Config.Drinks.items
                TriggerServerEvent('inventory:server:OpenInventory', 'shop', Config.Drinks.label..' #'.. math.random(1, 99), ShopItems)
            else
                QBCore.Functions.Notify(Config.OutOfService, "info")
            end
        end
    end)
end)

function GetClosestVendingDrinks()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local object = nil
    for _, machine in pairs(Config.Drinks.props) do
        local ClosestObject = GetClosestObjectOfType(pos.x, pos.y, pos.z, 0.75, GetHashKey(machine), 0, 0, 0)
        if ClosestObject ~= 0 and ClosestObject ~= nil then
            if object == nil then
                object = ClosestObject
            end
        end
    end
    return object
end


-- ===== Snacks =====================================================================
exports['qb-target']:AddTargetModel(Config.Snacks.props, {
    options = { { type = 'client', event = 'neko_vendingmachine:open:snacks', icon = Config.Snacks.icon, label = Config.Snacks.label } },
    distance = 2.0
})

RegisterNetEvent('neko_vendingmachine:open:snacks')
AddEventHandler('neko_vendingmachine:open:snacks', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() then
            local closestMachine = GetClosestVendingFoods()
            if closestMachine ~= nil then
                local ShopItems = {}
                ShopItems.label = Config.Snacks.label
                ShopItems.items = Config.Snacks.items
                ShopItems.slots = #Config.Snacks.items
                TriggerServerEvent('inventory:server:OpenInventory', 'shop', Config.Snacks.label..' #'.. math.random(1, 99), ShopItems)
            else
                QBCore.Functions.Notify(Config.OutOfService, "info")
            end
        end
    end)
end)

function GetClosestVendingFoods()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local object = nil
    for _, machine in pairs(Config.Snacks.props) do
        local ClosestObject = GetClosestObjectOfType(pos.x, pos.y, pos.z, 0.75, GetHashKey(machine), 0, 0, 0)
        if ClosestObject ~= 0 and ClosestObject ~= nil then
            if object == nil then
                object = ClosestObject
            end
        end
    end
    return object
end


-- ===== Coffee =====================================================================
exports['qb-target']:AddTargetModel(Config.Coffee.props, {
    options = { { type = 'client', event = 'neko_vendingmachine:open:coffee', icon = Config.Coffee.icon, label = Config.Coffee.label } },
    distance = 2.0
})

RegisterNetEvent('neko_vendingmachine:open:coffee')
AddEventHandler('neko_vendingmachine:open:coffee', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() then
            local closestMachine = GetClosestVendingCoffee()
            if closestMachine ~= nil then
                local ShopItems = {}
                ShopItems.label = Config.Coffee.label
                ShopItems.items = Config.Coffee.items
                ShopItems.slots = #Config.Coffee.items
                TriggerServerEvent('inventory:server:OpenInventory', 'shop', Config.Coffee.label..' #'.. math.random(1, 99), ShopItems)
            else
                QBCore.Functions.Notify(Config.OutOfService, "info")
            end
        end
    end)
end)

function GetClosestVendingCoffee()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local object = nil
    for _, machine in pairs(Config.Coffee.props) do
        local ClosestObject = GetClosestObjectOfType(pos.x, pos.y, pos.z, 0.75, GetHashKey(machine), 0, 0, 0)
        if ClosestObject ~= 0 and ClosestObject ~= nil then
            if object == nil then
                object = ClosestObject
            end
        end
    end
    return object
end