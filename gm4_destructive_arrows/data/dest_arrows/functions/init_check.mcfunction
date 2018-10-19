#unless the module is already initialized
execute unless score dest_arrows gm4_modules matches 1.. run function dest_arrows:init
scoreboard players add installedModules gm4_upCheck 1
