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
    title = 'Get yourself loadouts',
    options = options
}

lib.registerContext(context)

local function loadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end
end
