#unless the module is already initialized
execute unless score nbi gm4_modules matches 1.. run function nbi:init
scoreboard players add installedModules gm4_upCheck 1
