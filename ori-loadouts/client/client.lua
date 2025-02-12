local options = {}

for key, value in pairs(Config.DevLoadouts) do
    options[#options + 1] = {
        title = key,
        description = string.format('%s Loadout', key),
        onSelect = function()
            TriggerServerEvent('ori:server:collectLoadout', key)
        end,
        metadata = {},
    }

    for _, item in pairs(value) do
        table.insert(options[#options].metadata, {
            label = item.name,
            value = string.format("%dx Quantity", item.amount)
        })
    end
end

RegisterNetEvent('ori:client:showMenu', function()
    lib.showContext('devloadouts')
end)

local context = {
    id = 'devloadouts',
    title = 'Get Loadouts',
    options = options
}

lib.registerContext(context)

local function spawnPed()
    RequestModel(Config.PedModel)
    while not HasModelLoaded(Config.PedModel) do
        Wait(100)
    end

    local ped = CreatePed(4, GetHashKey(Config.PedModel), Config.PedCoords.x, Config.PedCoords.y, Config.PedCoords.z - 1.0, Config.PedHeading, false, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)

    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
                type = "client",
                event = "ori:client:showMenu",
                icon = "fa-solid fa-gun",
                label = "Open Loadout Menu",
            }
        },
        distance = 2.5
    })
end

CreateThread(function()
    Wait(1000)
    spawnPed()
end)
