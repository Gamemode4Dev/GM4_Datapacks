#unless the module is already initialized
execute unless score seasons gm4_modules matches 1.. run function seasons:init
scoreboard players add installedModules gm4_upCheck 1
