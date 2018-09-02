#unless the module is already initialized
execute unless score particles_pack gm4_modules matches 1.. run function particles_pack:init
scoreboard players add installedModules gm4_upCheck 1
