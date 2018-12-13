#unless the module is already initialized
execute unless score custom_terrain_base gm4_modules matches 1.. run function orbis:init
scoreboard players add installed_modules gm4_up_check 1
