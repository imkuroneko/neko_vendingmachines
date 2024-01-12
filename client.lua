QBCore = exports['qb-core']:GetCoreObject()
ItemsName = {}

if Config.Inventory == 'ox_inventory' then
    for item, data in pairs(exports.ox_inventory:Items()) do
        ItemsName[item] = data.label
    end
end

-- ===== Slushies ===================================================================
exports['qb-target']:AddTargetModel(Config.Slush.props, {
    options = { { type = 'client', event = 'neko_vendingmachine:open:slushies', icon = Config.Slush.icon, label = Config.Slush.label } },
    distance = 2.0
})

RegisterNetEvent('neko_vendingmachine:open:slushies')
AddEventHandler('neko_vendingmachine:open:slushies', function()
    QBCore.Functions.GetPlayerData(function(Player)
        if not Player.metadata["isdead"] and not Player.metadata["inlaststand"] and not Player.metadata["ishandcuffed"] and not IsPauseMenuActive() then
            OpenMachineMenu(Config.Slush)
        end
    end)
end)

-- ===== Drinks =====================================================================
exports['qb-target']:AddTargetModel(Config.Drinks.props, {
    options = { { type = 'client', event = 'neko_vendingmachine:open:drinks', icon = Config.Drinks.icon, label = Config.Drinks.label } },
    distance = 2.0
})

RegisterNetEvent('neko_vendingmachine:open:drinks')
AddEventHandler('neko_vendingmachine:open:drinks', function()
    QBCore.Functions.GetPlayerData(function(Player)
        if not Player.metadata["isdead"] and not Player.metadata["inlaststand"] and not Player.metadata["ishandcuffed"] and not IsPauseMenuActive() then
            local closestMachine = GetClosestProps(Config.Drinks.props)
            if closestMachine ~= nil then
                OpenMachineMenu(Config.Drinks)
            else
                QBCore.Functions.Notify(Config.OutOfService, 'primary')
            end
        end
    end)
end)

-- ===== Snacks =====================================================================
exports['qb-target']:AddTargetModel(Config.Snacks.props, {
    options = { { type = 'client', event = 'neko_vendingmachine:open:snacks', icon = Config.Snacks.icon, label = Config.Snacks.label } },
    distance = 2.0
})

RegisterNetEvent('neko_vendingmachine:open:snacks')
AddEventHandler('neko_vendingmachine:open:snacks', function()
    QBCore.Functions.GetPlayerData(function(Player)
        if not Player.metadata["isdead"] and not Player.metadata["inlaststand"] and not Player.metadata["ishandcuffed"] and not IsPauseMenuActive() then
            local closestMachine = GetClosestProps(Config.Snacks.props)
            if closestMachine ~= nil then
                OpenMachineMenu(Config.Snacks)
            else
                QBCore.Functions.Notify(Config.OutOfService, 'primary')
            end
        end
    end)
end)

-- ===== Coffee =====================================================================
exports['qb-target']:AddTargetModel(Config.Coffee.props, {
    options = { { type = 'client', event = 'neko_vendingmachine:open:coffee', icon = Config.Coffee.icon, label = Config.Coffee.label } },
    distance = 2.0
})

RegisterNetEvent('neko_vendingmachine:open:coffee')
AddEventHandler('neko_vendingmachine:open:coffee', function()
    QBCore.Functions.GetPlayerData(function(Player)
        if not Player.metadata["isdead"] and not Player.metadata["inlaststand"] and not Player.metadata["ishandcuffed"] and not IsPauseMenuActive() then
            local closestMachine = GetClosestProps(Config.Coffee.props)
            if closestMachine ~= nil then
                OpenMachineMenu(Config.Coffee)
            else
                QBCore.Functions.Notify(Config.OutOfService, 'primary')
            end
        end
    end)
end)

-- ===== Funciones ==================================================================
function GetClosestProps(propList)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local object = nil
    for _, machine in pairs(propList) do
        local ClosestObject = GetClosestObjectOfType(pos.x, pos.y, pos.z, 0.75, GetHashKey(machine), 0, 0, 0)
        if ClosestObject ~= 0 and ClosestObject ~= nil then
            if object == nil then
                object = ClosestObject
            end
        end
    end
    return object
end

function OpenMachineMenu(params)
    local menuItems = {}

    table.insert(menuItems, { header = params.label, icon = params.icon, isMenuHeader = true })

    for key, value in pairs(params.items) do
        if Config.Inventory == 'ox_inventory' then
            ItemLabel = ItemsName[value]
        else
            ItemLabel = QBCore.Shared.Items[value:lower()].label
        end

        table.insert(menuItems, {
            header = ItemLabel,
            txt = 'Comprar x1 '..ItemLabel.. ' a $'..params.price,
            params = { event = 'neko_vendingmachine:server:sellitem', args = { item = value, type = params.type, label = ItemLabel } }
        })
    end
    exports['qb-menu']:openMenu(menuItems)
end

RegisterNetEvent('neko_vendingmachine:server:sellitem', function(data)
    TriggerServerEvent('neko_vendingmachine:server:sellitem', data)
end)