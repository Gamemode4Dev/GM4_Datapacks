#unless the module is already initialized
execute unless score xp_storage gm4_modules matches 1.. run function xp_storage:init
scoreboard players add installed_modules gm4_upCheck 1
