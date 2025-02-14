QBCore = exports['qb-core']:GetCoreObject()

local BotToken = "Your_Bot_Token"

local function GetDiscordIdentifier(playerId)
    for _, id in ipairs(GetPlayerIdentifiers(playerId)) do
        if string.find(id, "discord:") then
            return string.gsub(id, "discord:", "")
        end
    end
    return nil
end

local function HasDiscordRole(playerId, roleId, callback)
    local discordId = GetDiscordIdentifier(playerId)
    if not discordId then 
        print("❌ No Discord ID found for Player:", playerId)
        callback(false)
        return
    end

    local endpoint = "https://discord.com/api/guilds/" .. Config.GuildID .. "/members/" .. discordId
    local headers = {
        ["Authorization"] = "Bot " .. BotToken,
        ["Content-Type"] = "application/json"
    }
    
    PerformHttpRequest(endpoint, function(statusCode, response)
        if statusCode == 200 then
            local data = json.decode(response)
            if data and data.roles then
                print("✅ Player Discord ID:", discordId)
                print("✅ Retrieved Roles:", json.encode(data.roles))
                print("✅ Required Role ID:", roleId)

                for _, role in ipairs(data.roles) do
                    if role == roleId then
                        print("✅ Player has the correct role!")
                        callback(true)
                        return
                    end
                end
            end
        end
        print("❌ Player does NOT have the required role.")
        callback(false)
    end, "GET", "", headers)
end

RegisterNetEvent('ori:server:collectLoadout', function(loadoutKey)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    HasDiscordRole(src, Config.RoleID, function(hasRole)
        if not hasRole then
            TriggerClientEvent('QBCore:Notify', src, Config.CantAccessMessage, 'error')
            return
        end

        local loadout = Config.DevLoadouts[loadoutKey]
        if not loadout then return end

        for _, item in pairs(loadout) do
            if item.type == 'weapon' then
                GiveWeaponToPed(GetPlayerPed(src), GetHashKey(item.name), item.ammo, false, true)
            else
                exports['ox_inventory']:AddItem(src, item.name, item.amount)
            end
        end

        TriggerClientEvent('QBCore:Notify', src, 'Loadout received!', 'success')
    end)
end)
