#unless the module is already initialized
execute unless score ore_trees gm4_modules matches 1.. run function ore_trees:init
scoreboard players add installedModules gm4_upCheck 1
