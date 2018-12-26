#unless the module is already initialized
execute unless score master_crafting gm4_modules matches 1.. run function master_crafting:init
scoreboard players add installedModules gm4_upCheck 1
