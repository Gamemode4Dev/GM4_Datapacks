#unless the module is already initialized
execute unless score tnt_mines gm4_modules matches 1.. run function tnt_mines:init
scoreboard players add installedModules gm4_upCheck 1
