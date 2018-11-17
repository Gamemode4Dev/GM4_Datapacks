#unless the module is already initialized
execute unless score liquid_tanks gm4_modules matches 1.. run function liquid_tanks:init
scoreboard players add installedModules gm4_upCheck 1
