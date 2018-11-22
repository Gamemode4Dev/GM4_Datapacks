#unless the module is already initialized
execute unless score master_armor_stands gm4_modules matches 1.. run function master_armor_stands:init
scoreboard players add installedModules gm4_upCheck 1
