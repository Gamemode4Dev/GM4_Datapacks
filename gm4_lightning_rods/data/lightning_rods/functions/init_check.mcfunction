#unless the module is already initialized
execute unless score lightning_rods gm4_modules matches 1.. run function lightning_rods:init
scoreboard players add installedModules gm4_upCheck 1
