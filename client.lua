lib.locale()
local QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory
local MenuMachines = {}

ItemsName = {}
for item, data in pairs(ox_inventory:Items()) do
    ItemsName[item] = data.label
end

for typeMachine, dataMachine in pairs(Config.Machines) do
    local clientEventTarget = 'neko_vendingmachine:open:'..typeMachine
    -- === Generate qb-targets
    exports['qb-target']:AddTargetModel(dataMachine.props, {
        options = { { typeMachine = 'client', event = clientEventTarget, icon = dataMachine.icon, label = dataMachine.label } },
        distance = Config.QbTargetDistance
    })

    -- === Create menu base
    MenuMachines[typeMachine] = { id = 'vending_machine:'..typeMachine, title = dataMachine.label, options = {} }

    -- === Add items on menu
    for itemId, itemCod in pairs(dataMachine.items) do
        table.insert(MenuMachines[typeMachine].options, {
            title       = ItemsName[itemCod],
            description = locale('option_description', ItemsName[itemCod], dataMachine.price),
            icon        = dataMachine.icon,
            serverEvent = 'neko_vendingmachine:server:sellitem',
            args        = { item = itemCod, type = typeMachine, label = ItemsName[itemCod] }
        })
    end

    lib.registerContext(MenuMachines[typeMachine])

    AddEventHandler(clientEventTarget, function()
        QBCore.Functions.GetPlayerData(function(Player)
            if not Player.metadata["isdead"] and not Player.metadata["inlaststand"] and not Player.metadata["ishandcuffed"] and not IsPauseMenuActive() then
                lib.showContext(MenuMachines[typeMachine].id)
            end
        end)
    end)
end