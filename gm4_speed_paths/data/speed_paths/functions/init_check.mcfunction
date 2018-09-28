#unless the module is already initialized
execute unless score speed_paths gm4_modules matches 1.. run function speed_paths:init
scoreboard players add installedModules gm4_upCheck 1
