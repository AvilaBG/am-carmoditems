fx_version 'cerulean'
game 'gta5'

author 'AvilaMn'
description 'Add usabel items for vehicle performance upgrade, and a simple menu to check vehicle info.'
version '1.0.0'

shared_scripts {
	'@qb-core/shared/locale.lua',
	'locales/es.lua' -- << change language here
    'config.lua',
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'    
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/style.css',
	'html/ui.js',
	'html/Images/*.png',
}

lua54 'yes'

