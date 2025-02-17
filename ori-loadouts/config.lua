Config = {
    BotToken = "Not Today", -- bot token (server.lua line : 3)
    GuildID = "Your_Guild_Id", -- server id
    RoleID = "Your_Role_Id", -- role id access

    PedModel = 's_m_m_armoured_02',
    PedCoords = vector3(451.3403, -980.0978, 30.6896),
    PedHeading = 90.0,


    DevLoadouts = {
        ['Pink-Reaper'] = {
            {name = 'WEAPON_PINKREAPER', amount = 1, ammo = 250, type = 'weapon'},
            {name = 'xpill', amount = 55},
            {name = 'oxy', amount = 25},
            {name = 'potion_teleportation', amount = 3},
            {name = 'potion_invisibility', amount = 3},
            {name = 'tablet', amount = 5},
        },
    
        ['Mac10'] = {
            {name = 'weapon_mac10', amount = 1, ammo = 250, type = 'weapon'},
            {name = 'oxy', amount = 20},
            {name = 'xpill', amount = 30},
            {name = 'tablet', amount = 2}
        },
    
        ['Orange-Reaper'] = {
            {name = 'WEAPON_ORANGEREAPER', amount = 1, ammo = 250, type = 'weapon'},
            {name = 'xpill', amount = 30},
            {name = 'oxy', amount = 20},
            {name = 'tablet', amount = 2}
        },
    
        ['Pink-Ar13'] = {
            {name = 'weapon_ar13pink', amount = 1, ammo = 250, type = 'weapon'},
            {name = 'xpill', amount = 30},
            {name = 'oxy', amount = 20},
            {name = 'tablet', amount = 2}
        },
    
        ['Cyan-Cult 19'] = {
            {name = 'WEAPON_CULT19CYAN', amount = 1, ammo = 250, type = 'weapon'},
            {name = 'xpill', amount = 30},
            {name = 'oxy', amount = 20},
            {name = 'tablet', amount = 2}
        },
    
        ['White-Ar13'] = {
            {name = 'WEAPON_AR13WHITE', amount = 1, ammo = 250, type = 'weapon'},
            {name = 'xpill', amount = 30},
            {name = 'oxy', amount = 20},
            {name = 'tablet', amount = 2}
        },
    
        ['Only Items'] = {
            {name = 'xpill', amount = 55},
            {name = 'oxy', amount = 25},
            {name = 'potion_teleportation', amount = 3},
            {name = 'potion_invisibility', amount = 3},
            {name = 'tablet', amount = 5},
        },
    },

    CanAcessMenu = function()
        return true
    end,

    CantAccessMessage = 'You cant access this menu'
}
