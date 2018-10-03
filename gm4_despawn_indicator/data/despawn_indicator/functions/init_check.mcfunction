#unless the module is already initialized
execute unless score despawn_indicator gm4_modules matches 1.. run function despawn_indicator:init
scoreboard players add installedModules gm4_upCheck 1