#unless the module is already initialized
execute unless score pig_tractors gm4_modules matches 1.. run function pig_tractors:init
scoreboard players add installedModules gm4_upCheck 1
