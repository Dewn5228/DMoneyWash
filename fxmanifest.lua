fx_version 'adamant'
game 'gta5'
lua54 'yes'

name 'DMoneyWash'
author 'Dewn5228'

client_scripts {
  'client/*.lua'
}

server_scripts {
  'server/*.lua'
}

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua'
}

files {
  'locales/*.json'
}

dependencies {
	"ox_lib",
	"ox_inventory",
}
