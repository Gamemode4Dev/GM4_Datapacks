#unless the module is already initialized
execute unless score potion_swords gm4_modules matches 1.. run function potion_swords:init
scoreboard players add installedModules gm4_upCheck 1
