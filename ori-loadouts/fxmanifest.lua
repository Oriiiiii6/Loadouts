fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Ori (us3rrrr.)'
description 'Loadouts With Role'
version '1.0.0'

client_script 'client/*.lua'
server_script 'server/*.lua'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}



-- need sleepless_pedmanager and put this code!
-- {
--     model = "onesis", -- ped model
--     coords = {vec4(-1018.334, -2698.4, 13.837141, 149.83868)}, -- location
--     renderDistance = 50.0,
--     targetOptions = {
--         {
--             type = 'client',
--             event = 'ori:client:showMenu', -- dont touch
--             label = 'Get Your Quick Loadouts' -- change if you want
--         }
--     },
--     onSpawn = function(ped)
--     end,
--     onDespawn = function(ped)
--     end
--  },