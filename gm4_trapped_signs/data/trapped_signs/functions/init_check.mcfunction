#unless the module is already initialized
execute unless score trapped_signs gm4_modules matches 1.. run function trapped_signs:init
scoreboard players add installedModules gm4_upCheck 1
