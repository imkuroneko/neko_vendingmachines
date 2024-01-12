author 'imkuroneko'
description 'Sistema de máquinas expendedoras'
version '1.0.0'

lua54 'yes'

fx_version 'cerulean'
game 'gta5'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua',
}

server_scripts {
    'server.lua'
}

dependencies {
    'ox_inventory'
}

dependencies {
    'qb-target'
}