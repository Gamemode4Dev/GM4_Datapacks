#unless the module is already initialized

execute unless score blast_furnaces gm4_modules matches 1.. run function blast_furnaces:init
scoreboard players add installedModules gm4_upCheck 1
