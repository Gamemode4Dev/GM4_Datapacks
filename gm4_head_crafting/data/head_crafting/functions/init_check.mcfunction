#unless the module is already initialized
execute unless score head_crafting gm4_modules matches 1.. run function head_crafting:init
scoreboard players add installedModules gm4_upCheck 1
