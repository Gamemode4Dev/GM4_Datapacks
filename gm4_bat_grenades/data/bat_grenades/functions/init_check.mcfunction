#unless the module is already initialized
execute unless score bat_grenades gm4_modules matches 1.. run function bat_grenades:init
scoreboard players add installedModules gm4_upCheck 1
